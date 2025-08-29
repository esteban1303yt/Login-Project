const express = require('express');
const cors = require('cors');
const app = express();
const imagenesRoutes = require('./routes/imagenes.routes')

// Middlewares
app.use(cors());
app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ extended: true, limit: '50mb' }));

// Rutas
app.use('/api/imagenes', imagenesRoutes);
app.use('/api/personas', require('./routes/personas.routes'));
app.use('/api/productos', require('./routes/productos.routes'));
app.use('/api/auth', require('./routes/auth.routes'));
app.use('/api/users', require('./routes/users.routes'));

module.exports = app;