<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sliderbanner.css" />

<c:if test="${not empty sessionScope.memberId}">
	<div class="slider__banner">
		<div class="slider__banner__header {
">나의 여행 일지</div>
		<div class="slider__banner__text">TRAVELY에서 작성한 여행 일지를 확인해보세요!</div>
	</div>
	<div class="section">

		<input type="radio" name="slide" id="slide01" checked> <input
			type="radio" name="slide" id="slide02"> <input type="radio"
			name="slide" id="slide03"> <input type="radio" name="slide"
			id="slide04">
		<div class="slidewrap">


			<ul id="slidelist">
				<!-- 슬라이드 영역 -->
			<c:forEach items="${userList}" var="result" varStatus="status">
				<li class="slideitem"><img class="img_slideitem"
					src="${pageContext.request.contextPath}/resources/images/청계천.jpg" />
					<a href="<c:url value='/travel/detail'/>">
						<div class="textbox">
							<div class="slide_travel_name"><c:out value="${result.travelTitle }"/></div>
							<br />
							<div class="slide_travel_period"><c:out value="${result.travelStart }"/> ~ <c:out value="${result.travelEnd }"/></div>
							<br />
							<div class="slide_travel_theme"><c:out value="${result.categoryName }"/></div>
							<br />
						</div>
				</a></li>
			</c:forEach>
			</ul>
			<!-- 페이징 -->
			<ul class="slide-pagelist">
				<li><label for="slide01"></label></li>
				<li><label for="slide02"></label></li>
				<li><label for="slide03"></label></li>
			</ul>
		</div>


	</div>
</c:if>

<script>
$(document).ready(function() {
	$.ajax({
		url:'/travelSlide/${sessionScope.memberId}',
		type : 'post',
		dateType : 'json',
		traditional: true,
		success : function(result) {
			console.log(result);							
			$("#slidelist").html(result);
			
			}, error : function() {
				console.log("실패");
			}
		});
	});
	

</script>

