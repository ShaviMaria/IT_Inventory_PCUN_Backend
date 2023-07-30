import { getConnection } from '../database/database';

const getUsers = async(req, res) => {
    try {
        const connection = await getConnection();
        if(req.params.id) {
            const query = `SELECT * FROM User WHERE Id_User = ${req.params.id}`;
            const result = await connection.query(query);
            res.json(result);
        } else {
            const query = `SELECT * FROM User`;
            const result = await connection.query(query);
            res.json(result);
        }
    } catch(error) {
        res.status(500);
        res.send(error.message);
    }
}

export const methods = {
    getUsers
}