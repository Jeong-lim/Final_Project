<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/information.css" />


<div class="item" data-aos="fade-up" data-aos-anchor-placement="top-center">
<div class="scroll__header">
NEXT, 여행은 TRAVELY
</div>

<div class="scroll__main">
다음을 생각하는 건 꽤 중요한 일입니다. <br />
이정표이자 목표가 되니까요. <br />
우리는 여행자를 위한 하나의 여행 플랫폼, <br /> 
나아가 여행하면 떠오르는 대명사가 되고자 합니다. <br />
여행자와 여행자를 연결하고 여행자와 여행 셀러를 자유롭게 연결해 새로운 가치를 만드는 여행 플랫폼. <br />
남녀노소 누구나 여행이 생각날 때 켜보는 대표 웹사이트. <br />
앞으로의 여행은 TRAVELY입니다. <br />
</div>
</div>

<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    setTimeout(function() { AOS.refresh(); }, 500);
});
AOS.init({
	  duration: 1000
	});
</script> 
