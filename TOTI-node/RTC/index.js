"use strict";

var os = require("os");
var nodeStatic = require("node-static");
var http = require("http");
var socketIO = require("socket.io");


var fileServer = new nodeStatic.Server();
var app = http
  .createServer(function(req, res) {

    fileServer.serve(req, res);

  })
  .listen(8000);

var io = socketIO.listen(app);
io.sockets.on("connection", function(socket) {
  // convenience function to log server messages on the client
  function log() {
    var array = ["Message from server:"];
    array.push.apply(array, arguments);
    socket.emit("log", array);
  }

  var roomnum;


  socket.on("message", function(message) {
    log("Client said: ", message);
    // for a real app, would be room-only (not broadcast)
    io.sockets.in(roomnum).emit("message", message);
  });

  socket.on("create or join", function(room) {
    roomnum = room;
    log("Received request to create or join room " + room);

    var clientsInRoom = io.sockets.adapter.rooms[room];
    var numClients = clientsInRoom
      ? Object.keys(clientsInRoom.sockets).length
      : 0;
    log("Room " + room + " now has " + numClients + " client(s)");

    if (numClients === 0) {
      socket.join(room);
      log("Client ID " + socket.id + " created room " + room);
      io.sockets.in(room).emit("created", room);
    } else if (numClients === 1) {
      log("Client ID " + socket.id + " joined room " + room);
      io.sockets.in(room).emit("join", room);
      socket.join(room);
      io.sockets.in(room).emit("joined", room);
      io.sockets.in(room).emit("ready");
    } else {
      // max two clients
      io.sockets.in(room).emit("full", room);
    }
  });

  socket.on("ipaddr", function() {
    var ifaces = os.networkInterfaces();
    for (var dev in ifaces) {
      ifaces[dev].forEach(function(details) {
        if (details.family === "IPv4" && details.address !== "127.0.0.1") {
          socket.emit("ipaddr", details.address);
        }
      });
    }
  });

  socket.on("bye", function() {
    console.log("received bye");
  });
});
