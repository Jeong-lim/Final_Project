<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/placedetail.css" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>
</head>
<body>
	
	<div class="container_top">
		<div class="container">
			<div class="place_info">
				<p class="place_name">경복궁</p>
				<p class="place_area">서울특별시 종로구</p>
				<label class="category_label"> <span>종교/역사/전통</span></label>
			</div>
			<div class="slider_container">
				<div class="bxslider">
					<div>
						<img class="gbg_img"
							src="${pageContext.request.contextPath}/resources/images/gbg1.jpg">
					</div>
					<div>
						<img class="gbg_img"
							src="${pageContext.request.contextPath}/resources/images/gbg2.jpg">
					</div>
					<div>
						<img class="gbg_img"
							src="${pageContext.request.contextPath}/resources/images/gbg3.jpg">
					</div>
				</div>
			</div>

			<div class="content">
				<p>경복궁은 조선 시대에 지어진 왕궁 중 가장 큰 궁궐이었다. 조선 왕조 개국 3년인 1395년에 완공된 궁궐은
					390여 칸으로 한양의 중심축에 자리했다. 개국공신 정도전은 태조로부터 첫 번째 궁궐의 이름을 지으라는 명을 받았고,
					고심 끝에 '새 왕조가 큰 복을 누려 번영할 것'이라는 의미로 경복궁(景福宮)이라는 이름을 붙였다.</p>
				<p>경복궁은 5대궁인 경희궁, 덕수궁, 창경궁, 창덕궁 중 가장 큰 궁궐로 조선 왕조의 주요 궁궐 역할을 했다.
					국보 제223호인 근정전(勤政殿)은 경복궁의 법전으로 각종 즉위식을 거행했던 왕실의 행사장이었다. 근정전의 옆에 위치한
					경회루는 1만원권 구화폐 실릴 만큼 대표적인 건축물로 사랑받아 왔다. 한국은 미래 세대를 위해 궁궐의 재건, 복원,
					유지를 위해 많은 시간과 노력을 투자해 왔다. 이외에도 일제강점기에 훼손을 겪었다가 2010년에 완전히 복원된 광화문,
					고종과 명성황후가 머물던 건천궁, 경복궁의 후원인 향원정 등이 자리하고 있다.</p>
				<p>경복궁을 방문할 때 국립 고궁 박물관과 국립 민속 박물관 또한 함께 방문하기 좋다. 경복궁은 조선 왕조 최고의
					궁궐인 만큼 생각보다 넓다. 동선은 자유롭게 조정할 수 있다. 다만 좀 더 자세한 관람을 원한다면 우리궁궐지킴이
					해설사들의 설명과 함께하는 것이 가장 좋다. 경복궁과 서촌 지역 방문 관람객의 편의를 높이고 경제 활성화를 위한 경복궁의
					서문 영추문이 2018년 12월부터 전면 개방된다. 경복궁 출입문은 이전까지 남쪽의 광화문, 북쪽의 신무문, 동쪽의
					국립민속박물관 출입문 등 총 세 곳으로 이번에 서쪽의 영추문을 43년 만에 개방하면서 동·서·남·북 모든 곳에서 출입이
					가능해진다.</p>
			</div>
		</div>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	$(function() {
		$('.bxslider').bxSlider({
			mode : 'fade',
			captions : true,
			slideWidth : 700
		});
	});
</script>
<%@ include file="../common/footer.jsp"%>
</html>