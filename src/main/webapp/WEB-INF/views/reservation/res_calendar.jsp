<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>


<style>



  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }


	#modal_time span{
	border:1px solid red;
	border-radius:5px;
	
	padding:5px;
	}
	
	 #modal_time span:hover{
        background-color: red;
        color: white;
        cursor:pointer;
      }
      
      .clicked {
       background-color: red;
       color: white;
      }
	 
.disableClick{

}
.dontClick{
background-color:blue;
pointer-events:none;
}
</style>
</head>
<body>

<%@include file="../layout/header.jsp" %>

<div class="container">

<section class="">

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">예약 시간</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modal_time">
      <c:forTokens var="onday" items="${onday}" delims=",">
       <span class="select_time">${onday}</span>
      </c:forTokens>
     
      </div>
      <div class="modal-footer">
      	<button  class="btn btn-primary" id="subBtn">선택하기</button>
       	<button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancelBtn">취소하기</button>
      </div>
    </div>
  </div>
</div>
 <div id='calendar'></div>
 </section>
 </div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="/resources/js/header.js"></script>
 <script>
 let select = document.getElementsByClassName("select_time");
 

 
 function handleClick(e){
	 if (event.target.classList[1] === "clicked") {
         event.target.classList.remove("clicked");
       }else{
    	   for (var i = 0; i < select.length; i++) {
               select[i].classList.remove("clicked");
             }
       }
         event.target.classList.add("clicked");
         console.log("target: ",e.target.classList[1]);
         console.log("target: ",e.target.classList[0]); 
 }
 
 function init() {
     for (var i = 0; i < select.length; i++) {
       select[i].addEventListener("click", handleClick);
     }
   }

 function reset(){
	  for (var i = 0; i < select.length; i++) {
          select[i].classList.remove("clicked");
        }
 }
 
   init();
   
 </script>
<script>

  
	 
    var calendarEl = document.getElementById('calendar');
    let strDate = ''
    	 $("#subBtn").on('click',function(){
    		 
    		
      		let selected = $('.clicked').html();
      		
      		console.log(selected)
      		console.log(strDate)
      		let data = {
      			res_name:'${bizName}',
      			userId:'${loginID}',
      			res_date:strDate,
      			res_time:selected,
      			biz_seq:${biz_seq}
      			}
      		//start 컨트롤러에 보내면 시간 초 까지 나옴 가공해야됨
      		let no = 12
      		 $.ajax({
      			url:"/res/insertCal",
      			type:"POST",
      			data: JSON.stringify(data),
      			contentType:"application/json;charset=utf-8"
      			
      		}).done(function(resp){
      			console.log("resp",resp)
      			
      			
      			
      		          calendar.addEvent({
      		            title: " 예약",
      		            start: strDate+" "+data.res_time

      		          })
      		       
      		       reset();
      		        location.reload()
      			$("#cancelBtn").click();
      		}) 
      	})
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	
      headerToolbar: {
        left: 'prev,next',
        center: 'title',
        right: 'dayGridMonth'
      },
     
      initialDate: '2021-08-01',
      initialView: 'dayGridMonth',
      validRange: {
    	  start: '2021-08-27',
    	    end: '2021-10-31',
      },
      locale : 'ko',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
    
     /* 클릭하였을때 이벤트 막기 */
    	selectConstraint: {
    		<c:if test="${od == 'mon'}">
    		daysOfWeek: [0,2,3,4,5,6]
    		</c:if>
    		<c:if test="${od == 'tue'}">
    		daysOfWeek: [0,1,3,4,5,6]
    		</c:if>
    		<c:if test="${od == 'wed'}">
    		daysOfWeek: [0,1,2,4,5,6]
    		</c:if>
    		<c:if test="${od == 'thu'}">
    		daysOfWeek: [0,1,2,3,5,6]
    		</c:if>
    		<c:if test="${od == 'fri'}">
    		daysOfWeek: [0,1,2,3,4,6]
    		</c:if>
    		<c:if test="${od == 'sat'}">
    		daysOfWeek: [0,1,2,3,4,5]
    		</c:if>
    		<c:if test="${od == 'sun'}">
    		daysOfWeek: [1,2,3,4,5,6]
    		</c:if>
    	},
    
      //여기다가 모달창 만들어서 ajax로 데이터 넘겨주자
     
      select: function(arg) {
    	   strDate = moment(arg.start).format("YYYY-MM-DD")
     /*모달창  띄우기*/
     $("#exampleModal").modal('show');
    	  /* 예약됬는지 체크 */
    	  console.log(strDate)
    	   for(let i=0; i<select.length; i++){
    		   let data = {
        			   res_time:select[i].innerText,
        			   res_date:strDate,
        			   biz_seq:${biz_seq}
        			   }
    			 console.log(select[i].innerText)
    			 $.ajax({
    				 url:"/res/reserveCheck",
    				 data:JSON.stringify(data),
    				 type:"POST",
    				 contentType:"application/json;charset=utf-8"
    			 }).done(function(resp){
    				 console.log("resp",resp)
    				 if(resp == 'Y'){
    						//select[i].className="dontClick"
    					// select[i].style.backgroundColor = 'blue'
    						console.log("selI",select[i])
    			select[i].classList.add("dontClick")
    						
    				 }else{
    					 //select[i].style.backgroundColor = 'rgba(1,1,1,0)'
    					 select[i].classList.remove('dontClick')
    				 }
    				 
    			 })
    		 }
      },
     
      //이벤트 클릭 취소하기
      
      eventClick: function(arg) {
    	
    	let title = arg.event.title;
    	let resId = arg.event.id  //저장된 id값 얻기
    	  console.log(arg.event.start)
    	  console.log(resId)
    	 let eventDt = moment(arg.event.start).format("YYYY-MM-DD")
    	 console.log(eventDt)
    	 if(title == '휴일'){
    		 alert("휴일 입니다")
    		 return;
    	 }else{
        if (confirm('취소 하시겠습니까?')) {
          arg.event.remove()
          $.ajax({
        	  url:"/res/"+resId,
        	  type:"delete"
          }).done(function(resp){
        	  console.log(resp)
        	 
          })
        }
    	 }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [  //여기다가일정 불러오면 됨 디비에서
        {
          title: 'All Day Event',
          start: '2021-08-03',
         
     	 
        },
        
        	<c:forEach var="resInfo" items="${resInfo}">
        	{
        	id: ${resInfo.res_no},
        	title: '예약',
        	start: '${resInfo.res_date}'+" "+'${resInfo.res_time}'
        		
        	},
        	</c:forEach>
       
        		<c:forEach var="every" items="${offdays}">
        		{
        		title:'휴일',
        		start: '${every}',
        		color:'red',
        		
        		},
        		</c:forEach>
        		
        
      ],
      eventTimeFormat: { // like '14:30:00'
		    hour: '2-digit',
		    minute: '2-digit',
		    hour12: false
		  },
		
    });

    calendar.render();

   
    

    
</script>
</body>
</html>


