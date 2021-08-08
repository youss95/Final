/**
 * 
 */


 $(function () {
	   let $window = $(window),
	     mainHeader = $("#main-header");
	   defaultLogo = "/resources/images/logoTxt.png";
	   smallLogo = "/resources/images/logoPic.png";

	   $window.scroll(function () {
	     if ($window.scrollTop() > 100) {
	       if (!mainHeader.hasClass("shrink")) {
	         mainHeader.addClass("shrink");
	         switchImages(smallLogo);
	       }
	     } else {
	       if (mainHeader.hasClass("shrink")) {
	         mainHeader.removeClass("shrink");
	         switchImages(defaultLogo);
	       }
	     }
	   });
	 });

	 function switchImages(newPath) {
	   let logo = $("#logo");
	   logo.fadeOut(300, function () {
	     logo.attr("src", newPath);
	     logo.fadeIn(300);
	   }); //로고 사라지게함
	 }

/*팝오버*/

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
     //$("#popBtn").ekkoLightbox();
     // $(".wrap").css("background-color", "rgba(0,0,0,0.6)");
     //$(".wrap").css("opacity", "0.3");
   });

   $("#popBtn").attr(
     "data-content",
     '<li id="menu1">메뉴1</li><li id="menu2">메뉴2</li><div id="myp"><a href="">MYPAGE</a></div><br><div class="section"></div>'
   );
   //동적 생성된거는 이거 쓴다.
   $(document).on("click", "#menu1", function () {
     $(".section *").remove();
     let contentSection = $(".section");
     let first = `<div id="aaa">menu1 내용</div><br><div>dd</div><br><div>dd</div><br><div>dd</div><br><div>dd</div><br><div>dd</div><br><div>dd</div><br><div>dd</div><br><div>dd</div><br><div>dd</div>`;

     contentSection.append(first);
   });
   $(document).on("click", "#menu2", function () {
     $(".section *").remove();
     let contentSection = $(".section");
     let second = `<div id="aaa">menu2 내용</div><br>`;
     contentSection.append(second);
   });

