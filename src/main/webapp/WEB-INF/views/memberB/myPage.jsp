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
    Mypage - Info and Service
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

 <style>
      p{display:inline-block;}
    .card-body div{ display:inline-block;}
  
  </style>

<script>
	$(function(){
		$("#signOut").on("click",function(){
			Swal.fire({
				  icon: "question",
				  title: "정말 탈퇴하시겠습니까?",
				  text: "확인 버튼을 클릭 시, 탈퇴가 진행됩니다.",
				  showConfirmButton:true,
				  showCancelButton:true,
				  confirmButtonText:"확인",
				  cancelButtonText:"취소",
				}).then((result) =>{
					if(result.isConfirmed){
						location.href="${pageContext.request.contextPath}/bMember/signOut?id=${loginID}";
					}else{
						return false;
					}
					
				})
		})
		
		
		$("#edit").on("click",function(){
			$(".hiddenInput").css("display","inline-block");
			$(".hiddenDiv").css("display","none");
			$(".repwDiv").css("display","inline-block");
// 			$("#edit").text("Save");
			$("#edit").css("display","none");
			$("#signOut").css("display","none");	
			
			
// 			$("#edit").on("click",function(){
// 				let result = checkBefore();
// 				console.log(result);
// 				if(result){
// 					$("#personalInfoFrm").submit();
// 				}
// 			})
		})
		
		
		
		
		$("#bizInfoBtn").on("click",function(){
			location.href="${pageContext.request.contextPath}/res/bizSetting";
		})

		$("#cancel").on("click",function(){
			location.href="${pageContext.request.contextPath}/bMember/myPage";
		})
		
	})
	
	
	$(document).on("click","#save",function(){
		let pw = $("#pw").val();
		let repw = $("#repw").val();
		
		if(pw != repw){
			alert("패스워드가 일치하지 않습니다.");
			return false;
		}
		
// 		if (!pwReg.test(pw)) {
// 			alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
// 			return false;
// 		}
		

		let nameReg = /^.{2,30}$/;
		let name = $("#name").val();
		if (!nameReg.test(name)) {
			alert("이름은 2글자 이상 30글자 미만으로 입력해야 합니다.");
			return false;
		}

		let emailReg = /^[0-9a-zA-Z_-]*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		let email = $("#email").val();

		if (!emailReg.test(email)) {
			alert("이메일 형식을 확인해주세요.");
			return false;
		}		
		let phoneReg = /^[0-9]{9,}$/;
		let phone = $("#phone").val();

		if (!phoneReg.test(phone)) {
			alert("핸드폰 번호를 확인해주세요.  ex) 01033558989");
			return false;
		}
		
	})
			
	
	

</script>

</head>

<body class="">

  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="white" data-image="../assets/img/sidebar-1.jpg">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->

      <div class="logo">
          <a href="${pageContext.request.contextPath}/" class="simple-text logo-normal">
