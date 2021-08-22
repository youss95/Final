<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>

<script>
			Swal.fire({
				  icon: 'error',
				  title: "로그인 실패",
				  text: '입력하신 정보를 다시 확인해보세요 ',
			}).then(function() {
				location.href="${pageContext.request.contextPath}/bMember/loginForm";
			});
</script>
			
</body>
</html>