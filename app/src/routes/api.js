const express = require('express');
const router = express.Router();
const productsController = require('../controllers/productsController');

// Define the main route for the homepage
router.get('/', productsController.getProductsPage);

module.exports = router;