<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/advertising.css" />

	<div class="ad__wrapper">
		<div class="ad__header">
			<span class="ad__header__font">TRAVELY 상품</span> 
		</div>
		<div class="ad_content_box">
			<div>
				<form action="/productDetail" method="post">
					<button type="submit" class="submit">
						<img class="ad_img"  src="${pageContext.request.contextPath}/resources/images/ad1.png">
						<input type="text" name="title" class="ad_title" value="⛷️망고스노우파크 입장권 ⛷️"/>
						&#8361;&nbsp;<span class="original_price"> 59,000 &nbsp; →</span><input type="text" class="sale_price" name="price" value="39,000원"> 
					</button>
					<input type="hidden" name="img" value="ad1"/>
					<input type="hidden" name="pname" value="망고스노우파크입장권"/>
					<input type="hidden" name="pprice" value="39000"/>
					<input type="hidden" name="pcode" value="0010"/>
				</form>
			</div>
			<div>
				<form action="/productDetail" method="post">
					<button type="submit" class="submit">
						<img class="ad_img" " src="${pageContext.request.contextPath}/resources/images/ad2.png"/>
						<input type="text" name="title" class="ad_title" value="(🎀올겨울 최저가🎀) 스키 시즌권"/>
						&#8361;&nbsp;<span class="original_price"> 750,000&nbsp; → </span><input type="text" class="sale_price" name="price" value="350,000원"/>
					</button>
					<input type="hidden" name="img" value="ad2"/>
					<input type="hidden" name="pname" value="스키 시즌권"/>
					<input type="hidden" name="pprice" value="350000"/>
					<input type="hidden" name="pcode" value="0020"/>
				</form>
			</div>
			
			<div>
				<form action="/productDetail" method="post">
					<button type="submit" class="submit">
						<img class="ad_img"  src="${pageContext.request.contextPath}/resources/images/ad3.png">
						<input type="text" name="title" class="ad_title" value="(~2.22일까지)_형제섬 호핑투어🌊"/>
						&#8361;&nbsp;<span class="original_price"> 39000&nbsp;→  </span><input type="text" class="sale_price" name="price" value="29,000원">
					</button>
					<input type="hidden" name="img" value="ad3"/>
					<input type="hidden" name="pname" value="형제섬호핑투어"/>
					<input type="hidden" name="pprice" value="29000"/>
					<input type="hidden" name="pcode" value="0030"/>
				</form>
			</div>
			<div>
				<form action="/productDetail" method="post">
					<button type="submit" class="submit">
						<img class="ad_img"  src="${pageContext.request.contextPath}/resources/images/ad4.png">
						<input type="text" name="title" class="ad_title" value="💙얼리버드특가💙 씨워킹투어"/>
						&#8361;&nbsp;<span class="original_price"> 190,000&nbsp;→  </span><input type="text"  class="sale_price" name="price" value="115,000원"/>
					</button>
					<input type="hidden" name="img" value="ad4"/>
					<input type="hidden" name="pname" value="씨워킹투어"/>
					<input type="hidden" name="pprice" value="115000"/>
					<input type="hidden" name="pcode" value="0040"/>
				</form>
			</div>
			<div>
			<form action="/productDetail" method="post">
				<button type="submit" class="submit">
					<img class="ad_img"  src="${pageContext.request.contextPath}/resources/images/ad5.png">
					<input type="text" name="title" class="ad_title" value="(논산)🍓산딸기 체험 입장권🍓"/>
					&#8361;&nbsp;<span class="original_price"> 20000&nbsp;→  </span><input type="test" name="price" class="sale_price" value="9,900원"/>
				</button>
				<input type="hidden" name="img" value="ad5"/>
				<input type="hidden" name="pname" value="산딸기체험입장권"/>
				<input type="hidden" name="pprice" value="9900"/>
				<input type="hidden" name="pcode" value="0050"/>
			</form>
			</div>
		</div>
	</div>

	