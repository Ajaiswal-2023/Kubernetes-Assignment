const pool = require('../config/db');
const responseHandler = require('../utils/responseHandler');

const getAllProducts = async (req, res) => {
    try {
        const { rows } = await pool.query('SELECT * FROM products;');

        // Simulate a high CPU load by performing more complex and numerous computations
        for (let i = 0; i < 1e8; i++) {
            Math.sqrt(i);
            Math.log(i + 1);
            Math.exp(i % 10);
          }

        responseHandler.success(res, rows);
    } catch (error) {
        responseHandler.error(res, error.message);
    }
};

const createNewProduct = async (req, res) => {
    try {
        const { name, description, price, category_id } = req.body;

        // Insert new product into the database
        const newProduct = await pool.query('INSERT INTO products (name, description, price, category_id) VALUES ($1, $2, $3, $4) RETURNING *', [name, description, price, category_id]);

        res.status(201).json(newProduct.rows[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

module.exports = {
    getAllProducts,
    createNewProduct
}
