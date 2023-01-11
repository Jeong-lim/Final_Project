<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/travelinsert.css" />
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
			<div class="modal_wrap_box">
				<div class="place_sel_box">
					<img src="../resources/images/logo.png" class="place_sel_logo"><label
						class="place_title">관광지 선택하기</label><img
						src="../resources/images/x.png" class="place_title_x"
						id="place_title_x">
				</div>
				<div class="place_search_box">
					<span><select name="sido1" id="sido1" class="sido1"></select>
						<select name="gugun1" id="gugun1" class="gugun1"></select>
						<div class="search">
							<input type="text" class="select" spellcheck="false"> <img
								src="../resources/images/search.png">
						</div></span>
					<button type="button" id="modal_close" class="place_btn">확인</button>
				</div>
			</div>


			<div class="place_list">

				<c:forEach var="place" items="${placeList }">
					<div class="place">
						<div class="image_wrap">
							<img class="place_img"
								src="${pageContext.request.contextPath}/resources/images/경복궁.jpg" />
						</div>
						<div class="place_info">
							<a href='<c:url value="/place/detail"/>'>
								<p class="place_name">${place.placeName}</p>
							</a>
							<p class="place_area">${place.areaName}</p>
							<label class="category_label"> <span>${place.category}</span></label>
						</div>
					</div>
				</c:forEach>

			</div>


		</div>
	</div>


</body>
<script>
	$('document').ready(function() {
						var area0 = [ "시/도 선택", "서울특별시", "인천광역시", "대전광역시",
								"광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도",
								"강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도",
								"경상남도", "제주도" ];
						var area1 = [ "구/군 선택","서울" ];
						var area2 = [ "구/군 선택","인천" ];
						var area3 = [ "구/군 선택","대전" ];
						var area4 = [ "구/군 선택","광주" ];
						var area5 = [ "구/군 선택","대구" ];
						var area6 = [ "구/군 선택","울산" ];
						var area7 = [ "구/군 선택","부산" ];
						var area8 = [ "고양시", "과천시", "광명시", "광주시", "구리시", "군포시",
								"김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시",
								"시흥시", "안산시", "안성시", "안양시", "양주시", "오산시",
								"용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시",
								"포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군" ];
						var area9 = [ "강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시",
								"태백시", "고성군", "양구군", "양양군", "영월군", "인제군",
								"정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군" ];
						var area10 = [ "제천시", "청주시", "충주시", "괴산군", "단양군",
								"보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군" ];
						var area11 = [ "계룡시", "공주시", "논산시", "보령시", "서산시",
								"아산시", "천안시", "금산군", "당진군", "부여군", "서천군",
								"연기군", "예산군", "청양군", "태안군", "홍성군" ];
						var area12 = [ "군산시", "김제시", "남원시", "익산시", "전주시",
								"정읍시", "고창군", "무주군", "부안군", "순창군", "완주군",
								"임실군", "장수군", "진안군" ];
						var area13 = [ "광양시", "나주시", "목포시", "순천시", "여수시",
								"강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군",
								"보성군", "신안군", "영광군", "영암군", "완도군", "장성군",
								"장흥군", "진도군", "함평군", "해남군", "화순군" ];
						var area14 = [ "경산시", "경주시", "구미시", "김천시", "문경시",
								"상주시", "안동시", "영주시", "영천시", "포항시", "고령군",
								"군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군",
								"울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군" ];
						var area15 = [ "거제시", "김해시", "마산시", "밀양시", "사천시",
								"양산시", "진주시", "진해시", "창원시", "통영시", "거창군",
								"고성군", "남해군", "산청군", "의령군", "창녕군", "하동군",
								"함안군", "함양군", "합천군" ];
						var area16 = [ "제주", "서귀포" ];

						$("select[name^=sido]")
								.each(
										function() {
											$selsido = $(this);
											$
													.each(
															eval(area0),
															function() {
																$selsido
																		.append("<option value='"+this+"'>"
																				+ this
																				+ "</option>");
															});
											$selsido
													.next()
													.append(
															"<option value=''>구/군 선택</option>");
										});

						$("select[name^=sido]")
								.change(
										function() {
											var area = "area"
													+ $("option", $(this))
															.index(
																	$(
																			"option:selected",
																			$(this))); // 선택지역의 구군 Array
											var $gugun = $(this).next(); // 선택영역 군구 객체
											$("option", $gugun).remove(); // 구군 초기화

											if (area == "area0")
												$gugun
														.append("<option value=''>구/군 선택</option>");
											else {
												$
														.each(
																eval(area),
																function() {
																	$gugun
																			.append("<option value='"+this+"'>"
																					+ this
																					+ "</option>");
																});
											}
										});
						$("#sido1").change(function(){
							console.log("값변경테스트: "+$(this).val());
						});
						$("#gugun1").change(function(){
							console.log("값변경테스트: "+$(this).val());
						});
						
						$.ajax

					});
			
	
</script>
<%@ include file="../common/footer.jsp"%>
</html>