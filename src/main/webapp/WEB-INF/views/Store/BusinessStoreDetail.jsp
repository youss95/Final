<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--틀 리스트-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/Store_main.css?after">
<!--슬라이드-->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!--별점-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/Store_detail.css?after">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
	integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
	integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
	integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/like.js"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />



<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>


<style>
* {
	margin: 0;
	padding: 0;
}

.contain {
	width: 100%;
	height: 106px;
	float: center -webkit-font-smoothing: antialiased;
	box-sizing: border-box;
}

.headers {
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

.foot {
	float: left;
	width: 65%;
	height: 300px;
}

.footer {
	width: 35%;
	height: 300px;
}

@media ( max-width : 1540px) {
	#wrap {
		width: 100%;
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

.form-group {
	width: 600px;
	height: 100px;
}

.form-group>input {
	width: 800px;
	height: 100%;
}

.btn_light {
	background-color: #3DB2FF;
	color: #203e60;
	border: 1px solid #d6e6f2;
}

.btn_s {
	display: inline-block;
	min-width: 70px;
	min-height: 32px;
	padding: 8px 13px;
	font-size: 13px;
	text-align: center;
	outline: none;
	vertical-align: middle;
	border-radius: 5px;
	cursor: pointer;
	transition: all 0.1s ease-out;
}

.afterLikes {
	color: red;
}

#heartIcon:hover {
	cursor: pointer
}

<!--
테이블-->#menu {
	width: 100%;
}

/*강사님이 말한 댓글 삐져 나오는거, 각각의 요소들 사이에 margin 준 거 */
#store {
	margin: 3%;
}

.well {
	margin: 3%;
}

.form-group {
	width: 100%;
	height: 100px;
}

.form-group>input {
	width: 100%;
	height: 100%;
}

#commentInsertForm {
	width: 100%;
}

.scrolltable {
	table-layout: fixed;
	border-collapse: collapse;
	border: 1px solid #888;
	width: 100%;
}

.scrolltable thead {
	display: block;
	background: #a88;
	color: #fff;
}

.scrolltable tbody {
	display: block;
	overflow: auto;
	height: 190px;
	width: 100%;
}

