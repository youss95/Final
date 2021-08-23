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
<title>Document</title>
<style>
* {
	box-sizing: border-box;
	text-align: center;
}

.container {
	margin-top: 100px;
}

.wrapper {
	max-width: 600px;
	margin: auto;
}

.row {
	margin: 1%;
}

.header {
	margin-bottom: 5%;
}

.more {
	margin: 2%;
}

div[class*=col] {
	padding: 0px;
}

.col-2 {
	text-align: left;
}

#more {
	width: 64%;
}

.btnDel {
	width: 35%;
}

.submit {
	margin-top: 2%;
}

input {
	height: 100%;
	width: 90%;
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
		<form action="${pageContext.request.contextPath}/trans/insertMenuProc"
			method="post">
			<div class="wrapper">

				<div class="row">
					<div class="col-2"></div>
					<div class="col-4">메뉴 이름</div>
					<div class="col-4">가격(원)</div>
					<div class="col-2"></div>
				</div>
				<div class="row list">
					<div class="col-2"></div>
					<div class="col-4">
						<input class="inp menu" type="text" name="menu_kor">
					</div>
					<div class="col-4">
						<input class="inp price" type="text" name="price">
					</div>
					<div class="col-2">
						<button type="button" class="btn btn-light btnDel">-</button>
					</div>
				</div>
				<div class="row more">
					<div class="col-12">
						<button type="button" id="more" class="btn btn-secondary">메뉴
							추가</button>
					</div>
				</div>
				<div class="row submit">
					<div class="col-12">
						<button class="btn btn-primary" type="submit" id="submit"
							style="width: 64%">신청</button>
					</div>
				</div>

			</div>
		</form>
	</div>
	<script>
		let count = 1;
		$("#more").on("click", function() {

			if (count < 10) {
				count++;
				let row = $("<div>");
				row.addClass("row list");

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
				btnDel.attr("class", "btn btn-light btnDel");
				btnDel.html("-");
				col4.append(btnDel);

				row.append(col1);
				row.append(col2);
				row.append(col3);
				row.append(col4);
				$(row).hide();
				$(".wrapper .list").after(row);
				$(row).fadeIn(800);

			} else if (count == 10) {
				count++;

				alert("메뉴는 최대 10개까지 등록할 수 있습니다.");

			}
		})

		$(".wrapper").on("click", ".btnDel", function() {
			if(count==1){
				alert("최소 1개 이상의 메뉴를 등록하셔야 합니다.");
			}else{
				count--;
				$(this).closest(".row").remove();
			}

		})
	</script>
</body>
</html>