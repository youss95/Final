<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

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

.hidden {
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

#login {
	width: 100%;
}

.footer {
	margin-top: 20px;
}
</style>
</head>

<body>
	<div class="container p-5 shadow bg-white rounded">
		<center>Find ID</center>
		<div class="wrapper">


			<div class="row">
				<div class="col-12">Name</div>
				<div class="col-12">
					<input type="text" class="ipF" name="name" id="iname"
						placeholder="Username (Only Visible for Reservation)" required>
				</div>
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
				<div class="col-12" id="waiting"></div>
			</div>

			<div class="row hidden">
				<div class="col-12">
					<input type=text class="ipB" name="check" id="confirmInput"
						placeholder="인증번호입력"><input type="hidden"
						id="confirmNumber">
					<button id="confirmEmail">confirm</button>
				</div>
			</div>
			<div class="row hidden">
				<div class="col-12" id="FindID"></div>
			</div>
			<div class="row footer">
				<div class="col-12" id="btlogin">
					<button class="btn btn-warning" id="login">Back to Log-In</button>
				</div>
			</div>

		</div>

	</div>

	<script>
		$("#sendEmail")
				.on(
						"click",
						function() {
							$("#waiting").css("color", "rgb(245, 147, 0)");
							$("#waiting").html(
									"Please wait a second for sending email.");
							$
									.ajax({
										url : "/cMember/sendEmailforID",
										type : "get",
										data : {
											"email" : $("#iemail").val(),
											"name" : $("#iname").val()
										}
									})
									.done(
											function(res) {
												if (res == "false") {
													$("#waiting").css("display", "none");
													alert("There is no matching member with your NAME and EMAIL. Check your NAME and EMAIL again.");
												} else {
													$("#waiting").css("display", "none");
													$("#confirmNumber")
															.val(res);
													$(".hidden").css("display",
															"block");
												}
											}).fail(function(a, b, c) {
										alert("서버와의 통신이 불안정 합니다.");
									})
						})
		$("#confirmEmail").on("click", function() {
			if ($("#confirmInput").val() == $("#confirmNumber").val()) {
				$.ajax({
					url : "/cMember/findID",
					type : "get",
					data : {
						"name" : $("#iname").val(),
						"email" : $("#iemail").val()
					}
				}).done(function(res) {
					$("#FindID").css("color", "blue");
					$("#FindID").html("Your ID is \"" + res + "\".");

				}).fail(function(a, b, c) {
					alert("Server Connection is unstable.");
				})

			} else {
				$("#FindID").css("color", "red");
				$("#FindID").html("Wrong Number");
			}
		})

		$("#login")
				.on(
						"click",
						function() {
							location.href = "${pageContext.request.contextPath}/cMember/loginForm";
						})
	</script>
</body>
</html>