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
    <title>Document</title>
    <style>
        * {
            box-sizing: border-box;
            text-align: center;
        }

        .wrapper {
            max-width: 600px;
            margin: auto;
        }
        .row{
            margin: 1%;
        }
        .header{
            margin-bottom: 5%;
        }
        .submit{
            margin-top: 5%;
        }
        input {
            width: 99%;
        }
    </style>

</head>

<body>
    <div class="container p-5 shadow bg-white rounded">
        <div class="row header">
            <div class="col-12">
                <h2>메뉴 번역 신청</h2>
            </div>

        </div>
        <form action="${pageContext.request.contextPath}/trans/insertMenuProc" method="post">
            <div class="wrapper">
            
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-4">메뉴 이름</div>
                    <div class="col-4">가격(원)</div>
                    <div class="col-2"></div>
                </div>
                <div class="row">
                    <div class="col-2"><button class="more">+</button></div>
                    <div class="col-4"><input class="inp menu" type="text" name="menu_kor"></div>
                    <div class="col-4"><input class="inp price" type="text" name="price"></div>
                    <div class="col-2"></div>
                </div>
                <div class="row submit">
                    <div class="col-12">
                        <button type="submit" id="submit">신청</button>
                    </div>        
                </div>
                
            </div>
        </form>
    </div>
    <script>
        let count = 1;
        $(".wrapper").on("click", ".more", function () {

            if (count < 9) {
                count++;
                $(this).remove();

                let row = $("<div>");
                row.addClass("row");

                let col1 = $("<div>");
                col1.addClass("col-2");
                let more = $("<button>");
                more.addClass("more");
                more.html("+");
                col1.append(more);

                let col2 = $("<div>");
                col2.addClass("col-4");
                let inpM = $("<input>");
                inpM.attr("class", "inp menu");
                inpM.attr("type", "text");
                inpM.attr("name", "menu_kor");
                col2.append(inpM);

                let col3 = $("<div>");
                col3.addClass("col-4");
                let inpP = $("<input>");
                inpP.attr("class", "inp price");
                inpP.attr("type", "text");
                inpP.attr("name", "price");
                col3.append(inpP);

                let col4 = $("<div>");
                col4.addClass("col-2");
                let btnDel = $("<button>");
                btnDel.attr("class", "btnDel");
                btnDel.html("-");
                col4.append(btnDel);

                row.append(col1);
                row.append(col2);
                row.append(col3);
                row.append(col4);
                $(row).hide();
                $(".wrapper .row:last-child").before(row);
                $(row).fadeIn(800);


            } else if (count == 9) {
                count++;
                $(this).remove();

                let row = $("<div>");
                row.addClass("row");

                let col1 = $("<div>");
                col1.addClass("col-2");

                let col2 = $("<div>");
                col2.addClass("col-4");
                let inpM = $("<input>");
                inpM.attr("class", "inp menu");
                inpM.attr("type", "text");
                inpM.attr("name", "menu_kor");
                col2.append(inpM);

                let col3 = $("<div>");
                col3.addClass("col-4");
                let inpP = $("<input>");
                inpP.attr("class", "inp price");
                inpP.attr("type", "text");
                inpP.attr("name", "price");
                col3.append(inpP);

                let col4 = $("<div>");
                col4.addClass("col-2");
                let btnDel = $("<button>");
                btnDel.attr("class", "btnDel");
                btnDel.html("-");
                col4.append(btnDel);

                row.append(col1);
                row.append(col2);
                row.append(col3);
                row.append(col4);
                $(row).hide();
                $(".wrapper .row:last-child").before(row);
                $(row).fadeIn(800);
            }
        })

        $(".wrapper").on("click", ".btnDel", function () {
            count--;

            $(this).closest(".row").remove();

            let more = $("<button>");
            more.addClass("more");
            more.html("+");
            $('.wrapper .row:last-child div:first-child').append(more);
        })

    </script>
</body>
</html>