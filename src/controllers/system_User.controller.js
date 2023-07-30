import { getConnection } from '../database/database';

const getSystem_Users = async(req, res) => {
    try {
        const Windows_User = req.params.user;
        const Password = req.params.password; 
        const params = { Windows_User, Password };
        const connection = await getConnection();

        connection.query('BEGIN');
        try{
            const getSystem_UserQuery = `SELECT * FROM System_Users WHERE Windows_User = '${params.Windows_User}' AND Password = '${params.Password}'`;
            const system_User = await connection.query(getSystem_UserQuery);
            const getSystem_UserSectionsQuery = `SELECT Section FROM System_User JOIN Join_System_User_System_Section ON System_User.Id_System_User = ${system_User[0].Id_System_User} JOIN System_Section ON System_Section.Id_System_Section = Join_System_User_System_Section.Id_System_Section`;
            const system_UserSection = await connection.query(getSystem_UserSectionsQuery);
            const system_UserPropertiesQuery = `SELECT Property.Property_Code FROM System_User JOIN Join_System_User_Property ON System_User.Id_System_User = ${system_User[0].Id_System_User} JOIN Property ON Property.Id_Property = Join_System_User_Property.Id_Property;`;
            const system_UserProperties = await connection.query(system_UserPropertiesQuery);
            const system_UserSectionList = []
            const system_UserPropertiesList = []

            system_UserSection.map(sSection => {
                system_UserSectionList.push(sSection.Section)
            })

            system_UserProperties.map(property => {
                system_UserPropertiesList.push(property.Property_Code)
            })

            const System_User = [
                {
                    ...system_User[0],
                    ['Properties']: system_UserPropertiesList,
                    ['Sections']: system_UserSectionList
                }
            ]
            
            await connection.query('COMMIT');

            res.json(System_User);
        } catch(error) {
            console.error(error)
            connection.query('ROLLBACK');
        }

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }

};

const updateSystemUserById = async (req, res) => {
    try {
        const { id, password, userType, user, language } = req.body;
        
        if( id === undefined ) {
            res.status(400).json({ message: 'Bad request, please set id'});
            return;
        }

        const updateValues = [{}];
        if(password !== undefined) {
            updateValues[0].Password = password;
        }
        if(userType !== undefined) {
            updateValues[0].User_Type = userType;
        }
        if(user !== undefined) {
            user[0].User = user;
        }
        if(language !== undefined) {
            updateValues[0].Language = language;
        }

        if (Object.keys(updateValues).length === 0) {
            res.status(400).json({ message: 'Bad request, no values provided for update' });
            return;
        }

        updateValues.push(id)

        const connection = await getConnection();
        const query = `UPDATE System_User SET ? WHERE Id_System_User = ?`;
        const result = await connection.query(query, updateValues);
        res.json(result);
    } catch(error) {
        res.status(500)
        res.send(error.message)
    }
}

export const methods = {
    getSystem_Users,
    updateSystemUserById
}