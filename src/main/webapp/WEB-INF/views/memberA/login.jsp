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

<style>
* {
	box-sizing: border-box;
}

div {
	border: 1px solid black;
}

.container {
	max-width: 600px;
	margin: auto;
}

.wrapper {
	max-width: 300px;
	margin: auto;
}

.logo {
	text-align: center;
}

input {
	width: 100%;
}

button {
	width: 49.2%;
}
</style>
</head>
<body>
    <div class="container p-5 shadow bg-white rounded">
        <form action="${pageContext.request.contextPath}/aMember/loginProc" id="loginForm" method="POST">
            <div class="wrapper">
                <div class="row header">
                    <div class="col-12 logo">LOGO</div>                    
                </div>
                <div class="row">
                    <div class="col-12"><input id="iid" name="id" type="text" placeholder="ID를 입력하세요."></div></div>
                <div class="row">
                    <div class="col-12"><input id="ipw" name="pw" type="password" placeholder="비밀번호를 입력하세요."></div></div>
                <div class="row">
                    <div class="col-12">
                        <button type="button" id="login">Log-in</button>
                        <button type="button" id="signup">Sign-up</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6"><a href="">아이디 찾기</a></div>
                    <div class="col-6"><a href="">비밀번호 찾기</a></div>
                </div>
            </div>

        </form>

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
        $("#signup").on("click", function(){
            location.href="${pageContext.request.contextPath}/aMember/signupForm";
        })
    </script>
	
</body>
</html>