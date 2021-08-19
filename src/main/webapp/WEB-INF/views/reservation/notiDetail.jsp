<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<style>
.notiDetail {
margin-top:300px;
}
</style>

<body>
<%@include file="../layout/header.jsp" %>
 <div class="container">
        <section class="notiDetail">
        <div>  <h3>알람</h3></div>
           <table class="table">
  <thead>
    <tr>
      <th scope="col">No</th>
      <th scope="col">Content</th>
      <th scope="col">Date</th>
     
    </tr>
  </thead>
      
  <tbody>
   <c:forEach var="notiList" items="${notiList}">
    <tr>
      <th scope="row">${notiList.noti_no}</th>
      <td>  ${notiList.content}</td>
      <td>${notiList.noti_createDate}</td>
    </tr>
      </c:forEach>
  </tbody>
 
</table>
      
        
          </section>
 </div>

<%@include file="../layout/alarm.jsp" %>