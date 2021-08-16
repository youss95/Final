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

<!-- <script src="/com/js/Chart.PieceLabel.js"></script> your piecelabel -->

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.0/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>

 <style>
      p{display:inline-block;}
    .card-body div{ display:inline-block;}
   .myChart{
   -webkit-filter:blur(3px);
    -moz-filter:blur(3px);
    -o-filter:blur(3px);
    -ms-filter:blur(3px);
    filter:blur(4px);
   }
   .hoverBtn{
   display:none;
   position:absolute;
   left:50%;
   top:50%;
   transform:translate(-50%,-50%);
   }
   .chartBlur:hover .hoverBtn{
   display:block
   }
   
</style>

<script>
$(function(){
   $(".hoverBtn").on("click",function(){
      location.href="${pageContext.request.contextPath}/pay/res_payment";
   })
})
</script>

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
        <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " style="margin:24px 0 0 35px">
          <div class="container-fluid">
            <div class="navbar-wrapper" style="font-size:20px; font-weight:400">
            <c:if test="${bizInfo.businessName eq null}"> 
             <a href="${pageContext.request.contextPath}/bMember/myPage" style="color:purple"> My Page </a>에서 나의 업체 정보를 등록하고,&nbsp;&nbsp;Dashboard 의 정보를 받아보세요!
            </c:if>
            </div>
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
                    <h3 class="card-title"><c:if test="${vsMine.STAR_AVG eq null}">0</c:if>
                    ${vsMine.STAR_AVG}
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
                    <h3 class="card-title"><c:if test="${totalRes eq null}">0</c:if>
                     ${totalRes}
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
                    <h3 class="card-title"><c:if test="${vsMine.KEEP_COUNT eq null}">0</c:if>
                    ${vsMine.KEEP_COUNT}
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


              <div class="col-md-6" style="height:400px">
                <div class="card card-chart" style="height:100%" >

                  <div class="card-header card-header-rose">
