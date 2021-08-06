<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 하기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>

<h2>결제 페이지 (예약)</h2>


<p>
    <p>아임 서포트 결제 모듈 테스트 해보기</p>
    <button id="check_module" type="button">아임 서포트 결제 모듈 테스트 해보기</button>
    <input type="button" id="check2" value="환불">
</p>
<script>
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
            /* 
                merchant_uid에 경우 
                https://docs.iamport.kr/implementation/payment
                위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
                참고하세요. 
                나중에 포스팅 해볼게요.
             */
            name: '주문명:결제테스트',
            //결제창에서 보여질 이름
            amount: 100, 
            //가격 
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자이름',
            buyer_tel: '010-1234-5678',
            buyer_addr: '서울특별시 강남구 삼성동',
            buyer_postcode: '123-456',
           // m_redirect_url: 'https://www.yourdomain.com/payments/complete'
            /*  
                모바일 결제시,
                결제가 끝나고 랜딩되는 URL을 지정 
                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
                */
        }, function (rsp) {
            console.log(rsp);
            let msg='';
            if (rsp.success) {
            	
            	var result = {
            			"memberId": "test",
    					"imp_uid" : rsp.imp_uid,
    				"merchant_uid" : rsp.merchant_uid,
    					"biz_email" : 'tkdyd1796@naver.com',
    					"pay_date" : new Date().getTime(),
    					"price" : 100,
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
	    
		$.ajax({
				url: "/pay/cancel",
				type:"post",
				//datatype:"json",
				contentType : 'application/x-www-form-urlencoded; charset = utf-8',
				data : {
					memberId : 'test', // 주문번호
					
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
		}) 

    
</script>
</body>
</html>