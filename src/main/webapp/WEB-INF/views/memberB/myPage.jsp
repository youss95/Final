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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

 <style>
      p{display:inline-block;}
    .card-body div{ display:inline-block;}
  
   
  </style>

<script>
	$(function(){
	
		//====Personal Info 관련 
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
			$("#edit").css("display","none");
			$("#signOut").css("display","none");	
		})
		//====Personal Info 관련 =========
	
			
			
		//-------Business Info 관련-------
		$("#bizInfoBtn").on("click",function(){
			location.href="${pageContext.request.contextPath}/res/bizSetting";
		})
		$("#bizInfoEditBtn").on("click",function(){
			$(".hiddenInputB").css("display","inline-block");
			$(".hiddenDivB").css("display","none");
			$("#bizInfoEditBtn").css("display","none");
		})

		$("#bizFrm").on("submit",function(){
			if($("#biz_type").val()==null||$("#biz_type").val()==""){
				alert("업종을 선택해주세요.");
				return false;
			}
			if($("#bizNum").val()==null||$("#bizNum").val()==""){
				alert("사업자등록번호를 입력해주세요.");
				return false;
			}
			let bizNumReg = /^[0-9]{5,}$/;
			let bizNum = $("#bizNum").val();

			if (!bizNumReg.test(bizNum)) {
				alert("유효하지 않은 사업자등록번호입니다. 5자리 이상의 숫자만 입력해주세요. \n ex) 13079");
				return false;
			}
// 			if($("#businessName").val()==null||$("#businessName").val()==""){
// 				alert("업체명을 입력해주세요.");
// 				return false;
// 			}
// 			if($("#businessNameEng").val()==null||$("#businessNameEng").val()==""){
// 				alert("영문 업체명을 입력해주세요.");
// 				return false;
// 			}
			if($("#businessContact").val()==null||$("#businessContact").val()==""){
				alert("업체 연락처를 입력해주세요.");
				return false;
			}
			let contactReg = /^[0-9]{7,}$/;
			let contact = $("#businessContact").val();

			if (!contactReg.test(contact)) {
				alert("유효하지 않은 전화번호입니다. 7자리 이상의 숫자만 입력해주세요. \n ex) 025450790");
				return false;
			}
			if($("#address1").val()==null||$("#address1").val()==""){
				alert("업체 주소를 입력해주세요.");
				return false;
			}
			if($("#address2").val()==null||$("#address2").val()==""){
				alert("업체 상세주소를 입력해주세요.");
				return false;
			}
			if($("#postcode").val()==null||$("#postcode").val()==""){
				alert("업체 우편번호를 입력해주세요.");
				return false;
			}
// 			if($("#offday").val()==null||$("#offday").val()==""){
// 				alert("업체 휴무일을 입력해주세요.");
// 				return false;
// 			}
// 			if($("input[name=offday]:checked").val()==null||$("input[name=offday]:checked").val()==""){
// 				alert("업체 휴무일을 입력해주세요.");
// 				return false;
// 			}
		
		})
		//-------Business Info 관련 -------
		
		
		
			
		
		// 사진 등록 서비스 관련
		$("#uploadBtn1").on("click",function(){    
			//let reg = /(.*?)\.(jpg|jpeg|png)$/;
			let reg = /^\S*\.(jpg|jpeg|png)$/;
			let files=$('input[name="file"]')[0].files;
		       	         
		    let regResult = true;
		    for(var i= 0; i<files.length; i++){
		        if(!reg.test(files[i].name)){
		        	alert("사진은 jpg, jpeg, png 형식만 등록 가능합니다.");
		        	regResult = false;
		        	break;
		        }
		     }
		            	     
			if(regResult){
				Swal.fire({
					  icon: "question",
					  title: "사진을 등록하시겠습니까?",
					  text: "확인 버튼을 클릭 시, 사진이 등록됩니다.",
					  showConfirmButton:true,
					  showCancelButton:true,
					  confirmButtonText:"확인",
					  cancelButtonText:"취소",
					}).then((result) =>{
						if(result.isConfirmed){
							$("#uploadFrm1").submit();
						}else{
							return false;
						}						
					})
					}						
			})	
	     // ===========사진 등록 서비스 관련
			
			
		// 사진 수정 서비스 관련
		$("#editFileBtn").on("click",function(){
			$("#editFileDiv").css("display","block");
			$("#editFileDiv2").css("display","none");
		})
		
		
		$("#uploadBtn2").on("click",function(){
			let reg = /^\S*\.(jpg|jpeg|png)$/;
			let files=$('input[name="file"]')[0].files;
		       	         
		    let regResult = true;
		    for(var i= 0; i<files.length; i++){
		        if(!reg.test(files[i].name)){
		        	alert("사진은 jpg, jpeg, png 형식만 등록 가능합니다.");
		        	regResult = false;
		        	break;
		        }
		     }
		            	     
			if(regResult){
				Swal.fire({
					  icon: "question",
					  title: "사진을 등록하시겠습니까?",
					  text: "확인 버튼을 클릭 시, 사진이 등록됩니다.",
					  showConfirmButton:true,
					  showCancelButton:true,
					  confirmButtonText:"확인",
					  cancelButtonText:"취소",
					}).then((result) =>{
						if(result.isConfirmed){
							$("#uploadFrm2").submit();
						}else{
							return false;
						}						
					})
					}	
		})
		// ======= 사진 수정 서비스 관련
		
		//등록된 사진 삭제 서비스 관련
		$(".delTarget").on("click",function(){
		let fileSeq=$(this).attr("seq");
		let del = $("<input type='hidden' name='delFiles'>");
		del.val(fileSeq);
		$("#uploadFrm2").append(del);
		$(this).parent().parent().remove();
		})
		//=========  등록된 사진 삭제 서비스 관련
		
	})
	
	
	//취소 버튼 1
	$(document).on("click","#cancelPersonal",function(){
		location.href="${pageCotext.request.contextPath}/bMember/myPage"
	})
	//
	//취소 버튼 2
	$(document).on("click","#cancelBiz",function(){
		location.href="${pageCotext.request.contextPath}/bMember/myPage"
	})
	//
	//취소 버튼 3
	$(document).on("click","#cancelFile",function(){
		location.href="${pageCotext.request.contextPath}/bMember/myPage"
	})
	//
	
	$(document).on("click","#save",function(){
		let pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		let pw = $("#pw").val();
		let repw = $("#repw").val();
		
		if($("#pw").val()){
		if(pw != repw){
			alert("패스워드가 일치하지 않습니다.");
			return false;
		}
		
		if (!pwReg.test(pw)) {
			alert('비밀번호는 8자 이상이어야 하며, 숫자/대,소문자/특수문자를 모두 포함해야 합니다.');
			return false;
		}
		}

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
			
	$(function(){
		$("#transRequest").on("click", function(){
			location.href="${pageContext.request.contextPath}/trans/transRequest";			
		})
		
	})
	
	$(function(){
		$("#restrict").on("click", function(){
			location.href="${pageContext.request.contextPath}/bMember/restrict";			
		})
		
	})
	
	

</script>

</head>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">

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

          <li class="nav-item active" style="height:20%;">
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
          

          <li class="nav-item" style="height:20%;">
          <c:choose>
          	<c:when test="${bizInfo.businessName eq null}">
          		<a class="nav-link" href="${pageContext.request.contextPath}/bMember/noAccess">
          		<i class="material-icons">chat</i>
                <p>Chatting</p>
                </a>
          	</c:when>
          	<c:otherwise>
          	    <a class="nav-link" href="${pageContext.request.contextPath}/chat/businessMakeChat?store=${bizInfo.businessName}">
          	   <i class="material-icons">chat</i>
           	   <p>Chatting</p>
               </a>
          	</c:otherwise>
          </c:choose>  
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
                
                    <form id="personalInfoFrm" action="${pageContext.request.contextPath}/bMember/editPersonalInfo" method="post">
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
                        <button class="btn hiddenInput cancelBtn" id="cancelPersonal" class="btn" type="button" style="display:none; color:white; background-color:#f36767;">취소</button>
                        <button id="signOut" class="btn" type="button" style="background-color:tomato">탈퇴</button>
                        <button id="edit" class="btn" type="button">수정</button>
                        <button id="save" class="btn hiddenInput" style="display:none;">Save</button>
                       </div>

                    </div>
                    
                     </form>
                </div>
                <!-- ==== 개인정보 관련 끝! ==== -->

                
                 <!-- ==== 업체 정보 관련 ==== -->
                 <div class="col-lg-12">
                   
                    <form id="bizFrm" action="${pageCotext.request.contextPath}/bMember/editBizInfo" method="post">
                   
                    <div class="card">

                      <div class="card-header card-header-success">
                        <div class="ct-chart" id="dailySalesChart">
                            Business Info
                        </div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">업종</div>
                        <div style="width:40%" class="hiddenDivB">${bizInfo.biz_type}</div>
                        <div style="width:60%; display:none" class="hiddenInputB" >
                        	<select class="form-control" name="biz_type" id="biz_type"> 
								<option value="">업종을 선택해주세요</option>
								<option value="KoreanFood" >KoreanFood</option>
								<option value="ChineseFood">ChineseFood</option>
								<option value="JapaneseFood">JapaneseFood</option>
								<option value="WesternFood">WesternFood</option>
								<option value="WorldFood">WorldFood</option>
								<option value="Buffet">Buffet</option>
								<option value="Cafe">Cafe</option>
								<option value="Bar">Bar</option>
							</select>
						</div>
<%--                         <input class="hiddenInputB" id="" name="" type=text value="${bizInfo.biz_type}" style="display:none"> --%>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">사업자등록번호</div>
                        <div style="width:60%" class="hiddenDivB">${bizInfo.bizNum}</div>
                        <input class="hiddenInputB" id="bizNum" name="bizNum" type=text value="${bizInfo.bizNum}" style="display:none">
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">업체명</div>
                        <div style="width:60%" >${bizInfo.businessName}</div>
<%--                         <input class="hiddenInputB" id="businessName" name="businessName" type=text value="${bizInfo.businessName}" style="display:none"> --%>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">영문 업체명</div>
                        <div style="width:60%" >${bizInfo.businessNameEng}</div>
<%--                         <input class="hiddenInputB" id="businessNameEng" name="businessNameEng" type=text value="${bizInfo.businessNameEng}" style="display:none"> --%>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">업체 연락처</div>
                        <div style="width:60%" class="hiddenDivB">${bizInfo.businessContact}</div>
                        <input class="hiddenInputB" id="businessContact" name="businessContact" type=text value="${bizInfo.businessContact}" style="display:none">
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">업체 주소(영문)</div>
                        <div style="width:60%" class="hiddenDivB">${bizInfo.address1}</div>
                        <input class="hiddenInputB" id="address1" name="address1" type=text value="${bizInfo.address1}" style="display:none">
                        <button class="hiddenInputB btn" type="button" id="addrSearch" style="display:none">찾기</button>
                      </div>
				<input id="address1Kor" name="address1Kor" type=hidden value="${bizInfo.address1Kor}" >
                      <div class="card-body" style="width:100%">
                        <div style="width:30%">업체 상세주소(영문)</div>
                        <div style="width:60%" class="hiddenDivB">${bizInfo.address2}</div>
                        <input class="hiddenInputB" id="address2" name="address2" type=text value="${bizInfo.address2}" style="display:none">
                      </div>
                      
                      <div class="card-body" style="width:100%">
                        <div style="width:30%">업체 우편번호</div>
                        <div style="width:60%" class="hiddenDivB">${bizInfo.postcode}</div>
                        <input class="hiddenInputB" id="postcode" name="postcode" type=text value="${bizInfo.postcode}" style="display:none">
                      </div>


<!-- 						<div class="card-body" style="width: 100%"> -->
<!-- 								<div style="width: 30%">업체 휴무일</div> -->
<%-- 								<div style="width: 60%" class="hiddenDivB">${bizInfo.offday}</div> --%>
<!-- 								<input class="hiddenInputB" id="offday" name="offday" -->
<%-- 											type=text value="${bizInfo.offday}" style="display: none"> --%>
<!-- 								<div class="rd_group hiddenInputB" style="display: none"> -->
<!-- 											<div class="inp_rd"> -->
<!-- 												<input type="radio" id="mon" name="offday" value="mon"> -->
<!-- 												<label for="m1">월</label> -->
<!-- 											</div> -->
<!-- 											<div class="inp_rd"> -->
<!-- 												<input type="radio" id="tue" name="offday" value="tue"> -->
<!-- 												<label for="m2">화</label> -->
<!-- 											</div> -->
<!-- 											<div class="inp_rd"> -->
<!-- 												<input type="radio" id="wed" name="offday" value="wed"> -->
<!-- 												<label for="m3">수</label> -->
<!-- 											</div> -->
<!-- 											<div class="inp_rd"> -->
<!-- 												<input type="radio" id="thu" name="offday" value="thu"> -->
<!-- 												<label for="m3">목</label> -->
<!-- 											</div> -->
<!-- 											<div class="inp_rd"> -->
<!-- 												<input type="radio" id="fri" name="offday" value="fri"> -->
<!-- 												<label for="m3">금</label> -->
<!-- 											</div> -->
<!-- 											<div class="inp_rd"> -->
<!-- 												<input type="radio" id="sat" name="offday" value="sat"> -->
<!-- 												<label for="m3">토</label> -->
<!-- 											</div> -->
<!-- 											<div class="inp_rd"> -->
<!-- 												<input type="radio" id="sun" name="offday" value="sun"> -->
<!-- 												<label for="m3">일</label> -->
<!-- 											</div> -->
<!-- 										</div> -->

<!-- 									</div> -->

									<!--                       <div class="card-body" style="width:100%"> -->
<!--                         <div style="width:30%">업체 영엽시간</div> -->
<%--                         <div style="width:60%">${bizInfo.timeAvailable}</div> --%>
<!--                       </div> -->
                      
                      
                      
                      
                      <div style="text-align: right; padding:10px">
                      <c:choose>
                     	 <c:when test="${bizInfo.businessName==null}">
                     	 	<button id="bizInfoBtn" class="btn" type="button">업체정보등록</button>
                     	 </c:when>
                     	 <c:otherwise>
                     	 	<button id="bizInfoEditBtn" class="btn" type="button">업체정보수정</button>
                     	 </c:otherwise>
                      </c:choose>
                      
                      <button class="btn hiddenInputB cancelBtn" id="cancelBiz" class="btn" type="button" style="display:none; color:white; background-color:#f36767;">취소</button>
                      <button id="saveBiz" class="btn hiddenInputB" style="display:none;">Save</button>   
                                     
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
                    
                    <div class="card-body" style="width:100%;">
                      <div style="width:30%">메뉴판 번역 서비스</div>
                      <div style="width:60%">
                      	<c:choose>
                      		<c:when test="${bizInfo.businessName eq null}">
                      			<button class="btn" type="button" id="restrict">번역 서비스</button>
                      		</c:when>
                      		<c:otherwise>
                      			<button class="btn" type="button" id="transRequest">번역 서비스</button>
                      		</c:otherwise>
                      	</c:choose>                     	
                      </div>
                    </div>
					<hr>	
		
				<c:choose>
					<c:when test="${flist[0] eq null || flist[0] eq ''}">
					 <div class="card-body" style="width:100%">
                      <div style="width:30%">업체 대표사진 등록 서비스</div>
                      <div style="width:60%">
                      <form id="uploadFrm1" action="${pageContext.request.contextPath}/bFile/upload" method="post" enctype="multipart/form-data">
                      <input id='fileInput' type=file name="file" accept="image/jpeg, image/jpg, image/png"><button class="btn" type='button' id='uploadBtn1'>업로드</button>
                      <input type='hidden' name="id" value="${binfo.id}">
                      </form>
                      </div>
                    </div>
                    </c:when>
                    
                    <c:otherwise>
                     <div class="card-body" style="width:100%" id="editFileDiv2">
                      <div style="width:30%">업체 사진 등록 서비스 내역</div>
                      <div style="width:60%">
                     	 <div style="width:70%; margin-left:15px">
                      		<c:forEach var="list" items="${flist}">
                      		
                      		${list.oriName}<br>
                      		
                      		</c:forEach>
                      	 </div>	
<!--                       	 <div style="width:20%"><button class="btn" id="editFileBtn" type="button">수정</button></div> -->
                      </div>
                    </div>
                    </c:otherwise>
				</c:choose>
				
				 <div class="card-body" style="display:none; width:100%" id="editFileDiv">
                      <div style="width:30%">업체 사진 수정 서비스</div>
                      <div style="width:67%">
                      
                     	 <div style="width:62%">
                      		<form id="uploadFrm2" action="${pageContext.request.contextPath}/bFile/editFile" method="post" enctype="multipart/form-data">
                      		<input id='fileInput' type=file name="file" multiple accept="image/jpeg, image/jpg, image/png" style="width:100%">
                     		 <c:forEach var="f" items="${flist}">
			 					<div class="input-group" style="width:100%">
			 						<div style="width:50%">
                    				<a style="margin:0 20px 0 5px; display:block">${f.oriName}</a>
                    				</div>     
                   		 			<div class="input-group-btn" style="display: inline; width:10%">
									<button class="btn btn-danger delTarget" type="button" seq="${f.seq}" style="padding:0; margin:0; width:15px; height:16px">X</button>
			  						</div>
			  				   </div>	
             				</c:forEach>
             				<input type='hidden' name="id" value="${binfo.id}">
             				</form>
             			 </div>
             			
             			 <div style="width:35%; text-align:center">
                      		<button class="btn" id="cancelFile" class="btn" type="button" style="color:white; background-color:#f36767; ">취소</button>
                      		<button class="btn" type='button' id='uploadBtn2' >저장</button>
                      	</div>
                      	
                      </div>
                    </div>
				
				
					<hr>
					<div class="card-body" style="width:100%;">
                      <div style="width:30%">Premium 업그레이드 결제</div>
                      <div style="width:60%">
                      	<c:if test="${binfo.premium eq 'Y'}">
                      		<button class="btn" type="button" id="refund">환불</button>
                      	</c:if>
                      	<c:if test="${binfo.premium eq 'N'}">
                      	    <button class="btn" type="button" id="upgrade">결제</button>
                      	</c:if>          
                      </div>
                    </div>
					
					
					<c:if test="${bizInfo.businessName!=null}">
					<hr>
					<div class="card-body" style="width:100%;">
                      <div style="width:30%">업체 소개 페이지</div>
                      <div style="width:60%">
                      		<button class="btn" type="button" id="go">이동</button>          	                            
                      </div>
                    </div>
					</c:if>
				
				
				
                  </div>
              </div>
              </div>
               <!-- ==== 메뉴판 및 사진 업로드 관련  끝! ==== -->
           
    
    </div>
    </div>
  </div> 
</div>      
      
  <script> 
 document.getElementById("addrSearch").onclick = function () {
 			new daum.Postcode({
				oncomplete: function (data) {
				let roadAddr = data.roadAddress; // 도로명 주소 변수
				let engAddr = data.roadAddressEnglish; //영문 도로명 주소 변수

                    // 우편번호와  주소 정보를 해당 필드에 넣는다.
                  document.getElementById("postcode").value = data.zonecode;
                  document.getElementById("address1").value = engAddr;   
                  document.getElementById("address1Kor").value = roadAddr;   
                  document.getElementById("address2").value ="";
                  document.getElementById("address2").focus();
 				}
 			}).open(); 		};
 			
 			
 			
 		//프리미엄 결제 버튼	
 		$("#upgrade").on("click",function(){
 			location.href="${pageContext.request.contextPath}/pay/res_payment";
 		})	
 		
 		//프리미엄 환불 버튼	
 		$("#refund").on("click",function(){
 			 if(confirm("가장 최근에 구매한 이용권이 환불됩니다. 그래도 취소 하시겠습니까?")){
 				$.ajax({
 						url: "/pay/cancel",
 						type:"post",
 						//datatype:"json",
 						contentType : 'application/x-www-form-urlencoded; charset = utf-8',
 						data : {
 							memberId :'${loginID}'// 주문번호
 							
 							//price:80, //환불금액
 							//"reason": "테스트 결제 환불", //환불사유
 							//"refund_holder": "홍길동", //[가상계좌 환불시 필수입력] 환불 가상계좌 예금주
 							//"refund_bank":"88", //[가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex Kg이니시스의 경우 신한은행 88)
 							//"refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
 						}
 					}).done(function(result){ //환불 성공
 						console.log('환불 성공');
 						console.log(result);
 						location.href="${pageContext.request.contextPath}/bMember/myPage";
 					}).fail(function(error){
 						console.log("환불 실패 : "+ error);
 					});
 			    }
 		})	

 		//업체 소개페이지로 이동 버튼
 		$("#go").on("click",function(){
 			location.href="${pageContext.request.contextPath}/Business/view?biz_seq=${bizInfo.biz_seq}&userId=${binfo.id}";
 		})	
 		
 		
 </script>   

  
</body>

</html>