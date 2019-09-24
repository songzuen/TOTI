// express
const app = require("express");
// http, app
const http = require("http");
// socket.io
const socketio = require("socket.io")(http);

var server = http
  .createServer(function(req, res) {
    res.writeHead(200, { "Content-Type": "text/html" });
    res.end();
  })
  .listen(82, function() {
    console.log("listening 82 port");
  });

// 소켓 서버 생성
var io = socketio.listen(server);

io.sockets.on("connection", function(socket) {
  // 사용자의 방 이름, 사용자 명, socket.id 값을 저장할 변수
  const loginIds = new Array();

  var roomInfo;
  // 채팅방 입장시 실행
  socket.on("join", function(data) {
    socket.leave(socket.id);
    socket.join(data.room);

    loginIds.push({
      room: data.room, // 접속한 채팅방의 이름
      user: data.user, // 유저의 이름
      target: data.target
    });

    // 입장한 유저의 정보를 출력한다.
    io.sockets.in(data.room).emit("contact", {
      name: data.name,
      message: data.user + "님이 " + data.target + "님과 채팅 시작..!"
    });

    roomInfo = loginIds[0];
  });

  socket.on("disconnect", function() {
    if (roomInfo != undefined) {
      io.sockets.in(roomInfo.room).emit("contact", {
        message: roomInfo.user + "님이 채팅방에서 나갔스ㅂ.."
      });
    }
  });

  socket.on("send_msg", function(data) {
    socket.emit("send_msg", data);
    socket.broadcast.in(data.room).emit("receiv_msg", data);
  });
});

/*
// socket 연결 성공시 콘솔 출력
io.on("connection", function(socket) {
  function setName(user) {
    console.log(user);
    return user;
  }

  var name01;

  socket.on("userName", function(user) {
    name01 = setName(user);
  });

  setTimeout(function() {
    console.log(
      "socket.id : " +
        socket.id +
        ", username : " +
        name01 +
        "이(가) 접속했습니다..!"
    );

    io.sockets.emit("alarm", `${name01}이(가) 입장..!`);
  }, 500);

  // socket 연결 종료시 콘솔 출력
  socket.on("disconnect", function() {
    console.log(
      "socket.id : " +
        socket.id +
        ", username : " +
        `${name01}이(가) 접속종료했습니다..!`
    );
    io.sockets.emit("alarm", `${name01}이(가) 퇴장..!`);
  });

  // 콘솔 출력
  socket.on("send_msg", function(msg) {
    console.log(name01 + ":" + msg);

    // 메시지는 자신을 제외한 다른 유저들에게 보낸다.
    socket.broadcast.emit("receive_msg", `[${name01}] : ${msg}`);

    // 내가 보낸 메시지를 확인하기 위한 처리
    socket.emit("send_msg", `[${name01}] : ${msg}`);
  });
});
*/
