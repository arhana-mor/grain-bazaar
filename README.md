# Grain Bazaar

A database-driven web application that connects farmers and customers directly for grain listings and transactions.

## About the Project

Grain Bazaar is a web-based application designed to make it easier for customers to find grain from farmers directly.

Customers can search available grain listings using filters such as grain type, quantity, farmer, and price. Farmers can manage their listings and keep track of their completed transactions through the farmer portal.

The project combines a **JavaScript frontend**, **Node.js/Express backend**, and an **Oracle database with PL/SQL stored procedures**.

## Features

### Customer Portal

* Search available grain listings
* Filter by grain name
* Filter by maximum price per unit
* Filter by farmer
* Specify required quantity
* View farmer contact information
* View previous sellers when no current listing is available

### Farmer Portal

* Select a farmer profile
* View current listings
* Add new grain listings
* Remove listings
* View transaction history
* Record completed sales

## Tech Stack

**Frontend**

* HTML
* CSS
* JavaScript

**Backend**

* Node.js
* Express.js
* OracleDB
* CORS
* dotenv

**Database**

* Oracle Database XE
* SQL
* PL/SQL
* Stored Procedures

## Database

The project uses a relational Oracle database with tables for:

* `FARMERS`
* `CUSTOMERS`
* `GRAIN`
* `LISTINGS`
* `TRANSACTION`
* `TRANSACTION_DETAILS`

Database operations are handled through PL/SQL stored procedures, including:

* `AddListing`
* `DeleteListing`
* `FindCustomers`
* `FindFarmers`
* `GetFarmerListings`
* `GetFarmers`
* `GetFarmerTransactions`
* `GetGrains`
* `GetPastSellers`
* `MakeTransaction`

The database scripts are included in the `database` folder.

## Project Structure

```text
grain-bazaar/
│
├── backend/
│   ├── db.js
│   └── server.js
│
├── database/
│   ├── tables.sql
│   ├── data.sql
│   └── procedures.sql
│
├── frontend/
│   ├── index.html
│   ├── css/
│   │   └── style.css
│   └── js/
│       └── app.js
│
├── .gitignore
├── package.json
├── package-lock.json
└── README.md
```

## Application Flow

### Customer

```text
Search grain
     ↓
Apply filters
     ↓
View available farmers
     ↓
View farmer contact information
```

### Farmer

```text
Select farmer profile
     ↓
Manage listings
     ↓
Add / remove listings
     ↓
Record and view transactions
```

## Project Scope

The farmer portal currently uses **profile selection rather than full user authentication**.

The application uses **Oracle XE locally** as its database layer.

## Data Disclaimer

All farmer names, customer details, phone numbers, grain listings, prices, and transaction records included in this project are **fictional data created for demonstration purposes**. They do not represent real individuals, businesses, or transactions.


## Author

**Arhana Mor**
