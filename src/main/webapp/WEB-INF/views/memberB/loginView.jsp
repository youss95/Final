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
	<c:choose>
		<c:when test="${loginID != null}">
			<script>
			Swal.fire({
				  icon: "success",
				  title: "로그인 성공",
				  text: "${loginID}님 환영합니다!", 
				  showConfirmButton: false,
				  timer: 1100			 	 
				}).then(function() {
				  location.href="${pageContext.request.contextPath}/bMember/myPage";
				});

			</script>
		</c:when>
		<c:otherwise>
			<script>
			Swal.fire({
				  icon: "error",
				  title: "로그인 실패",
				  text: "아이디와 비밀번호를 정확히 입력해주세요",
			}).then(function() {
				location.href="${pageContext.request.contextPath}/bMember/loginForm";
			});
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>