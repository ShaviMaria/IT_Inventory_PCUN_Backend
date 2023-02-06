import express from "express";
import morgan from "morgan";

// Routes
import systemUserRoutes from "./routes/system_User.routes";

const app = express();

// Settings
app.set('port', 4000);

// Middlewares
app.use(morgan('dev'));
app.use(express.json());
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Authorization, X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method');
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
    res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
    next();
});

// Routes
//app.use('/api/system_Users:user/:password',  systemUserRoutes);
app.use('/api/System_Users/',  systemUserRoutes);

export default app;