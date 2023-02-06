import { getConnection } from '../database/database';

const getSystem_Users = async(req, res) => {
    try {
        //const { Windows_User, Password } = req.query;
        //req.accepts(['json', 'text'])
        // => "json"
        //req.accepts('application/json')
        // => "application/json"

        // Accept: text/*, application/json
        //req.accepts('image/png')
        //req.accepts('png')
        // => false

        // Accept: text/*;q=.5, application/json
        //req.accepts(['html', 'json'])
        // => "json"
        //res.set({
            //"Content-Type": "application/json",
            //"Access-Control-Allow-Origin": "*",
        //});
        const Windows_User = req.params.user;
        const Password = req.params.password;
        //console.log('Windows_User: ', Windows_User);
        //console.log('Password: ', Password);
        //const { Windows_User, Password } = req.body;
        const params = { Windows_User, Password };
        //console.log(params);
        const connection = await getConnection();
        //const result = await connection.query("SELECT * FROM System_Users WHERE Windows_User = ? AND Password = ?", params); 
        const query = `SELECT * FROM System_Users WHERE Windows_User = '${params.Windows_User}' AND Password = '${params.Password}'`;
        const result = await connection.query(query);
        res.json(result);
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }

};

export const methods = {
    getSystem_Users
}



//const getSystem_Users = async(req, res) => {
    //try {
        ////const { Windows_User, Password } = req.query;
        //const { Windows_User, Password } = req.body;
        //const params = { Windows_User, Password };
        //console.log(params);
        //const connection = await getConnection();
        ////const result = await connection.query("SELECT * FROM System_Users WHERE Windows_User = ? AND Password = ?", params); 
        //const query = `SELECT * FROM System_Users WHERE Windows_User = '${params.Windows_User}' AND Password = '${params.Password}'`;
        //const result = await connection.query(query);
        //console.log(result);
        //res.json(result);
    //} catch (error) {
        //res.status(500);
        //res.send(error.message);
    //}

//};