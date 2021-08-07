<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<style>

.container  > section {
  width: 1100px;
  margin:0 auto;
}
.inp_chk {
  display: inline-block;
  height: 18px;
  position: relative;
  padding-left: 20px;
  cursor: pointer;
  line-height: 18px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  vertical-align: top;
  text-indent: 5px;
}
.inp_chk input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}
.inp_chk input:checked ~ .chkmark {
  border-color: #ff3d68;
  background-color: #ff3d68;
}
.inp_chk input:checked ~ .chkmark:after {
  content: "";
  position: absolute;
  left: 4px;
  top: 0;
  width: 6px;
  height: 9px;
  border: solid #fff;
  border-width: 0 2px 2px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}
.inp_chk .chkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 18px;
  width: 18px;
  background-color: #fff;
  border: 1px solid #ff3d68;
  border-radius: 2px;
  -webkit-transition: all ease 0.1s;
  transition: all ease 0.1s;
}
.chk_group {
  display: -webkit-flex;
  display: -ms-flex;
  display: flex;
}
.chk_group .inp_chk + .inp_chk {
  margin-left: 20px;
}
.chk_group .chk_info {
  display: inline-block;
  margin-left: 5px;
  color: #888dac;
  line-height: 1.2;
  vertical-align: top;
}

</style>

<body>

 <div class="container">
        <section class="prototype">
        
        <form action="/res/setTime" method="post">
        <dt>사업장 이름</dt>
		<dd><input type="text" class="inpform" name="businessName" placeholder="이름"></dd>
        <dt>사업장 영어이름</dt>
		<dd><input type="text" class="inpform" name="businessNameEng" placeholder="영어이름"></dd>
		 <dt>사업장 전화번호</dt>
		<dd><input type="text" class="inpform" name="businessContact" placeholder="01012341234"></dd>
		 <dt>사업장 번호</dt>
		<dd><input type="text" class="inpform" name="bizNum" placeholder="01012341234"></dd>
		<dt>분류</dt>
								<dd>
									<div class="inp_slct">
										<select name="biz_type" id="biz_type">
											<option value="">선택</option>
											<option value="korean">Korean food</option>
											<option value="chinese">Chinese food</option>
											<option value="japanese">Japanese food</option>
											<option value="western">Western food</option>
											<option value="world">World food</option>
											<option value="buffet">Buffet</option>
											<option value="cafe">Cafe</option>
											<option value="bar">Bar</option>
										</select>
									</div>
								</dd>
		
		
		
											<div>
												<h3 class="ad_h3 su_address">우편번호</h3>
												<input type="text" " name="postcode" id="postcode"
													class="inpform su_s_ip su_address" maxlength=5 required>
												<button type="button" id="searchAddr"
													class="btn_m btn_default su_btn_detail">우편번호검색</button>
											</div>
											<div>
												<h3>도로명 주소</h3>
												<input type="text" name="address1" id="address1"
													class="inpform" placeholder="도로명/지번"
													maxlength=100 required>
											</div>
											<div>
												<h3>상세 주소</h3>
												<dd><input type="text" class="inpform" name="address2" id="address2" placeholder="Placeholder"></dd>
												</div>
											<div>
											<h3>한글주소</h3>
										<dd><input type="text" class="inpform" name="address1Kor" id="address1Kor" placeholder="한글주소"></dd>
											</div>
									
							<div>휴일</div>			
	<div class="chk_group">
		<label class="inp_chk"> <input type="checkbox" name="offday" id="mon" value="mon">
			<span class="chkmark"></span> 월
		</label> 
		<label class="inp_chk"> <input type="checkbox" name="offday" id="tue" value="tue">
			<span class="chkmark"></span> 화
		</label>
		<label class="inp_chk"> <input type="checkbox" name="offday" id="wedn" value="wedn">
			<span class="chkmark"></span> 수
		</label>
		<label class="inp_chk"> <input type="checkbox" name="offday" id="thur" value="thur">
			<span class="chkmark"></span> 목
		</label>
		<label class="inp_chk"> <input type="checkbox" name="offday" id="fri" value="fri">
			<span class="chkmark"></span> 금
		</label>
		<label class="inp_chk"> <input type="checkbox" name="offday" id="sat" value="sat">
			<span class="chkmark"></span> 토
		</label>
		<label class="inp_chk"> <input type="checkbox" name="offday" id="sun" value="sun">
			<span class="chkmark"></span> 일
		</label>
	</div>
						<br>
						<div>영업시간</div>				
<div class="chk_group">
		<label class="inp_chk"> <input type="checkbox" name="onday" id="times1" value="12:00">
			<span class="chkmark"></span> 12:00
		</label> 
		<label class="inp_chk"> <input type="checkbox" name="onday" id="times2" value="13:00">
			<span class="chkmark"></span> 13:00
		</label>
		<label class="inp_chk"> <input type="checkbox" name="onday" id="times3" value="18:00">
			<span class="chkmark"></span> 18:00
		</label>
		<label class="inp_chk"> <input type="checkbox" name="onday" id="times4" value="19:00">
			<span class="chkmark"></span> 19:00
		</label>
		<label class="inp_chk"> <input type="checkbox" name="onday" id="times5" value="20:00">
			<span class="chkmark"></span> 20:00
		</label>
	</div>
	
	<button type="submit">시간등록</button>
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
})


/*
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
	*/
</script>
</body>
</html>