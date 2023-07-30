import e, { Router } from 'express';
import { methods as eventController } from '../controllers/networks.controller';

const router = Router();

router.get('', eventController.getNetworks);
router.get('/ByProperties/:properties', eventController.getNetworksByProperties);
router.get('/DHCP_Servers', eventController.getDhcp_Servers);
router.get('/DHCP_Servers/:id', eventController.getDhcp_ServersById);
router.get('/Relations/:id', eventController.getRelations);
router.get('/Gateways', eventController.getGateways);
router.get('/LastNetwork', eventController.getLastNetwork);
router.get('/IP_Address/:network/:ip', eventController.getIpAddress);
router.get('/IP_Addresses/Aviable/:network', eventController.getAviableIpAddressesByNetwork);
router.post('', eventController.addNetwork);
router.post('/IP_Address', eventController.addIpAddress);
router.post('/Broadcast', eventController.addBroadcast);
router.put('', eventController.updateNetwork);
router.delete('/', eventController.deleteNetwork);

export default router;