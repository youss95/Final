<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@600;900&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/4b9ba14b0f.js" crossorigin="anonymous"></script>
  <style>
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



  </style>
</head>
<body>
  <div class="mainbox">
    <div class="err">  </div>
  
    <div class="msg"> Error! Page Not Found <p>Let's <a href="${pageContext.request.contextPath}/">go home</a> and try from there.</p></div>
 	
  </div>
</body>