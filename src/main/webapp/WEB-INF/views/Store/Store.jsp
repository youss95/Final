<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Store_main.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

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
					<c:choose>
						<c:when test="${list != null}">
							<c:forEach var="list" items="${list}">
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
									
											
												<script type="text/javascript">

												$(document).ready(function() {
												   var list = new Array();
												   $("input[name=x]").each(function(index, item){
													   list.push($(item).val());
												   });
												   consol.log(list);
												});
												</script>
												
											</figcaption>
										</figure>
								</a></li>
							</c:forEach>
						</c:when>

						<c:otherwise>
							<c:forEach var="searchlist" items="${searchList}">
								<li><span class="grid-number"></span> <span class="ribbon"><a
										href="/rate" title="Rate"></a></span> <a href="#">
										<figure>
											<img src="https://source.unsplash.com/mZS7cne5iY0/800x600"
												alt="Photo of Brooklyn Park">
											<figcaption>
												<p>${searchList.road_name }</p>
												<h2>${searchList.store }</h2>
												<h3>조회수 : ${searchList.count }</h3>
											</figcaption>
										</figure>
								</a></li>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</ul>
			</main>
			<!-- 페이징바!! -->
			<div class="col-12" style="float: center">
				<ul class="pagination" style="list-style: none; padding: 0px">

					<c:forEach var="i" items="${navi}" varStatus="s">
						<c:choose>
							<c:when test="${i=='>'}">
								<li class="page-item"><a
									href="/store/signup?cpage=${navi[s.index-1]+1}&category=${category}&keyword=${keyword}">Next</a>
							</c:when>
							<c:when test="${i=='<'}">
								<li class="page-item"><a
									href="/store/signup?cpage=${navi[s.index+1]-1}&category=${category}&keyword=${keyword}">Previous</a>
							</c:when>
							<c:when test="${i==cpage}">
								<li class="page-item" id="currentPage"
									style="background-color: #17a2b8"><a style="color: white"
									href="/store/signup?cpage=${i}&category=${category}&keyword=${keyword}">${i}</a>
							</c:when>
							<c:otherwise>
								<li class="page-item" id="currentPage"><a
									href="/store/signup?cpage=${i}&category=${category}&keyword=${keyword}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</div>
		</aside>


		<!--경계선-->
		<line>br</line>

		<section>
			<div class="map_wrap">
				<div class="hAddr" style="float: center;">
					<div id="centerAddr" style="font-size: 20px; padding-left: 170px;"></div>
					<br>
				</div>
				<div id="map" style="width: 100%; height: 550px;"></div>
				<div>
					<br>
					<div class="d1">
						<form>
							<input type="text" placeholder="검색어 입력" id="resultAdd">
							<button type="button" class="pulse"></button>
						</form>
					</div>

				</div>
			</div>
		
			
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2fa91fa0473f76d7311f40d80a8f1521&libraries=services"></script>
				<script>
					const $addFind = document.querySelector('#resultAdd');
					const $button = document.querySelector('button')
					console.log($addFind.value)
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
						level : 12
					// 지도의 확대 레벨
					};

					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption);

					// 마커 생성
					//오늘 오후 갑시다
					
					var positions = [ {
						content : '<div>카카오</div>',
						latlng : new kakao.maps.LatLng($('#x').val(), $('#y').val())
					}, {
						content : '<div>생태연못</div>',
						latlng : new kakao.maps.LatLng(33.450936, 126.569477)
					}, {
						content : '<div>텃밭</div>',
						latlng : new kakao.maps.LatLng(33.450879, 126.569940)
					}, {
						content : '<div>근린공원</div>',
						latlng : new kakao.maps.LatLng(33.451393, 126.570738)
					} ];

					for (var i = 0; i < positions.length; i++) {
						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
							map : map, // 마커를 표시할 지도
							position : positions[i].latlng
						// 마커의 위치
						});

						// 마커에 표시할 인포윈도우를 생성합니다 
						var infowindow = new kakao.maps.InfoWindow({
							content : positions[i].content
						// 인포윈도우에 표시할 내용
						});

						// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
						// 이벤트 리스너로는 클로저를 만들어 등록합니다 
						// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
						kakao.maps.event.addListener(marker, 'mouseover',
								makeOverListener(map, marker, infowindow));
						kakao.maps.event.addListener(marker, 'mouseout',
								makeOutListener(infowindow));
					}

					// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
					function makeOverListener(map, marker, infowindow) {
						return function() {
							infowindow.open(map, marker);
						};
					}

					// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
					function makeOutListener(infowindow) {
						return function() {
							infowindow.close();
						};
					}

					//----------------------------- 등록
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();

					//검색 주소 찾기
					$button.addEventListener('click', function() {

						geocoder.addressSearch($addFind.value, function(result,
								status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 인포윈도우로 장소에 대한 설명을 표시합니다

								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						})
					});

					var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
					infowindow = new kakao.maps.InfoWindow({
						zindex : 1
					}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

					// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
					searchAddrFromCoords(map.getCenter(), displayCenterInfo);

					// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
					kakao.maps.event
							.addListener(
									map,
									'click',
									function(mouseEvent) {
										searchDetailAddrFromCoords(
												mouseEvent.latLng,
												function(result, status) {
													if (status === kakao.maps.services.Status.OK) {
														var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
																+ result[0].road_address.address_name
																+ '</div>'
																: '';
														detailAddr += '<div>지번 주소 : '
																+ result[0].address.address_name
																+ '</div>';

													}
												});
									});

					// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
					kakao.maps.event.addListener(map, 'idle',
							function() {
								searchAddrFromCoords(map.getCenter(),
										displayCenterInfo);
							});

					function searchAddrFromCoords(coords, callback) {
						// 좌표로 행정동 주소 정보를 요청합니다
						geocoder.coord2RegionCode(coords.getLng(), coords
								.getLat(), callback);
					}

					function searchDetailAddrFromCoords(coords, callback) {
						// 좌표로 법정동 상세 주소 정보를 요청합니다
						geocoder.coord2Address(coords.getLng(),
								coords.getLat(), callback);
					}

					// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
					function displayCenterInfo(result, status) {
						if (status === kakao.maps.services.Status.OK) {
							var infoDiv = document.getElementById('centerAddr');

							for (var i = 0; i < result.length; i++) {
								// 행정동의 region_type 값은 'H' 이므로
								if (result[i].region_type === 'H') {
									infoDiv.innerHTML = result[i].address_name;
									break;
								}
							}
						}
					}
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