<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 하기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<style>
.payTitle{
margin-bottom:100px;
}
.inp_rd{

margin-right:130px;
}
#selectPrice{

border-bottom:2px solid black;
}
strong{
font-size:20px;
}
#totalPrice{
font-size:30px;
font-weight:600;
}
#priceTitle{
font-size:30px;
font-weight:600;
}
</style>
<body>
<%@include file="../layout/header.jsp" %>
<div class="container">
<section class="">
<div class="payTitle"><h2>결제 페이지 (정액권)</h2></div>
	
										<div class="inp_rd">
											<input type="radio" id="m1" name="price" value=100>
											
											<label for="m1">1개월 <strong>5,000원</strong></label>
										</div>
										<div class="inp_rd">
											<input type="radio" id="m2" name="price" value=200>
											<label for="m2">6개월 <strong>30,000원</strong></label>
										</div>
										<div class="inp_rd">
											<input type="radio" id="m3" name="price" value=300>
											<label for="m3">12개월 <strong>70,000원</strong></label>
										</div>
							
								<hr>
<div id="priceTitle">총 가격: <span id="totalPrice"></span></div>
 
    <button id="check_module" type="button">결제</button>
    <input type="button" id="check2" value="환불">

</section>
 </div>
<script>
$(function(){
	$.ajax({
		url:"/pay/refundCheck",
			data:{memberId :'${loginID}'}
	}).done(function(resp){
		console.log(resp)
		if(resp === 1){
			$("#check2").hide();
		}
	})
})


let price = '';
$("input[type=radio][name='price']").on('change',function(){
	price = $("input[type=radio][name='price']:checked").val() ;
	console.log(price)
	$("#totalPrice").text(price+" 원")
})



    $("#check_module").click(function () {
    	alert("결제를 진행")
        var IMP = window.IMP; // 생략가능
        IMP.init('imp45286492'); 
        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
        IMP.request_pay({
            pg: 'html5_inicis', // version 1.1.0부터 지원.
            /* 
                'kakao':카카오페이, 
                html5_inicis':이니시스(웹표준결제)
                    'nice':나이스페이
                    'jtnet':제이티넷
                    'uplus':LG유플러스
                    'danal':다날
                    'payco':페이코
                    'syrup':시럽페이
                    'paypal':페이팔
                */
            pay_method: 'card',
            /* 
                'samsung':삼성페이, 
                'card':신용카드, 
                'trans':실시간계좌이체,
                'vbank':가상계좌,
                'phone':휴대폰소액결제 
            */
            merchant_uid: 'merchant_' + new Date().getTime(),
          
            name: '주문명:결제테스트',
            //결제창에서 보여질 이름
            amount: price, 
            //가격 
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자이름',
            buyer_tel: '010-1234-5678',
            buyer_addr: '서울특별시 강남구 삼성동',
            buyer_postcode: '123-456',

        }, function (rsp) {
            console.log(rsp);
            let msg='';
            if (rsp.success) {
            	
            	var result = {
            			"memberId":'${loginID}',
    					"imp_uid" : rsp.imp_uid,
    				"merchant_uid" : rsp.merchant_uid,
    					"biz_email" : 'tkdyd1796@naver.com',
    					"pay_date" : new Date().getTime(),
    					"price" : price,
    					"card_no" : rsp.apply_num,
    					//"refund" : 'payed'
    					}
            	
            	jQuery.ajax({
            		url:"/pay/payment",
            		type:"post",
            		data:JSON.stringify(result),
            		contentType:'application/json;charset=utf-8',
            		dataType:'json',
            		success:function(resp){
            			 msg += '결제가 완료되었습니다.';
             			msg += '이멜' +resp.biz_email;
            			console.log("resp",resp)
                		
                		
            		console.log(msg)
                        /*   msg += '고유ID : ' + rsp.imp_uid;
                          msg += '상점 거래ID : ' + rsp.merchant_uid;
                          msg += '결제 금액 : ' + rsp.paid_amount;
                          msg += '카드 승인번호 : ' + rsp.apply_num; */
                          alert(msg)
            		}

            	})
              
            } else {
                 msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                alert(msg)
            }
         
         
        });
    });
    
     $("#check2").click(function(e){
	    if(confirm("가장 최근에 구매한 이용권이 환불됩니다. 그래도 취소 하시겠습니까?")){
		$.ajax({
				url: "/pay/cancel",
				type:"post",
				//datatype:"json",
				contentType : 'application/x-www-form-urlencoded; charset = utf-8',
				data : {
					memberId :'${loginID}', // 주문번호
					"amount":80
					//price:80, //환불금액
					//"reason": "테스트 결제 환불", //환불사유
					//"refund_holder": "홍길동", //[가상계좌 환불시 필수입력] 환불 가상계좌 예금주
					//"refund_bank":"88", //[가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex Kg이니시스의 경우 신한은행 88)
					//"refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
				}
			}).done(function(result){ //환불 성공
				console.log('환불 성공')
				console.log(result);
			}).fail(function(error){
				console.log("환불 실패 : "+ error);
			});
	    }
		}) 

    
</script>
<%@include file="../layout/alarm.jsp" %>