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
<script type="text/javascript">
window.history.forward();
function noBack() {window.history.forward();}
 </script>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<script>
			Swal.fire({
				  icon: 'info',
				  title: "회원 탈퇴 완료",
				  text: '회원 정보를 모두 삭제하였습니다.',
			}).then(function() {
				location.href="${pageContext.request.contextPath}/";
			});
</script>
</body>
</html>