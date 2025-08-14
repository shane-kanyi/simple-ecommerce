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

// This block will only run when the file is executed directly (e.g., `node src/app.js` or `npm start`)
// It will NOT run when the file is imported by another file (like our test script)
if (require.main === module) {
    app.listen(PORT, () => {
        console.log(`Server is running on port ${PORT}`);
    });
}

// We still export the app for our test file to use
module.exports = app;