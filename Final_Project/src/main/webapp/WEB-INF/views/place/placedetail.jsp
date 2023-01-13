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
				<p class="place_name">${placeInfoList.placeName }</p>
				<p class="place_area">${placeInfoList.areaName }</p>
				<label class="category_label"> <span>${placeInfoList.category }</span></label>
			</div>
			
			
			<div class="slider_container">
				<div class="bxslider">
				
					<c:forEach var="info" items="${placeInfoList}">
						<div>
							<img class="gbg_img"  src="<spring:url value='/place/${info.fileSavedName}'/>" />
						</div>
					</c:forEach>
				
				</div>
			</div>

			<div class="content">
				<p>${placeInfoList.placeDetail}</p>
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