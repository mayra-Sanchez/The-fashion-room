const {Router} = require('express');
const { insertUser, getUser, deleteUser, updateUser } = require('../controllers/users.controllers');

const router = Router();

router.get('/users/:id', getUser);

router.post('/insert', insertUser);

router.delete('/delete/:id', deleteUser);

router.put('/update/:id', updateUser);

module.exports = router;