<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>

<div class="modal-body" id="modal_time">
      <span class="select_time" data-res='12:00'>12:00</span>
      <span class="select_time" data-res='13:00'>13:00</span>
      <span class="select_time" data-res='18:00'>18:00</span>
      <span class="select_time" data-res='19:00'>19:00</span>
      <span class="select_time" data-res='20:00'>20:00</span>
      </div>
<button id="resBtn">등록</button>
<button id="testBtn">btn</button>
<script>
$("#testBtn").on('click',function(){
	location.href="/board/testBtn"
})

//checkbox 로 변경
let result = '';
let data ='';
$(".select_time").on('click',function(){
	resTime = $(this).data('res');
	result = result + resTime+","
	console.log(result)
	console.log(resTime)
	data=result
	
})
$("#resBtn").on('click',function(){
	console.log("result",result)
	console.log("data",data)
	$.ajax({
		url:"/replies/resTime",
		data:data,
		type:"post",
		contentType:"text/html; charset=utf-8"
	}).done(function(res){
		console.log(res)
		location.href="/res/calendar?time="+data
	})
})

</script>
</body>
</html>