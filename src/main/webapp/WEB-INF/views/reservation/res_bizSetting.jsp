<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <link rel="stylesheet" href="/resources/css/formstyle.css" />
 <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>

<style>
</style>

<body>

	<div class="container">
		<section class="prototype">

			<form action="/res/setTime" method="post">
				<div>
					<h3>사업장 이름</h3>
					<input type="text" class="inpform" name="businessName"
						placeholder="이름">
				</div>
				<div>
					<h3>사업장 영어이름</h3>
					<input type="text" class="inpform" name="businessNameEng"
						placeholder="영어이름">
				</div>
				<div>
					<h3>사업장 전화번호</h3>
					<input type="text" class="inpform" id="businessContact"
						name="businessContact" placeholder="01012341234">
					<spring:hasBindErrors name="businessDTO">
						<c:if test="${errors.hasFieldErrors('businessContact') }">

							<strong style="color: red">${errors.getFieldError( 'businessContact' ).defaultMessage }</strong>

						</c:if>

					</spring:hasBindErrors>
				</div>
				<div>
					<h3>사업장 번호</h3>
					<input type="text" class="inpform" name="bizNum"
						placeholder="01012341234">
				</div>
				<h3>분류</h3>

				<div class="inp_slct" id="classify">
					<select name="biz_type" id="biz_type">
						<option value="">선택</option>
						<option value="KoreanFood">KoreanFood</option>
						<option value="ChineseFood">ChineseFood</option>
						<option value="JapaneseFood">JapaneseFood</option>
						<option value="WesternFood">WesternFood</option>
						<option value="WorldFood">WorldFood</option>
						<option value="Buffet">Buffet</option>
						<option value="Cafe">Cafe</option>
						<option value="Bar">Bar</option>
					</select>
				</div>




				<div>
					<h3 class="ad_h3 su_address">우편번호</h3>
					<input type="text" name="postcode" id="postcode" class="inpform"
						maxlength=5 required>
					<button type="button" id="searchAddr"
						class="btn_m btn_default su_btn_detail">우편번호검색</button>
				</div>
				<div>
					<h3>도로명 주소</h3>
					<input type="text" name="address1" id="address1" class="inpform"
						placeholder="도로명/지번" maxlength=100>
				</div>
				<div>
					<h3>상세 주소</h3>
					<input type="text" class="inpform" name="address2" id="address2"
						placeholder="Placeholder">
				</div>
				<div>
					<h3>한글주소</h3>
					<input type="text" class="inpform" name="address1Kor"
						id="address1Kor" placeholder="한글주소">
				</div>



				<h3>휴일</h3>
				<div class="rd_group">
					<div class="inp_rd">
						<input type="radio" id="mon" name="offday" value="mon"> <label
							for="m1">월</label>
					</div>
					<div class="inp_rd">
						<input type="radio" id="tue" name="offday" value="tue"> <label
							for="m2">화</label>
					</div>
					<div class="inp_rd">
						<input type="radio" id="wed" name="offday" value="wed"> <label
							for="m3">수</label>
					</div>
					<div class="inp_rd">
						<input type="radio" id="thu" name="offday" value="thu"> <label
							for="m3">목</label>
					</div>
					<div class="inp_rd">
						<input type="radio" id="fri" name="offday" value="fri"> <label
							for="m3">금</label>
					</div>
					<div class="inp_rd">
						<input type="radio" id="sat" name="offday" value="sat"> <label
							for="m3">토</label>
					</div>
					<div class="inp_rd">
						<input type="radio" id="sun" name="offday" value="sun"> <label
							for="m3">일</label>
					</div>
				</div>


				<br>
				<h3>영업시간</h3>
				<div class="chk_group">
					<label class="inp_chk"> <input type="checkbox" name="onday"
						id="times1" value="12:00"> <span class="chkmark"></span>
						12:00
					</label> <label class="inp_chk"> <input type="checkbox"
						name="onday" id="times2" value="13:00"> <span
						class="chkmark"></span> 13:00
					</label> <label class="inp_chk"> <input type="checkbox"
						name="onday" id="times3" value="18:00"> <span
						class="chkmark"></span> 18:00
					</label> <label class="inp_chk"> <input type="checkbox"
						name="onday" id="times4" value="19:00"> <span
						class="chkmark"></span> 19:00
					</label> <label class="inp_chk"> <input type="checkbox"
						name="onday" id="times5" value="20:00"> <span
						class="chkmark"></span> 20:00
					</label>
				</div>
				<input type="hidden" name="seq" value="${binfo.seq}">


				<button type="submit" id="submit"
					class="btn_m btn_primary">등록</button>

			</form>

		</section>
	</div>




	<script>

$(function() {
	document.getElementById("searchAddr").onclick = function () {
        new daum.Postcode({
            oncomplete: function (data) {
                let roadAddr = data.roadAddress; // 도로명 주소 변수
                let engAddr = data.roadAddressEnglish; //영문 도로명 주소 변수
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById('address1').value = engAddr;
                document.getElementById("address1Kor").value = roadAddr;
            }
        }).open();
    }
	let phoneRegex = /^010\d{3,4}\d{4}$/;
	 $("#businessContact").on("blur", function() {
		if(!phoneRegex.test($("#businessContact").val())){
			alert("번호 확인")
			return;
		}
	
	}) 
})



	$("#testBtn").on('click', function() {
		location.href = "/board/testBtn"
	})

	//checkbox 로 변경
	let result = '';
	let data = '';
	$(".select_time").on('click', function() {
		resTime = $(this).data('res');
		result = result + resTime + ","
		console.log(result)
		console.log(resTime)
		data = result

	})
	$("#resBtn").on('click', function() {
		console.log("result", result)
		console.log("data", data)
		$.ajax({
			url : "/replies/resTime",
			data : data,
			type : "post",
			contentType : "text/html; charset=utf-8"
		}).done(function(res) {
			console.log(res)
			location.href = "/res/calendar?time=" + data
		})
	})
	
</script>
<%@include file="../layout/alarm.jsp" %>
</body>
</html>