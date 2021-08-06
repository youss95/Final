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
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
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
	 

</style>
</head>
<body>



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
      <c:forTokens var="time" items="${time}" delims=",">
       <span class="select_time">${time}</span>
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
      		
      		let data = {data:selected}
      		//start 컨트롤러에 보내면 시간 초 까지 나옴 가공해야됨
      		let no = 12
      		 $.ajax({
      			url:"/replies/insertCal",
      			type:"POST",
      			data: JSON.stringify(data),
      			contentType:"application/json;charset=utf-8"
      			
      		}).done(function(resp){
      			console.log("resp",resp)
      			
      			
      			
      		          calendar.addEvent({
      		            title: " 예약",
      		            start: strDate+" "+data.data

      		          })
      		       
      		       reset();
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
      locale : 'ko',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
    
     
    	selectConstraint: {
    		daysOfWeek: [0,1,2,3,4,6]
    	},
    
      //여기다가 모달창 만들어서 ajax로 데이터 넘겨주자
     
      select: function(arg) {
    	   strDate = moment(arg.start).format("YYYY-MM-DD")
     /*모달창  띄우기*/
     $("#exampleModal").modal('show');
	
     
     
        //title 값이 있으면 json형식으로 일정을 추가 -> ajax통신 성공하면 추가로 변경하자
       if(strDate == '2021-08-08'){
    	   console.log('asddsa')
        calendar.unselect()
       }
      },
     
      //이벤트 클릭 취소하기
      //휴일 이벤트 취소 막기(아직 기능 구현 못함)
      eventClick: function(arg) {
    	
    	
    	let resId = arg.event.id  //저장된 id값 얻기
    	  console.log(arg.event.start)
    	 let eventDt = moment(arg.event.start).format("YYYY-MM-DD")
    	 console.log(eventDt)
        if (confirm('취소 하시겠습니까?')) {
          arg.event.remove()
          $.ajax({
        	  url:"/res/"+resId,
        	  type:"delete"
          }).done(function(resp){
        	  console.log(resp)
          })
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [  //여기다가일정 불러오면 됨 디비에서
        {
          title: 'All Day Event',
          start: '2021-08-03',
         
     	 
        },
        {
        	id: 999,
        	title: 'Repeating Event',
        	start: '2021-08-09 16:00'
        	},
       
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


