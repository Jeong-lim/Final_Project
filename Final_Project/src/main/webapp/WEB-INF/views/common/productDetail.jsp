<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productDetail.css" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>
</head>
<body>



<div class="outer">
	<div class="inner">
		<div class="content1">
			<img class="ad_img"  src="${pageContext.request.contextPath}/resources/images/${img}.png">
		</div><div class="content2">
			<div>${title}</div>
			<div>${price }</div>
			<div><label class="contentLabel">수량</label><input type="number" id="amount" step="1" min="1" max="10" onkeydown="preventCheck(this)" required /></div>
			<div><label class="contentLabel">구매자 이름</label><input type="text" id="name"/></div>
			<button type="button" class="buybtn" onclick="payAlert()">구매하기</button>
			
		</div>
	</div>
	
</div>
<input type="hidden" id="pname" value="${pname }"/>
<input type="hidden" id="pprice" value="${pprice}"/>
<input type="hidden" id="pcode" value="${pcode }"/>
</body>
<%@ include file="../common/footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">

	IMP.init("imp42040372");
	var date=new Date().getTime();
	var pname=$('#pname').val();
	var pprice=$('#pprice').val();
	var pcode=$('#pcode').val();
	
	function requestPay() {
		var name=$('#name').val();
		var amount=$('#amount').val();
		
	    IMP.request_pay({
	      pg: "kakaopay.TC0ONETIME",
	      pay_method: "card",
	      merchant_uid:"travely"+pcode+"-"+date,   // 주문번호
	      name: pname,
	      amount: amount*pprice,                         // 숫자 타입
	      buyer_name: name,
	      
	    }, function (rsp) { // callback
	      if (rsp.success) {
	        // 결제 성공 시 로직
	        alert("구매가 완료되었습니다.");
	        location.replace("/");
	      } else {
	        // 결제 실패 시 로직
	        alert("구매가 취소되었습니다.");
	      }
	    });
	  }
	
	
		function preventCheck(obj){
			event.preventDefault();
			}
	
		function payAlert(){
			var result=confirm("구매 하시겠습니까?");
			if(result==true){
				requestPay();
			}
			else{
				alert("구매 요청 취소");
			}
		}
	</script>
</html>