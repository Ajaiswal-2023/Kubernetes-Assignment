const express = require('express');
const productController = require('../controllers/productController');
const router = express.Router();

/**
 * @swagger
 * components:
 *   schemas:
 *     Product:
 *       type: object
 *       required:
 *         - name
 *         - price
 *       properties:
 *         name:
 *           type: string
 *           description: name of the product
*         price:
 *           type: number
 *           description: price of the product
*         decscription:
 *           type: string
 *         category_id:
 *           type: string
 */

/**
 * @swagger
 * tags:
 *   name: Products
 *   description: The products managing API
 */

/**
 * @swagger
 * /products:
 *   get:
 *     summary: Returns the list of all the products
 *     tags: [Products]
 *     responses:
 *       200:
 *         description: The list of the products
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Product'
 */
router.get('/', productController.getAllProducts);

/**
 * @swagger
 * /products/create:
 *   post:
 *     summary: Create a new product
 *     tags: [Products]
*     description: Endpoint to create a new product.
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *               price:
 *                 type: number
 *               description:
 *                 type: string
 *               category_id:
 *                 type: integer
 *     responses:
 *       '201':
 *         description: product created successfully
 *       '400':
 *         description: Invalid request body
 *       '500':
 *         description: Internal server error
 */
router.post('/create', productController.createNewProduct);

module.exports = router;
