<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sliderbanner.css" />



<div class="slidelist__">
	<!-- 슬라이드 영역 -->
	<ul class="slidelist">
	<c:forEach items="${userList}" var="result" varStatus="status">

		<li class="slideitem"><img class="img_slideitem"
			src="${pageContext.request.contextPath}/resources/images/청계천.jpg" />
			<a href="<c:url value='/travel/detail'/>">
				<div class="textbox">
					<div class="slide_travel_name">
						<c:out value="${result.travelTitle }" />
					</div>
					<br />
					<div class="slide_travel_period">
						<c:out value="${result.travelStart }" />
						~
						<c:out value="${result.travelEnd }" />
					</div>
					<br />
					<div class="slide_travel_theme">
						<c:out value="${result.categoryName }" />
					</div>
					<br />
				</div>
		</a></li>

	</c:forEach>
</ul>
</div>


<script>



	$(window).on("load", function() {
		$.ajax({
			url : '/travelSlide/${sessionScope.memberId}',
			type : 'post',
			dateType : 'json',
			success : function(result) {
				console.log(result);

				$(".slidelist__").html(result);

			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log("실패");
			}
		});
	});
</script>


