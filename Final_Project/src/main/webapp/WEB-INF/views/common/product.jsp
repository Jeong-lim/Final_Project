<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button type="button" onclick="requestPay(this)">결제하기</button>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">

	IMP.init("imp42040372");
	
	function requestPay(e) {

	    IMP.request_pay({
	      pg: "kakaopay.TC0ONETIME",
	      pay_method: "card",
	      merchant_uid: "ORD20180131-1001",   // 주문번호
	      name: "노르웨이 회전 의자",
	      amount: 100,                         // 숫자 타입
	      buyer_email: "wjdrkdud01@naver.com",
	      buyer_name: "정가영",
	      
	    }, function (rsp) { // callback
	      if (rsp.success) {
	        // 결제 성공 시 로직
	        alert("성공");
	      } else {
	        // 결제 실패 시 로직
	      }
	    });
	  }
	</script>
</html>