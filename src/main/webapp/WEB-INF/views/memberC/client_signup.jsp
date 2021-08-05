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

        <form action="/cMember/signupProc" method="post">
            <div class="wrapper">
                <div class="row">
                    <div class="col-12">ID</div>
                    <div class="col-9"><input type="text" name="id" id="iid"
                            placeholder="Enter your ID (Visible to Others)" required></div>
                    <div class="col-3"><button id="idCheck">Check</button></div>
                </div>
                <div class="row">
                    <div class="col-12">PW</div>
                    <div class="col-12"><input type="text" name="pw" id="ipw" placeholder="Enter your PW" required></div>

                </div>
                <div class="row">
                    <div class="col-12">Confirm PW</div>
                    <div class="col-12"><input type="text" name="cpw" id="icpw" placeholder="Enter your PW" required></div>

                </div>
                <div class="row">
                    <div class="col-12">Email</div>
                    <div class="col-9"><input type="text" name="email" id="iemail"
                            placeholder="Enter your Usable Email" required></div>
                    <div class="col-3"><button>Authentication</button></div>
                </div>
                <div class="row">
                    <div class="col-12">Name</div>
                    <div class="col-12"><input type="text" name="name" id="iname"
                            placeholder="Username (Only Visible for Reservation)" required></div>
                </div>
                <div class="row">
                    <div class="col-12">Year Of Birth</div>
                    <div class="col-12"><input type="number" name="yob" id="iyob" placeholder="ex) 1995" required></div>
                </div>
                <div class="row">
                    <div class="col" style="text-align: center;"></div>
                    
                </div>
                <div class="row">
                    <div class="col-12">
                        <input type="checkbox" name="agree" id="agree" value="agree">I agree to the <a href=#>Terms and Condition and Privacy Policy, Tasty Korea Rules</a></div>
                    
                </div>
                <div class="row">
                    <div class="col-12" style="text-align: center;"><button type="submit">Sign Up</button></div>
                    
                </div>
            </div>

        </form>
    </div>

    <script>

        $("#idCheck").on("click", function () {
            $.ajax({
                url: "/member/idCheck",
                type: "get",
                data: { "id": $("#id").val() }
            }).done(function (res) {
                if (res == "1") {
                    alert("ID is already used by other user");
                    $("#id").val("");
                    $("#id").focus();
                } else {
                	alert("Userble ID");
                }
            }).fail(function (a, b, c) {
                $("#idCheckBox").text("서버와의 통신이 불안정 합니다.");
            })
        })


    </script>
</body>
</html>