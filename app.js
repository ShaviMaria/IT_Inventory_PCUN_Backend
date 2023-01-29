const express = require('express');
const path = require('path');
const app = express();
const routes = require('./routes/index');
const bodyParser = require('body-parser');

//settings
app.set('port', process.env.PORT || 3000);
//app.set('public', path.join(__dirname, '/public'));
app.set('public', __dirname + "/public");
app.set('view engine', 'ejs');

//middlewares
app.use((req, res, next) => {
    console.log(`${req.url} -${req.method}`);
    next();
});

//app.use(bodyParser);
//app.use(bodyParser.urlencoded());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

//routes
app.use(routes);

//static files
//app.use(express.static(path.join(__dirname, '/public')));
app.use(express.static(__dirname + '/public'));

//start the server
app.listen(app.get('port'), () => console.log(`Server running on port ${app.get('port')}`));