<!--            <img src="/resources/images/logoPic.png" style="width:50px" > -->
          <img src="/resources/images/logoTxt.png" style="width:180px">
          </a>
      </div>



      <div class="sidebar-wrapper">

        <div id="profileBox"  style="height:30%">
            <div>
             <p></p>
            </div>
           <div style="text-align: center;">
            <i class="material-icons" style="font-size: 100px;">person_outline</i>
           </div>
           <div id="idBox" style="text-align: center;">
            ID  ${loginID} <br>
            반갑습니다.
           </div>
        </div>

        <div id="naviBox" style="height:50%">
        <ul class="nav" style="height:100%">

          <li class="nav-item active ">
             <a class="nav-link" href="">
                  <i class="material-icons">person</i>
                  <p>My Page</p>
             </a>
          </li>

          <li class="nav-item ">
            <a class="nav-link" href="">
              <i class="material-icons">dashboard</i>
              <p>Dashboard</p>
            </a>
          </li>
          

          <li class="nav-item ">
            <a class="nav-link" href="link.html">
              <i class="material-icons">chat</i>
              <p>Chatting</p>
            </a>
          </li>


          <div style="height:55%"></div>

          
            <li class="nav-item ">
              <a class="nav-link" href="">
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
            <a class="navbar-brand" href="">My Page</a>
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
         
         
            
        <!-- Info 관련 카드 2 섹션 -->
            <div class="row">  
                <!-- ==== 개인정보 관련 ==== -->
                <div class="col-lg-12">
                
                    <form id="personalInfoFrm" action="${pageContext.request.contextPath}/bMember/editPersonalInfo">
                    <div class="card">

                      <div class="card-header card-header-warning">
                        <div class="ct-chart" id="dailySalesChart">
                            Personal Info
                        </div>
                      </div>

                      <!-- <div style="border-top: 1px solid rgb(128, 50, 50);">
                      </div> -->

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">ID</div>
                        <div style="width:60%;">${binfo.id}</div>
                         <input name="id" type=hidden value="${binfo.id}">
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">PW</div>
                        <div class="hiddenDiv" style="width:60%">***</div>
                        <input class="hiddenInput" name="pw" id="pw" type=password style="display:none">
                      </div>

                      <div class="card-body repwDiv" style="width:100%; display:none">
                        <div style="width:30%">PW 재입력</div>                 
                        <input class="hiddenInput" name="repw" id="repw" type=password>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">Name</div>
                        <div class="hiddenDiv" style="width:60%">${binfo.name}</div>
                        <input class="hiddenInput" id="name" name="name" type=text value="${binfo.name}" style="display:none">
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">Email</div>
                        <div class="hiddenDiv" style="width:30%">${binfo.email}</div>
                        <input class="hiddenInput" id="email" name="email" type=text value="${binfo.email}" style="display:none">
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">Phone</div>
                        <div class="hiddenDiv" style="width:60%">${binfo.phone}</div>
                        <input class="hiddenInput" id="phone" name="phone" type=text value="${binfo.phone}" style="display:none">
                      </div>

                     

                       <div style="text-align: right; padding:10px">
                        <button class="btn hiddenInput" id="cancel" class="btn" type="button" style="display:none; color:white; background-color:#f36767;">취소</button>
                        <button id="signOut" class="btn" type="button" style="background-color:tomato">탈퇴하기</button>
                        <button id="edit" class="btn" type="button">Edit</button>
                        <button id="save" class="btn hiddenInput" style="display:none;">Save</button>
                       </div>

                    </div>
                    
                     </form>
                </div>
                <!-- ==== 개인정보 관련 끝! ==== -->

                
                 <!-- ==== 업체 정보 관련 ==== -->
                 <div class="col-lg-12">
                    <form id="" action="">
                    <div class="card">

                      <div class="card-header card-header-success">
                        <div class="ct-chart" id="dailySalesChart">
                            Business Info
                        </div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">업종</div>
                        <div style="width:60%">${bizInfo.biz_type}</div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">사업자등록번호</div>
                        <div style="width:60%">${bizInfo.bizNum}</div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">업체명</div>
                        <div style="width:60%">${bizInfo.businessName}</div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">영문 업체명</div>
                        <div style="width:60%">${bizInfo.businessNameEng}</div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">업체 연락처</div>
                        <div style="width:60%">${bizInfo.businessContact}</div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">업체 주소</div>
                        <div style="width:60%">${bizInfo.address1}</div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">업체 상세주소</div>
                        <div style="width:60%">${bizInfo.address2}</div>
                      </div>
                      
                      <div class="card-body" style="width:100%">
                        <div style="width:30%">업체 우편번호</div>
                        <div style="width:60%">${bizInfo.postcode}</div>
                      </div>
                      
                      <div class="card-body" style="width:100%">
                        <div style="width:30%">업체 휴무일</div>
                        <div style="width:60%">${bizInfo.offday}</div>
                      </div>
                      
<!--                       <div class="card-body" style="width:100%"> -->
<!--                         <div style="width:30%">업체 영엽시간</div> -->
<%--                         <div style="width:60%">${bizInfo.timeAvailable}</div> --%>
<!--                       </div> -->
                      
                      
                      
                      
                      <div style="text-align: right; padding:10px">
                        <button id="bizInfoBtn" class="btn" type="button">Edit</button>
                       </div>
                    </div>
                    </form>
                </div>
                <!-- ==== 업체 정보 관련 끝!! ==== -->
              </div>
              <!-- Info 관련 카드 2 섹션 끝!! -->  
            

              <!-- ==== 메뉴판 및 사진 업로드 관련 ==== -->
              <div class="row">
                <div class="col-lg-12">
                  <div class="card">

                    <div class="card-header card-header-info">
                      <div class="ct-chart" id="dailySalesChart">
                          Business Service
                      </div>
                    </div>
                    
                    <div class="card-body" style="width:100%">
                      <div style="width:30%">메뉴판 번역 서비스</div>
                      <div style="width:60%"><button class="btn" type="button">번역 서비스</button></div>
                    </div>

                    <div class="card-body" style="width:100%">
                      <div style="width:30%">업체 사진 등록 서비스</div>
                      <div style="width:60%"><input type=file><button class="btn" type="button">업로드</button></div>
                    </div>

                  </div>
              </div>
              </div>
               <!-- ==== 메뉴판 및 사진 업로드 관련  끝! ==== -->
    
    </div>
    </div>
  </div> 
</div>      
      
    

  
</body>

</html>