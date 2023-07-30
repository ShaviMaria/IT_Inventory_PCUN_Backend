import { Router } from 'express';
import { methods as eventController } from '../controllers/events.controller';

const router = Router();

router.post('', eventController.addGenericEvent);

router.get('/System_User/:id', eventController.getSystem_User_Events);
router.get('/System_User/', eventController.getSystem_User_Events);
router.post('/System_User', eventController.addSystem_User_Event);

router.get('/Property', eventController.getProperty_Events);
router.post('/Property', eventController.addProperty_Event);

export default router;