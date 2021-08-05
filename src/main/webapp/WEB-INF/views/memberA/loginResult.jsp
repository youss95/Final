<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	if(${result=="true"}){
		alert("로그인에 성공하였습니다.");
		location.href="/"
	}else{
		alert("로그인에 실패하셨습니다. ID와 비밀번호를 확인해주세요.");
		location.href = "${pageContext.request.contextPath}aMember/loginForm";
	}	
	</script>
</body>
</html>