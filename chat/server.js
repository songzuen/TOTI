// express
var app = require("express")();
// http, app
var http = require("http").Server(app);
// socket.io
var io = require("socket.io")(http);

// get 요청
app.get("/", function(req, res) {
  res.send("<h1>Hello</h1>");
});

// user 구분을 위한 변수

function getRandomCode(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

// socket 연결 성공 시 콘솔 출력
io.on("connection", function(socket) {
  // user 구분을 위한 변수
  var usercode = getRandomCode(1, 9999);

  var name = "user" + usercode;

  io.to(socket.id).emit("user_name", name);
  console.log(
    "socket.id : " +
      socket.id +
      ", username : " +
      name +
      "이(가) 접속했습니다..!"
  );

  io.sockets.emit("alarm", `${name}이(가) 입장..!`);

  socket.on("disconnect", function() {
    console.log(
      "socket.id : " +
        socket.id +
        ", username : " +
        name +
        "이(가) 접속종료했습니다..!"
    );
    io.sockets.emit("alarm", `${name}이(가) 퇴장..!`);
  });

  // 콘솔 출력
  socket.on("send_msg", function(msg) {
    console.log(name + ":" + msg);

    // 소켓을 통해 이벤트를 다시 전송한다.
    socket.broadcast.emit("receive_msg", `[${name}] : ${msg}`);
    socket.emit("send_msg", `[${name}] : ${msg}`);
  });
});

// 82번 포트를 서버로 사용
http.listen(82, function() {
  // 콘솔창에 출력
  console.log("listening on *:82");
});