<!--              <div class="card-header" style="background-color:#C3C3C3;"> -->
                    <div class="ct-chart" id="dailySalesChart">
                    </div>
                  </div>

                  <div class="card-body <c:if test="${binfo.premium eq 'N'}"> chartBlur</c:if>" >
                    <h4 class="card-title" style="margin-top:10px; text-align:center">연령대별 예약자 수 비교</h4>
                    <p class="card-category"></p>
                    <div style="width:90%; height:80%">
                    <canvas id="myChart1" <c:if test="${binfo.premium eq 'N'}"> class="myChart"</c:if>>

                    </canvas>
                    <button type='button' class='btn hoverBtn' style="background-color:black">Premium 결제</button>
                    </div>
                  </div>
                </div>
              </div>


              <div class="col-md-6" style="height:400px">
                <div class="card card-chart" style="height:100%">

                  <div class="card-header card-header-success">
                    <div class="ct-chart" id="dailySalesChart">
                    </div>
                  </div>

                  <div class="card-body <c:if test="${binfo.premium eq 'N'}"> chartBlur</c:if>" >
                    <h4 class="card-title" style="margin-top:10px; text-align:center">국적별 예약자 수 비교</h4>
                    <p class="card-category"></p>
                    <div style="width:90%; height:80%">
                    <canvas id="myChart2" <c:if test="${binfo.premium eq 'N'}"> class="myChart"</c:if>>

                    </canvas>
                    <button type='button' class='btn hoverBtn' style="background-color:black">Premium 결제</button>
                    </div>
                    </div>
                </div>
              </div>


              <div class="col-md-12" style="margin-top:70px" >
                <div class="card card-chart" >

                  <div class="card-header card-header-info">
                    <div class="ct-chart" id="dailySalesChart">
                    </div>
                  </div>

                  <div class="card-body <c:if test="${binfo.premium eq 'N'}"> chartBlur</c:if>" >
                    <h4 class="card-title" style="margin-top:10px">월별 예약자 추세선</h4>
                    <p class="card-category"></p>
                    <div style="width:90%; height:80%">
                    <canvas id="myChart3" <c:if test="${binfo.premium eq 'N'}"> class="myChart"</c:if>>

                    </canvas>
                    <button type='button' class='btn hoverBtn' style="background-color:black">Premium 결제</button>
                    </div>
                    </div>
                </div>
              </div>
              
              
              
              <div class="col-md-12" style="margin-top:70px" >
                <div class="card card-chart" >

                  <div class="card-header card-header-info">
                    <div class="ct-chart" id="dailySalesChart">
                    </div>
                  </div>

                  <div class="card-body <c:if test="${binfo.premium eq 'N'}"> chartBlur</c:if>" >
                    <h4 class="card-title" style="margin-top:10px">업종 평균 비교차트</h4>
                    <p class="card-category"></p>
                    <div style="width:90%; height:80%">
                    <canvas id="myChart4" <c:if test="${binfo.premium eq 'N'}"> class="myChart"</c:if>>

                    </canvas>
                    <button type='button' class='btn hoverBtn' style="background-color:black">Premium 결제</button>
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
  var ctx4 = document.getElementById('myChart4');
  
  var myChart1 = new Chart(ctx1, {
      type: 'bar',
      data: {
          labels: ['10대','20대','30대','40대','50대'],       
          datasets: [{   
              data: [
                 <c:forEach var="ad" items="${ageData}"> 
                 "${ad}",
                 </c:forEach> ],
              backgroundColor: [
                 'rgba(54, 162, 235, 0.6)',
              ],
              borderColor: [
                 'rgb(54, 162, 235)', 
              ],
              borderWidth: 1
          }]
      },
      options: {
          maintainAspectRatio:false,
          scales: {
              y: {
                  beginAtZero: true,
                  stepSize:5,
                  max:20
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
          labels: [
             <c:forEach var="nl" items="${nationLabel}">
             "${nl}",
             </c:forEach>
          ],
          datasets: [{
              data: [
                 <c:forEach var="nd" items="${nationData}">
                 "${nd}",
                 </c:forEach>
              ],
              backgroundColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)'
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
           
            legend: {
               position: 'right',      // 범례의 위치를 지정한다. 'top','left','bottom','right'.
               labels: {
                     fontSize: 16, // 범례 폰트의 사이즈.
                     boxWidth: 10, // 범례 컬러박스의 사이즈.
                          padding: 20   // 범례 사이의 간격.
                     }
               },
         labels: {
                      position: 'outside',
                      render: (args) => {
                        return `${args.label}: ${args.value}%`;
                      }
                    },
               
//          title: {
//                display: true,
//                text: "국적별 예약자 수 비교",
//                fontSize: 80         // 차트 제목 폰트의 사이즈.
//                },
               
         animation: {
            animateScale: true,   // true일 경우 차트 생성시 중앙에서부터 커지는 애니메이션. 
            animateRotate: true   // true일 경우 차트 생성시 회전 애니메이션.
               }
             
          },
         
          maintainAspectRatio:false,

      }
  });



  var myChart3 = new Chart(ctx3, 
     {
        type: 'line',
        data: {
          labels: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
          datasets: [{
            data: [
               <c:forEach var='md' items="${monthData}">
               "${md}",
               </c:forEach>
            ],
            borderColor:'rgb(75, 192, 192)',
            pointBackgroundColor:'rgb(75, 192, 192)',
            fill:false,
            tension: 0.1     
          }]
        },
        options: {
             maintainAspectRatio:false,
             scales: {
                 y: {
                     beginAtZero: true,
                     max:25
                 }
             },
        
         plugins:{
            legend:{
               display: false
               }
           }
         }
      
  });
  
  
  
  
  var myChart4 = new Chart(ctx4, 
        {
     data: {
           datasets: [{
               type: 'bar',
               label: '업종 평균',
               data: [
                  "${vsResult.STAR_AVG}","${vsResult.KEEP_COUNT}","${vsResult.VIEW_COUNT}"
               ],
//                borderColor: 'rgb(153, 102, 255)',
//                backgroundColor: 'rgba(153, 102, 255,0.2)'
           }, {
               type: 'line',
               label: '우리 업체',
               data: [
                  "${vsMine.STAR_AVG}","${vsMine.KEEP_COUNT}","${vsMine.VIEW_COUNT}"
               ],
               fill: false,
               borderColor: 'rgb(153, 102, 255)',
               pointBackgroundColor:'rgb(153, 102, 255)'
           }],
           labels: ['별점', '찜수', '조회수']
       },
       
       options: {
             maintainAspectRatio:false,
             scales: {
                 y: {
                     beginAtZero: true,
                     max:50
                 }
             },
        
         plugins:{
            
           }
         }
      
     
     
     
     });
  

  </script>

  
</body>

</html>