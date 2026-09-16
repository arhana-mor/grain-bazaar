const oracledb = require('oracledb');

const DB_CONFIG = {
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  connectString: process.env.DB_CONNECT_STRING,
};

oracledb.outFormat = oracledb.OUT_FORMAT_OBJECT;

async function getConnection() {
  return await oracledb.getConnection(DB_CONFIG);
}

async function fetchCursor(cursor) {
  const rows = [];

  let row;
  while ((row = await cursor.getRow()) !== undefined) {
    rows.push(row);
  }

  await cursor.close();
  return rows;
}

module.exports = {
  getConnection,
  fetchCursor,
};