const products = require('../models/product');

exports.getProductsPage = (req, res) => {
    res.render('index', { 
        title: 'Our Awesome Products',
        products: products 
    });
};