var send = $('#send');			/*전송 버튼*/
var msgbox = $('#msgbox');		/*대화가 로딩되는 공간*/
var message = $('#message');	/*메시지 입력 input*/
/*id, name은	map.jsp 윗부분에 세션에서 받음*/

/*socket.io 서버에 접속*/
var socket = io('http://192.168.0.114:3000');
socket.emit('enter', {uid: id, name: name});
  
/*스크롤 자동으로 내리기*/
function scrollAuto() {
	msgbox.scrollTop(msgbox[0].scrollHeight);
};

/*메시지 전송*/
function sendMsg() {
	var msg = message.val();
	socket.emit('message', {uid: id, msg: msg});
	message.val('');
};
	/*1. 전송 버튼을 누를때*/
send.click(function() {
	sendMsg();
});
	/*2. 엔터를 누를때*/
message.keypress(function(event) {
	if(event.keyCode === 13) {
		sendMsg();
	}
});

/*메시지 수신*/
socket.on('message', function(msg) {
	msgbox.append(msg + '<br>');
	scrollAuto();
});

/*접속 인원 보기*/
socket.on('userList', function(userList) {
	console.log(userList);
});

/*방 만들고 접속하기*/
$('#addRoom').click(function() {
	socket.emit('join', 1);
});

/*방 나가기*/


/*방 목록보기*/
socket.on('roomList', function(roomList) {
	console.log(roomList);
});

/*방 예약하기*/


/*귓속말하기*/
