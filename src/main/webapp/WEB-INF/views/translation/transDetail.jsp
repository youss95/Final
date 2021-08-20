<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://kit.fontawesome.com/be4f056d3a.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<style>
* {
	box-sizing: border-box;
	text-align: center;
}

body {
	background-color: #D8E3E7;
}

.container {
	margin-top: 80px;
	padding: 5%;
	max-width: 600px;
}

.row {
	text-align: center;
}

.header {
	margin: 3%;
}

.search {
	margin: 3%;
}

.columns {
	padding: 1%;
	border-bottom: 3px solid black;
	margin-left: 10px;
	margin-right: 10px;
}

.list {
	margin: 1%;
	border-bottom: 1px solid black;
	padding-bottom: 1%;
}

.footer {
	margin: 2%;
}

a {
	text-decoration: none;
	color: black;
}

.slide {
	position: absolute;
	width: 100%;
	height: 50px;
	top: 100%;
	background-color: #55555550;
}

.fa-pen {
	color: rgb(89, 128, 255)
}

.fa-save {
	color: rgb(211, 43, 43);
}
input{
width:100%;
}
</style>

</head>

<body>


	<div class="container p-4 shadow bg-white rounded">
		<div class="row header">
			<h2 style="width: 100%;">
				<b>${business_id}</b>
			</h2>
		</div>



		<div class="row columns">
			<div class="col-4">한국어</div>
			<div class="col-4">영어</div>
			<div class="col-2">가격</div>
			<div class="col-2">confirm</div>
		</div>

		<c:forEach var="item" items="${menuList}" varStatus="s">
			<div class="row list" style="overflow: hidden">
				<input type="hidden" value="${fn:length(menuList)}" id="menuCount${s.index }">
				<div class="col-4">${item.menu_kor}</div>
				<div class="col-4 menu_eng">${item.menu_eng}</div>
				<div class="col-2">${item.price}</div>
				<div class="col-2">
					<i class="fas fa-pen modi" seq="${item.seq}"></i> <i
						class="fas fa-save directConfirm" seq="${item.seq}"></i>
				</div>
			</div>
		</c:forEach>

		<div class="row footer">
			<div class="col-3"></div>

			<div class="col-6" style="text-align: center;">
				<button id="done">완료</button>
			</div>

			<div class="col-3" style="text-align: right"></div>
		</div>
	</div>

	<script>
				let count = 0;
				$("#done").on("click", function(){
					if(count==$("#menuCount0").val()){
					location.href="${pageContext.request.contextPath}/trans/transList?currentPage=1";
					}else{
						alert("모든 메뉴를 confirm한 후, 완료 버튼을 누르세요.");
					}
				})
                $(".list").on("click", ".modi", function(){                    
                    $(this).siblings().remove();
                    let modiConfirm = $("<i>");
                    modiConfirm.addClass("fas fa-save modiConfirm");		
                    modiConfirm.attr("seq", $(this).attr("seq"));
                    $(this).parent().append(modiConfirm);
                    
                    let menu_eng_box = $(this).closest(".list").children(".menu_eng")
                    let menu_eng_val = menu_eng_box.html();
                    
                    let menu_eng = $("<input>");
                    menu_eng.attr("type","text");
                    menu_eng.attr("name","menu_eng");
                    menu_eng.attr("value",menu_eng_val);
                    menu_eng.addClass("menu_engInput");
                    menu_eng_box.html("");
                    $(this).closest(".list").children(".menu_eng").append(menu_eng);
                                        
                    $(this).remove();
                })
                
                $(".list").on("click", ".directConfirm", function(){   
                		
                		let here = $(this);
                		let seq =$(this).attr("seq");
                		
                		let check = confirm("정말 confirm 하시겠습니까? 이후 변경은 불가능합니다.");
                		if(check){
	                		$.ajax({
	            				url:"${pageContext.request.contextPath}/trans/directConfirm",
	            				type:"get",
	            				data:{"seq": seq}
	            			}).done(function(res){
	            				if(res>0){
	            					count++;
	            					here.siblings().remove();
	                                let checkSign = $("<i>");
	                                checkSign.addClass("fas fa-check check");
	                                here.parent().append(checkSign);
	                                
	                                here.remove();
	            				}else{
	            					alert("저장 실패");
	            				}
	            			}).fail(function(a,b,c){
	            				alert("서버와의 통신이 불안정 합니다.");
	            			})   
                		}
          		})
          		
                $(".list").on("click", ".modiConfirm", function(){
                	
            		
            		let here = $(this);
            		let seq = here.attr("seq");
            		let menu_eng = here.closest(".list").find(".menu_engInput");
            		let menu_eng_val = menu_eng.val();
            		
            		let check = confirm("정말 수정하시겠습니까? 이후 변경은 불가능합니다.");
            		if(check){
	            		$.ajax({
	        				url:"${pageContext.request.contextPath}/trans/modiConfirm",
	        				type:"get",
	        				data:{"seq": seq, "menu_eng":menu_eng_val}
	        			}).done(function(res){
	        				if(res>0){
	        					count++;
	        					menu_eng.remove();
	        					here.closest(".list").children(".menu_eng").html(menu_eng_val);
	        					let checkSign = $("<i>");
	                            checkSign.addClass("fas fa-check check");
	                            here.parent().append(checkSign);
	                            here.remove();
	        				}else{
	        					alert("저장 실패");
	        				}
	        			}).fail(function(a,b,c){
	        				alert("서버와의 통신이 불안정 합니다.");
	        			}) 
            		}
                })
                
            </script>

</body>




</html>