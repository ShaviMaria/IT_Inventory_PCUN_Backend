import { Router } from 'express';
import { methods as propertyController } from '../controllers/properties.controller';

const router = Router();

router.get('', propertyController.getProperties);
router.get('/ByList/:properties', propertyController.getPropertiesByList);
router.get('/Last', propertyController.getLastProperty);
router.get('/getRelations/:id', propertyController.getRelations);
router.put('', propertyController.updatePropertyById);
router.post('', propertyController.addProperty);
router.delete('', propertyController.deleteProperty);

export default router;