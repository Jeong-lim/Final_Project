<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
</head>
<body>
	<div id="floatWeather">
		<div id="news-container">
			<ul>
				<li>
					<div>서울시 ⛈️</div>
				</li>
				<li>
					<div>파주시 🌤️</div>
				</li>
				<li>
					<div>고양시 ⛅</div>
				</li>
				<li>
					<div>평택시 ❄️</div>
				</li>

				<li><div>전주시 ☃️</div></li>
			</ul>
		</div>

	</div>
	<div id="floatMenu">
				
		<div class="container">
			
			<div class="leaderboard">
				<div class="head">
					<i class="fas fa-crown"></i>
					<div>✈️ 실시간 여행 인기코스 ✈️</div>
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
	
	<a href="#" class="top"><img src="${pageContext.request.contextPath}/resources/images/topbutton.png"></a>
	
	<%@ include file="/WEB-INF/views/common/slider.jsp"%>	
	<%@ include file="/WEB-INF/views/common/advertising.jsp"%>	
	<%@ include file="/WEB-INF/views/common/information.jsp"%>
	<%@ include file="/WEB-INF/views/common/sliderbanner.jsp"%>
	<%@ include file="/WEB-INF/views/common/slidetravel.jsp"%>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	

</body>
	<script>
	 $( document ).ready( function() {
	        $( window ).scroll( function() {
	          if ( $( this ).scrollTop() > 200 ) {
	            $( '.top' ).fadeIn();
	          } else {
	            $( '.top' ).fadeOut();
	          }
	        } );
	        $( '.top' ).click( function() {
	          $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
	          return false;
	        } );
	      } );
	 $(function(){
	        $('#news-container').vTicker({ 
	            speed: 500,
	            pause: 3000,
	            animation: 'fade',
	            mousePause: false,
	            showItems: 1
	        
	        });
	    });

		(function(a) {
			a.fn.vTicker = function(b) {
				var c = {
					speed : 700,
					pause : 4000,
					showItems : 3,
					animation : "",
					mousePause : true,
					isPaused : false,
					direction : "up",
					height : 0
				};
				var b = a.extend(c, b);
				moveUp = function(g, d, e) {
					if (e.isPaused) {
						return
					}
					var f = g.children("ul");
					var h = f.children("li:first").clone(true);
					if (e.height > 0) {
						d = f.children("li:first").height()
					}
					f.animate({
						top : "-=" + d + "px"
					}, e.speed, function() {
						a(this).children("li:first").remove();
						a(this).css("top", "0px")
					});
					if (e.animation == "fade") {
						f.children("li:first").fadeOut(e.speed);
						if (e.height == 0) {
							f.children("li:eq(" + e.showItems + ")").hide()
									.fadeIn(e.speed)
						}
					}
					h.appendTo(f)
				};
				moveDown = function(g, d, e) {
					if (e.isPaused) {
						return
					}
					var f = g.children("ul");
					var h = f.children("li:last").clone(true);
					if (e.height > 0) {
						d = f.children("li:first").height()
					}
					f.css("top", "-" + d + "px").prepend(h);
					f.animate({
						top : 0
					}, e.speed, function() {
						a(this).children("li:last").remove()
					});
					if (e.animation == "fade") {
						if (e.height == 0) {
							f.children("li:eq(" + e.showItems + ")").fadeOut(
									e.speed)
						}
						f.children("li:first").hide().fadeIn(e.speed)
					}
				};
				return this.each(function() {
					var f = a(this);
					var e = 0;
					f.css({
						overflow : "hidden",
						position : "relative"
					}).children("ul").css({
						position : "absolute",
						margin : 0,
						padding : 0
					}).children("li").css({
						margin : 0,
						padding : 0
					});
					if (b.height == 0) {
						f.children("ul").children("li").each(function() {
							if (a(this).height() > e) {
								e = a(this).height()
							}
						});
						f.children("ul").children("li").each(function() {
							a(this).height(e)
						});
						f.height(e * b.showItems)
					} else {
						f.height(b.height)
					}
					var d = setInterval(function() {
						if (b.direction == "up") {
							moveUp(f, e, b)
						} else {
							moveDown(f, e, b)
						}
					}, b.pause);
					if (b.mousePause) {
						f.bind("mouseenter", function() {
							b.isPaused = true
						}).bind("mouseleave", function() {
							b.isPaused = false
						})
					}
				})
			}
		})(jQuery);
	</script>
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
	
	$(document).ready(function() {

		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatWeather = parseInt($("#floatWeather").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
		$(window).scroll(function() {

			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatWeather + "px";
			$("#floatWeather").stop().animate({
				"top" : newPosition
			}, 650);

		}).scroll();

	});
</script>
</html>