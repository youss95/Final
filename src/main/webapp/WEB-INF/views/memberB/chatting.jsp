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
    Mypage - Chatting
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
          <img src="/resources/images/logoTxt&Pic.png" style="width:160px">
          </a>
      </div>



      <div class="sidebar-wrapper" style="height:85%; padding-bottom:0px">
        <div id="profileBox"  style="height:33%;">
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

          <li class="nav-item" style="height:20%;">
            <a class="nav-link" href="${pageContext.request.contextPath}/bMember/dashboard">
              <i class="material-icons">dashboard</i>
              <p>Dashboard</p>
            </a>
          </li>
          

          <li class="nav-item active" style="height:20%;">
            <a class="nav-link" href="${pageContext.request.contextPath}/chat/businessMakeChat?store=${bizInfo.businessName}">
              <i class="material-icons">chat</i>
              <p>Chatting</p>
            </a>
          </li>
          
          <li class="nav-item" style="height:20%;">
            <a class="nav-link" href="${pageContext.request.contextPath}/bMember/reservation?res_name=${bizInfo.businessName}">
               <i class="material-icons">content_paste</i>
              <p>Reservation 관리</p>
            </a>
          </li>

            
            <li class="nav-item " style="height:20%;">
              <a class="nav-link" href="${pageContext.request.contextPath}/" id="exit" style="margin-top:0px">
                <i class="material-icons">west</i>
                <p>Exit this Page</p>
              </a>
            </li>
        </ul>
        </div>
      </div>
    </div>




    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="">Chatting</a>
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
                <div class="col-lg-12">
<!--                       채팅 자리 1   -->
                </div>
               

                 <div class="col-lg-12">
<!--                       채팅 자리 2	    -->
                </div>
              
            </div>
              
            

              <div class="row">
                <div class="col-lg-12">
              
              	</div>
              </div>

    </div>
    </div>
  </div> 
</div>      


  
</body>

</html>