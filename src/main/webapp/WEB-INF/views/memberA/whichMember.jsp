<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
* {
	box-sizing: border-box;
}

.container {
	padding-top: 10px !important;
	margin-top: 20px;
	max-width: 500px;
	text-align: center;
}

img {
	width: 300px;
	height: 85px;
	margin-left: 30px
}

button {
	margin-bottom: 10px;
}
</style>
</head>

<body>

	<div class="container p-5 shadow bg-white rounded">

		<div>
			<a href="${pageContext.request.contextPath}/"><img
				src="/resources/images/logoTxt&Pic.png"></a>
		</div>


		<div class="card bg-light">
			<article class="card-body mx-auto" style="max-width: 400px;">
				<h4 class="card-title mt-3 text-center"></h4>
				<p class="text-center"></p>

				<p class="divider-text">
					<span class="bg-light">Who are you?</span>
				</p>

				<div class="form-group">
					<a href="${pageContext.request.contextPath}/cMember/loginForm"><button
							type="button" class="btn btn-primary btn-block">Client</button></a> <a
						href="${pageContext.request.contextPath}/bMember/loginForm"><button
							type="button" class="btn btn-primary btn-block">
							Business(사업자)</button></a> <a
						href="${pageContext.request.contextPath}/aMember/loginForm">
						<button type="button" class="btn btn-primary btn-block">
							Admin(관리자)</button>
					</a>
				</div>

			</article>
		</div>
	</div>







</body>
</html>