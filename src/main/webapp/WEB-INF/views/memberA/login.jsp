<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

<style>
* {
	box-sizing: border-box;
}

.container {
	max-width: 600px;
	padding-top:5px !important;
	padding-bottom: 30px !important;
}




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

img{
width: 300px;
height:85px;
margin-left:100px
}
</style>
</head>
<body>

<div class="container p-5 shadow bg-white rounded">
    	<div><a href="${pageContext.request.contextPath}/"><img src="/resources/images/logoTxt&Pic.png"></a></div>

        <div class="card bg-light">
        <article class="card-body mx-auto" style="max-width: 400px;">
            <h4 class="card-title mt-3 text-center"></h4>
            <p class="text-center"></p>
           
            <p class="divider-text">
                <span class="bg-light">로그인</span>
            </p>


            <form id="loginForm" action="${pageContext.request.contextPath}/aMember/loginProc">
            
            
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                 </div>
                <input id="iid" name="emp_id" class="form-control" placeholder="ID" type="text">    
            </div> <!-- form-group// -->
			


            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                </div>
                <input id="ipw" name="pw" class="form-control" placeholder="Password" type="password">
            </div> <!-- form-group// -->

    <div class="form-group">
        <button type="button" id="login" class="btn btn-primary btn-block"> LOGIN </button>
        
    </div> <!-- form-group// -->    
     <p style="margin-top:50px" class="text-center">아직 회원이 아니신가요? <a href="${pageContext.request.contextPath}/aMember/signupForm">Sign Up</a> </p>                                                                 
</form>
</article>
</div> <!-- card.// -->

    </div>





    <script>
        $("#login").on("click", function(){
            if($("#iid").val()==""){
                alert("ID must be entered");
                $("#iid").focus();
            }else if($("#ipw").val()==""){
                alert("Password must be entered");
                $("#ipw").focus();
            }else{
                $("#loginForm").submit();
            }
        })
      
    </script>
	
</body>
</html>