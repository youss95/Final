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
.noneDiv{
display:none
}

 .emailDnone{ 
 display:none 
 } 
 

    </style>


<script>
$(function(){
	
	
	//이메일 인증번호 & 회원정보 일치 체크
	$("#emailSend").on("click",function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/bMember/checkAndEmailSend",
			data:{"id":$("#id").val(),"name":$("#name").val(), "email":$("#email").val()}
		}).done(function(resp){
			if(resp=="0"){
				$("#noneDiv2").css("display","block");
			}
			else{
				$("#sendNum").val(resp);
				$("#checkId").val($("#id").val());
				$("#noneDiv2").css("display","none");
				$(".emailDnone").css("display","flex");
			}
		}).fail(function(){
			alert("이메일 발송에 실패하였습니다. 다시 시도해주세요.")
		})
	})
	//이메일 인증번호 확인
	$("#emailConfirm").on("click",function(){
	if($("#emailNum").val() == $("#sendNum").val()){
		$("#eResult").text("이메일 주소가 인증되었습니다.");
		$(".noneDiv").css("display","flex");
	}else{
		$("#eResult").text("이메일 인증 실패! 다시 시도해주세요.")
	}
	})
	
	
	
	
// 	$("#confirm").on("click",function(){
		
// 		let idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
// 		let id = $("#id").val();
// 		let nameReg = /^.{2,30}$/;
// 		let name = $("#name").val();
// 		let emailReg = /^[0-9a-zA-Z_-]*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 		let email = $("#email").val();
		
// 		if (!idReg.test(id)) {
// 			alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
// 			$("#id").focus();
// 		}else if (!nameReg.test(name)) {
// 			alert("이름은 2글자 이상 30글자 미만으로 입력해야 합니다.");
// 			$("#name").focus();
// 		}else if (!emailReg.test(email)) {
// 			alert("이메일 형식을 확인해주세요.");
// 			$("#email").focus();
// 		}
		
// 		else{
// 			$.ajax({
// 				url:"/bMember/findPWProc",
// 				data:{"id":$("#id").val(),"name":$("#name").val(), "email":$("#email").val()},
// 			}).done(function(resp){
// 				if(resp!=null&&resp!=''){
// 					$("#checkId").val(resp);
// 					$(".noneDiv").css("display","flex");
// 					$("#noneDiv2").css("display","none");
// 				}else{
// 					$("#noneDiv2").css("display","block");
// 					$("#noneDiv").css("display","none");
// 				}
				
// 			})
// 		}
		
// 	})
	
	
	$("#pwFrm").on("submit",function(){
// 		let pwReg = /^[A-Za-z0-9#?!@$%^&*-]{8,}$/;
		let pw = $("#pw").val();
		let repw = $("#repw").val();
		
		if(pw != repw){
			alert("패스워드가 일치하지 않습니다.");
			return false;
		}
		
// 		if (!pwReg.test(pw)) {
// 			alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
// 			return false;
// 		}

	})
	
	
	
	
	
})



</script>


    
</head>
<body>

<div class="card bg-light">
        <article class="card-body mx-auto" style="max-width: 400px;">
            <h4 class="card-title mt-3 text-center">Find Your PW</h4>
           
            <p class="divider-text">
                <span class="bg-light">Personal Info</span>
            </p>


			<div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                 </div>
                <input name="id" id="id" class="form-control" placeholder="ID" type="text">
            </div> 

           
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
			
            
<!--             <div class="form-group noneBtn"> -->
<!--         		<button id="confirm" type="button" class="btn btn-primary btn-block"> Change Your PW </button> -->
<!--     		</div> form-group//       -->
            
            
            <form id="pwFrm" action="${pageContext.request.contextPath}/bMember/changePW" >
            <div class="form-group input-group noneDiv">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                </div>
                <input id="pw" name="pw" class="form-control" placeholder="Change password" type="password">
            </div> <!-- form-group// -->
            <div class="form-group input-group noneDiv">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                </div>
                <input id="repw" class="form-control" placeholder="Repeat password" type="password">
            </div> <!-- form-group// -->      
            <div class="form-group noneDiv">
        		<button id="submit" class="btn btn-primary btn-block"> Submit  </button>
    		</div> <!-- form-group// -->     
    		<input type="hidden" id="checkId" name="id" >
            </form>    
            
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