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

 
