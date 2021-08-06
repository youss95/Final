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
		alert("회원가입에 성공했습니다!");
		location.href="${pageContext.request.contextPath}/aMember/loginForm";
	}else{
		alert("회원가입에 실패했습니다. 다시 가입해주세요.");
		location.href = "${pageContext.request.contextPath}/aMember/signupForm";
	}	
	</script>
</body>
</html>