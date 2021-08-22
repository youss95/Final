<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<button id="insertC">insert Client</button>
	<button id="insertB">insert Business</button>
	
	<script>
		$("#insertC").on("click", function(){
			alert("insertC 누름");
			location.href="${pageContext.request.contextPath}/admin/insertC";
		})
		$("#insertB").on("click", function(){
			alert("insertB 누름");
			location.href="${pageContext.request.contextPath}/admin/insertB";
		})
	</script>
</body>
</html>