import { getConnection } from '../database/database';

//Only Events
const addGenericEvent = async (req, res) => {
    try {
        const { event, event_date, details, user } = req.body;

        if( event === undefined || event_date === undefined || details === undefined || user === undefined) {
            res.status(400).json({ message: "Error, bad request, please send all require data (event, event_date, details, user)." })
            return
        }

        const eventData = {
            Event: event,
            Event_Date: event_date,
            Details: details,
            User: user
        };

        const connection = await getConnection();
        await connection.query(`INSERT INTO Event SET ?`, eventData);
        
        res.json({ message: "Generic event added"});

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
}

//System User Events
const getSystem_User_Events = async (req, res) => {
    try {
        const connection = await getConnection();
        if(req.params.id) {
            const query = `SELECT * FROM System_User_Events WHERE Id_Event = ${req.params.id}`;
            const result = await connection.query(query);
            res.json(result);
        } else {
            const query = `SELECT * FROM System_User_Events`;
            const result = await connection.query(query);
            res.json(result);
        }
    } catch(error) {
        res.status(500);
        res.send(error.message);
    }
}

const addSystem_User_Event = async (req, res) => {
    try {
        const { event, event_date, details, user } = req.body;

        if( event === undefined || event_date === undefined || details === undefined || user === undefined) {
            res.status(400).json({ message: "Error, bad request, please send all require data (event, event_date, details, user)." })
            return
        }

        const eventData = {
            Event: event,
            Event_Date: event_date,
            Details: details,
            User: user
        };

        const connection = await getConnection();
        await connection.query(`INSERT INTO Event SET ?`, eventData);
        const currentEvent = await connection.query(`SELECT * FROM Event ORDER BY Id_Event DESC LIMIT 1`);
        
        if(
            eventData.Event === currentEvent[0].Event
            &&
            eventData.Details === currentEvent[0].Details
            &&
            eventData.User === currentEvent[0].User) {
                await connection.query(`INSERT INTO Join_System_User_Event (Id_System_User, Id_Event) VALUES(${eventData.User}, ${currentEvent[0].Id_Event})`);
        } else {
            res.status(500);
            res.send('Internal server error, if the error persist please contact to support');
            return
        }
        
        res.json({ message: "System event added"});

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
}

//Properties Events
const getProperty_Events = async (req, res) => {
    try {
        const connection = await getConnection();
        if(req.params.id) {
            const query = `SELECT * FROM Property_Events WHERE Id_Event = ${req.params.id}`;
            const result = await connection.query(query);
            res.json(result);
        } else {
            const query = `SELECT * FROM Property_Events`;
            const result = await connection.query(query);
            res.json(result);
        }
    } catch(error) {
        res.status(500);
        res.send(error.message);
    }
}

const addProperty_Event = async (req, res) => {
    try {
        const { id_property, event, event_date, details, user } = req.body;

        if( id_property === undefined || event === undefined || event_date === undefined || details === undefined || user === undefined) {
            res.status(400).json({ message: "Error, bad request, please send all require data (event, event_date, details, user)." })
            return
        }

        const eventData = {
            Event: event,
            Event_Date: event_date,
            Details: details,
            User: user
        };

        const connection = await getConnection();
        await connection.query(`INSERT INTO Event SET ?`, eventData);
        const currentEvent = await connection.query(`SELECT * FROM Event ORDER BY Id_Event DESC LIMIT 1`);

        eventData.Id_Property = id_property;

        console.log(eventData)

        if(
            eventData.Event === currentEvent[0].Event
            &&
            eventData.Details === currentEvent[0].Details
            &&
            eventData.User === currentEvent[0].User) {
                await connection.query(`INSERT INTO Join_Property_Event (Id_Property, Id_Event) VALUES(${eventData.Id_Property}, ${currentEvent[0].Id_Event})`);
        } else {
            res.status(500);
            res.send('Internal server error, if the error persist please contact to support');
            return
        }
        
        res.json({ message: "Property event added"});

    } catch (error) {
        res.status(500);
        res.send(error.message);
    } 
}
export const methods = {
    getSystem_User_Events,
    addSystem_User_Event,
    getProperty_Events,
    addProperty_Event,
    addGenericEvent,
}