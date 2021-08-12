<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Mypage - DashBoard
  </title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
   <!--     Fonts and icons     -->
   <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/css/material-dashboard.css?v=2.1.2" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/resources/css/demo.css" rel="stylesheet" />
  <!--   jquery 관련 -->
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.0/chart.min.js"></script>

<script src="/com/js/Chart.PieceLabel.js"></script> <!-- your piecelabel -->


 <style>
      p{display:inline-block;}
    .card-body div{ display:inline-block;}
   
</style>

</head>

<body>

  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="white" data-image="../assets/img/sidebar-1.jpg" style="height:100%;">
   
      <div class="logo" style="height:15%; padding:0px">
          <a href="${pageContext.request.contextPath}/" class="simple-text logo-normal">
<!--            <img src="/resources/images/logoPic.png" style="width:50px" > -->
          <img src="/resources/images/logoTxt.png" style="width:130px">
          </a>
      </div>



      <div class="sidebar-wrapper" style="height:85%; padding-bottom:0px">
        <div id="profileBox"  style="height:35%;">
           <div style="height:10px"></div>
           <div style="text-align: center;">
            <i class="material-icons" style="font-size: 90px;">person_outline</i>
           </div>
           <div id="idBox" style="text-align: center;">
            ${loginID} 님
           </div>
        </div>

        <div id="naviBox" style="height:60%">
        <ul class="nav" style="height:100%; margin-top:0px">

          <li class="nav-item" style="height:20%;">
             <a class="nav-link" href="${pageContext.request.contextPath}/bMember/myPage">
                  <i class="material-icons">person</i>
                  <p>My Page</p>
             </a>
          </li>

          <li class="nav-item active" style="height:20%;">
            <a class="nav-link" href="${pageContext.request.contextPath}/bMember/dashboard">
              <i class="material-icons">dashboard</i>
              <p>Dashboard</p>
            </a>
          </li>
          

          <li class="nav-item" style="height:20%;">
            <a class="nav-link" href="${pageContext.request.contextPath}/bMember/chatting">
              <i class="material-icons">chat</i>
              <p>Chatting</p>
            </a>
          </li>


<!--           <div style="height:50%"></div> -->
           <li class="nav-item " style="height:20%;">
              
            </li>
            
            <li class="nav-item " style="height:20%;">
              <a class="nav-link" href="${pageContext.request.contextPath}/" id="exit" style="margin-top:0px">
                <i class="material-icons">west</i>
                <p>Exit this Page</p>
              </a>
            </li>
          

        </ul>
        </div>

        <!-- <div id="outBox" style="height:20%">
        
        </div> -->
      </div>
    </div>




    <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
          <div class="container-fluid">
            <div class="navbar-wrapper">
              <a class="navbar-brand" href="javascript:;">Dashboard</a>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
              <span class="sr-only">Toggle navigation</span>
              <span class="navbar-toggler-icon icon-bar"></span>
              <span class="navbar-toggler-icon icon-bar"></span>
              <span class="navbar-toggler-icon icon-bar"></span>
            </button>
          </div>
        </nav>
        <!-- End Navbar -->
  
  
  
        <div class="content">
          <div class="container-fluid">
            <div class="row">
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="card card-stats">
                  <div class="card-header card-header-warning card-header-icon">
                    <div class="card-icon">
                      <i class="material-icons">star_border</i>
                    </div>
                    <p class="card-category">별점</p>
                    <h3 class="card-title">4.3
                      <small>/5.0</small>
                    </h3>
                  </div>
  
                  
                  <div class="card-footer">
                    <div class="stats">
                      <!-- <i class="material-icons text-danger">warning</i>
                      <a href="javascript:;">Get More Space...</a> -->
                    </div>
                  </div>
                </div>
              </div>
  
  
  
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="card card-stats">
                  <div class="card-header card-header-success card-header-icon">
                    <div class="card-icon">
                      <i class="material-icons">store</i>
                    </div>
                    <p class="card-category">예약자 수</p>
                    <h3 class="card-title"> 245 
                      <small>명</small>
                    </h3>
                  </div>
                  <div class="card-footer">
                    <div class="stats">
                     <!--  <i class="material-icons">date_range</i> Last 24 Hours -->
                    </div>
                  </div>
                </div>
              </div>
  
  
  
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="card card-stats">
                  <div class="card-header card-header-danger card-header-icon">
                    <div class="card-icon">
                      <i class="material-icons">favorite</i>
                    </div>
                    <p class="card-category">찜 수</p>
                    <h3 class="card-title">75
                      <small>개</small>
                    </h3>
                  </div>
                  <div class="card-footer">
                    <div class="stats">
                      <!-- <i class="material-icons">local_offer</i> Tracked from Github -->
                    </div>
                  </div>
                </div>
              </div>
  
  
  
              <!-- <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="card card-stats">
                  <div class="card-header card-header-info card-header-icon">
                    <div class="card-icon">
                      <i class="fa fa-twitter"></i>
                    </div>
                    <p class="card-category">Followers</p>
                    <h3 class="card-title">+245</h3>
                  </div>
                  <div class="card-footer">
                    <div class="stats">
                      <i class="material-icons">update</i> Just Updated 
                    </div>
                  </div>
                </div>
              </div>
            </div> -->
  
  
  
  
            <div class="row">


              <div class="col-md-6" style="width:90%; height:400px">
                <div class="card card-chart" style="height:100%">

                  <div class="card-header card-header-success">
                    <div class="ct-chart" id="dailySalesChart">
                    </div>
                  </div>

                  <div class="card-body" style="width:100%; height:100%">
                    <h4 class="card-title" style="margin-top:10px">연령대별 예약자 수 비교</h4>
                    <p class="card-category"></p>
                    <div style="width:100%; height:80%">
                    <canvas id="myChart1">

                    </canvas>
                    </div>
                    </div>
                </div>
              </div>


              <div class="col-md-6" style="width:90%; height:400px">
                <div class="card card-chart" style="height:100%">

                  <div class="card-header card-header-warning">
                    <div class="ct-chart" id="dailySalesChart">
                    </div>
                  </div>

                  <div class="card-body" style="width:100%; height:100%">
                    <h4 class="card-title" style="margin-top:10px">국적별 예약자 수 비교</h4>
                    <p class="card-category"></p>
                    <div style="width:100%; height:80%">
                    <canvas id="myChart2">

                    </canvas>
                    </div>
                    </div>
                </div>
              </div>


              <div class="col-md-12" style="width:90%; height:400px; margin-top:70px">
                <div class="card card-chart" style="height:100%">

                  <div class="card-header card-header-info">
                    <div class="ct-chart" id="dailySalesChart">
                    </div>
                  </div>

                  <div class="card-body" style="width:100%; height:100%">
                    <h4 class="card-title" style="margin-top:10px">월별 예약자 추세선</h4>
                    <p class="card-category"></p>
                    <div style="width:100%; height:80%">
                    <canvas id="myChart2">

                    </canvas>
                    </div>
                    </div>
                </div>
              </div>

            
            </div>
            
                 
          </div>

        </div>
        </div>


        






