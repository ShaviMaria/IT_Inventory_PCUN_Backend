import { Router } from 'express';
import { methods as userController } from '../controllers/users.controller';

const router = Router();

router.get('/:id', userController.getUsers);
router.get('', userController.getUsers);

export default router;