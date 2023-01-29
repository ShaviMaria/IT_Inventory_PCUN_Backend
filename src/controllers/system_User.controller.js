import { getConnection } from '../database/database';

const getSystem_Users = async(req, res) => {
   const connection = await getConnection();
   const result = await connection.query("SELECT * FROM System_Users");
   console.log(result);
   res.json(result);
};

export const methods = {
    getSystem_Users
}