var WebSocket = require('ws');
var express = require('express');
var http = require('http');

var app = express()

var server = http.createServer(app);

const wss = new WebSocket.Server({ server });

wss.on('connection', function connection(ws) {
  console.log('connection event received');
  ws.on('message', function incoming(message) {
    console.log('received: %s', message);
  });
 
  ws.send('something');
});

server.listen(process.env.PORT || 8999, () => {
  console.log(`Server started on port ${server.address().port}`);
});

