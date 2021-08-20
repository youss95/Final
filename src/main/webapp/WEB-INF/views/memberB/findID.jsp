<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FindID</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
.divider-text {
    position: relative;
    text-align: center;
    margin-top: 15px;
    margin-bottom: 15px;
}
.divider-text span {
    padding: 7px;
    font-size: 12px;
    position: relative;   
    z-index: 2;
}
.divider-text:after {
    content: "";
    position: absolute;
    width: 100%;
    border-bottom: 1px solid #ddd;
    top: 55%;
    left: 0;
    z-index: 1;
}

.btn-facebook {
    background-color: #405D9D;
    color: #fff;
}
.btn-twitter {
    background-color: #42AEEC;
    color: #fff;
}
.result{
margin-bottom:15px;
}

 .emailDnone{ 
 display:none 
 } 
  .emailDnone2{ 
 display:none 
 } 

    </style>


<script>
$(function(){
	
	
		//이메일 인증번호
		$("#emailSend").on("click",function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/bMember/emailSend",
				data:{"name":$("#name").val(), "email":$("#email").val()}
			}).done(function(resp){
				$("#sendNum").val(resp);
				$(".emailDnone").css("display","flex");
			}).fail(function(){
				alert("이메일 발송에 실패하였습니다. 다시 시도해주세요.")
			})
		})
		//이메일 인증번호 확인
		$("#emailConfirm").on("click",function(){
		if($("#emailNum").val() == $("#sendNum").val()){
			$("#eResult").text("이메일 주소가 인증되었습니다.");
			$(".emailDnone2").css("display","flex");
		}else{
			$("#eResult").text("이메일 인증 실패! 다시 시도해주세요.")
		}
		})
	
	
	
	$("#findIdBtn").on("click",function(){
		
// 		let emailReg = /^[0-9a-zA-Z_-]*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 		let email = $("#email").val();

// 		if (!emailReg.test(email)) {
// 			alert("이메일 형식을 확인해주세요.");
// 			$("#email").focus();
			
// 		}else{
			$.ajax({
				url:"/bMember/findIDProc",
				data:{"name":$("#name").val(), "email":$("#email").val()}
			}).done(function(resp){
				if(resp!=null&&resp!=''){
					$("#noneDiv").css("display","flex");
	 				$("#id").val(resp);
	 				$("#noneDiv2").css("display","none");
				}else{
					$("#noneDiv2").css("display","block");
					$("#noneDiv").css("display","none");
				}
			})
		
		
	})
	
	
	
	
	
	
})



</script>


    
</head>
<body>

<div class="card bg-light">
        <article class="card-body mx-auto" style="max-width: 400px;">
            <h4 class="card-title mt-3 text-center">Find Your ID</h4>
           
            <p class="divider-text">
                <span class="bg-light">Personal Info</span>
            </p>


           
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                 </div>
                <input id="name" name="name" class="form-control" placeholder="Name" type="text">
            </div> <!-- form-group// -->


            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                 </div>
                <input id="email" name="email" class="form-control" placeholder="Email address" type="email">
                <button id="emailSend" type="button" class="btn btn-primary">&nbsp;Send&nbsp;</button>
            </div> <!-- form-group// -->
            
            <div class="form-group input-group emailDnone">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                 </div>
                <input name="emailNum" id="emailNum" class="form-control" placeholder="이메일 인증번호" type="text">
                <input type='hidden' id='sendNum'>
                <button id="emailConfirm" type="button" class="btn btn-primary" style="font-size:13px">Confirm</button>
            </div> <!-- form-group// -->
			<div id="eResult" class="result"></div>
            
            
            <div class="form-group emailDnone2">
        		<button id="findIdBtn" type="button" class="btn btn-primary btn-block"> Find My ID </button>
    		</div> <!-- form-group// -->      
            
            
            
            <div class="form-group input-group" id="noneDiv" style="display:none">
                <div class="input-group-prepend">
                    <span class="input-group-text"> ID </span>
                 </div>
                <input name="id" id="id" class="form-control" type="text" readonly style="background-color:white">
            </div> <!-- form-group// -->
            
            <div class="form-group input-group" id="noneDiv2" style="display:none">
                <div class="input-group-prepend">
           			 정보와 일치하는 회원이 없습니다.
                 </div> 
            </div> <!-- form-group// -->
			


           


<!--     <div class="form-group"> -->
<%--        <a href="${pageContext.request.contextPath}/bMember/loginForm"><button type="button" class="btn btn-primary btn-block"> Login  </button></a> --%>
<!--     </div> form-group//       -->
    <p class="text-center" style="margin-top:100px">Have an account? &nbsp; <a href="${pageContext.request.contextPath}/bMember/loginForm">LogIn</a> </p>        
    <p class="text-center">Create free account! &nbsp; <a href="${pageContext.request.contextPath}/bMember/signupForm">SignUp</a> </p>                                                                 
</article>
</div> <!-- card.// -->


<!--container end.//-->

<br><br>
<article class="bg-secondary mb-3">  
<div class="card-body text-center">

</div>
<br><br>
</article>



</body>
</html>