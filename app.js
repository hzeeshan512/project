// app.js
const express = require('express');
require('dotenv').config();  // Load .env file (for local dev; in Docker, env vars are passed differently)
const app = express();

// Use PORT from environment if provided, otherwise default to 3000
const PORT = process.env.PORT || 3000;
const ENV = process.env.NODE_ENV || process.env.ENVIRONMENT || 'development';

// Basic route
app.get('/', (req, res) => {
  res.send(`Hello from Node.js! Environment: ${ENV}`);
});

// A health check route (useful for testing)
app.get('/health', (req, res) => {
  res.json({ status: 'OK', env: ENV });
});

// Start the server
app.listen(PORT, () => {
  console.log(`App listening on port ${PORT} (Environment: ${ENV})`);
});
