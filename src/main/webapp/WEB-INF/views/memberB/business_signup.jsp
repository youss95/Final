<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
.divider-text {
    position: relative;
    text-align: center;
    margin-top: 15px;
    margin-bottom: 15px;
}
.divider-text span {
    padding: 7px;
    font-size: 12px;
    position: relative;   
    z-index: 2;
}
.divider-text:after {
    content: "";
    position: absolute;
    width: 100%;
    border-bottom: 1px solid #ddd;
    top: 55%;
    left: 0;
    z-index: 1;
}

.btn-facebook {
    background-color: #405D9D;
    color: #fff;
}
.btn-twitter {
    background-color: #42AEEC;
    color: #fff;
}
.result{
margin-bottom:15px;
}


    </style>


<script>
$(function(){
	let idDupleCheck = false;
	
	
	$("#dupleCheck").on("click",function(){
		$.ajax({
            url: "/bMember/dupleCheck",
            type: "get",
            data: { "id": $("#id").val() }
        }).done(function (resp) {
            if (resp == "1") {
                $("#dResult").text("ID가 이미 존재합니다");
                $("#id").val("");
                $("#id").focus();
            } else {
            	$("#dResult").text("사용가능한 ID입니다.");
            	idDupleCheck = true;
            }
        })
	})
	
	
	
	$("#frm").on("submit",function() {
		let idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
		let id = $("#id").val();
		if (!idReg.test(id)) {
			alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
			return false;
		}
		
// 		let pwReg = /^[A-Za-z0-9#?!@$%^&*-]{8,}$/;
		let pw = $("#pw").val();
		let repw = $("#repw").val();
		
		if(pw != repw){
			alert("패스워드가 일치하지 않습니다.");
			return false;
		}
		
// 		if (!pwReg.test(pw)) {
// 			alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
// 			return false;
// 		}
		

		let nameReg = /^.{2,30}$/;
		let name = $("#name").val();
		if (!nameReg.test(name)) {
			alert("이름은 2글자 이상 30글자 미만으로 입력해야 합니다.");
			return false;
		}

		let emailReg = /^[0-9a-zA-Z_-]*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		let email = $("#email").val();

		if (!emailReg.test(email)) {
			alert("이메일 형식을 확인해주세요.");
			return false;
		}

		let phoneReg = /^\d{3}\d{3,4}\d{4}$/;
		let phone = $("#contact1 option:selected")
				.val()
				+ $("#contact2").val()
				+ $("#contact3").val();

		if (!phoneReg.test(phone)) {
			alert("핸드폰 번호를 확인해주세요.");
			return false;
		}
		
		if (idDupleCheck== false) {
			alert("ID를 중복체크해주세요.")
			return false;
		}
	})
	
	
	
	
})



</script>


    
</head>
<body>

<div class="card bg-light">
        <article class="card-body mx-auto" style="max-width: 400px;">
            <h4 class="card-title mt-3 text-center">Create Account</h4>
            <p class="text-center">Get started with your free account</p>
           
            <p class="divider-text">
                <span class="bg-light">Personal Info</span>
            </p>


            <form id="frm" action="/bMember/signup">
            
            
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                 </div>
                <input name="id" id="id" class="form-control" placeholder="ID" type="text">
                <button id="dupleCheck" type="button" class="btn btn-primary">Check</button>
            </div> <!-- form-group// -->
			<div id="dResult" class="result"></div>


            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                </div>
                <input id="pw" name="pw" class="form-control" placeholder="Create password" type="password">
            </div> <!-- form-group// -->
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                </div>
                <input id="repw" class="form-control" placeholder="Repeat password" type="password">
            </div> <!-- form-group// -->                                      


            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                 </div>
                <input id="name" name="name" class="form-control" placeholder="Name" type="text">
            </div> <!-- form-group// -->


            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                 </div>
                <input id="email" name="email" class="form-control" placeholder="Email address" type="email">
            </div> <!-- form-group// -->


            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
                </div>
                <select id="contact1" class="custom-select" style="max-width: 70px;" name="phone1">
                    <option value="010" selected="selected">010</option>
                    <option value="011">011</option>
                    <option value="019">019</option>
                </select>
                <input id="contact2" name="phone2" class="form-control" placeholder="number" type="text">
                <input id="contact3" name="phone3" class="form-control" placeholder="number" type="text">
            </div> <!-- form-group// -->




            



<!-- 사업자 정보 입력 칸 -->
<!-- <div class="card bg-light"> -->
<!-- <article class="card-body mx-auto" style="max-width: 400px;"> -->
<!-- 	<h4 class="card-title mt-3 text-center">Business Info</h4> -->
<!-- 	<p> -->
<!-- 	</p> -->
<!-- 	<p class="divider-text"> -->
<!--     </p> -->

