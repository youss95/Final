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
	max-width: 300px;
	margin: auto;
}

.logo {
	text-align: center;
}

input {
	width: 100%;
}

button {
	width: 49.2%;
}
</style>
</head>
<body>
	<div class="container p-5 shadow bg-white rounded">
		<center>회원가입</center>

		<form action="${pageContext.request.contextPath}/cMember/signupProc"
			method="post">
			<div class="wrapper">
				<div class="row">
					<div class="col-12">ID</div>
					<div class="col-12">
						<input type="text" name="id" id="iid"
							placeholder="Enter your ID (Visible to Others)" required>
					</div>
				</div>
				<div class="row">
					<div class="col-12">PW</div>
					<div class="col-12">
						<input type="password" name="pw" id="ipw" placeholder="Enter your PW"
							required>
					</div>
				</div>
				<div class="row">
					<div class="col-12">Confirm PW</div>
					<div class="col-12">
						<input type="password" id="ipwC" placeholder="Enter your PW" required>
					</div>
				</div>
				<div class="row">
					<div class="col-12" id="pwCheck"></div>
				</div>
				<div class="row">
					<div class="col-12">Email</div>
					<div class="col-9">
						<input type="text" name="email" id="iemail"
							placeholder="Enter your Usable Email" required>
					</div>
					<div class="col-3">
						<button>Authentication</button>
					</div>
				</div>
				<div class="row">
					<div class="col-12">Name</div>
					<div class="col-12">
						<input type="text" name="name" id="iname"
							placeholder="Username (Only Visible for Reservation)" required>
					</div>
				</div>
				<div class="row">
					<div class="col-12">Year Of Birth</div>
					<div class="col-12">
						<input type="number" name="yob" id="iyob" placeholder="ex) 1995"
							required>
					</div>
				</div>
				<div class="row">
					<div class="col" style="text-align: center;"></div>

				</div>
				<div class="row">
					<div class="col-12">
						<input type="checkbox" name="agree" id="agree" value="agree"
							required>I agree to the <a href=#>Terms and Condition
							and Privacy Policy, Tasty Korea Rules</a>
					</div>

				</div>
				<div class="row">
					<div class="col-12" style="text-align: center;">
						<button type="submit">Sign Up</button>
					</div>

				</div>
			</div>

		</form>
	</div>

	<script>
		$("#idCheck").on("click", function() {
			$.ajax({
				url : "/cMember/idCheck",
				type : "get",
				data : {
					"id" : $("#id").val()
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
				$("#idCheckBox").text("서버와의 통신이 불안정 합니다.");
			})
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