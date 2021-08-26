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
				  title: "번역 서비스 이용 불가",
				  text: '업체 정보를 등록해야 번역 서비스 이용이 가능합니다. ',
			}).then(function() {
				location.href="${pageContext.request.contextPath}/bMember/myPage";
			});
</script>
			
</body>
</html>