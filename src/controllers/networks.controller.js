import { getConnection } from '../database/database';
import ip from 'ip';
import CIDR from 'cidr-js';

const getNetworks = async (req, res) => {
    try {
        const connection = await getConnection();
        const result = await connection.query('SELECT * FROM Networks');
        res.json(result);
    } catch(error) {
        res.status(500);
        res.send(error.message);
    }
}

const getNetworksByProperties = async (req, res) => {
    try {

        const properties = JSON.parse(req.params.properties);

        console.log(properties)

        if(properties === undefined) {
            res.status(400).json({ message: 'Bad request, please set a properties list'});
            return;
        }

        let propertiesListConditions = ''

        properties.map(property => {
            if(propertiesListConditions.length > 0) {
                propertiesListConditions += ` OR Property_Code = ${property}`
            } else {
                propertiesListConditions += `Property_Code = ${property}`
            }
        })
        
        const connection = await getConnection();
        const query = `SELECT * FROM Networks WHERE ${propertiesListConditions}`
        const networks = await connection.query(query)
        res.json(networks);
    } catch(error) {
        res.status(500);
        res.send(error.message);
    }  
}

const getDhcp_Servers = async (req, res) => {
    try {
        const connection = await getConnection();
        const result = await connection.query('SELECT * FROM DHCP_Server');
        res.json(result);
    } catch(error) {
        res.status(500);
        res.send(error.message);
    } 
}

const getDhcp_ServersById = async (req, res) => {
    try {

        const id = req.params.id

        if(id === undefined) {
            res.status(400).json({ message: 'Bad request, please set an id'});
            return;
        }
        
        const connection = await getConnection();
        const result = await connection.query(`SELECT * FROM DHCP_Server WHERE Id_Network = ${id}`);
        res.json(result);
    } catch(error) {
        res.status(500);
        res.send(error.message);
    } 
}

const getGateways = async (req, res) => {
    try {
        const connection = await getConnection();
        const result = await connection.query('SELECT * FROM Gateway');
        res.json(result);
    } catch(error) {
        res.status(500);
        res.send(error.message);
    }  
}

const getGatewaysAddress = async (req, res) => {
    try {
        const connection = await getConnection();
        const result = await connection.query('SELECT * FROM Gateways_Address');
        res.json(result);
    } catch(error) {
        res.status(500);
        res.send(error.message);
    } 
}

const getLastNetwork = async (req, res) => {
    try {
        const connection = await getConnection();
        const result = await connection.query('SELECT * FROM Network ORDER BY Id_Network DESC LIMIT 1');
        res.json(result);
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
        const switchCount = await connection.query(`SELECT COUNT(*) AS Count FROM IP_Address JOIN Switch ON IP_Address.Network = ${id} AND Switch.IP_Address = IP_Address.Id_IP_Address`);
        const pcCount = await connection.query(`SELECT COUNT(*) AS Count FROM IP_Address JOIN PC ON IP_Address.Network = ${id} AND PC.IP_Address = IP_Address.Id_IP_Address`);
        const phoneCount = await connection.query(`SELECT COUNT(*) AS Count FROM IP_Address JOIN Phone ON IP_Address.Network = ${id} AND Phone.IP_Address = IP_Address.Id_IP_Address`);
        const printerCount = await connection.query(`SELECT COUNT(*) AS Count FROM IP_Address JOIN Printer ON IP_Address.Network = ${id} AND Printer.IP_Address = IP_Address.Id_IP_Address`);
        const serverCount = await connection.query(`SELECT COUNT(*) AS Count FROM IP_Address JOIN Server ON IP_Address.Network = ${id} AND Server.IP_Address = IP_Address.Id_IP_Address`);
        const routerCount = await connection.query(`SELECT COUNT(*) AS Count FROM IP_Address JOIN Join_IP_Address_Router ON IP_Address.Id_IP_Address = Join_IP_Address_Router.Id_IP_Address AND IP_Address.Network = ${id} JOIN Router ON Join_IP_Address_Router.Id_Router = Router.Id_Router`);

        if(switchCount[0].Count > 0) {
            relations.push('Switches');
        }

        if(pcCount[0].Count > 0) {
            relations.push(`PC's`);
        }

        if(phoneCount[0].Count > 0) {
            relations.push('Phones');
        }

        if(printerCount[0].Count > 0) {
            relations.push('Printers');
        }

        if(serverCount[0].Count > 0) {
            relations.push('Servers');
        }

        if(routerCount[0].Count > 0) {
            relations.push('Routers');
        }
        
        res.json(relations);
    } catch(error) {
        res.status(500);
        res.send(error.message);
    }
}