/* 행 장식 */
.scrolltable th, .scrolltable td {
	padding: 10px;
	text-align: left;
	width: 406px;
	text-align: center;
	font-size: 1.375em;
}
/*
.scrolltable tbody tr:nth-child(2n+1) {
    background-color: #f0f0f0;
}
*/
.bottom_bottom {
	position: relative;
	height: 200px;
	padding: 10px;
	border: 1px solid red;
}
</style>
</head>
<body>
	<div id="wrap">
		<br>
		<div class="contain">
			<%@include file="../layout/header_main.jsp"%>
		</div>


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


		<!--  -->
		<aside>
			<div id='store'>
				<!--  <input type="hidden" id="store" value="${list.businessNameEng }"> -->
				<input type="hidden" id="address1Kor" name="address1Kor"
					value="${list.address1Kor}"> <input type="hidden"
					id="businessNameEng" name="businessNameEng"
					value="${list.businessNameEng }"> <span id="likeStar"><i
					id="heartIcon" class="fas fa-heart fa-2x"></i>찜하기</span>
				<h1 style="float: center;">${list.businessNameEng }</h1>
				<div>
					<img
						src="${pageContext.request.contextPath}/resources/images/view.png">
					${list.view_Count} <img
						src="${pageContext.request.contextPath}/resources/images/start.png">
					0 <img
						src="${pageContext.request.contextPath}/resources/images/write.png">
					0
				</div>
				<br>
				<table class='table'>
					<tr>
						<th>City</th>
						<td>${list.businessNameEng}</td>
					</tr>
					<tr>
						<th>Phone</th>
						<td>${list.businessContact}</td>
					</tr>
					<tr>
						<th>Store</th>
						<td>${list.address1 }</td>
					</tr>
				</table>
			</div>
			<div id="menu">
				<table class="scrolltable">
					<c:choose>
						<c:when test="${menuList!=null}">
							<thead>
								<tr>
									<th>menu</th>
									<th>price</th>
								</tr>
							</thead>
							</tbody>
							<c:forEach var="item" items="${menuList}" varStatus="s">
								<tr>
									<td>${item.menu_eng}</td>
									<td>${item.price}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>


			<c:choose>
				<c:when test="${loginID != null}">
					<div id="bottom"
						style="padding: 20px; margin: 5px; float: left; height: 100px; position: relative;">
						<a
							href="/res/calendar?userId=${loginID}&biz_seq=${list.biz_seq}&res_name=${list.businessName}"
							class="btn_s btn_light" style="left: 0;">예약하기</a>
					</div>

					<div id="bottom_bottom"
						style="padding: 20px; margin: 5px; float: right; height: 100px; position: relative;">

						<script type="text/javascript"
							src="https://ssl.pstatic.net/share/js/naver_sharebutton.js"></script>
						<script type="text/javascript">
                        new ShareNaver.makeButton({
                           "type" : "f"
                        });
                     </script>
						<!-- 될까? -->
						<!--트위터 공유 하기 버튼-->
						<a href="#"
							onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');return false;"
							target="_blank" alt="Share on Twitter"><img
							src="${pageContext.request.contextPath}/resources/images/twiter.png"></a>
						<!----------페이스북 공유 하기 -->
						<a href="#"
							onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');return false;"
							target="_blank" alt="Share on Facebook"><img
							src="${pageContext.request.contextPath}/resources/images/fackebook.png"></a>
						<!-----------카카오 페이지------------------->
						<a href="#"
							onclick="javascript:window.open('https://story.kakao.com/s/share?url=' +encodeURIComponent(document.URL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes, height=400,width=600');return false;"
							target="_blank" alt="Share on kakaostory"><img
							src="${pageContext.request.contextPath}/resources/images/kakao.png"></a>
						<!---------구글 플러스----->
						<a href="#"
							onclick="javascript:window.open('https://plus.google.com/share?url=' +encodeURIComponent(document.URL), 'googleplussharedialog','menubar=no,toolbar=no,resizable=yes, scrollbars=yes,height=350,width=600');return false;"
							target="_blank" alt="Share on Google+"><img
							src="${pageContext.request.contextPath}/resources/images/google.jpg"></a>
					</div>

				</c:when>
				<c:otherwise>
					<div id="bottom" style="top: 300px; left: 0"></div>


					<div id="bottom_bottom"
						style="padding: 20px; margin: 5px; float: right; height: 100px; position: relative;">

						<script type="text/javascript"
							src="https://ssl.pstatic.net/share/js/naver_sharebutton.js"></script>
						<script type="text/javascript">
                        new ShareNaver.makeButton({
                           "type" : "f"
                        });
                     </script>
						<!--트위터 공유 하기 버튼-->
						<a href="#"
							onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');return false;"
							target="_blank" alt="Share on Twitter"><img
							src="${pageContext.request.contextPath}/resources/images/twiter.png"></a>
						<!----------페이스북 공유 하기 -->
						<a href="#"
							onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');return false;"
							target="_blank" alt="Share on Facebook"><img
							src="${pageContext.request.contextPath}/resources/images/fackebook.png"></a>
						<!-----------카카오 페이지------------------->
						<a href="#"
							onclick="javascript:window.open('https://story.kakao.com/s/share?url=' +encodeURIComponent(document.URL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes, height=400,width=600');return false;"
							target="_blank" alt="Share on kakaostory"><img
							src="${pageContext.request.contextPath}/resources/images/kakao.png"></a>
						<!---------구글 플러스----->
						<a href="#"
							onclick="javascript:window.open('https://plus.google.com/share?url=' +encodeURIComponent(document.URL), 'googleplussharedialog','menubar=no,toolbar=no,resizable=yes, scrollbars=yes,height=350,width=600');return false;"
							target="_blank" alt="Share on Google+"><img
							src="${pageContext.request.contextPath}/resources/images/google.jpg"></a>
					</div>
				</c:otherwise>
			</c:choose>



			<!-- 지도 값 받기 -->


		</aside>


		<!-- 지도 풀하기 -->
		<section>
			<div id="map" style="width: 100%; height: 700px;"></div>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2fa91fa0473f76d7311f40d80a8f1521&libraries=services"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 4 // 지도의 확대 레벨
			    };  

			// 지도를 생성합니다
			var address1kor = $("#address1Kor").val();
			var businessNameEng = $("#businessNameEng").val();
			console.log("address1kor : " + address1kor)
			console.log("businessNameEng : " + businessNameEng)
			var map = new kakao.maps.Map(mapContainer, mapOption); 

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch($("#address1Kor").val(), function(result, status) {
				
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			       
					
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});   
            
         </script>

			<!-- 여기까지 -->


			<br>
			<!-- 1번쨰 -->
			<script>
            function random_imglink() {
               var myimages = new Array()
               /* 각각의 이미지 경로 지정 */
               myimages[1] = "${pageContext.request.contextPath}/resources/images/3.png"
               myimages[2] = "${pageContext.request.contextPath}/resources/images/4.png"
               myimages[3] = "${pageContext.request.contextPath}/resources/images/6.png"
               /* 각각의 이미지 링크 지정 */
               var imagelinks = new Array()
               imagelinks[1] = "https://www.tripadvisor.com/Restaurants-g294197-zfn7778638-Seoul.html"
               imagelinks[2] = "https://www.willflyforfood.net/seoul-food-guide-25-must-eat-restaurants-in-seoul-south-korea/"
               imagelinks[3] = "https://www.creatrip.com/en/blog/1822/TOP-5-Busan-Pork-Rice-Soup-Restaurants"
               var ry = Math.floor(Math.random() * myimages.length)
               if (ry == 0)
                  ry = 1
               document
                     .write('<a href=' + '"' + imagelinks[ry] + '"' + ' target=_blank><img src="' + myimages[ry] + '" border=0></a>')
            }
            random_imglink();
         </script>
			<br> <br> <br>
			<script>
            function random_imglink() {
               var myimages = new Array()
               /* 각각의 이미지 경로 지정 */
               myimages[1] = "${pageContext.request.contextPath}/resources/images/1.png"
               myimages[2] = "${pageContext.request.contextPath}/resources/images/2.png"
               myimages[3] = "${pageContext.request.contextPath}/resources/images/5.png"
               /* 각각의 이미지 링크 지정 */
               var imagelinks = new Array()
               imagelinks[1] = "https://www.tripadvisor.com/Restaurants-g294197-zfn7778640-Seoul.html"
               imagelinks[2] = "https://theculturetrip.com/asia/south-korea/articles/korean-cuisine-crash-course-top-10-dishes-to-know/"
               imagelinks[3] = "https://www.tripadvisor.com/Restaurants-g294197-zfn7778650-Seoul.html"
               var ry = Math.floor(Math.random() * myimages.length)
               if (ry == 0)
                  ry = 1
               document
                     .write('<a href=' + '"' + imagelinks[ry] + '"' + ' target=_blank><img src="' + myimages[ry] + '" border=0></a>')
            }
            random_imglink();
         </script>
			<br> <br>
		</section>
		<div class="foot">
			<!-- 지워지면 망 -->
			<!--  댓글  -->

			<div class="containers">
				<div class="well">
					<c:choose>
						<c:when test="${loginID != null}">
							<form role="form" name="commentInsertForm">
								<h4>
									<i class="fa fa-paper-plane-o"></i> Leave a Comment:
									<div class="make_star">
										<div class="rating" data-rate="3" style="float: left">
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i>
										</div>
									</div>
								</h4>
								<!-- 로그인하면 나오는 리뷰 -->
								<input type="hidden" id="writer" name="writer"
									value="${loginID}"> <input type="hidden" id="bno"
									name="bno" value="${list.biz_seq }" />
								<div class="form-group">
									<input type="text" class="form-control" id="contents"
										name="contents" placeholder="check">
								</div>
								<button type="button" value="" class="btn btn-primary"
									name="commentInsertBtn" style="left: 0;">
									<i class="fa fa-reply"></i>Submit
								</button>

							</form>
						</c:when>

						<c:otherwise>
							<h4>
								<i class="fa fa-paper-plane-o"></i> Leave a Comment:
							</h4>
							<form role="form" name="commentInsertForm">
								<input type="hidden" id="bno" name="bno"
									value="${list.biz_seq }" />
								<div class="form-group">
									<input type="text" class="co" id="contents" name="contents"
										placeholder="If you want to write a review, log in." disabled>
								</div>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath}/member/whichMember'"
									class="btn btn-primary" name="commentInsertBtn"
									style="left: 0;">로그인하기</button>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div class="containers">
				<div class="commentList"></div>
			</div>
		</div>

		<!-- 이거 지워지면 안된다 -->
		<script>
      
       $(function () {
          /* 등록후 리스트 */
         
              /* 별점 등록할떄 */
              let targetNum=0;
       $(".make_star i").click(function () {
          targetNum = $(this).index() + 1; //별점 값
           
             $(".make_star i").css({ color: "#000" });
             $(".make_star")
               .find(".rating")
               .find("i:nth-child(-n" + targetNum + ")")
               .css({ color: "yellow" });
          
           });
        console.log(targetNum)
         var bno = $("#bno").val(); //게시글 번호
         
         
         $('[name=commentInsertBtn]').click(function() { //댓글 등록 버튼 클릭시 
            //var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
            var contents = $("#contents").val();
            let data = {bno:${list.biz_seq },writer:'${loginID}' ,content:contents,star_avg:targetNum}
            commentInsert(data); //Insert 함수호출(아래)
         });
         
         //댓글 목록
         function commentList() {
            
            $
                  .ajax({
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
                                       console.log("vale",value)
                                       a += '<div class="col-sm-12"><div class="panel panel-default"><div class="panel-heading">'
                                       a += '<h3><i class="fa fa-comment"></i> '
                                             + value.writer
                                             + '<small> 날짜 : '
                                             + value.reg_date
                                             
                                             + '<div class="review">'
                                             + ' <div class="rating" data-rate='+value.star_avg+'>'
                                             + ' <i class="fas fa-star"></i>'
                                             + ' <i class="fas fa-star"></i>'
                                             + ' <i class="fas fa-star"></i>'
                                             + ' <i class="fas fa-star"></i>'
                                             + ' <i class="fas fa-star"></i>'
                                             + '</div>'
                                             + '</div>'
                                      /* if (value.writer === $(
                                             "#writer").val()) {
                                          a += ' <div class="commentInfo'+ value.cno+'">'
                                          a += '<br>'
                                          
                                          a += '<a onclick="commentUpdate('
                                                + value.cno
                                                + ',\''
                                                + value.content
                                                + '\');"> 수정하기 </a>';
                                          a += '<a href="/comment/deleteComments?cno='
                                                + value.cno
                                                + '"> 삭제하기 </a></div>';
                                       }*/
                                       a += '</small></h3></div>';
                                       a += '<div class="panel-body"><div class="panel-body'+ value.cno + '"><p>'
                                             + value.content
                                             + '</p>';
                                       a += '</div></div></div></div>';
                                    });
                        $(".commentList").html(a);
                         let rating = $(".review .rating");
                           console.log(rating)
                                rating.each(function () {
                                  let targetScore = $(this).attr("data-rate");
                                  console.log(targetScore)
                                  $(this)
                                    .find("i:nth-child(-n" + targetScore + ")")
                                    .css({ color: "yellow" });
                                });
                     }
                  });
         }
         //댓글 등록
         function commentInsert(data) {
            $.ajax({
               url : '/comment/insert',
               type : 'post',
               data : JSON.stringify(data),
               contentType:"application/json;charset=utf-8",
               success : function(res) {
                  if (res == 1) {
                     commentList(); //댓글 작성 후 댓글 목록 reload
                     $("#contents").val('');
                  }
               }
            });
         }
         //댓글 수정 - 댓글 ㄹ 출력을 input 폼으로 변경 
         function commentUpdate(cno, content) {
            var a = '';
            a += '<div class="col-sm-12"><div class="panel panel-default"><div class="panel-heading" style="height:145px">';
            a += '<div class="form-group">';
            a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
            a += '<button class="btn btn-primary" style="left:0" type="button" onclick="commentUpdateProc('
                  + cno + ');">수정하기</button>';
            a += '</div></div></div>';
            $('.panel-body' + cno).html(a);
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
        	 console.log("삭제 경로 수정")
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
         
       });
       
      </script>







		<div class="footer">
			<c:choose>
			<c:when test="${info.member_role eq 'C'}">
				<a href="/chat/makeChat?store=${list.businessName }">
			
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
			</a>
			</c:when>
		</c:choose>
			<script>
			$(function(){
				
		
      $("#likeStar").click(function(){
    	  
   
        	 let data={userId:'${loginID}',biz_seq:${list.biz_seq}}
        	 $.ajax({
        		 url:"/like/statusReload",
        		 data:JSON.stringify(data),
        		 type:"POST",
        		 contentType:"application/json;charset=utf-8"
        	 }).done(function(resp){
        		 console.log("sta:" +resp)
        		 if(resp === 'Y'){
        			 $("#heartIcon").css("color","red")
        	            //취소
        	              
        	              let data = {
        	                    userId:'${loginID}',
        	                  businessName:'${list.businessName}',
        	                  biz_seq:${list.biz_seq}
        	                           }
        	              $.ajax({
        	                url:"/like/updateLike",
        	                data:JSON.stringify(data),
        	                type:"POST",
        	                contentType:"application/json;charset=utf-8"
        	              }).done(function(resp){
        	                console.log(resp)
        	              $("#heartIcon").css("color","black")
        	             alert("취소 되었습니다.")
        	              })
        	              
        	              /* 알람  */
        	 let businessName = '${list.businessNameEng }'
            let sender = '${loginID}'
            let getter = ${list.seq}
            let content = sender+" 님이 "+businessName+" 을  찜하였습니다."
            console.log(content)
            //let data ={content:content,seq:getter,biz_seq:biz_seq}
            $.ajax({
               url:"/noti/likeAlarm",
               type:"post",
               data:{'content':content,'seq':getter},
               
            }).done(function(resp){
               console.log(resp)
               if(socket){
                  let scktMsg = "unlike,"+sender+","+resp+","+businessName+","+"1";
                  console.log(scktMsg);
                  socket.send(scktMsg);
               }
            }) 
        	           
        		 }else if(resp === 'N'){
        			  $("#heartIcon").css("color","black")
                   
                     let data = {
                           userId:'${loginID}',
                         businessName:'${list.businessNameEng }',
                         biz_seq:${list.biz_seq}
                                  }
                     $.ajax({
                       url:"/like/updateLikeN",
                       data:JSON.stringify(data),
                       type:"POST",
                       contentType:"application/json;charset=utf-8"
                     }).done(function(resp){
                       console.log(resp)
                     $("#heartIcon").css("color","red")
                   alert("찜을 하였습니다.")
                     })
                     
                     /* 알람  */
             let businessName = '${list.businessName}'
            let sender = '${loginID}'
            let getter = ${list.seq}
            let content = sender+" 님이 "+businessName+" 을  찜하였습니다."
            console.log(content)
            //let data ={content:content,seq:getter,biz_seq:biz_seq}
            $.ajax({
               url:"/noti/likeAlarm",
               type:"post",
               data:{'content':content,'seq':getter},
               
            }).done(function(resp){
               console.log(resp)
               if(socket){
                  let scktMsg = "like,"+sender+","+resp+","+businessName+","+"1";
                  console.log(scktMsg);
                  socket.send(scktMsg);
               }
            }) 
                  
        		 }else{
        			  let data = {
                              userId:'${loginID}',
                            businessName:'${list.businessName}',
                            biz_seq:${list.biz_seq}
                                     }
                        $.ajax({
                          url:"/like/insertLike",
                          data:JSON.stringify(data),
                          type:"POST",
                          contentType:"application/json;charset=utf-8"
                        }).done(function(resp){
                          console.log(resp)
                        $("#heartIcon").css("color","red")
                       
                        })
        		 }
        	 })
      })
			})
			
         $(function(){
        	 
        	
         
            <c:choose>
            <c:when test="${likeStatus == 'Y' }">
            $("#heartIcon").css("color","red")
            //취소
             /*   $("#likeStar").click(function(){
              let data = {
                    userId:'${loginID}',
                  businessName:'${list.businessName}',
                  biz_seq:${list.biz_seq}
                           }
              $.ajax({
                url:"/like/updateLike",
                data:JSON.stringify(data),
                type:"POST",
                contentType:"application/json;charset=utf-8"
              }).done(function(resp){
                console.log(resp)
              $("#heartIcon").css("color","black")
              statusReload()
              })
              
            }) */
            
               </c:when>
            <c:when test="${likeStatus == 'N' }">
               $("#heartIcon").css("color","black")
            /*    $("#likeStar").click(function(){
              let data = {
                    userId:'${loginID}',
                  businessName:'${list.businessName}',
                  biz_seq:${list.biz_seq}
                           }
              $.ajax({
                url:"/like/updateLikeN",
                data:JSON.stringify(data),
                type:"POST",
                contentType:"application/json;charset=utf-8"
              }).done(function(resp){
                console.log(resp)
              $("#heartIcon").css("color","red")
              statusReload()
              })
              
            }) */
        </c:when>
               <c:otherwise>
               $("#likeStar").click(function(){
                 
                   
                 })
               </c:otherwise>
            </c:choose>
         })
          
            
            $(window).scroll(function() {
               //스크롤의 위치가 상단에서 450보다 크면  
               if ($(window).scrollTop() > 1) {
                  /* if(window.pageYOffset >= $('원하는위치의엘리먼트').offset().top){ */
                  $('.chat').addClass("fix");
                  //위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
               }
            });
         </script>
			<script>
         //socket alarm
         $(function(){
            $.ajax({
               
            url:"/noti/alarmCounts",
             data:{userId:'${loginID}'}

            }).done(function(resp){
               console.log("rresp",resp)
               $("#ala").append(resp)
            })
         })
         $("#likeStar").on('click',function(){
        	
         })
         </script>
		</div>
	</div>
	<%@include file="../layout/alarm.jsp"%>