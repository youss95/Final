<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<style>
.container {
	max-width: 800px;
}
</style>
</head>
<body>
	<div class="container p-2 shadow bg-white rounded">
		<c:choose>
			<c:when test="${loginID!=null }">
				<ul class="nav justify-content-end" style="background-color: white">

					<li class="nav-item"><a class="nav-link" style="color: black"
						href="${pageContext.request.contextPath}/mypage.mp">My Page</a></li>
					<li class="nav-item"><a class="nav-link" style="color: black"
						href="${pageContext.request.contextPath}/member/logout"><i
							class="fas fa-sign-out-alt"></i></a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="nav justify-content-end" style="background-color: white">

					<li class="nav-item"><a class="nav-link" style="color: black"
						href="${pageContext.request.contextPath}/member/whichMember">Login</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>