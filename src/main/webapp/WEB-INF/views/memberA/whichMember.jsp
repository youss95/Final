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
        * {
            box-sizing: border-box;
        }


        .container {
            margin-top: 100px;
            max-width: 500px;
            text-align: center;
        }

        .wrapper {
            max-width: 500px;
            margin: auto;

        }
    </style>
</head>

<body>
    <div class="container p-5 shadow bg-white rounded">
        <div class="wrapper">
            <div class="row" style="margin-bottom: 20px;">
                <div class="col-12">Who are you?</div>
            </div>
            <div class="row">
                <div class="col-12"><a href="${pageContext.request.contextPath}/cMember/loginForm">Client</a></div>
            </div>
            <div class="row">
                <div class="col-12"><a href="${pageContext.request.contextPath}/bMember/loginForm">Business(사업자)</a>
                </div>
            </div>
            <div class="row">
                <div class="col-12"><a href="${pageContext.request.contextPath}/aMember/loginForm">Admin(관리자)</a>
            </div>
        </div>
    </div>

    </div>
</body>
</html>