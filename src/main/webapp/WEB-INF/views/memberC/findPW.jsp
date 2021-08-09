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

.confirm {
	display: none;
}

.findPW {
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
</style>
</head>

<body>
	<div class="container p-5 shadow bg-white rounded">
		<center>Find ID</center>
		<div class="wrapper">

			<form action="${pageContext.request.contextPath}/cMember/resetPW"
				id="pwForm">
				<div class="row">
					<div class="col-12">ID</div>
					<div class="col-12">
						<input type="text" class="ipF" name="id" id="iid"
							placeholder="Enter your ID">
					</div>
				</div>
				<div class="row">
					<div class="col-12">Name</div>
					<div class="col-12">
						<input type="text" class="ipF" name="name" id="iname"
							placeholder="Enter your NAME">
					</div>
				</div>

				<div class="row">
					<div class="col-12">Email</div>
					<div class="col-12">
						<input type="text" class="ipB" name="email" id="iemail"
							placeholder="Enter your Email">
						<button id="sendEmail">send</button>
					</div>
				</div>

				<div class="row">
					<div class="col-12" id="waiting"></div>
				</div>


				<div class="row confirm">
					<div class="col-12">
						<input type=text class="ipB" name="check" id="confirmInput"
							placeholder="인증번호입력"><input type="hidden"
							id="confirmNumber">
						<button id="confirmEmail">confirm</button>
					</div>
				</div>

				<div class="row findPW">
					<div class="col-12">PW</div>
					<div class="col-12">
						<input type="password" class="ipF" name="pw" id="ipw"
							placeholder="Reset your PW" required>
					</div>
				</div>
				<div class="row findPW">
					<div class="col-12">Confirm PW</div>
					<div class="col-12">
						<input type="password" class="ipF" id="ipwC"
							placeholder="Reset your PW" required>
					</div>
				</div>
				<div class="row">
					<div class="col-12" id="pwCheck"></div>
				</div>
				<div class="row findPW">
					<div class="col-12">
						<button type="submit" id="resetPW">Reset Password</button>
					</div>
				</div>
			</form>


		</div>

	</div>

	<script>
		$("#sendEmail")
				.on(
						"click",
						function() {
							$("#waiting").css("color", "red");
							$("#waiting").html("Please wait a second for sending email.");
							$
									.ajax({
										url : "/cMember/sendEmailforPW",
										type : "get",
										data : {
											"id" : $("#id").val(),
											"name" : $("#iname").val(),
											"email" : $("#iemail").val()
										}
									})
									.done(
											function(res) {
												if (res == "false") {
													$("#waiting").css("display", "none");
													alert("There is no matching member with your ID, NAME and EMAIL. Check your ID, NAME and EMAIL again.");
												} else {
													$("#waiting").css("display", "none");
													$("#confirmNumber")
															.val(res);
													$(".confirm").css(
															"display", "block");
												}
											}).fail(function(a, b, c) {
										alert("서버와의 통신이 불안정 합니다.");
									})
						})
		$("#confirmEmail").on("click", function() {
			if ($("#confirmInput").val() == $("#confirmNumber").val()) {
				$(".findPW").css("display", "block");
			} else {
				$("#findPW").css("color", "red");
				$("#findPW").html("Wrong Number");
			}
		})
		$("#resetPW").on("click", function() {
			if ($("#ipw").val() == $("#ipwC").val()) {
				$("#pwForm").submit();
			} else {
				$("#pwCheck").css("color", "red");
				$("#pwCheck").html("Unmatched Password");
			}
		})
	</script>
</body>
</html>