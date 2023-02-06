import { Router } from 'express';
import { methods as system_UserController } from '../controllers/system_User.controller';

const router = Router();

router.get('/:user/:password', system_UserController.getSystem_Users);

export default router;