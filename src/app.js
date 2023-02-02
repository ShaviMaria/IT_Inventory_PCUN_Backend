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

// Routes
//app.use('/api/system_Users:user/:password',  systemUserRoutes);
app.use('/api/System_Users',  systemUserRoutes);

export default app;