const getIpAddress = async (req, res) => {
    try {

        const network = req.params.network;
        const ip = req.params.ip;

        console.log('NETWORK', network)
        console.log('IP', ip)

        if(network !== undefined && ip !== undefined) {
            const connection = await getConnection();
            const result = await connection.query(`SELECT * FROM Ip_Address WHERE Network = ${network} AND IP_Address = "${ip}"`);
            res.json(result);
            return
        } else if(network !== undefined) {
            const connection = await getConnection();
            const result = await connection.query(`SELECT * FROM Ip_Address WHERE Network = ${network}`);
            res.json(result);
            return
        } else if(ip !== undefined) {
            const connection = await getConnection();
            const result = await connection.query(`SELECT * FROM Ip_Address WHERE IP_Address = ${ip}`);
            res.json(result);
            return
        } else {
            const connection = await getConnection();
            const result = await connection.query(`SELECT * FROM Ip_Address`);
            res.json(result); 
            return
        }
    } catch(error) {
        res.status(500);
        res.send(error.message);
    }
}

const getAviableIpAddressesByNetwork = async (req, res) => {
    try {
        const network = req.params.network;

        if(network !== undefined) {
            const connection = await getConnection();
            const result = await connection.query(`SELECT * FROM Ip_Address WHERE Network = ${network} AND Status = ${0}`);
            res.json(result);
            return 
        } else {
            res.status(400).json({ message: "Error, bad request, please send all require data (network)." })
            return
        }
    } catch(error) {
        res.status(500);
        res.send(error.message);
    }
}

