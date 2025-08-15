const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;
const mainRoutes = require('./routes/api');

// Set the view engine
app.set('view engine', 'ejs');
app.set('views', 'src/views');

// Use the router for all incoming requests
app.use('/', mainRoutes);

// This block only runs when the file is executed directly (e.g., `npm start`)
if (require.main === module) {
    app.listen(PORT, () => {
        console.log(`Server is running on port ${PORT}`);
    });
}

// Export the app for testing
module.exports = app;