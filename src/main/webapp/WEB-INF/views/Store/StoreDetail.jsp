<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--틀 리스트-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Store_main.css">
<!--슬라이드-->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!--별점-->
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Store_detail.css">
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<style>
* {
	margin: 0;
	padding: 0;
}

header {
	width: 100%;
	height: 250px;
}

aside {
	float: left;
	width: 65%;
	height: 700px;
}

section {
	float: left;
	width: 35%;
	height: 700px;
}

footer {
	float: left;
	width: 65%;
	height: 300px;
}

feOffset {
	width: 35%;
	height: 300px;
}

@media ( max-width : 1220px) {
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
		height: 300px;
	}
	aside {
		float: none;
		width: 100%;
		height: 300px;
	}
	section {
		float: none;
		width: 100%;
		height: 300px;
	}
}
</style>
</head>
<body>
	<div id="wrap">
		<header>
			<div class="swiper-container mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">Slide 1</div>
					<div class="swiper-slide">Slide 2</div>
					<div class="swiper-slide">Slide 3</div>
					<div class="swiper-slide">Slide 4</div>
					<div class="swiper-slide">Slide 5</div>
					<div class="swiper-slide">Slide 6</div>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-pagination"></div>
			</div>
		</header>
		<!--슬라이드 Script-->
		<script>
			var swiper = new Swiper(".mySwiper", {
				slidesPerView : 3,
				spaceBetween : 30,
				slidesPerGroup : 3,
				loop : true,
				loopFillGroupWithBlank : true,
				pagination : {
					el : ".swiper-pagination",
					clickable : true,
				},
				navigation : {
					nextEl : ".swiper-button-next",
					prevEl : ".swiper-button-prev",
				},
			});
		</script>



		<aside>
			<div class='form container'>
				<div id='store'>
					<div>
						<input type="hidden" id="x" name="x" value="${list.store_x }">
						<input type="hidden" id="y" name="y" value="${list.store_y }">
						<input type="hidden" id="store" value="${list.store }"> <a><img
							src="/img/start.png"> 찜하기</a>
						<h1 style="float: center;">${list.store }</h1>
						<div>
							<img src="/img/view.png"> ${list.count} <img
								src="/img/start.png"> ${list.report_count}
						</div>
						<br>
						<table class='table'>
							<tr>
								<th>시군명</th>
								<td>${list.city}</td>
							</tr>
							<tr>
								<th>맛집 전화번호</th>
								<td>${list.phone}</td>
							</tr>
							<tr>
								<th>가게 주소</th>
								<td>${list.road_name }</td>
							</tr>					
						</table>
						<button>예약하기</button>
						<script type="text/javascript">
							var xid = $('#x').val();
							var yid = $('#y').val();
							var store = $('#store').val();
							console.log(xid);
							console.log(yid);
							console.log(store);
						</script>
					</div>
				</div>
			</div>
		</aside>
		<section>
			<div id="staticMap" style="width: 100%; height: 700px;"></div>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2fa91fa0473f76d7311f40d80a8f1521&libraries=services"></script>
			<script>
				// 이미지 지도에 표시할 마커입니다
				// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
				var markers = [ {
					position : new kakao.maps.LatLng(xid, yid),
					text : store
				// text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
				} ];

				var staticMapContainer = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
				staticMapOption = {
					center : new kakao.maps.LatLng(xid, yid), // 이미지 지도의 중심좌표
					level : 4, // 이미지 지도의 확대 레벨
					marker : markers
				// 이미지 지도에 표시할 마커 
				};

				// 이미지 지도를 생성합니다
				var staticMap = new kakao.maps.StaticMap(staticMapContainer,
						staticMapOption);
			</script>
			</script>
			<br>
			<!-- 별점 radio 박스-->
			<h3 style="text-align: center">점수 주시겠어요?</h3>
			<form action="myform" id="myform" method="post" action="/store/star">
				<div class="rating">
					<input type="radio" id="star5" name="rating" value="5" /> <label
						class="full" for="star5" title="Awesome - 5 stars"></label> <input
						type="radio" id="star4half" name="rating" value="4 and a half" />
					<label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>

					<input type="radio" id="star4" name="rating" value="4" /> <label
						class="full" for="star4" title="Pretty good - 4 stars"></label> <input
						type="radio" id="star3half" name="rating" value="3 and a half" />
					<label class="half" for="star3half" title="Meh - 3.5 stars"></label>

					<input type="radio" id="star3" name="rating" value="3" /> <label
						class="full" for="star3" title="Meh - 3 stars"></label> <input
						type="radio" id="star2half" name="rating" value="2 and a half" />
					<label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>

					<input type="radio" id="star2" name="rating" value="2" /> <label
						class="full" for="star2" title="Kinda bad - 2 stars"></label> <input
						type="radio" id="star1half" name="rating" value="1 and a half" />
					<label class="half" for="star1half" title="Meh - 1.5 stars"></label>

					<input type="radio" id="star1" name="rating" value="1" /> <label
						class="full" for="star1" title="Sucks big time - 1 star"></label>
					<input type="radio" id="starhalf" name="rating" value="half" /> <label
						class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
				</div>
				<button>별점 주기</button>
			</form>
			<script
				src='https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.min.js'></script>
			<script
				src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>


		</section>
		<footer>
			<!--  댓글  -->
			<div class="container">
				<label for="content">comment</label>
				<form name="commentInsertForm">
					<div class="input-group">
						<input type="hidden" id="bno" name="bno"
							value="${list.store_seq }" /> <input type="text"
							class="form-control" id="content" name="content"
							placeholder="내용을 입력하세요."> <span class="input-group-btn">
							<button class="btn btn-default" type="button"
								name="commentInsertBtn">등록</button>
						</span>
					</div>
				</form>
			</div>
			<div class="container">
				<div class="commentList"></div>
			</div>
	</div>

	</footer>

	<script>
		var bno = $("#bno").val(); //게시글 번호
		$('[name=commentInsertBtn]').click(function() { //댓글 등록 버튼 클릭시 
			var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
			commentInsert(insertData); //Insert 함수호출(아래)
		});
		//댓글 목록 
		function commentList() {
			$.ajax({
			url : '/comment/list',
			type : 'get',
			data : {
			'bno' : bno
				},
			success : function(data) {
			var a = '';
				$
				.each(
							data,
									function(key, value) {
												a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 20px;">';
												a += '<div class="commentInfo'+value.cno+'">'
														+ '댓글번호 : '
														+ value.cno
														+ ' / 작성자 : '
														+ value.writer;
														+ ' / 작성 시간 : '
														+ value.reg_Date;		
												
												a += '<a onclick="commentUpdate('
														+ value.cno
														+ ',\''
														+ value.content
														+ '\');"> 수정 </a>';
												a += '<a onclick="commentDelete('
														+ value.cno
														+ ');"> 삭제 </a> </div>';
												a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '
														+ value.content
														+ '</p>';
												a += '</div></div>';
											});

							$(".commentList").html(a);
						}
					});
		}

		//댓글 등록
		function commentInsert(insertData) {
			$.ajax({
				url : '/comment/insert',
				type : 'post',
				data : insertData,

				success : function(data) {
					if (data == 1) {
						commentList(); //댓글 작성 후 댓글 목록 reload
						$('[name=content]').val('');
					}
				}
			});
		}
		
		
		//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
		function commentUpdate(cno, content) {
			var a = '';
			a += '<br>'
			a += '<div class="input-group">';
			a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
			a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('
					+ cno + ');">수정</button> </span>';
			a += '</div>';

			$('.commentContent' + cno).html(a);

		}

		//댓글 수정
		function commentUpdateProc(cno) {
			var updateContent = $('[name=content_' + cno + ']').val();

			$.ajax({
				url : '/comment/update',
				type : 'post',
				data : {
					'content' : updateContent,
					'cno' : cno
				},
				success : function(data) {
					if (data == 1)
						commentList(bno); //댓글 수정후 목록 출력 
				}
			});
		}

		//댓글 삭제 
		function commentDelete(cno) {
			$.ajax({
				url : '/comment/delete/' + cno,
				type : 'post',
				success : function(data) {
					if (data == 1)
						commentList(bno); //댓글 삭제후 목록 출력 
				}
			});
		}

		$(document).ready(function() {
			commentList(); //페이지 로딩시 댓글 목록 출력 
		});
	</script>



	<!-- ---------------------------------------------- -->

	<feOffset> <a href="/chat/toChat">
		<div class="chat" onclick="this.classList.toggle('active')">
			<div class="background"></div>
			<svg class="chat-bubble" width="100" height="100"
				viewBox="0 0 100 100">
                        <g class="bubble">
                            <path class="line line1"
					d="M 30.7873,85.113394 30.7873,46.556405 C 30.7873,41.101961
                    36.826342,35.342 40.898074,35.342 H 59.113981 C 63.73287,35.342
                    69.29995,40.103201 69.29995,46.784744" />
                            <path class="line line2"
					d="M 13.461999,65.039335 H 58.028684 C
                      63.483128,65.039335
                      69.243089,59.000293 69.243089,54.928561 V 45.605853 C
                      69.243089,40.986964 65.02087,35.419884 58.339327,35.419884" />
                        </g>
                        <circle class="circle circle1" r="1.9" cy="50.7"
					cx="42.5" />
                        <circle class="circle circle2" cx="49.9"
					cy="50.7" r="1.9" />
                        <circle class="circle circle3" r="1.9" cy="50.7"
					cx="57.3" />
                    </svg>
		</div>
	</a> <script>
		$(window).scroll(function() {
			//스크롤의 위치가 상단에서 450보다 크면  
			if ($(window).scrollTop() > 450) {
				/* if(window.pageYOffset >= $('원하는위치의엘리먼트').offset().top){ */
				$('.chat').addClass("fix");
				//위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
			} else {
				$('.chat').removeClass("fix");
				//위의 if문에 대한 조건 아닌경우 fix라는 class를 삭제함  
			}
		});
	</script> </feOffset>
	</div>
</body>
</html>