const addNetwork = async (req, res) => {
    const cidr = new CIDR();

    try {
        const { network_name, ip_address, subnet_mask, property } = req.body;

        if( network_name === undefined || ip_address === undefined || subnet_mask === undefined || property === undefined) {
            res.status(400).json({ message: "Error, bad request, please send all require data (network_name, subnet_mask, CIDR, host_number, length, property)." })
            return
        }

        const net = ip.subnet(ip_address, subnet_mask);

        const block = `${net.networkAddress}/${net.subnetMaskLength}`;
        const ipList = cidr.list(block)

        const networkData = {
            Name: network_name,
            Subnet_Mask: subnet_mask,
            CIDR: net.subnetMaskLength,
            Host_Number: net.numHosts,
            Length: net.length,
            Property: property
        };

        const connection = await getConnection();
        await connection.query('BEGIN');
        try {
            await connection.query(`INSERT INTO Network SET ?`, networkData);
            const networkId = await connection.query('SELECT LAST_INSERT_ID() AS Id_Network')
            const ipPromisesResult = await Promise.all(ipList.map(async ip => {
                const ipData = [{
                    "IP_Address": ip,
                    "status": 0,
                    "network": networkId[0].Id_Network
                }];

                return await connection.query('INSERT INTO IP_Address SET ?', ipData);
            }))

            const networkIp = await connection.query(`SELECT Id_IP_Address FROM IP_Address WHERE IP_Address = "${net.networkAddress}" AND Network = ${networkId[0].Id_Network}`);
            await connection.query(`UPDATE Network SET IP_Address = ${networkIp[0].Id_IP_Address} WHERE Id_Network = ${networkId[0].Id_Network}`);
            await connection.query(`UPDATE IP_Address SET Status = 1 WHERE Id_IP_Address = ${networkIp[0].Id_IP_Address}`);
            const broadcastIp = await connection.query(`SELECT Id_IP_Address FROM IP_Address WHERE IP_Address = "${net.broadcastAddress}" AND Network = ${networkId[0].Id_Network}`);
            await connection.query(`INSERT INTO Join_Network_IP_Address_as_Broadcast VALUES (null, ${broadcastIp[0].Id_IP_Address}, ${networkId[0].Id_Network})`);
            await connection.query(`UPDATE IP_Address SET Status = 1 WHERE Id_IP_Address = ${broadcastIp[0].Id_IP_Address}`);

            await connection.query('COMMIT');
            res.json({ message: "Network added"});
        } catch(error) {
            console.error(error);
            connection.query('ROLLBACK');
        }
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
}

const addIpAddress = async (req, res) => {
    try {
        const { ip_address, status, network } = req.body;

        if( ip_address === undefined || status === undefined || network === undefined ) {
            res.status(400).json({ message: "Error, bad request, please send all require data (ip_address, status, network)." })
            return
        }

        const ipData = {
            IP_Address: ip_address,
            Status: status,
            network: network
        };

        const connection = await getConnection();
        await connection.query(`INSERT INTO IP_Address SET ?`, ipData);
        
        res.json({ message: "IP Address added"});

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
}

const addBroadcast = async (req, res) => {
    try {
        const { network, ip } = req.body;

        if( network === undefined || ip === undefined ) {
            res.status(400).json({ message: "Error, bad request, please send all require data (network, ip)." })
            return
        }

        const broadcastData = {
            Id_IP_Address: ip,
            Id_Network: network
        };

        const connection = await getConnection();
        await connection.query(`INSERT INTO Join_Network_IP_Address_as_Broadcast SET ?`, broadcastData);
        
        res.json({ message: "Broadcast added"});

    } catch (error) {
        res.status(500);
        res.send(error.message);
    } 
}

const updateNetwork = async (req, res) => {
    try {
        const { id, network_name, subnet_mask, CIDR, host_number, length, ip_address, property } = req.body;
        
        const updateValues = [{}];

        if( id === undefined ) {
            res.status(400).json({ message: 'Bad request, please set id'});
            return;
        }

        if( network_name !== undefined ) {
            updateValues[0].Name = network_name
        }

        if( subnet_mask !== undefined ) {
            updateValues[0].Subnet_Mask = subnet_mask
        }

        if( CIDR !== undefined ) {
            updateValues[0].CIDR = CIDR
        }

        if( host_number !== undefined ) {
            updateValues[0].Host_Number = CIDR
        }

        if( length !== undefined ) {
            updateValues[0].Length = length 
        }

        if( ip_address !== undefined ) {
            updateValues[0].IP_Address = ip_address
        }

        if( property !== undefined ) {
            updateValues[0].Property = property
        }

        updateValues.push(id)

        console.log(updateValues)

        const connection = await getConnection();
        const query = `UPDATE Network SET ? WHERE Id_Network = ?`;
        const result = await connection.query(query, updateValues);
        res.json(result);
    } catch(error) {
        res.status(500)
        res.send(error.message)
    }
}

const deleteNetwork = async (req, res) => {
    try{
        const { id } = req.body;

        if(id === undefined) { 
            res.status(400).json({ message: 'Bad request, please set a property id'});
            return;
        }

        const connection = await getConnection();
        const result = connection.query(`DELETE FROM Network WHERE Id_Network = ${id}`)
        res.json(result)
    } catch(error) {
        res.status(500);
        res.send(error.message);
    }
}

export const methods = {
    getNetworks,
    getNetworksByProperties,
    getDhcp_Servers,
    getDhcp_ServersById,
    getGateways,
    getGatewaysAddress,
    getLastNetwork,
    getRelations,
    getIpAddress,
    getAviableIpAddressesByNetwork,
    deleteNetwork,
    addNetwork,
    addIpAddress,
    addBroadcast,
    updateNetwork
}