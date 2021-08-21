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
     
        <navi aria-label="Page navigation example ">
  <ul class="pagination mt-4 justify-content-center align-items-center">
  <c:choose>
  <c:when test="${param.page<=1}">
   <li class="page-item  "><a class="page-link"     onclick="alert('이전 페이지가 없습니다.');">Previous</a></li>
    </c:when>
    <c:otherwise>
     <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noti/detail?userId=${loginID}&page=${param.page-1}">Previous</a></li>
     </c:otherwise>
    </c:choose>
    <c:forEach var="i" begin="${paging.startNum}" end="${paging.endPage}" step="1">
    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noti/detail?userId=${loginID}&page=${i}">${i}</a></li>
   </c:forEach>
   
   <c:choose>
   
   	<c:when test="${param.page >= paging.endPage }">
   		<li class="page-item  "><a class="page-link"     onclick="alert('마지막 페이지 입니다.');">Next</a></li>
   	</c:when>
   	<c:otherwise>
   	 <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/noti/detail?userId=${loginID}&page=${param.page+1}">Next</a></li>
   	</c:otherwise>
    </c:choose>
  </ul>
  
</navi>
          </section>
 </div>

<%@include file="../layout/alarm.jsp" %>