<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <style>
        /* 마스크 뛰우기(fixed로 하면 화면을 내려도 흰부분 안보임) */
        
        #mask {
            position: fixed;
            width: 100%;
            height: 100%;
            z-index: 100000000000000000000;
            background-color: #000;
            display: none;
            left: 0;
            top: 0;
        }
        /* 팝업으로 뜨는 윈도우 css  */
        
        .popup {
            display: none;
            position: absolute;
            left: 50%;
            top: 50px;
            margin-left: -500px;
            width: 1000px;
            height: 500px;
            /*background-color: #FFF;*/
            z-index: 100000000000000000000000;
        }
    </style>
    <script language="Javascript">
        function setCookie(name, value, expiredays) {
            var todayDate = new Date();
            todayDate.setDate(todayDate.getDate() + expiredays);
            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
        }

        function closeWin() {
            if (document.notice_form.chkbox.checked) {
                setCookie("maindiv", "done", 1);
            }
            document.all['divpop'].style.visibility = "hidden";
        }
    </script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
        $(document).ready(function() {
            //검은 막 띄우기
            $(document).ready(function(e) {
                $("#mask").fadeTo("slow", 0.6);
                $(".popup").show();
            });

            //닫기 버튼을 눌렀을 때
            $(".popup .close").click(function(e) {
                //링크 기본동작은 작동하지 않도록 한다.
                e.preventDefault();
                $("#mask, .popup").hide();
            });

            //검은 막을 눌렀을 때(이것도 필요 없으면 삭제해도 됨)
            $("#mask").click(function() {
                $(this).hide();
                $(".popup").hide();

            });

        });
    </script>
</head>
<body>
	 <div id="wrap">
        <div id="divpop">
            <div id="mask"></div>
            <div class="popup">
                <p style="width:1000px;height:500px;text-align:center;vertical-align:middle;">
                    <img src="${pageContext.request.contextPath}/resources/images/main_banner.png">
                </p>
                <form name="notice_form">
                    <!--어색하다면 값 채우기 background:#ffffff;-->
                    <p style="text-align:center; padding:20px; background:#ffffff; color: black; width: 961px">
                        <input type="checkbox" name="chkbox" value="checkbox">오늘 하루 이 창을 열지 않음
                        <a href="javascript:closeWin();"><B>[닫기]</B></a>
                    </p>
                </form>
            </div>
        </div>
    </div>
    <script language="Javascript">
        cookiedata = document.cookie;
        if (cookiedata.indexOf("maindiv=done") < 0) {
            document.all['divpop'].style.visibility = "visible";
        } else {
            document.all['divpop'].style.visibility = "hidden";
        }
    </script>
</body>
</html>