<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Client Sign-up</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>
<script src="https://kit.fontawesome.com/be4f056d3a.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Ubuntu:wght@300&display=swap')
	;

* {
	box-sizing: border-box;
	font-family: 'Ubuntu', sans-serif;
	font-weight: 500;
}

div {
	font-size: 25px;
}

.container {
	max-width: 1000px;
	margin: auto;
	margin-top: 50px;
}

.wrapper {
	background-color: rgb(255, 251, 241);
}

.row {
	padding: 2%;
}

.left {
	background-color: rgb(255, 228, 179);
	font-weight: 600;
}

div[class*=field] {
	min-height: 60px;
	border: 1px solid rgb(235, 235, 235);
}

div[class*=hidden] {
	display: none;
	padding-bottom: 0px;
}

.currentPW {
	display: none;
}

.confirmEmail {
	display: none;
}

.btn {
	border-radius: 10%;
	background-color: rgb(255, 248, 244);
	border: 1.7px solid rgb(201, 196, 191);
}

.btn:hover {
	background-color: rgb(224, 219, 216);
}

.submit {
	margin: 3%;
}

#submit {
	width: 400px;
	height: 50px;
	border-radius: 5%;
	border: none;
	background-color: rgb(255, 194, 81);
	font-weight: 600;
}

#submit:hover {
	background-color: rgb(204, 199, 189);
}
</style>
</head>

