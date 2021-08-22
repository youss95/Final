<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
<body>
<%@include file="../layout/header.jsp" %>
 <div class="container">
        <section class="notiDetail">

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
