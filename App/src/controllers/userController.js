const pool = require('../config/db');
const responseHandler = require('../utils/responseHandler');

const getAllUsers = async (req, res) => {
  try {
    const { rows } = await pool.query('SELECT * FROM users;');
    responseHandler.success(res, rows);
  } catch (error) {
    responseHandler.error(res, error.message);
  }
};

const createUser = async (req, res) => {
  try {
    const { username, password, email } = req.body;
    
    if (!username || !password || !email) {
      return responseHandler.error(res, 'Missing required fields', 400);
    }

    // Check if the user already exists
    const existingUser = await pool.query('SELECT * FROM users WHERE username = $1 OR email = $2', [username, email]);
    if (existingUser.rows.length > 0) {
      return responseHandler.error(res, 'User already exists', 400);
    }

    // Insert new user into the database
    const newUser = await pool.query('INSERT INTO users (username, password, email) VALUES ($1, $2, $3) RETURNING *', [username, password, email]);
    res.status(201).json(newUser.rows[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = {
    getAllUsers,
    createUser
}