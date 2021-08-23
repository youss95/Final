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
	background-color: #7389b3;
}
.navbar-nav {
	width: 100%;
	height: 60px;
}

.nav-link {
	width: 20%;
	text-align: center;
	font-size: larger;
	line-height: 45px;
	background-color: rgb(56, 61, 78);
}

a:hover {
	background-color: rgb(84, 86, 92);
}

i {
	margin-right: 10px;
}

.container {
	padding: 5%;
	margin-top: 90px;
	max-width: 1000px;
	margin-bottom: 90px;
}

.wrapper {
	max-width: 890px;
	margin: auto;
	border: 2px solid rgb(196, 196, 196);
}

.title {

	background-color: rgb(213, 218, 235);
	color: black;
	height: 95px;
}

.header {
	margin: 33px;
}

.row {
	text-align: center;
}

.subtitle {
	margin-top: 20px;
	margin-bottom: 10px;
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


</style>

</head>

<body>

	<nav id="nav" class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="navbar-nav">
			<a class="nav-link" href="#" style="color: white;">home</a>
			<a class="nav-link" href="${pageContext.request.contextPath}/admin/dashForm" style="color: white;"><i class="fas fa-chart-line"></i>관리자 대시보드</a>
			<a class="nav-link" href="${pageContext.request.contextPath}/trans/transList?currentPage=1" style="color: white;"><i class="fas fa-tasks"></i>메뉴 번역 요청함</a>
			<a class="nav-link" href="#" style="color: white;"><i class="fas fa-user"></i>일반 회원 관리</a>
			<a class="nav-link" href="${pageContext.request.contextPath}/admin/manageBusinessPage" style="color: white;"><i class="fas fa-user-tie"></i>업체 회원 관리</a>
		</div>
	</nav>


	<div class="container p-4 shadow bg-white rounded">

		<div class="row header">
			<div class="col-12 title">
					<h1
						style="line-height: 100px; font-family: 'Noto Sans KR', sans-serif;">업체 회원 관리</h1>
				</div>
		</div>
		<div class="wrapper l">
			<div class="row subtitle">
				<h5 style="width: 100%;">
					<b>의심 업체 관리</b>
				</h5>
			</div>
			<div class="row columns">
				<div class="col-4">업체 No</div>
				<div class="col-4">상호명</div>
				<div class="col-2">주간 리뷰수</div>
				<div class="col-2"></div>
			</div>

			<c:forEach var="list" items="${blackList}" varStatus="s">
				<div class="row list" style="overflow: hidden">			
						<div class="col-4">${list.BNO}</div>
						<div class="col-4">${list.BUSINESSNAME}</div>
						<div class="col-2">${list.COUNTS}</div>
						<div class="col-2"><button type="button" class="btnOut btn btn-outline-danger" seq="${list.BNO}">탈퇴</button></div>
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


	</div>

<script>
	$(".btnOut").on("click",function(){
		let seq =$(this).attr("seq");
		let here = this;
		$.ajax({
			data:{"seq":seq},
			url:"${pageContext.request.contextPath}/admin/businessOut",
		}).done(function(resp){
			if(resp>0){
			$(here).closest(".list").remove();
			}
		})
		
	})
</script>
</body>

</html>