<body>
	<div class="container p-5 shadow bg-white rounded">
		<div class="row header">
			<div class="col-12 title">
				<h1 style="line-height: 100px; text-align: center;">
					<b>My profile</b>
				</h1>
			</div>
		</div>

		<form action="${pageContext.request.contextPath}/cMember/updateProc"
			method="post" id="updateForm">
		<div class="wrapper">
			<div class="row fieldName">
				<div class="col-3 left">Name</div>
				<div class="col-9">
					<div class="row">
						<div class="col-12">${info.name}</div>
						<div class="col-12">You could not change your NAME.</div>
					</div>
				</div>
			</div>

			<div class="row fieldID">
				<div class="col-3 left">ID</div>
				<div class="col-9">
					<div class="row">
						<div class="col-12">${info.id}</div>
						<div class="col-12">The ID of the TASTY-KOREA account.</div>
						<input type="hidden" name="id" value="${info.id}">
					</div>
				</div>
			</div>

			<div class="row fieldPW">
				<div class="col-3 left">Password</div>
				<div class="col-9">
					<div class="row">
						<div class="col-12">
							********
							<button class="btn modi" id="modiPW" type="button">modify</button>
							<input type="hidden" id="currentPW" value="${info.pw }">
						</div>
					</div>
					<div class="row currentPW">
						<div class="col-12">current Password</div>
						<div class="col-12">
							<input type="password" class="ipF" name="currentPW" id="icurrentPW"
								placeholder="Enter your PW">
							<button class="btn confirm" type="button" id="confirmPW">confirm</button>
						</div>
					</div>
					<div class="row hiddenPW">
						<div class="col-12">PW</div>
						<div class="col-12">
							<input type="password" class="ipF" name="pw" id="ipw"
								placeholder="Enter your PW">
						</div>
					</div>
					<div class="row hiddenPW">
						<div class="col-12 pwCheck"></div>
					</div>
					<div class="row hiddenPW">
						<div class="col-12">Confirm PW</div>
						<div class="col-12">
							<input type="password" class="ipF" id="ipwC"
								placeholder="Enter your PW">
						</div>
					</div>
					<div class="row hiddenPW">
						<div class="col-12" id="pwCheck"></div>
					</div>

				</div>
			</div>

			<div class="row fieldEmail">
				<div class="col-3 left">Email</div>
				<div class="col-9">
					<div class="row">
						<div class="col-12">
							${info.email}
							<button class="btn modi" id="modiEmail" type="button">modify</button>
						</div>
					</div>
					<div class="row hiddenEmail">
						<div class="col-12">
							<input type="text" class="ipB" name="email" id="iemail"
								placeholder="Enter your Usable Email">
							<button type="button"  class="btn confirm" id="sendEmail">send</button>
						</div>
					</div>
					<div class="row hiddemEmail">
						<div class="col-12" id="waiting"></div>
					</div>
					<div class="row confirmEmail">
						<div class="col-12">
							<input type=text class="ipB" name="check" id="confirmInput"
								placeholder="인증번호입력"><input type="hidden"
								id="confirmNumber"><input type="hidden"
								id="confirmResult">
							<button type="button" class="btn confirm" id="confirmEmail">confirm</button>
						</div>
					</div>
					<div class="row confirmEmail">
						<div class="col-12" id="emailCheck"></div>
					</div>
				</div>
			</div>

			<div class="row fieldYOB">
				<div class="col-3 left">Year of Birth</div>
				<div class="col-9">
					<div class="row">
						<div class="col-12">
							${info.yob}
							<button class="btn modi" id="modiYOB" type="button">modify</button>
						</div>
					</div>
					<div class="row hiddenYOB">
						<div class="col-12">Year Of Birth</div>
						<div class="col-12">
							<input type="number" class="ipF" name="yob" id="iyob"
								placeholder="ex) 1995">
						</div>
					</div>
					<div class="row hiddenYOB">
						<div class="col-12 yobCheck"></div>
					</div>
				</div>
			</div>

			<div class="row fieldNation">
				<div class="col-3 left">Nation</div>
				<div class="col-9">
					<div class="row">
						<div class="col-12">
							${info.nation}
							<button class="btn modi" id="modiNation" type="button">modify</button>
						</div>
					</div>
					<div class="row hiddenNation">
						<div class="col-12">Nation</div>
						<div class="col-12">
							<select name="nation" id="nation">
								<option value="AR">Argentina</option>
								<option value="AU">Australia</option>
								<option value="BR">Brazil</option>
								<option value="CA">Canada</option>
								<option value="CN">China</option>
								<option value="FR">France</option>
								<option value="DE">Germany</option>
								<option value="IN">India</option>
								<option value="ID">Indonesia</option>
								<option value="IT">Italy</option>
								<option value="JP">Japan</option>
								<option value="KR">Korea, Republic of</option>
								<option value="MX">Mexico</option>
								<option value="RU">Russian Federation</option>
								<option value="SA">Saudi Arabia</option>
								<option value="ZA">South Africa</option>
								<option value="TR">Turkey</option>
								<option value="GB">United Kingdom</option>
								<option value="US">United States</option>

							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
		

		<div class="row submit">
			<div class="col-12" style="text-align: center;">
				<button type="submit" id="submit">SUBMIT</button>
			</div>
		</div>
		</form>



	</div>

	<script>
	let emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	let pwRegex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	let yobRegex = /^\d{4,4}$/;
	
                $("#modiPW").on("click", function () {
                    $(this).remove();
                    $(".currentPW").css("display", "block");
                })
                $("#confirmPW").on("click", function () {
                	$.ajax({
        				url : "/cMember/currentPW",
        				type : "get",
        				data : {
        					"pw" : $("#icurrentPW").val()
        				}
        			}).done(function(res) {
        				alert(res);
        				if(res>0){
        					$(this).remove();
                            $(".hiddenPW").css("display", "block");
        				}else{
        					alert("Wrong Password");
        				}
        			}).fail(function(a, b, c) {
        				alert("서버와의 통신이 불안정 합니다.");
        			})       
                })
                $("#modiEmail").on("click", function () {
                    $(this).remove();
                    $(".hiddenEmail").css("display", "block");
                })
                $("#sendEmail").on("click", function () {
                	$(this).remove();
        			$("#waiting").css("color", "rgb(245, 147, 0)");
        			$("#waiting").html("Please wait a second for sending email.");
        			$.ajax({
        				url : "/cMember/emailConfirm",
        				type : "get",
        				data : {
        					"email" : $("#iemail").val(),
        					"name" : $("#iname").val()
        				}
        			}).done(function(res) {
        				$("#waiting").css("display", "none");
        				$(".confirmEmail").css("display", "block");
        				$("#confirmNumber").val(res);

        			}).fail(function(a, b, c) {
        				alert("서버와의 통신이 불안정 합니다.");
        			})
                    
                    
                })
                $("#confirmEmail").on("click", function () {
        			if ($("#confirmInput").val() == $("#confirmNumber").val()) {
        				$("#confirmResult").val("true");
        				$("#emailCheck").css("color", "blue");
        				$("#emailCheck").html("Email confirmed");
        				$("#hiddenBox").css("display", "block");
        			} else {
        				$("#emailCheck").css("color", "red");
        				$("#emailCheck").html("Wrong Number");
        			}
                })
                $("#modiYOB").on("click", function () {
                    $(this).remove();
                    $(".hiddenYOB").css("display", "block");
        			let resultyob = yobRegex.test($("#iyob").val());
        			console.log(resultyob)
        			if (resultyob) {
        				$(".yobCheck").html("");
        			} else {
        				$(".yobCheck").css("color", "red");
        				$(".yobCheck").html("Enter your Year of Birth in 4 characters.");
        				$("#iyob").val("");
        			}
                })
                $("#modiNation").on("click", function () {
                    $(this).remove();
                    $(".hiddenNation").css("display", "block");
                })
                
                $("#ipw")
				.on(
						"blur",
						function() {
							let resultpw = pwRegex.test($("#ipw").val());
							if (resultpw) {
								$(".pwCheck").html("");
							} else {
								$(".pwCheck").html("");
								$(".pwCheck").css("color", "red");
								$(".pwCheck").html("Password must contain at least 8 characters, at least one number, letter and special characters");
								$("#ipw").val("");
								$("#pwCheck").html("");
							}
						})

				$("#ipwC").on("blur", function() {
					console.log("비밀번호: " + $("#ipw").val());
					console.log("비밀번호 확인: " + $("#ipwC").val())
					if ($("#ipw").val() != $("#ipwC").val()) {
						$("#pwCheck").css("color", "red");
						$("#pwCheck").html("Unmatched Password");
						 $("#ipwC").val("");
					} else {
						$("#pwCheck").css("color", "blue");
						$("#pwCheck").html("Matched Password");
					}
				})
                
	            $("#iemail").on("blur", function() {
				let resultEmail = emailRegex.test($("#iemail").val());
				if (resultEmail) {
					return;
				} else {
					alert("Unusable Email address. Enter other address you have.");
					$("#iemail").val() = "";
				}
		})
            </script>
</body>

</html>