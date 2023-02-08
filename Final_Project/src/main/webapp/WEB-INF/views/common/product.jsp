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
	const IMP = window.IMP; // 생략 가능
	IMP.init("imp54472107");
	
	function requestPay(e) {
		console.log("결제중");
	    IMP.request_pay({
	      pg: "kcp.{상점ID}",
	      pay_method: "card",
	      merchant_uid: "ORD20180131-0000011",   // 주문번호
	      name: "노르웨이 회전 의자",
	      amount: 64900,                         // 숫자 타입
	      buyer_email: "gildong@gmail.com",
	      buyer_name: "홍길동",
	      buyer_tel: "010-4242-4242",
	      buyer_addr: "서울특별시 강남구 신사동",
	      buyer_postcode: "01181"
	    }, function (rsp) { // callback
	      if (rsp.success) {
	        // 결제 성공 시 로직
	      } else {
	        // 결제 실패 시 로직
	      }
	    });
	  }
	</script>
</html>