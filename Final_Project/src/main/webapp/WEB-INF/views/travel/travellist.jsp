<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	text-align: center;
}

.inner {
	width: 1000px;
	margin: auto;
	border: 1px solid black;
}

.title {
	width: 800px;
	text-align: left;
	border: 0px;
	margin: 40px auto;
}

.list {
	width: 800px;
	margin: auto;
}

.listdetail {
	width: 800px;
	height: 200px;
	border: 1px solid black;
}

.listdetail img {
	width: 200px;
	height: 200px;
	float: left
}

.bar {
	margin: auto;
	width: 800px;
	height: 60px;
}

.items {
	display: inline-block;
}

.radiobtn {
	display: none;
}

.radioLabel {
	display: inline-block;
	width: 100px;
	height: 35px;
	border-radius: 15px;
	line-height: 35px;
}

.radiobtn:checked+label {
	box-shadow: 3px 3px 3px;
}

.selectdiv {
	display: inline-block;
	width: 300px;
	height: 30px;
	border: 1px solid black;
	margin-left: 200px;
}

.selectdiv select {
	height: 30px;
	float: left;
}

.search {
	width: 200px;
	height: 26px;
	padding: 2px;
	float: left;
	border: 0px;
}

.search:focus {
	outline: 0;
}

.selectdiv img {
	display: inline-block;
	width: 30px;
	height: 30px;
}

.listContent {
	display: inline-block;
}

.contentTitle {
	width: 550px;
	height: 80px;
	margin-top: 30px;
	font-size: 25px;
	font-weight: bold;
	text-align: left;
}

.contentWriter {
	text-align: left;
}

.share {
	float: right;
}

.category {
	float: left;
}

.test_obj input[type="radio"] {
	display: none;
}

.test_obj input[type="radio"]+span {
	display: inline-block;
	width: 80px; padding : 5px;
	border: 1px solid #dfdfdf;
	border-radius: 15px;
	background-color: #ffffff;
	text-align: center;
	cursor: pointer;
	font-size: 13px;
	padding: 5px;
}

.test_obj input[type="radio"]:checked+span {
	background-color: #113a6b;
	color: #ffffff;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>


	<div class="outer">
		<div class="inner">

			<div class="title">
				<div>travely가 준비한</div>
				<div>여행 일정 리스트</div>
			</div>

			<div class="bar">
				<div class="category">
					<label class="test_obj"> <input type="radio"
						name="category" value=""> <span>최신순</span>
					</label> <label class="test_obj"> <input type="radio"
						name="category" value=""> <span>조회순</span>
					</label> <label class="test_obj"> <input type="radio"
						name="category" value=""> <span>인기순</span>
					</label>

				</div>

				<div class="selectdiv">
					<select>
						<option>작성자</option>
						<option>제목</option>
					</select> <input type="text" class="search"> <img
						src="../resources/images/search.png">
				</div>

			</div>

			<div class="list">

				<div class="listdetail">
					<img src="../resources/images/travellist1.jpg"
						onclick="location.href='<c:url value="/travel/detail"/>'">
					<div class="listContent">
						<div class="contentTitle"
							onclick="location.href='<c:url value="/travel/detail"/>'">꼭
							가봐야 할 3박4일 서울 여행</div>
						<div class="contentWriter">
							작성자 dudtjahgo98
							<button class="share"
								onclick="location.href='<c:url value="/travel/insert"/>'">스크랩</button>
						</div>
					</div>
				</div>

				<div class="listdetail">
					<img src="../resources/images/travellist2.jpg"
						onclick="location.href='<c:url value="/travel/detail"/>'">
					<div class="listContent">
						<div class="contentTitle"
							onclick="location.href='<c:url value="/travel/detail"/>'">아이들과
							가기 좋은 역사 여행</div>
						<div class="contentWriter">
							작성자 wjdflarkwlak00
							<button class="share"
								onclick="location.href='<c:url value="/travel/insert"/>'">스크랩</button>
						</div>
					</div>
				</div>

				<div class="listdetail">
					<img src="../resources/images/travellist3.jpg"
						onclick="location.href='<c:url value="/travel/detail"/>'">
					<div class="listContent">
						<div class="contentTitle"
							onclick="location.href='<c:url value="/travel/detail"/>'">남자친구랑
							떠나는 남산 타워 투어</div>
						<div class="contentWriter">
							작성자 rkdudrhdwn99
							<button class="share"
								onclick="location.href='<c:url value="/travel/insert"/>'">스크랩</button>
						</div>

					</div>
				</div>


			</div>



		</div>
	</div>




</body>
</html>