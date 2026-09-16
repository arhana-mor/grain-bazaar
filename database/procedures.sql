
CREATE OR REPLACE PROCEDURE AddListing(
    p_farmer_id IN VARCHAR2,
    p_grain_id IN NUMBER,
    p_quantity IN NUMBER,
    p_price IN NUMBER
)
AS
BEGIN
    INSERT INTO listings(
        farmer_id,
        grain_id,
        quantity_available,
        price_per_unit,
        status,
        date_posted
    )
    VALUES(
        p_farmer_id,
        p_grain_id,
        p_quantity,
        p_price,
        'active',
        SYSDATE
    );

    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE DeleteListing(
    p_listing_id IN NUMBER
)
AS
BEGIN
    DELETE FROM listings
    WHERE listing_id = p_listing_id;

    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE FindCustomers(
    p_grain_name IN VARCHAR2,
    p_min_price  IN NUMBER,
    p_recordset  OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_recordset FOR
        SELECT DISTINCT
               c.First_name,
               c.Last_name,
               t.price_per_unit
        FROM customers c
        JOIN transaction t
            ON c.customer_id = t.customer_id
        JOIN grain g
            ON t.grain_id = g.grain_id
        WHERE g.grain_name = p_grain_name
          AND t.price_per_unit >= p_min_price;
END;
/

CREATE OR REPLACE PROCEDURE FindFarmers(
    p_grain_name IN VARCHAR2,
    p_quantity   IN NUMBER,
    p_max_price  IN NUMBER,
    p_farmer_id  IN VARCHAR2,
    p_recordset  OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_recordset FOR
        SELECT
            f.farmer_id,
            f.first_name,
            f.last_name,
            f.farmer_phone,
            g.grain_name,
            l.quantity_available,
            l.price_per_unit,
            (
                SELECT ROUND(AVG(t.price_per_unit), 0)
                FROM transaction t
                WHERE t.farmer_id = f.farmer_id
                  AND t.grain_id = l.grain_id
            ) AS avg_past_price
        FROM farmers f
        JOIN listings l
            ON f.farmer_id = l.farmer_id
        JOIN grain g
            ON l.grain_id = g.grain_id
        WHERE l.status = 'active'
          AND (p_grain_name IS NULL OR g.grain_name = p_grain_name)
          AND (p_quantity IS NULL OR l.quantity_available >= p_quantity)
          AND (p_max_price IS NULL OR l.price_per_unit <= p_max_price)
          AND (p_farmer_id IS NULL OR f.farmer_id = p_farmer_id)
        ORDER BY l.price_per_unit ASC;
END;
/

CREATE OR REPLACE PROCEDURE GetFarmerListings(
    p_farmer_id IN VARCHAR2,
    p_recordset OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_recordset FOR
        SELECT
            l.listing_id,
            g.grain_name,
            l.quantity_available,
            l.price_per_unit,
            l.status
        FROM listings l
        JOIN grain g
            ON l.grain_id = g.grain_id
        WHERE l.farmer_id = p_farmer_id;
END;
/

CREATE OR REPLACE PROCEDURE GetFarmers(
    p_recordset OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_recordset FOR
        SELECT
            farmer_id,
            first_name,
            last_name,
            farmer_phone
        FROM farmers
        ORDER BY first_name;
END;
/

CREATE OR REPLACE PROCEDURE GetFarmerTransactions(
    p_farmer_id IN VARCHAR2,
    p_recordset OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_recordset FOR
        SELECT
            t.transaction_id,
            g.grain_name,
            t.quantity,
            t.price_per_unit,
            t.trans_date,
            c.first_name || ' ' || c.last_name AS customer_name,
            c.customer_phone
        FROM transaction t
        JOIN grain g
            ON t.grain_id = g.grain_id
        LEFT JOIN customers c
            ON t.customer_id = c.customer_id
        WHERE t.farmer_id = p_farmer_id
        ORDER BY t.trans_date DESC;
END;
/

CREATE OR REPLACE PROCEDURE GetGrains(
    p_recordset OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_recordset FOR
        SELECT
            grain_id,
            grain_name
        FROM grain
        ORDER BY grain_name;
END;
/

CREATE OR REPLACE PROCEDURE GetPastSellers(
    p_grain_name IN VARCHAR2,
    p_max_price  IN NUMBER,
    p_farmer_id  IN VARCHAR2,
    p_recordset  OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_recordset FOR
        SELECT DISTINCT
            f.farmer_id,
            f.first_name,
            f.last_name,
            f.farmer_phone,
            g.grain_name,
            ROUND(
                AVG(t.price_per_unit)
                OVER (PARTITION BY f.farmer_id, g.grain_id),
                0
            ) AS avg_past_price
        FROM farmers f
        JOIN transaction t
            ON f.farmer_id = t.farmer_id
        JOIN grain g
            ON t.grain_id = g.grain_id
        WHERE (p_grain_name IS NULL OR g.grain_name = p_grain_name)
          AND (p_max_price IS NULL OR t.price_per_unit <= p_max_price)
          AND (p_farmer_id IS NULL OR f.farmer_id = p_farmer_id);
END;
/

CREATE OR REPLACE PROCEDURE MakeTransaction(
    p_farmer_id   IN VARCHAR2,
    p_customer_id IN VARCHAR2,
    p_grain_id    IN NUMBER,
    p_quantity    IN NUMBER,
    p_price       IN NUMBER,
    p_status_code OUT NUMBER,
    p_message     OUT VARCHAR2
)
AS
BEGIN
    INSERT INTO transaction (
        transaction_id,
        trans_date,
        farmer_id,
        customer_id,
        grain_id,
        quantity,
        price_per_unit
    )
    VALUES (
        trans_seq.NEXTVAL,
        SYSDATE,
        p_farmer_id,
        p_customer_id,
        p_grain_id,
        p_quantity,
        p_price
    );

    UPDATE listings
    SET quantity_available = quantity_available - p_quantity
    WHERE farmer_id = p_farmer_id
      AND grain_id  = p_grain_id
      AND status    = 'active';

    UPDATE listings
    SET status = 'sold_out'
    WHERE farmer_id = p_farmer_id
      AND grain_id  = p_grain_id
      AND quantity_available <= 0;

    p_status_code := 0;
    p_message := 'Transaction successful';

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        p_status_code := 1;
        p_message := 'Procedure Error: ' || SQLERRM;
END;
/
