<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Store_main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/map.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
* {
	margin: 0;
	padding: 0;
}

#wrap {
	width: 1400px;
	margin: 0 auto;
}

header {
	width: 100%;
	height: 100px;
	float: center
}

aside {
	float: left;
	width: 60%;
	height: 700px;
}

line {
	float: left;
	width: 5%;
}

section {
	float: left;
	width: 35%;
	height: 700px;
}
/* 화면 너비 0 ~ 1540px */
@media ( max-width : 1540px) {
	#wrap {
		width: 95%;
	}
}
/* 화면 너비 0 ~ 768px */
@media ( max-width : 768px) {
	#wrap {
		width: 100%;
	}
}
/* 화면 너비 0 ~ 480px */
@media ( max-width : 480px) {
	#wrap {
		width: 100%;
	}
	header {
		height: 80px;
	}
	aside {
		float: none;
		width: 100%;
		height: 1400px;
	}
	section {
		float: none;
		width: 100%;
		height: 1400px;
	}
}

@media ( min-width :1024px) {
	.flexgrid.columns-news li {
		width: 23%;
	}
}

/*찾기 버튼*/
form {
	position: relative;
	width: 510px;
	margin: 1 auto;
}

.d1 {
	background: #A3D0C3;
}

.d1 input {
	width: 100%;
	height: 42px;
	padding-left: 10px;
	border: 2px solid #7BA7AB;
	border-radius: 5px;
	outline: none;
	background: #F9F0DA;
	color: #9E9C9C;
	box-sizing: border-box;
}

.d1 button {
	position: absolute;
	top: 0;
	right: 0px;
	width: 42px;
	height: 42px;
	border: none;
	background: #7BA7AB;
	border-radius: 0 5px 5px 0;
	cursor: pointer;
}

.d1 button:before {
	content: "\f002";
	font-family: FontAwesome;
	font-size: 16px;
	color: #F9F0DA;
}

.card-box {
	padding-bottom: 70px;
	display: block;
	width: 100%;
}

.card-box>ul::before {
	float: center;
	content: "메뉴 리스트";
	font-size: 25px;
	font-weight: bold;
	padding-left: 205px;
	top: 10px;
}

.card-box>ul {
	text-align: left;
	display: block;
	padding: 0 10px;
}

.card-box>ul>li {
	display: block;
	width: 100%;
	padding: 10px;
}
/*카드*/
@media ( min-width : 770px) {
	.card-box {
		padding-bottom: 70px;
		display: block;
	}
	.card-box>ul {
		display: block;
		margin: 0 -10px;
	}
	.card-box>ul>li {
		width: 100%;
		padding: 10px;
	}
}

.card-box>ul>li>a {
	position: relative;
	display: block;
	overflow: hidden;
	border-radius: 10px;
	cursor: pointer;
}

.card-box>ul>li>a>img {
	width: 100%;
	height: auto;
	border-radius: 6px;
}
/*카드 텍스트*/
.card-box>ul>li {
	text-align: left;
}

