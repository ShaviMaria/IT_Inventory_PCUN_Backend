import express from "express";
import morgan from "morgan";

// Routes
import systemUserRoutes from "./routes/system_User.routes";
import userRoutes from './routes/users.routes';
import eventsRoutes from './routes/events.routes';
import propertiesRoutes from './routes/properties.routes';
import networksRoutes from './routes/networks.routes';

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
app.use('/api/User/', userRoutes);
app.use('/api/Events/', eventsRoutes);
app.use('/api/Properties', propertiesRoutes);
app.use('/api/Networks', networksRoutes);
//app.use('/api/Users/', )

export default app;