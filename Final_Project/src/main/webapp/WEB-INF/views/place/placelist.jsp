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
	height: 30px;
	margin-right: 5px;
	width: 100px;
}

.search {
	
}

.search_bar {
	height: 30px;
	padding: 0;
	margin: 0;
	width: 364px;
}

.search_btn {
	width: 32px;
	height: 32px;
	padding: 0;
	vertical-align: middle;
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
	padding: 5px;
	border: 1px solid #dfdfdf;
	border-radius: 15px;
	background-color: #ffffff;
	text-align: center;
	cursor: pointer;
	font-size: 13px;
}

.test_obj input[type="radio"]:checked+span {
	background-color: #113a6b;
	color: #ffffff;
}

.place {
	border: 1px solid black;
	margin-top: 20px;
	margin-bottom: 20px;
}

.place_img {
	width: 180px;
	height: 140px;
	float: left;
	margin-right: 30px;
}

.place_info {
	
}

a {
	text-decoration: none;
	color: black;
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
				<a href='<c:url value="/place/detail"/>'>
					<div class="place">
						<div class="image_wrap">
							<img class="place_img"
								src="${pageContext.request.contextPath}/resources/images/경복궁.jpg" />
						</div>
						<div class="place_info">
							<h3>경복궁</h3>
							<h4>서울특별시 종로구</h4>
							<label class="test_obj"><input type="radio"
								name="category" value=""> <span>종교/역사/전통</span></label>
						</div>
					</div>
				</a> <a href='<c:url value="/place/detail"/>'>
					<div class="place">
						<div class="image_wrap">
							<img class="place_img"
								src="${pageContext.request.contextPath}/resources/images/남산타워.jpg" />
						</div>
						<div class="place_info">
							<h3>남산타워</h3>
							<h4>서울특별시 용산구</h4>
							<label class="test_obj"><input type="radio"
								name="category" value=""> <span>종교/역사/전통</span></label>
						</div>
					</div>
				</a> <a href='<c:url value="/place/detail"/>'>
					<div class="place">
						<div class="image_wrap">
							<img class="place_img"
								src="${pageContext.request.contextPath}/resources/images/청계천.jpg" />
						</div>
						<div class="place_info">
							<h3>청계천</h3>
							<h4>서울특별시 종로구</h4>
							<label class="test_obj"><input type="radio"
								name="category" value=""> <span>종교/역사/전통</span></label>
						</div>
					</div>
				</a>
			</div>
		</div>
		<div></div>
	</div>



</body>
</html>