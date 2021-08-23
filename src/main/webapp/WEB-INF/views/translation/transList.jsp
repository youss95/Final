<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://kit.fontawesome.com/be4f056d3a.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<style>
* {
	box-sizing: border-box;
	text-align: center;
}

body {
	background-color: #D8E3E7;
}

.container {
	margin-top: 80px;
	padding: 5%;
	max-width: 600px;
}

.row {
	text-align: center;
}

.header {
	margin: 3%;
}

.search {
	margin: 3%;
}

.columns {
	padding: 1%;
	border-bottom: 3px solid black;
	margin-left: 10px;
	margin-right: 10px;
}

.list {
	margin: 1%;
	border-bottom: 1px solid black;
	padding-bottom: 1%;
}

.footer {
	margin: 2%;
}

a {
	text-decoration: none;
	color: black;
}

.navbar>.container-fluid {
	padding: 0px;
}

.navbar-nav {
	flex-grow: 1;
	justify-content: space-around;
}

.slide {
	position: absolute;
	width: 100%;
	height: 50px;
	top: 100%;
	background-color: #55555550;
}

.fa-bell {
	color: rgb(236, 95, 95);
}
</style>

</head>

<body>


	<div class="container p-4 shadow bg-white rounded">
		<div class="row header">
			<h2 style="width: 100%;">
				<b>번역 요청함</b>
			</h2>
		</div>



		<div class="row columns">
			<div class="col-2"></div>
			<div class="col-7">상호명</div>
			<div class="col-3">요청일</div>
		</div>

		<c:forEach var="item" items="${pageList}" varStatus="s">
			<div class="row list" style="overflow: hidden">
				<c:choose>
					<c:when test="${item.confirm_YN=='N'}">
						<div class="col-2">
							<i class="fas fa-bell"></i>
						</div>
						<div class="col-7">
							<a
								href="${pageContext.request.contextPath}/trans/transDetail?biz_seq=${item.biz_seq }">
								${item.business_name} </a>
						</div>
						<div class="col-3">${item.reg_date}</div>
					</c:when>
					<c:otherwise>
						<div class="col-2">
							<i class="fas fa-check"></i>
						</div>
						<div class="col-7">${item.business_name}</div>
						<div class="col-3">${item.reg_date}</div>

					</c:otherwise>
				</c:choose>



			</div>
		</c:forEach>

		<div class="row footer">
			<div class="col-3"></div>

			<div class="col-6" style="text-align: center;">
				<nav>
					<c:forEach var="i" items="${pageNavi }" varStatus="s">
						<c:choose>
							<c:when test="${i == '<'}">
								<a
									href="${pageContext.request.contextPath}/trans/transList?currentPage=${pageNavi[s.index+1]-1}}">${i}</a>
							</c:when>
							<c:when test="${i == '>'}">
								<a
									href="${pageContext.request.contextPath}/trans/transList?currentPage=${pageNavi[s.index-1]+1}">${i}</a>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/trans/transList?currentPage=${i}">${i
                                    }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</nav>
			</div>

			<div class="col-3" style="text-align: right"></div>
		</div>
	</div>


</body>

</body>
</html>