<!--     <div class="form-group input-group"> -->
<!--     	<div class="input-group-prepend"> -->
<!-- 		    <span class="input-group-text"> <i class="fa fa-building"></i> </span> -->
<!-- 		</div> -->
<!-- 		<select class="form-control" name="type"> -->
<!-- 			<option selected="selected">Select Business type</option> -->
<!-- 			<option value="KoreanFood" >KoreanFood</option> -->
<!-- 			<option value="ChineseFood">ChineseFood</option> -->
<!-- 			<option value="JapaneseFood">JapaneseFood</option> -->
<!-- 			<option value="WesternFood">WesternFood</option> -->
<!-- 			<option value="WorldFood">WorldFood</option> -->
<!-- 			<option value="Buffet">Buffet</option> -->
<!-- 			<option value="Cafe">Cafe</option> -->
<!-- 			<option value="Bar">Bar</option> -->
<!-- 		</select> -->
<!-- 	</div> form-group end.// -->
	

<!--     <div class="form-group input-group"> -->
<!-- 		<div class="input-group-prepend"> -->
<!-- 		    <span class="input-group-text"> <i class="fa fa-building"></i> </span> -->
<!-- 		 </div> -->
<!--         <input name="regNum" id="regNum" class="form-control" placeholder="사업자등록번호" type="text"> -->
<!--     </div> form-group// -->


<!-- 	<div class="form-group input-group"> -->
<!-- 		<div class="input-group-prepend"> -->
<!-- 		    <span class="input-group-text"> <i class="fa fa-building"></i> </span> -->
<!-- 		 </div> -->
<!--         <input name="businessName" class="form-control" placeholder="업체명" type="text"> -->
<!--     </div> form-group// -->
<!--     <div class="form-group input-group"> -->
<!-- 		<div class="input-group-prepend"> -->
<!-- 		    <span class="input-group-text"> <i class="fa fa-building"></i> </span> -->
<!-- 		 </div> -->
<!--         <input name="businessNameEng" class="form-control" placeholder="영문 업체명" type="text"> -->
<!--     </div> form-group// -->

<!--     <div class="form-group input-group"> -->
<!--                 <div class="input-group-prepend"> -->
<!--                     <span class="input-group-text"> <i class="fa fa-phone"></i> </span> -->
<!--                 </div> -->
<!--                 <select class="custom-select" style="max-width: 70px;" name="bContact1"> -->
<!--                     <option value="02" selected="selected" >02</option> -->
<!--                     <option value="032" >032</option> -->
<!--                     <option value="010" >010</option> -->
<!--                     <option value="011">011</option> -->
<!--                     <option value="019">019</option> -->
<!--                 </select> -->
<!--                 <input name="bContact2" class="form-control" placeholder="number" type="text"> -->
<!--                 <input name="bContact3" class="form-control" placeholder="number" type="text"> -->
<!--             </div> form-group//  -->

<!--     <div class="form-group input-group"> -->
<!-- 		<div class="input-group-prepend"> -->
<!-- 		    <span class="input-group-text"> <i class="fa fa-building"></i> </span> -->
<!-- 		 </div> -->
<!--         <input name="address1" id="address1" class="form-control" placeholder="업체 주소" type="text"> -->
<!--         <button id="search" type="button" class="btn btn-primary">찾기</button> -->
<!--     </div> form-group// -->
<!--     <div class="form-group input-group"> -->
<!-- 		<div class="input-group-prepend"> -->
<!-- 		    <span class="input-group-text"> <i class="fa fa-building"></i> </span> -->
<!-- 		 </div> -->
<!--         <input name="address2" class="form-control" placeholder="세부 주소" type="text" style="width:50%"> -->
<!--         <input name="postcode" id="postcode" class="form-control" placeholder="우편번호" type="text" style="width:25%"> -->
<!--     </div> form-group// -->
<!--      <input name="address1Kor" id="address1Kor" class="form-control" placeholder="한글주소" type="hidden" > -->
<!-- </article> -->
<!-- </div> -->







    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block"> Create Account  </button>
    </div> <!-- form-group// -->      
    <p class="text-center">Have an account? <a href="">Log In</a> </p>                                                                 
</form>
</article>
</div> <!-- card.// -->


<!--container end.//-->

<br><br>
<article class="bg-secondary mb-3">  
<div class="card-body text-center">

</div>
<br><br>
</article>



<script>
document.getElementById("search").onclick = function () {
			new daum.Postcode({
				oncomplete: function (data) {
					let roadAddr = data.roadAddress; // 도로명 주소 변수
					let engAddr = data.roadAddressEnglish; //영문 도로명 주소 변수

                     // 우편번호와  주소 정보를 해당 필드에 넣는다.
                    document.getElementById("postcode").value = data.zonecode;
                    document.getElementById("address1").value = engAddr;   
                    document.getElementById("address1Kor").value = roadAddr;   
				}
			}).open();
		};

</script>


</body>
</html>