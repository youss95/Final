<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Sign-up Result</title>
</head>
<body>
	<script>
	if(${result>0}){
		alert("Sign-up Success!");
		location.href="/"
	}else{
		alert("Fail to sign up. Try again.");
		location.href = "${pageContext.request.contextPath}cMember/signupForm";
	}	
	</script>
</body>
</html>