<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
 -->
</head>
<script src="/projectB/js/jquery-1.10.2.min.js"></script>
<script src="/projectB/js/socket.io.js"></script>
<script>
	$(document).ready(function() {
		var socket = io.connect("http://192.168.0.119:12345");  //서버연결 
		socket.on('response', function(msg){// 서버로부터 채팅메세지를 계속 받고있다. ..
			$("#msgs").empty();		//모든 요소를비운다.
			$('#msgs').append('<br>' + msg.msg);		// 채팅 메세지 받아 출력 부분..
		});
		
		// 텍스트박스내부의 채팅 내용 보내기
		$("#sendBtn").bind("click", function() {	
			//alert('aa');
			var msg = $("input[name=chat]").val();
			//alert(msg);
			socket.emit('msg', {msg:msg});
		});
	});
</script>
</head>
<body>
	<h3>키워드 응답</h3>
	<h4>청원</h4>
	<input type="text" name="chat" />
	<input type="button" value="send" id="sendBtn" />
	 <span id="msgs"></span>
</body>
<!-- <body>
    <div>
        <input type="text" id="sender" value="사용자" style="display: none;">
        <input type="text" id="messageinput">
    </div>
    <div>
        <button type="button" onclick="openSocket();">연결</button>
        <button type="button" onclick="send();">보내기</button>
        <button type="button" onclick="closeSocket();">닫기</button>
    </div>
    Server responses get written here
    <div id="messages"></div>
    websocket javascript
    <script type="text/javascript">
        var ws;
        var messages=document.getElementById("messages");
        
        function openSocket(){
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
                writeResponse("WebSocket is already opened.");
                return;
            }
            //웹소켓 객체 만드는 코드
            ws=new WebSocket("ws://localhost:8080/projectB/echo.aa");
            
            ws.onopen=function(event){
                if(event.data===undefined) return;
                
                writeResponse(event.data);
            };
            ws.onmessage=function(event){
                writeResponse(event.data);
            };
            ws.onclose=function(event){
                writeResponse("Connection closed");
            }
        }
        
        function send(){
            var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value;
            //alert(text);
            ws.send(text);
            text="";
        }
        
        function closeSocket(){
            ws.close();
        }
        function writeResponse(text){
            messages.innerHTML+="<br/>"+text;
        }
  </script>
</body> -->
</html>
