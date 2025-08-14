const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.set('view engine', 'ejs');
app.set('views', 'src/views');

app.get('/', (req, res) => {
    const products = [
        { id: 1, name: 'Gaming Laptop', price: 1400 },
        { id: 2, name: 'Mechanical Keyboard', price: 95 },
        { id: 3, name: 'Wireless Mouse', price: 50 }
    ];
    res.render('index', { products });
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});

module.exports = app;