var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/apps', function (req, res, next) {
  res.send('Hello World this is apps page !!!')
})

module.exports = router;
