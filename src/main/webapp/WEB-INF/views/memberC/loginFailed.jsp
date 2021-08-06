<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Client Login Failed</title>
</head>
<body>
	<script>

		alert("Fail to Login. Try again.");
		location.href = "${pageContext.request.contextPath}cMember/loginForm";
	
	</script>
</body>
</html>