import { getConnection } from '../database/database';

const getProperties = async (req, res) => {
    try {
        const connection = await getConnection();
        const result = await connection.query('SELECT * FROM Property');
        res.json(result);
    } catch(error) {
        res.status(500);
        res.send(error.message);
    }
}

const getPropertiesByList = async (req, res) => {
    try {
        const propertiesList = JSON.parse(req.params.properties);

        if(propertiesList === undefined) {
            res.status(400).json({ message: 'Bad request, please set a properties list'});
            return;
        }

        let propertiesListConditions = ''

        propertiesList.map(property => {
            if(propertiesListConditions.length > 0) {
                propertiesListConditions += ` OR Property_Code = ${property}`
            } else {
                propertiesListConditions += `Property_Code = ${property}`
            }
        })
        
        const connection = await getConnection();
        const query = `SELECT * FROM Property WHERE ${propertiesListConditions}`
        const properties = await connection.query(query)
        res.json(properties);
    } catch(error) {
        res.status(500);
        res.send(error.message);
    }
}

const addProperty = async (req, res) => {
    try{
        const { code, name } = req.body;

        if( code === undefined ) {
            res.status(400).json({ message: 'Bad request, please set code'});
            return;
        }

        if( name === undefined ) {
            res.status(400).json({ message: 'Bad request, please set name'});
            return;
        }

        const addData = [{}];

        addData[0].Property_Code = code;
        addData[0].Name = name;

        const connection = await getConnection();
        const query = `INSERT INTO Property SET ?`;
        await connection.query(query, addData);
        res.json({ message: `Property ${addData[0].Property_Code} ${addData[0].Name} added`});
    } catch(error) {
        res.status(500);
        res.send(error.message);
    }
}

const getLastProperty = async (req, res) => {
    try {
        const connection = await getConnection();
        const query = `SELECT * FROM Property ORDER BY Id_Property DESC LIMIT 1`;
        const result = await connection.query(query);
        res.json(result);
    } catch(error) {
        res.status(500);
        res.send(error.message);
    } 
}

const deleteProperty = async (req, res) => {
    try{
        const { id } = req.body;

        if(id === undefined) { 
            res.status(400).json({ message: 'Bad request, please set a property id'});
            return;
        }

        const connection = await getConnection();
        const result = connection.query(`DELETE FROM Property WHERE Id_Property = ${id}`)
        res.json(result)
    } catch(error) {
        res.status(500);
        res.send(error.message);
    }
}

const getRelations = async (req, res) => {
    try {
        const id = req.params.id;

        if(id === undefined) { 
            res.status(400).json({ message: 'Bad request, please set a property id'});
            return;
        }

        const relations = [];

        const connection = await getConnection();
        const appleIdResult = await connection.query(`SELECT COUNT(*) as Count FROM Apple_ID WHERE Property = ${id}`);
        const departamentResult = await connection.query(`SELECT COUNT(*) as Count FROM Departament WHERE Property = ${id}`);
        const googleAccountResult = await connection.query(`SELECT COUNT(*) as Count FROM Google_Account WHERE Property = ${id}`);
        const hostNameResult = await connection.query(`SELECT COUNT(*) as Count FROM HostName WHERE Property = ${id}`);
        const networkResult = await connection.query(`SELECT COUNT(*) as Count FROM Network WHERE Property = ${id}`);
        const upsResult = await connection.query(`SELECT COUNT(*) as Count FROM UPS WHERE Property = ${id}`);
        const cellPhoneResult = await connection.query(`SELECT COUNT(*) as Count FROM Cell_Phone WHERE Property = ${id}`);
        const tabletResult = await connection.query(`SELECT COUNT(*) as Count FROM Tablet WHERE Property = ${id}`);
        const phoneResult = await connection.query(`SELECT COUNT(*) as Count FROM Phone WHERE Property = ${id}`);
        const pcResult = await connection.query(`SELECT COUNT(*) as Count FROM PC WHERE Property = ${id}`);
        const printerResult = await connection.query(`SELECT COUNT(*) as Count FROM Printer WHERE Property = ${id}`);
        const switchResult = await connection.query(`SELECT COUNT(*) as Count FROM Switch WHERE Property = ${id}`);
        const routerResult = await connection.query(`SELECT COUNT(*) as Count FROM Router WHERE Property = ${id}`);
        const monitorResult = await connection.query(`SELECT COUNT(*) as Count FROM Monitor WHERE Property = ${id}`);
        const serverResult = await connection.query(`SELECT COUNT(*) as Count FROM Server WHERE Property = ${id}`);

        if(appleIdResult[0].Count > 0) {
            relations.push('AppleIds');
        }
        
        if(departamentResult[0].Count > 0) {
            relations.push('Departaments');
        }

        if(googleAccountResult[0].Count > 0) {
            relations.push('Google Accounts');
        }

        if(hostNameResult[0].Count > 0) {
            relations.push('HostNames');
        }

        if(networkResult[0].Count > 0) {
            relations.push('Networks');
        }
        
        if(upsResult[0].Count > 0) {
            relations.push('UPS');
        }
        
        if(cellPhoneResult[0].Count > 0) {
            relations.push('Cell Phones');
        }
        
        if(tabletResult[0].Count > 0) {
            relations.push('Tablets');
        }
        
        if(phoneResult[0].Count > 0) {
            relations.push('Phones');
        }
        
        if(pcResult[0].Count > 0) {
            relations.push('PCs');
        }
        
        if(printerResult[0].Count > 0) {
            relations.push('Printers');
        }

        if(switchResult[0].Count > 0) {
            relations.push('Switches');
        }
        
        if(routerResult[0].Count > 0) {
            relations.push('Routers');
        }
        
        if(monitorResult[0].Count > 0) {
            relations.push('Monitors');
        }
        
        if(serverResult[0].Count > 0) {
            relations.push('Servers');
        }
        res.json(relations);
    } catch(error) {
        res.status(500);
        res.send(error.message);
    }
}

const updatePropertyById = async (req, res) => {
    try {
        const { id, code, name } = req.body;
        
        if( id === undefined ) {
            res.status(400).json({ message: 'Bad request, please set id'});
            return;
        }

        if( code === undefined ) {
            res.status(400).json({ message: 'Bad request, please set code'});
            return;
        }

        if( name === undefined ) {
            res.status(400).json({ message: 'Bad request, please set name'});
            return;
        }

        const updateValues = [{}];
        updateValues[0].Property_Code = code;
        updateValues[0].Name = name;

        updateValues.push(id)

        const connection = await getConnection();
        const query = `UPDATE Property SET ? WHERE Id_Property = ?`;
        const result = await connection.query(query, updateValues);
        res.json(result);
    } catch(error) {
        res.status(500)
        res.send(error.message)
    }
}

export const methods = {
    getProperties,
    getPropertiesByList,
    addProperty,
    deleteProperty,
    getRelations,
    updatePropertyById,
    getLastProperty
}