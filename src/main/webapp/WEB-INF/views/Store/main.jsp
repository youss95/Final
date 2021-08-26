<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome. It's your first time in Korea, right?</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 부트스트랩 css -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ontawesome.css">
<!-- 슬라이드 적용부분 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/templatemo-sixteen.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
	integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
	integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.col-4 {
	padding: 0.5%;
}
.up-content{
	border-radius: 5%;
}
</style>
</head>

<body>
	<%@include file="../layout/header.jsp"%>
	<!-- ***** Preloader Start ***** -->

	<!-- ***** Preloader End ***** -->

	<!-- Header -->
	<!-- 네비바 넣는 부분 ! -->
	<!-- 여기다 삽입하는걸로 -->

	<!-- Page Content -->
	<!-- Banner Starts Here -->
	<!-- 스크린 헤더 body-->
	<div class="banner header-text">
		<div class="owl-banner owl-carousel">
			<div class="banner-item-01">
				<div class="text-content">
					<h4>Best Offer</h4>
					<h2>New Arrivals On Sale</h2>
				</div>
			</div>
			<div class="banner-item-02">
				<div class="text-content">
					<h4>Flash Deals</h4>
					<h2>Get your best products</h2>
				</div>
			</div>
			<div class="banner-item-03">
				<div class="text-content">
					<h4>Last Minute</h4>
					<h2>Grab last minute deals</h2>
				</div>
			</div>
		</div>
	</div>

	<!-- Banner Ends Here -->
	<div class="latest-products">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Store 메인 -->
					<div class="section-heading">
						<h2>List of restaurants you can trust and watch</h2>
						<a href="/store/signup?cpage=1">view all products >> </a>
					</div>
				</div>
				<div class="col-4">
					<div class="product-item">
						<a href="/store/view?store_seq=1"><img
							src="${pageContext.request.contextPath}/resources/Storeimages/1.png"
							alt=""></a>
						<div class="down-content">
							<a href="/store/view?store_seq=1"> <!-- 타이틀 이름-->
								<h4>Gapyeong Livestock</h4>
							</a>
							<p>19 Daljeon-ro, Gapyeong-eup</p>

							<!--별점-->
							<!--<ul class="stars">
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                            </ul>-->
							<!--댓글 개수 -->
							<span>Reviews (24)</span>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="product-item">
						<a href="/store/view?store_seq=19"><img
							src="${pageContext.request.contextPath}/resources/Storeimages/19.png"
							alt=""></a>
						<div class="down-content">
							<a href="/store/view?store_seq=19">
								<h4>Grilled Charcoal Eel</h4>
							</a>

							<p>96 Gimpo-daero 3023</p>
							<!--<ul class="stars">
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                            </ul>-->
							<span>Reviews (21)</span>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="product-item">
						<a href="/store/view?store_seq=31"><img
							src="${pageContext.request.contextPath}/resources/Storeimages/31.png"
							alt=""></a>
						<div class="down-content">
							<a href="/store/view?store_seq=31">
								<h4>Charm Jinsu Charcoal Ribs</h4>
							</a>

							<p>16 Seokcheon-ro 177beon-gil Bucheon-si</p>
							<!--<ul class="stars">
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                            </ul>-->
							<span>Reviews (36)</span>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="product-item">
						<a href="/store/view?store_seq=116"><img
							src="${pageContext.request.contextPath}/resources/Storeimages/116.png"
							alt=""></a>
						<div class="down-content">
							<a href="/store/view?store_seq=116">
								<h4>Kyohajeong</h4>
							</a>

							<p>1290 Gyoha-ro Paju-si Gyeonggi Paju-si Gyeonggi-do</p>
							<!--<ul class="stars">
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                            </ul>-->
							<span>Reviews (48)</span>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="product-item">
						<a href="/store/view?store_seq=120"><img
							src="${pageContext.request.contextPath}/resources/Storeimages/120.png"
							alt=""></a>
						<div class="down-content">
							<a href="/store/view?store_seq=120">
								<h4>500-Year Nurungji Baeksuk</h4>
							</a>

							<p>Saeori-ro Tanhyeon-myeon Paju-si Gyeonggi-do 94.</p>
							<!--<ul class="stars">
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                            </ul>-->
							<span>Reviews (16)</span>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="product-item">
						<a href="/store/view?store_seq=100"><img
							src="${pageContext.request.contextPath}/resources/Storeimages/100.png"
							alt=""></a>
						<div class="down-content">
							<a href="/store/view?store_seq=100">
								<h4>Blue Dragon</h4>
							</a>

							<p>1624 Bogaewonsam-ro Wonsam-myeon Cheoin-gu Yongin-si
								Gyeonggi-do.</p>
							<!--<ul class="stars">
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                            </ul>-->
							<span>Reviews (32)</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!----------->



	<!-- business 디테일 페이지 -->
	<div class="latest-products">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Store 메인 -->
					<div class="section-heading">
						<!-- 제목 -->
						<h2>You can make a reservation at this store.</h2>
						<a href="/Business/signup?cpage=1">view all products >> </a>
					</div>
				</div>


				
						<c:forEach var="item" items="${storePics}" varStatus="status"
							begin="1" end="6">
							<div class="col-4" >
								<div class="product-item" style="height: 400px;">
									<div class="up-content" style="width: 100%; height: 75%; overflow:hidden;" >
										<a
											href="/Business/view?biz_seq=${item.biz_seq}&userId=">
											<img
											src="${pageContext.request.contextPath}/files/${item.sysName}"
											 class="d-block h-100" >
										</a>
									</div>
									<div class="down-content">
										<a
											href="/Business/view?biz_seq=${item.biz_seq}&userId=">
											<!-- 타이틀 이름-->
											<h4>${item.businessnameeng}</h4>
										</a>
										<!--댓글 개수 -->
									</div>
								</div>
							</div>
						</c:forEach>

			</div>
		</div>
	</div>




	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="inner-content">
						<p>
							Copyright &copy; 2020 Sixteen Clothing Co., Ltd. - Design: <a
								rel="nofollow noopener" href="https://templatemo.com"
								target="_blank">TemplateMo</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>







	<!--  css  파일!!! -->
	<script src="/jquery/jquery.min.js"></script>

	<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Additional Scripts -->
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/isotope.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/accordions.js"></script>
	<%@include file="../layout/alarm.jsp"%>
</body>
</html>