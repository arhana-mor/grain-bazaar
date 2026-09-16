require('dotenv').config();

const express = require('express');
const oracledb = require('oracledb');
const cors = require('cors');

const { getConnection, fetchCursor } = require('./db');

const app = express();

app.use(cors());
app.use(express.json());


app.get('/api/farmers', async (req, res) => {
  let conn;

  try {
    conn = await getConnection();

    const result = await conn.execute(`
      SELECT farmer_id,
             first_name,
             last_name,
             farmer_phone
      FROM farmers
      ORDER BY first_name
    `);

    res.json(result.rows);

  } catch (err) {
    res.status(500).json({ error: err.message });

  } finally {
    if (conn) await conn.close();
  }
});



app.get('/api/grains', async (req, res) => {
  let conn;

  try {
    conn = await getConnection();

    const result = await conn.execute(
      `BEGIN GetGrains(:cursor); END;`,
      {
        cursor: {
          dir: oracledb.BIND_OUT,
          type: oracledb.CURSOR
        }
      }
    );

    const rows = await fetchCursor(result.outBinds.cursor);

    res.json(rows);

  } catch (err) {
    res.status(500).json({ error: err.message });

  } finally {
    if (conn) await conn.close();
  }
});



app.post('/api/find-farmers', async (req, res) => {
  let conn;

  try {
    conn = await getConnection();

    const {
      grain_name = null,
      quantity = null,
      max_price = null,
      farmer_id = null
    } = req.body;

    const result = await conn.execute(
      `BEGIN FindFarmers(
        :grain_name,
        :quantity,
        :max_price,
        :farmer_id,
        :cursor
      ); END;`,
      {
        grain_name: grain_name || null,
        quantity: quantity || null,
        max_price: max_price || null,
        farmer_id: farmer_id || null,

        cursor: {
          dir: oracledb.BIND_OUT,
          type: oracledb.CURSOR
        }
      }
    );

    const rows = await fetchCursor(result.outBinds.cursor);

    res.json({ rows });

  } catch (err) {
    res.status(500).json({ error: err.message });

  } finally {
    if (conn) await conn.close();
  }
});



app.post('/api/past-sellers', async (req, res) => {
  let conn;

  try {
    conn = await getConnection();

    const {
      grain_name = null,
      max_price = null,
      farmer_id = null
    } = req.body;

    const result = await conn.execute(
      `BEGIN GetPastSellers(
        :grain_name,
        :max_price,
        :farmer_id,
        :cursor
      ); END;`,
      {
        grain_name: grain_name || null,
        max_price: max_price || null,
        farmer_id: farmer_id || null,

        cursor: {
          dir: oracledb.BIND_OUT,
          type: oracledb.CURSOR
        }
      }
    );

    const rows = await fetchCursor(result.outBinds.cursor);

    res.json({ rows });

  } catch (err) {
    res.status(500).json({ error: err.message });

  } finally {
    if (conn) await conn.close();
  }
});



app.get('/api/farmer/:id/listings', async (req, res) => {
  let conn;

  try {
    conn = await getConnection();

    const result = await conn.execute(
      `BEGIN GetFarmerListings(
        :farmer_id,
        :cursor
      ); END;`,
      {
        farmer_id: req.params.id,

        cursor: {
          dir: oracledb.BIND_OUT,
          type: oracledb.CURSOR
        }
      }
    );

    const rows = await fetchCursor(result.outBinds.cursor);

    
    const grainResult = await conn.execute(
      `SELECT grain_id, grain_name FROM grain`
    );

    const nameToId = {};

    grainResult.rows.forEach(row => {
      nameToId[row.GRAIN_NAME] = row.GRAIN_ID;
    });

    rows.forEach(row => {
      row.GRAIN_ID = nameToId[row.GRAIN_NAME] || null;
    });

    res.json(rows);

  } catch (err) {
    res.status(500).json({ error: err.message });

  } finally {
    if (conn) await conn.close();
  }
});


app.get('/api/farmer/:id/transactions', async (req, res) => {
  let conn;

  try {
    conn = await getConnection();

    const result = await conn.execute(
      `BEGIN GetFarmerTransactions(
        :farmer_id,
        :cursor
      ); END;`,
      {
        farmer_id: req.params.id,

        cursor: {
          dir: oracledb.BIND_OUT,
          type: oracledb.CURSOR
        }
      }
    );

    const rows = await fetchCursor(result.outBinds.cursor);

    res.json(rows);

  } catch (err) {
    res.status(500).json({ error: err.message });

  } finally {
    if (conn) await conn.close();
  }
});


app.post('/api/listing', async (req, res) => {
  let conn;

  try {
    conn = await getConnection();

    const {
      farmer_id,
      grain_id,
      quantity,
      price
    } = req.body;

    await conn.execute(
      `BEGIN AddListing(
        :farmer_id,
        :grain_id,
        :quantity,
        :price
      ); END;`,
      {
        farmer_id,
        grain_id: Number(grain_id),
        quantity: Number(quantity),
        price: Number(price)
      }
    );

    res.json({ success: true });

  } catch (err) {
    res.status(500).json({ error: err.message });

  } finally {
    if (conn) await conn.close();
  }
});



app.delete('/api/listing/:id', async (req, res) => {
  let conn;

  try {
    conn = await getConnection();

    await conn.execute(
      `BEGIN DeleteListing(:listing_id); END;`,
      {
        listing_id: Number(req.params.id)
      }
    );

    res.json({ success: true });

  } catch (err) {
    res.status(500).json({ error: err.message });

  } finally {
    if (conn) await conn.close();
  }
});


app.post('/api/transaction', async (req, res) => {
  let conn;

  try {
    conn = await getConnection();

    const {
      farmer_id,
      customer_id,
      grain_id,
      quantity,
      price
    } = req.body;

    const result = await conn.execute(
      `BEGIN MakeTransaction(
        :farmer_id,
        :customer_id,
        :grain_id,
        :quantity,
        :price,
        :status_code,
        :message
      ); END;`,
      {
        farmer_id,
        customer_id: customer_id || 'WALK_IN',
        grain_id: Number(grain_id),
        quantity: Number(quantity),
        price: Number(price),

        status_code: {
          dir: oracledb.BIND_OUT,
          type: oracledb.NUMBER
        },

        message: {
          dir: oracledb.BIND_OUT,
          type: oracledb.STRING,
          maxSize: 200
        }
      }
    );

    const {
      status_code,
      message
    } = result.outBinds;

    if (status_code === 0) {
      res.json({
        success: true,
        message
      });
    } else {
      res.status(400).json({
        success: false,
        error: message
      });
    }

  } catch (err) {
    res.status(500).json({
      error: err.message
    });

  } finally {
    if (conn) await conn.close();
  }
});



const PORT = process.env.PORT || 3001;

app.listen(PORT, () => {
  console.log(
    `Grain Bazaar API running → http://localhost:${PORT}`
  );
});