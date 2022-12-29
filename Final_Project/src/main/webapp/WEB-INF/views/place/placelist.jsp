<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.container_top {
	text-align: center;
}

.container {
	width: 1000px;
	min-height: 1000px;
	margin: auto;
	text-align: left;
}

.select {
	height: 34px;
	margin-right: 5px;
	width: 100px;
	border-radius: 5px;
	border: 2px solid #dfdfdf;
	padding: 3px;
}

.search {
	float: right;
}

.search_bar {
	height: 30px;
	padding: 0;
	margin: 0;
	width: 250px;
	border-radius: 5px;
	border: 2px solid #dfdfdf;
}

.search_btn {
	width: 30px;
	height: 30px;
	padding: 0;
	vertical-align: middle;
	background-color: white;
	border:none;
}

.search_img {
	width: 20px;
	height: 20px;
}

.category {
	margin-top: 10px;
}

.test_obj input[type="radio"] {
	display: none;
}

.test_obj input[type="radio"]+span {
	display: inline-block;
	border: 1px solid #dfdfdf;
	border-radius: 15px;
	background-color: #ffffff;
	text-align: center;
	cursor: pointer;
	font-size: 14px;
	padding: 7px 10px 5px 10px;
	height: 20px;
}

.test_obj input[type="radio"]:checked+span {
	background-color: #3B82F6;
	color: #ffffff;
}

.place {
	border: 2px solid #BDBDBD;
	margin-top: 20px;
	margin-bottom: 20px;
	height: 160px;
	border-radius: 35px;
}

.category_label {
	padding: 5px 10px;
	border: 1px solid #dfdfdf;
	border-radius: 15px;
	background-color: #ffffff;
	text-align: center;
	font-size: 13px;
}

.place_img {
	width: 200px;
	height: 160px;
	float: left;
	margin-right: 50px;
	border-top-left-radius: 32px;
	border-bottom-left-radius: 32px;
}

.place_list {
	margin-top: 30px;
}

.place_info {
	margin: 30px 0 0 30px;
}

.place_name {
	font-size: 25px;
	margin: 0;
}

.place_area {
	font-size: 15px;
	cursor: default;
}

a {
	text-decoration: none;
	color: black;
}

::-webkit-scrollbar {
	display: none;
}
</style>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="container_top">
		<div class="container">
			<br>
			<div>
				<span>TRAVELY가 준비한</span>
			</div>
			<div>
				<h2>우리나라 관광지 리스트</h2>
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