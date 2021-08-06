<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        *{
            box-sizing: border-box;
        }

        div{
            border: 1px solid black;
        }
        .container{
            max-width: 600px;
            margin: auto;
        }
        .wrapper{
            max-width: 300px;
            margin: auto;
        }
        .logo{
            text-align: center;
        }
        input{
            width:100%;
        }
        button{
            width:49.2%;
        }
    </style>
</head>
<body>
	<div class="container p-5 shadow bg-white rounded">
		<center>회원가입</center>

		<form action="${pageContext.request.contextPath}/aMember/signupProc" method="post" id="signupForm">
			<div class="wrapper">
				<div class="row">
					<div class="col-12">ID</div>
					<div class="col-12">
						<input type="text" name="emp_id" id="iid"
							placeholder="최소 4자, 영 소문자, 숫자 입력">
					</div>

				</div>
				<div class="row">
					<div class="col-12">PW</div>
					<div class="col-12">
						<input type="text" name="pw" id="ipw"
							placeholder="최소 8 자, 영문, 숫자, 특수 문자가 반드시 들어가야 함.">
					</div>

				</div>
				<div class="row">
					<div class="col-12">Confirm PW</div>
					<div class="col-12">
						<input type="text" name="cpw" id="ipwC"
							placeholder="비밀번호 확인">
					</div>

				</div>

				<div class="row">
					<div class="col-12">Name</div>
					<div class="col-12">
						<input type="text" name="name" id="iname"
							placeholder="Username (Only Visible for Reservation)">
					</div>
				</div>

				<div class="row">
					<div class="col-12">Phone</div>
					<div class="col-12">
						<input type="text" name="phone" id="iphone"
							placeholder="01012341234">
					</div>

				</div>
				<div class="row">
					<div class="col-12">Email</div>
					<div class="col-9">
						<input type="text" name="email" id="iemail"
							placeholder="Enter your Usable Email">
					</div>
					<div class="col-3">
						<button>이메일 인증</button>
					</div>
				</div>


				<div class="row">
					<div class="col-12" style="text-align: center;">
						<button type="button" id="submit">Sign Up</button>
					</div>

				</div>
			</div>

		</form>
	</div>

	<script>


		#("#submit").on("click", function({
			$.ajax({
                url: "/aMember/preExist",
                type: "get",
                data: { "id": $("#id").val() }
            }).done(function (res) {
                if (res == "1") {
                    $("#signupForm").submit();
                } else {
                	alert("Your ID and Name is not exist in our company.");
                	$("#iid").val(""); 
                    $("#iname").val("");
                    #("#iid").focus();
                }
            }).fail(function (a, b, c) {
                alert("Server is unstable. try again.");
            })
		})
		

		

		let id = $("#iid").val();
        let pw = $("#ipw").val();
        let pwC =$("#ipwC").val();
        
		let phone = $("#iphone").val();
		
		let idRegex = /^[a-z0-9]{4,}$/;
		
		let emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		let pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		let phoneRegex = /^010\d{3,4}\d{4}$/;
		
		$("#iid").blur(function(){
			let resultid = idRegex.test(id);
			if(resultid){
				return;
			}else{
				alert("아이디 형식을 확인하세요.")
    			pw = "";
			}
		})

		$("#ipw").blur(function(){
	        let resultpw = pwRegex.test(pw);
            if(resultpw){
                return;
            }else{
                alert("비밀번호 형식을 확인하세요.")
    			pw = "";
    	        pwC = "";
            }
		})
		
		$("#pwC").oninput = function(){
            if(pw != pwC){
                val.innerHTML = "패스워드가 일치하지 않습니다.."
            }else{
             	val.innerHTML = "패스워드가 일치합니다." 
            }
        }	
				
		email.blur(function(){
			let resultEmail = emailRegex.test(email);
            if(resultEmail){
                return;
            }else{
                alert("EMAIL 형식을 확인하세요.")
                document.getElementById("email").value="";
            }
		})
		
		$("#iphone").blur(function(){
			let resultphone = phoneRegex.test(phone);
			if(resultphone){
				return;
			}else{
				alert("핸드폰 형식을 확인하세요.")
				document.getElementById("phone").value="";
			}
		})
    </script>
</body>
</html>