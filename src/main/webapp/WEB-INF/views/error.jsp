<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@600;900&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/4b9ba14b0f.js" crossorigin="anonymous"></script>
  <style>
  body {
  background-color: white;
}

.mainbox {
  background-color: white;
  border:12px solid #313a7b;
  margin: auto;
  height: 465px;
  width: 600px;
  position: relative;
}

  .err {
    color: #313a7b;
    font-family: 'Nunito Sans', sans-serif;
    font-size: 8rem;
    position:absolute;
    left: 27%;
    top: 5%;
  }

.far {
  position: absolute;
  font-size: 6rem;
  left: 43%;
  top: 13%;
  color: #313a7b;
}

 .err2 {
    color: #313a7b;
    font-family: 'Nunito Sans', sans-serif;
    font-size: 8rem;
    position:absolute;
    left: 61%;
    top: 5%;
  }

.msg {
    color: #313a7b;
    text-align: center;
    font-family: 'Nunito Sans', sans-serif;
    font-size: 1.6rem;
    position:absolute;
    left: 13%;
    top: 40%;
    width: 75%;
  }

a {
  text-decoration: none;
  color:  deeppink;
}

a:hover {
  text-decoration: underline;
}

img{
position:absolute;
top:78%;
width: 183px;
height:100px;
left: 69%;
}

  </style>
</head>
<body>
  <div class="mainbox">
    <div class="err">4</div>
    <i class="far fa-question-circle" style="font-color:black"></i>
<!--     <i class="far fa-question-circle fa-spin" style="font-color:black"></i> -->
    <div class="err2">4</div>
    <div class="msg"> Error! Page Not Found <p>Let's <a href="${pageContext.request.contextPath}/">go home</a> and try from there.</p></div>
 	<a href="${pageContext.request.contextPath}/"><img src="/resources/images/logoTxt&Pic.png" ></a>
  </div>
</body>