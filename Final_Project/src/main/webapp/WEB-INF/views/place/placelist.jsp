<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/placelist.css" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>
</head>
<body>
	
	<div class="container_top">
		<div class="container">
			<br>
			<div>
				<span>TRAVELY가 준비한</span>
			</div>
			<div>
				<p class="list_tit">우리나라 관광지 리스트</p>
			</div>
			<div class="search">
				<select class="select">
					<option value="area">지역명</option>
					<option value="place">관광지명</option>
				</select> <input type="text" class="search_bar" value=""
					placeholder="search..">
				<button class="search_btn">
					<img class="search_img"
						src="${pageContext.request.contextPath}/resources/images/search.png" />
				</button>
			</div>
			<div class="category">
				<label class="test_obj"> <input type="radio" name="category"
					value=""> <span>자연/힐링</span>
				</label> <label class="test_obj"> <input type="radio"
					name="category" value=""> <span>종교/역사/전통</span>
				</label> <label class="test_obj"> <input type="radio"
					name="category" value=""> <span>체험/학습/산업</span>
				</label> <label class="test_obj"> <input type="radio"
					name="category" value=""> <span>쇼핑/놀이</span>
				</label> <label class="test_obj"> <input type="radio"
					name="category" value=""> <span>캠핑/스포츠</span>
				</label> <label class="test_obj"> <input type="radio"
					name="category" value=""> <span>문화/예술</span>
				</label>
			</div>
			<div class="place_list">

				<div class="place">
					<div class="image_wrap">
						<img class="place_img"
							src="${pageContext.request.contextPath}/resources/images/경복궁.jpg" />
					</div>
					<div class="place_info">
						<a href='<c:url value="/place/detail"/>'>
							<p class="place_name">경복궁</p>
						</a>
						<p class="place_area">서울특별시 종로구</p>
						<label class="category_label"> <span>종교/역사/전통</span></label>
					</div>
				</div>

				<div class="place">
					<div class="image_wrap">
						<img class="place_img"
							src="${pageContext.request.contextPath}/resources/images/남산타워.jpg" />
					</div>
					<div class="place_info">
						<a href='<c:url value="/place/detail"/>'>
							<p class="place_name">남산타워</p>
						</a>
						<p class="place_area">서울특별시 용산구</p>
						<label class="category_label"> <span>종교/역사/전통</span></label>
					</div>
				</div>

				<div class="place">
					<div class="image_wrap">
						<img class="place_img"
							src="${pageContext.request.contextPath}/resources/images/롯데월드.jpg" />
					</div>
					<div class="place_info">
						<a href='<c:url value="/place/detail"/>'>
							<p class="place_name">롯데월드</p>
						</a>
						<p class="place_area">서울특별시 송파구</p>
						<label class="category_label"><span>쇼핑/놀이</span></label>
					</div>
				</div>

				<div class="place">
					<div class="image_wrap">
						<img class="place_img"
							src="${pageContext.request.contextPath}/resources/images/청계천.jpg" />
					</div>
					<div class="place_info">
						<a href='<c:url value="/place/detail"/>'>
							<p class="place_name">경복궁</p>
						</a>
						<p class="place_area">서울특별시 종로구</p>
						<label class="category_label"><span>종교/역사/전통</span></label>
					</div>
				</div>
			</div>
		</div>
		<div></div>
	</div>



</body>
<%@ include file="../common/footer.jsp"%>
</html>