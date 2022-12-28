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
	float:right;
}

.search_bar {
	height: 30px;
	padding: 0;
	margin: 0;
	width: 300px;
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
.category span{
	width:80px;
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
	font-size: 14px;
}

.test_obj input[type="radio"]:checked+span {
	background-color: #68B984;
	color: #ffffff;
}

.place {
	border: 2px solid #BDBDBD;
	margin-top: 20px;
	margin-bottom: 20px;
	height:160px;
	border-radius:35px;
}

.place_img {
	width: 200px;
	height: 160px;
	float: left;
	margin-right: 50px;
	border-top-left-radius: 35px;
	border-bottom-left-radius: 35px;
}

.place_list {
	margin-top:30px;
	
}
.place_info{
	margin:30px 0 0 30px;
}
.travel_title {
	font-size:25px;
	margin:0;
}
.travel_writer {
	font-size:15px;
}

a {
	text-decoration: none;
	color: black;
}
.travel_tit{
	margin-bottom:20px;
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
				<h2>여행 일정 리스트</h2>
			</div>
			<div class="search">
				<select class="select">
					<option value="area">작성자</option>
					<option value="place">제목</option>
				</select> <input type="text" class="search_bar" value=""
					placeholder="search..">
				<button class="search_btn">
					<img class="search_img"
						src="${pageContext.request.contextPath}/resources/images/search.png" />
				</button>
			</div>
			<div class="category">
				<label class="test_obj"> <input type="radio" name="category"
					value=""> <span>최신순</span>
				</label> <label class="test_obj"> <input type="radio"
					name="category" value=""> <span>조회순</span>
				</label> <label class="test_obj"> <input type="radio"
					name="category" value=""> <span>인기순</span>
				</label> 
			</div>
			<div class="place_list">
				<a href='<c:url value="/travel/detail"/>'>
					<div class="place">
						<div class="image_wrap">
							<img class="place_img"
								src="${pageContext.request.contextPath}/resources/images/travellist1.jpg" />
						</div>
						<div class="place_info">
							<p class="travel_title">꼭 가봐야 할 3박4일 서울 여행</p>
							<p class="travel_writer">작성자 rkdudrhdwn99</p>
							<a href='<c:url value="/travel/insert"/>'><button>스크랩</button></a>
						</div>
					</div>
				</a> <a href='<c:url value="/travel/detail"/>'>
					<div class="place">
						<div class="image_wrap">
							<img class="place_img"
								src="${pageContext.request.contextPath}/resources/images/travellist2.jpg" />
						</div>
						<div class="place_info">
							<p class="travel_title">아이들과 가기 좋은 역사 탐방</p>
							<p class="travel_writer">작성자 dudtjahdo98</p>
							<a href='<c:url value="/travel/insert"/>'><button>스크랩</button></a>
						</div>
					</div>
				</a> 
				<a href='<c:url value="/travel/detail"/>'>
					<div class="place">
						<div class="image_wrap">
							<img class="place_img"
								src="${pageContext.request.contextPath}/resources/images/travellist3.jpg" />
						</div>
						<div class="place_info">
							<p class="travel_title">남산 타워 데이트 코스</p>
							<p class="travel_writer">작성자 wjdflarkwlak00</p>
							<a href='<c:url value="/travel/insert"/>'><button>스크랩</button></a>
						</div>
					</div>
				</a>
				<a href='<c:url value="/travel/detail"/>'>
					<div class="place">
						<div class="image_wrap">
							<img class="place_img"
								src="${pageContext.request.contextPath}/resources/images/travellist4.jpg" />
						</div>
						<div class="place_info">
							<p class="travel_title">제주도 먹방투어</p>
							<p class="travel_writer">작성자 helpmeee1717</p>
							<a href='<c:url value="/travel/insert"/>'><button>스크랩</button></a>
						</div>
					</div>
				</a>
			</div>
		</div>
		<div></div>
	</div>



</body>
<%@ include file="../common/footer.jsp"%>
</html>