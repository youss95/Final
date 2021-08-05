<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="container p-5 shadow bg-white rounded">
        <center>회원가입</center>

        <form action="/aMember/signupProc" method="post" id="signupForm">
            <div class="wrapper">
                <div class="row">
                    <div class="col-12">ID</div>
                    <div class="col-12"><input type="text" name="emp_id" id="iid"
                            placeholder="Enter your Employee ID"></div>

                </div>
                <div class="row">
                    <div class="col-12">PW</div>
                    <div class="col-12"><input type="text" name="pw" id="ipw" placeholder="Enter your PW"></div>

                </div>
                <div class="row">
                    <div class="col-12">Confirm PW</div>
                    <div class="col-12"><input type="text" name="cpw" id="icpw" placeholder="Enter your PW"></div>

                </div>
                <div class="row">
                    <div class="col-12">Email</div>
                    <div class="col-9"><input type="text" name="email" id="iemail"
                            placeholder="Enter your Usable Email"></div>
                    <div class="col-3"><button>Authentication</button></div>
                </div>
                <div class="row">
                    <div class="col-12">Name</div>
                    <div class="col-12"><input type="text" name="name" id="iname"
                            placeholder="Username (Only Visible for Reservation)"></div>
                </div>
                <div class="row">
                    <div class="col-12">Year Of Birth</div>
                    <div class="col-12"><input type="number" name="yob" id="iyob" placeholder="ex) 1995"></div>
                </div>
                <div class="row">
                    <div class="col" style="text-align: center;"></div>
                    
                </div>
                <div class="row">
                    <div class="col-12">
                        <input type="checkbox" name="agree" id="agree" value="agree">I agree to the <a href=#>Terms and Condition and Privacy Policy, Tasty Korea Rules</a></div>
                    
                </div>
                <div class="row">
                    <div class="col-12" style="text-align: center;"><button type="button" id="submit">Sign Up</button></div>
                    
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
                	alert("Your id and name is not exist in our company.");
                	$("#iid").val(""); 
                    $("#iname").val("");
                    #("#iid").focus();
                }
            }).fail(function (a, b, c) {
                alert("Server is unstable. try again.");
            })
		})
    </script>
</body>
</html>