</div>      
<script>

  var ctx1 = document.getElementById('myChart1');
  var ctx2 = document.getElementById('myChart2');
  var ctx3 = document.getElementById('myChart3');
  
  var myChart1 = new Chart(ctx1, {
      type: 'bar',
      data: {
          labels: ['10대','20대','30대','40대','50대'],  	  
          datasets: [{   
              data: [
            	  <c:forEach var="d" items="${data}"> 
            	  "${d}",
            	  </c:forEach> ],
              backgroundColor: [
            	  'rgba(75, 192, 192, 1)',
              ],
              borderColor: [
            	  'rgba(75, 192, 192, 1)', 
              ],
              borderWidth: 1
          }]
      },
      options: {
          maintainAspectRatio:false,
          scales: {
              y: {
                  beginAtZero: true,
                  max:10
              }
          },
     
      plugins:{
    	  legend:{
    		  display: false
      		}
    	 }
      }
  });

  var myChart2 = new Chart(ctx2, {
      type: 'pie',
      data: {
          labels: ['China', 'Japan', 'France', 'USA', 'Spain'],
          datasets: [{
              data: [12, 19, 3, 5, 2],
              backgroundColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 0.6)',
                  'rgba(75, 192, 192, 0.6)',
                  'rgba(153, 102, 255, 0.6)',
                  'rgba(255, 159, 64, 0.6)'
              ],
              borderColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)'
              ]
             
          }]
      },
      options: {
    	  
    	  reponsive:false,
    	  plugins:{
        	  legend:{
        		  display: true,
        		  position:"bottom"
          		},
          		labels:[{
          			position:'outside',
          		}]
        	 },
         
          maintainAspectRatio:false,

      }
  });



  var myChart3 = new Chart(ctx3, {
      type: 'bar',
      data: {
          labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
          datasets: [{
              label: '# of Votes',
              data: [12, 19, 3, 5, 2, 3],
              backgroundColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 0.2)',
                  'rgba(153, 102, 255, 0.2)',
                  'rgba(255, 159, 64, 0.2)'
              ],
              borderColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)'
              ],
              borderWidth: 1
          }]
      },
      options: {
         /* 비율유지 값을 false 하면 부모를 꽉 채우게 된다 */
          maintainAspectRatio:false,
          scales: {
              y: {
                  beginAtZero: true
              }
          }
      }
  });
  

  </script>

  
</body>

</html>