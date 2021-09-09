<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
 let socket = null;  
 $(document).ready(function(){
 	connectWS();
 })
//연결
 function connectWS(){
 	var ws = new WebSocket("ws://122.45.84.154:8080/likeEcho");
 	socket = ws;
 	ws.onopen = function () { //커넥션 연결되었을떄
 	    console.log('Info: connection opened.');
 	   
 }
 	//메시지를 서버로부터 받았을때
     ws.onmessage = function (event) {
    	 console.log(event)
         console.log("받은 메시지: "+ event.data+'\n');
    	 let getMsg = event.data.split(",")
    	 let toMsg = getMsg[0];
    	 let toAla = getMsg[1]
         toastr.success("알림", toMsg);
    	
    		
    		 let gs = $('.nav-counter').text();
    		let total = parseInt(gs)
    		
    		  $('.nav-counter').text(total+1)
    	
        
     };
     
     ws.onclose = function (event) { 
     	console.log('Info: connection closed.');
     	//setTimeout( function(){ connect(); }, 1000); // retry connection!!
     	};
     ws.onerror = function (error) { console.log('Info: connection error.'); };
   
 };
 

  
 </script>
