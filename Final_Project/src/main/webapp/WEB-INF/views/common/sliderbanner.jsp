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
			src="<spring:url value='/place/${result.fileSavedName}'/>" />
			<a href="<c:url value="/travel/${result.travelId}/${result.writer}"/>">
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
					<c:if test="${result.categoryName eq '자연/힐링'}">

						<div class="slide_travel_theme">
							<p class="category a">
								<c:out value="${result.categoryName }" />
							</p>
						</div>

					</c:if> <c:if test="${result.categoryName eq '문화/예술'}">
						<div class="slide_travel_theme">
							<p class="category b">
								<c:out value="${result.categoryName }" />
							</p>
						</div>
					</c:if> <c:if test="${result.categoryName eq '체험/학습/산업'}">
						<div class="slide_travel_theme">
							<p class="category c">
								<c:out value="${result.categoryName }" />
							</p>
						</div>
					</c:if> <c:if test="${result.categoryName eq '캠핑/스포츠'}">
						<div class="slide_travel_theme">
							<p class="category d">
								<c:out value="${result.categoryName }" />
							</p>
						</div>
					</c:if> <c:if test="${result.categoryName eq '종교/역사/전통'}">
						<div class="slide_travel_theme">
							<p class="category e">
								<c:out value="${result.categoryName }" />
							</p>
						</div>
					</c:if> <c:if test="${result.categoryName eq '쇼핑/놀이'}">
						<div class="slide_travel_theme">
							<p class="category f">
								<c:out value="${result.categoryName }" />
							</p>
						</div>
					</c:if> <br />
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


