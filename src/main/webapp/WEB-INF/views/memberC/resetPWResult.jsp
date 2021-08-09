<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Client Sign-up Result</title>
</head>
<body>
	<script>
	if(${result>0}){
		alert("Reset Password SUCESS!");
		location.href="${pageContext.request.contextPath}/cMember/loginForm";
	}else{
		alert("FAIL to reset your password. Try again.");
		location.href = "${pageContext.request.contextPath}/cMember/findPWForm";
	}	
	</script>
</body>
</html>