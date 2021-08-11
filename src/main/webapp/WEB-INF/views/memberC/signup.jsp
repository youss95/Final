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
<style>
* {
	box-sizing: border-box;
}

.container {
	max-width: 600px;
	margin: auto;
	margin-top: 50px;
}

.wrapper {
	max-width: 400px;
	margin: auto;
}

.row {
	margin: 5px;
}

.logo {
	text-align: center;
}

#hiddenBox {
	display: none;
}

.ipB {
	width: 68%;
}

.ipF {
	width: 99%;
}

button {
	width: 30%;
}

#submit {
	width: 100%;
}
</style>
</head>
<body>
	<div class="container p-5 shadow bg-white rounded">
		<center>회원가입</center>

		<form action="${pageContext.request.contextPath}/cMember/signupProc"
			method="post" id="signupForm">
			<div class="wrapper">
				<div class="row">
					<div class="col-12">ID</div>
					<div class="col-12">
						<input type="text" class="ipB" name="id" id="iid"
							placeholder="Enter your ID (Visible to Others)" required>
						<button type="button" id="idCheck">check</button>
					</div>
				</div>
				<div class="row">
					<div class="col-12" id="idCheck"></div>
				</div>

				<div class="row">
					<div class="col-12">PW</div>
					<div class="col-12">
						<input type="password" class="ipF" name="pw" id="ipw"
							placeholder="Enter your PW" required>
					</div>
				</div>
				<div class="row">
					<div class="col-12">Confirm PW</div>
					<div class="col-12">
						<input type="password" class="ipF" id="ipwC"
							placeholder="Enter your PW" required>
					</div>
				</div>
				<div class="row">
					<div class="col-12" id="pwCheck"></div>
				</div>

				<div class="row">
					<div class="col-12">Email</div>
					<div class="col-12">
						<input type="text" class="ipB" name="email" id="iemail"
							placeholder="Enter your Usable Email" required>
						<button id="sendEmail">send</button>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<input type=text class="ipB" name="check" id="confirmInput"
							placeholder="인증번호입력"><input type="hidden"
							id="confirmNumber"><input type="hidden"
							id="confirmResult" required>
						<button id="confirmEmail">confirm</button>
					</div>
				</div>
				<div class="row">
					<div class="col-12" id="emailCheck"></div>
				</div>

				<div id="hiddenBox">
					<div class="row">
						<div class="col-12">Name</div>
						<div class="col-12">
							<input type="text" class="ipF" name="name" id="iname"
								placeholder="Username (Only Visible for Reservation)" required>
						</div>
					</div>
					<div class="row">
						<div class="col-12">Year Of Birth</div>
						<div class="col-12">
							<input type="number" class="ipF" name="yob" id="iyob"
								placeholder="ex) 1995" required>
						</div>
					</div>
					<div class="row">
						<div class="col-12">Nation</div>
						<div class="col-12">
							<select name="nation" id="">
                            <option value="kor">
                                korea
                            </option>
                            <option value="">
                            </option>
                        </select>
						</div>
					</div>
					<div class="row">
						<div class="col" style="text-align: center;"></div>

					</div>
					<div class="row">
						<div class="col-12">
							<input type="checkbox" class="ipF" name="agree" id="agree"
								value="agree" required>I agree to the <a href=#>Terms
								and Condition and Privacy Policy, Tasty Korea Rules</a>
						</div>
					</div>


					<div class="row">
						<div class="col-12" style="text-align: center;">
							<div class="g-recaptcha"
								data-sitekey="6Ld-7eIbAAAAAO070jFLpuiXkJbkX408OJwZS2ZO"></div>
						</div>
					</div>

				</div>
				<div class="row" style="margin: 10px;">
					<div class="col-12" style="text-align: center;">
						<button type="submit" id="submit">Sign Up</button>
					</div>

				</div>

			</div>

		</form>
	</div>

	<script>
		$('#submit')
				.on(
						"click",
						function() {
							var captcha = 1;
							$
									.ajax({
										url : '/cMember/verifyRecaptcha',
										type : 'post',
										data : {
											recaptcha : $(
													"#g-recaptcha-response")
													.val()
										},
										success : function(data) {
											switch (data) {
											case 0:
												console.log("자동 가입 방지 봇 통과");
												captcha = 0;
												$("#signupForm").submit();
												break;
											case 1:
												alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
												break;
											default:
												alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : "
														+ Number(data) + "]");
												break;
											}
										}
									});
							if (captcha != 0) {
								return false;
							}
						});

		$("#idCheck").on("click", function() {
			$.ajax({
				url : "/cMember/idCheck",
				type : "get",
				data : {
					"id" : $("#iid").val()
				}
			}).done(function(res) {
				if (res > 0) {
					alert("ID is already used by other user");
					$("#id").val("");
					$("#id").focus();
				} else {
					alert("Userble ID");
				}
			}).fail(function(a, b, c) {
				alert("서버와의 통신이 불안정 합니다.");
			})
		})
		$("#sendEmail").on("click", function() {
			$.ajax({
				url : "/cMember/emailConfirm",
				type : "get",
				data : {
					"email" : $("#iemail").val(),
					"name" : $("#iname").val()
				}
			}).done(function(res) {
				$("#confirmNumber").val(res);
			}).fail(function(a, b, c) {
				alert("서버와의 통신이 불안정 합니다.");
			})
		})
		$("#confirmEmail").on("click", function() {
			if ($("#confirmInput").val() == $("#confirmNumber").val()) {
				$("#confirmResult").val("true");
				$("#emailCheck").css("color", "blue");
				$("#emailCheck").html("Email confirmed");
				$("#hiddenBox").css("display", "block");
			} else {
				$("#emailCheck").css("color", "red");
				$("#emailCheck").html("Unmatched Password");
			}
		})

		let idRegex = /^[a-z0-9]{4,}$/;
		let emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		let pwRegex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		let yobRegex = /^[0-9]{4}$/;

		$("#iid").on("blur", function() {
			let resultid = idRegex.test($("#iid").val());
			if (resultid) {
				return;
			} else {
				alert("ID must be over 4 characters.");
				$("#iid").val() = "";
				$("#iid").focus();
			}
		})

		$("#ipw")
				.on(
						"blur",
						function() {
							let resultpw = pwRegex.test($("#ipw").val());
							if (resultpw) {
								return;
							} else {
								alert("Password must contain at least 8 characters, at least one number, letter and special characters");
								$("#ipw").val() = "";
								$("#ipw").focus();
							}
						})

		$("#ipwC").on("blur", function() {
			console.log("비밀번호: " + $("#ipw").val());
			console.log("비밀번호 확인: " + $("#ipwC").val())
			if ($("#ipw").val() != $("#ipwC").val()) {
				$("#pwCheck").css("color", "red");
				$("#pwCheck").html("Unmatched Password");
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
		$("#iyob").on("blur", function() {
			let resultpw = yobRegex.test($("#iyob").val());
			if (resultpw) {
				return;
			} else {
				alert("Enter your birth of year in CORRECT FORMAT");
				$("#iyob").val() = "";
				$("#iyob").focus();
			}
		})
	</script>
</body>
</html>