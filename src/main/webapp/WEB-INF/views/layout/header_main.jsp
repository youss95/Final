<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="main-header">
	<nav>
		<a href="/"> <img
			src="${pageContext.request.contextPath}/resources/images/logoTxt.png"
			alt="Logo" id="logo" style="width: 140px; height: 80px" /></a>
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/header_main.css?after" />
		<script src='https://kit.fontawesome.com/a076d05399.js'
			crossorigin='anonymous'></script>
		<c:choose>
			<c:when test="${loginID!=null }">
				<ul>

					<li>
						<c:if test="${binfo.member_role eq 'B'}">
							<a href="${pageContext.request.contextPath}/bMember/myPage">MyPage</a>
						</c:if>
						<c:if test="${info.member_role eq 'C'}">
							<a href="${pageContext.request.contextPath}/cMember/mypage">MyPage</a>
						</c:if>
						
					</li>
					<li><a href="${pageContext.request.contextPath}/member/logout"><i
							class="fas fa-sign-out-alt"></i></a></li>
					<li><a
						href="${pageContext.request.contextPath}/noti/detail?userId=${loginID}"
						class="button" style="position: relative"><i
							class="fas fa-bell fa-2x"></i><span class="nav-counter"></span></a></li>
					<li><i class="fas fa-user-alt userIcon" id="popBtn"
						data-placement="bottom" class="btn btn-lg btn-danger"
						data-toggle="popover lightbox" title="Popover title"
						data-content="And here's some amazing content. It's very engaging. Right?"></i></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/member/whichMember">Login</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</nav>

</header>

</body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script>

  $(function(){
	  $.ajax({
		  url:"/noti/alarmCounts",
		  data:{userId:'${loginID}'}
	  }).done(function(res){
		  console.log(res)
		  $('.nav-counter').append(res)
	  })
	 
  })
  
  /* 팝오버입니다. */
  $("#popBtn").popover({
	     animation: true,

	     delay: { show: 50, hide: 10 },
	     // template 사용한다.
	     html: true,
	     // 팝오버 template 제목은 popover-title, 내용은 popover-content에 들어간다.
	     template:
	       '<div class="popover" role="tooltip" style="width:500px;"><div class="arrow"></div><div class="popover-body"></div></div>',
	     // 팝오버 제목
	     title: "팝 오버",
	     // 팝오버 내용
	     content: "내용",
	     // 팝오버 이벤트는 수동.
	     trigger: "manual",
	   });
	   $("#popBtn").on("click", function () {
	     $("#popBtn").popover("toggle");
	     setTimeout(function() {
	    	 document.getElementById("menu1").click();
	    	}, 100);

	     
	    
	    
	     //$("#popBtn").ekkoLightbox();
	     // $(".wrap").css("background-color", "rgba(0,0,0,0.6)");
	     //$(".wrap").css("opacity", "0.3");
	   });

	   $("#popBtn").attr(
	     "data-content",
	     '<li id="menu1">예약정보</li><li id="menu2">메뉴2</li><div id="myp"><a href=""><i class="fas fa-cog fa-2x"></i></a></div><br><div class="section"></div>'
	   );
	 
	   //동적 생성된거는 이거 쓴다.
	  $(document).on("click", "#menu1", function () {
		  let contentSection = $(".section");
		   $.ajax({
			   url:"/res/resInfoList",
			   data:{userId:'${loginID}'}
		   }).done(function(resp){
			  
			  // $(".section *").remove();
			   
			     let first ='';
			      resp.map((list)=>{	
			    first += "<div id='aaa' data-res='"+list.res_no+"'>"+list.res_name+"</div><br><div>"+list.res_date+"</div><br><div>"+list.res_time+"</div>";	
			     }) 
			     contentSection.html(first);
		   })
	  
	   });

	   $(document).on("click", "#menu2", function () {
	     $(".section *").remove();
	     let contentSection = $(".section");
	     let second = `<div id="aaa">menu2 내용</div><br>`;
	     contentSection.append(second);
	   });
	   
	   
  </script>

</html>
</body>
</html>