.card-box>ul>li .text {
	position: absolute;
	bottom: 20px;
	left: 20px;
	z-index: 1;
	color: #fff;
	font-size: 30px;
	font-weight: bold;
	line-height: normal;
}
</style>
</head>
<body>
	<div id="wrap">
		<br>
		<header style="font-size: 50px;">어서와? 한국은 처음이지?</header>
		<aside>
			<!-- 왼쪽 -->

			<main role="main">
				<ul class="flexgrid columns-news">
					<c:forEach var="list" items="${viewAll}">
						<li><span class="grid-number">임의</span> <span class="ribbon"><a
								href="/Store/view?seq=">2.5</a></span> <a
							href="/store/view?store_seq=${list.store_seq }">
								<figure>
									<img src="https://source.unsplash.com/mZS7cne5iY0/800x600"
										alt="Photo of Brooklyn Park">
									<figcaption>
										<p>${list.city }</p>
										<h2>${list.store }</h2>
										<h3>조회수 : ${list.count }</h3>
									</figcaption>
								</figure>
						</a></li>
					</c:forEach>
				</ul>
			</main>
			<!-- 페이징바!! -->
			<div style="display: block; text-align: center;">
				<c:if test="${paging.startPage != 1 }">
					<a
						href="/store/signup?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a
								href="/store/signup?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a
						href="/store/signup?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			</div>
		</aside>


		<!--경계선-->
		<line>b</line>

		<section>

			<form:form commandName="searchVO" method="get" name="listForm"
				id="listForm" action="/store/signup">

				<div>
					<input type="text" class="text" id="searchWrd" name="searchWrd"
						placeholder="검색어를 입력해주세요" style="width: 300px;"
						value="${searchVO.searchWrd }" /> <a href="#"
						onclick="fn_search();" class="btn-login"
						style="width: 100px; height: 40px; margin-left: 5px;"><spring:message
							code="btn.search" text="검색" /></a>
				</div>
				<div>
					<div class="map_wrap">
						<div id="map"
							style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
						<!-- 지도타입 컨트롤 div 입니다 -->
						<div class="custom_typecontrol radius_border">
							<span id="btnRoadmap" class="selected_btn"
								onclick="setMapType('roadmap')">지도</span> <span id="btnSkyview"
								class="btn" onclick="setMapType('skyview')">스카이뷰</span>
						</div>
						<!-- 지도 확대, 축소 컨트롤 div 입니다 -->
						<div class="custom_zoomcontrol radius_border">
							<span onclick="zoomIn()"><img
								src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png"
								alt="확대"></span> <span onclick="zoomOut()"><img
								src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png"
								alt="축소"></span>
						</div>
					</div>
				</div>
			</form:form>


			<div class="map_wrap">
				<div class="hAddr" style="float: center;">
					<div id="centerAddr" style="font-size: 20px; padding-left: 170px;"></div>
					<br>
				</div>

				<div>
					<br>
					<div class="d1">
						<form>
							<input type="text" id="searchWrd" name="searchWrd"
								placeholder="검색어 입력" value="${searchVO.searchWrd }">
							<button type="button" class="pulse"></button>
						</form>
					</div>

				</div>
			</div>





			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2fa91fa0473f76d7311f40d80a8f1521&libraries=services"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
				mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 3, // 지도의 확대 레벨
				};

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				//지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
				function setMapType(maptype) {
					var roadmapControl = document.getElementById('btnRoadmap');
					var skyviewControl = document.getElementById('btnSkyview');
					if (maptype === 'roadmap') {
						map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);
						roadmapControl.className = 'selected_btn';
						skyviewControl.className = 'btn';
					} else {
						map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
						skyviewControl.className = 'selected_btn';
						roadmapControl.className = 'btn';
					}
				}

				// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
				function zoomIn() {
					map.setLevel(map.getLevel() - 1);
				}

				// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
				function zoomOut() {
					map.setLevel(map.getLevel() + 1);
				}

				//주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				var rdnmadrList = new Array();
				var cmpnmList = new Array();

				var rdnList = JSON.parse('${rdnmadrListJson}');

				for ( var k in rdnList) {
					var $obj = rdnList[k];
					var aa = $obj.road_name;
					var bb = $obj.store;
					rdnmadrList.push(aa);
					cmpnmList.push(bb);

				}

				//주소 리스트 
				rdnmadrList.forEach(function(addr, index) {
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch(addr, function(result, status) {
						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							var content = '<div class="overlay_info">';
							content += '    <a><strong>' + cmpnmList[index]
									+ '</strong></a>';
							content += '    <div class="desc">';
							content += '        <span class="address">'
									+ rdnmadrList[index] + '</span>';
							content += '    </div>';
							content += '</div>';

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow({
								//  content: cmpnmList[index], 
								content : content,
								disableAutoPan : true
								
							});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							if (index == 0) {
								map.setCenter(coords);
							}
						}
					});
				});
			</script>
			<script>
				var rdnList = JSON.parse('${rdnmadrListJson}');

				var rdnmadrList = new Array();
				var cmpnmList = new Array();

				for ( var k in rdnList) {
					var $obj = rdnList[k];
					var aa = $obj.road_name;
					var bb = $obj.store;
					rdnmadrList.push(aa);
					cmpnmList.push(bb);

				}

				//주소 리스트 
				rdnmadrList
						.forEach(function(addr, index) {
							// 주소로 좌표를 검색합니다
							geocoder
									.addressSearch(
											addr,
											function(result, status) {
												// 정상적으로 검색이 완료됐으면 
												if (status === kakao.maps.services.Status.OK) {

													var coords = new kakao.maps.LatLng(
															result[0].y,
															result[0].x);

													// 결과값으로 받은 위치를 마커로 표시합니다
													var marker = new kakao.maps.Marker(
															{
																map : map,
																position : coords
															});

													var content = '<div class="overlay_info">';
													content += '    <a><strong>'
															+ cmpnmList[index]
															+ '</strong></a>';
													content += '    <div class="desc">';
													content += '        <span class="address">'
															+ rdnmadrList[index]
															+ '</span>';
													content += '    </div>';
													content += '</div>';

													// 인포윈도우로 장소에 대한 설명을 표시합니다
													var infowindow = new kakao.maps.InfoWindow(
															{
																//  content: cmpnmList[index], 
																content : content,
																disableAutoPan : true

															});
													infowindow
															.open(map, marker);

													// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
													if (index == 0) {
														map.setCenter(coords);
													}
												}
											});
						});
			</script>

			<!-- 하단 추천바!! -->
			<br> <br>
			<div class="card-box con text-align-center">
				<ul class="row">
					<li class="cell"><a href="#">
							<div class="text">
								망고 <br>플레이트
							</div> <img src="/img/mango.png" alt="">
					</a></li>
					<li class="cell"><a href="#">
							<div class="text">
								음식점 <br>맛나요
							</div> <img src="/img/mango.png" alt="">
					</a></li>
					<li class="cell"><a href="#">
							<div class="text">
								여기 <br>어때요?
							</div> <img src="/img/mango.png" alt="">
					</a></li>
				</ul>
			</div>
		</section>
	</div>
</body>
</html>