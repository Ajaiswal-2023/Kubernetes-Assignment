const { Pool } = require('pg');
const config = require('./config');

const pool = new Pool({
  host: config.db.host || "localhost",
  user: config.db.user || "Admin",
  password: config.db.password || "Password1",
  database: config.db.database || "ecom-db",
  port: config.db.port || "5432",
});

module.exports = pool;
