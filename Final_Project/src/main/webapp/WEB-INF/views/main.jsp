<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="common/header.jsp"%>

<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>

<script>
	$(document).ready(function() {

		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#floatMenu").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
		$(window).scroll(function() {

			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";

			$("#floatMenu").stop().animate({
				"top" : newPosition
			}, 650);

		}).scroll();

	});
</script>

<style>


/* head */
.leaderboard .head {
	padding: 16px 13px;
	color: grey;
	font-size: 18px;
	text-align: center;
	font-weight: bolder;
}

.leaderboard .head div {
	display: inline-block;
	margin-left: 4px;
}

/* body */
.leaderboard .body {
	color: snow;
	font-size: 16px;
}

.leaderboard ol {
	counter-reset: number; /* 定義和初始化計數器 */
}

.leaderboard li {
	padding: 16px;
	display: flex;
}




#floating__banner_1 {
	background: #c9ffe2;
	color: #143601;
	font-weight: bold;
}


#floating__banner_2 {
	background: #b6f9c9;
	color: #143601;
	font-weight: bold;
}

#floating__banner_3 {
	background: #96e8bc;
	color: #143601;
	font-weight: bold;
}

#floating__banner_4 {
	background: #7dd181;
	color: #143601;
	font-weight: bold;
}

#floating__banner_5 {
	background: #44ad50;
	color: #143601;
	font-weight: bold;
}
.container {
	width: 260px;
	height: auto;
	border-radius: 10px;
	background-color: white;
	box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 1;
	overflow: hidden;
}
#floatMenu {
	position: absolute;
	width: 200px;
	height: 200px;
	left: 70px;
	top: 240px;
	background-color: #606060;
	color: #fff;
	z-index: 10;
}
 ::-webkit-scrollbar {
  		display: none;
	}
.item {
  width: 1000px;
  height: 200px;
  margin: 50px auto;
  padding-top: 75px;
  background: rgba(255,85,0, .7);
  text-align: center;
  color: #4E4C48;
  font-size: 1.5em;
  z-index: 2;
}
</style>
</head>
<body>
	<div id="floatMenu">
		<div class="container">
			<div class="leaderboard">
				<div class="head">
					<i class="fas fa-crown"></i>
					<div>✈️실시간 여행 인기코스✈️</div>
				</div>
				<div class="body">
					<a href="<c:url value='/travel/detail'/>"><li id="floating__banner_1">꼭 가봐야 할 3박4일 서울 여행</li></a>
					<a href="<c:url value='/travel/detail'/>"><li id="floating__banner_2">아이들과 가기 좋은 역사 여행</li></a>
					<a href="<c:url value='/travel/detail'/>"><li id="floating__banner_3">남자친구랑 떠나는 남산 타워 투어</li></a>
					<a href="<c:url value='/travel/detail'/>"><li id="floating__banner_4">부모님과 함께하는 효도 여행 코스</li></a>
					<a href="<c:url value='/travel/detail'/>"><li id="floating__banner_5">겨울에도 함께할 수 있는 여행 코스</li></a>
				</div>
			</div>

		</div>
	</div>
	
	<%@ include file="common/slider.jsp"%>
	<%@ include file="common/information.jsp"%>
	<%@ include file="common/sliderbanner.jsp"%>
	<%@ include file="common/slidetravel.jsp"%>
	<%@ include file="common/footer.jsp"%>
</body>
</html>