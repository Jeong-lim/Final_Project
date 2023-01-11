<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/travellist.css" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style type="text/css">
.pageli {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>
</head>
<body>

	<div class="container_top">
		<div class="container">
			<br>
			<div>
				<span>TRAVELY가 준비한</span>
			</div>
			<div>
				<p class="list_tit">여행 일정 리스트</p>
			</div>
			<div class="search_area">

				<select class="select" name="searchType" id="searchType">
					<option value="title">제목</option>
					<option value="writer">작성자</option>
				</select> <input type="text" name="keyword" id="keyword"
					value="${travel.keyword}">
				<button class="search_btn" name="btnSearch" id="btnSearch">
					<img class="search_img"
						src="${pageContext.request.contextPath}/resources/images/search.png" />
				</button>


			</div>
			<div class="category">
				<a href='<c:url value="/travel/recent/list"/>'> <label
					class="test_obj">
						<button id="recent">최신순</button>
				</label></a> <a href='<c:url value="/travel/shareCnt/list"/>'><label
					class="test_obj">
						<button id="shareCnt">인기순</button>

				</label></a> <a href='<c:url value="/travel/viewCnt/list"/>'><label
					class="test_obj">
						<button id="viewCnt">조회순</button>
				</label></a>

			</div>
			<div class="place_list">
				<c:forEach var="travel" items="${travelList}">
					<div class="place">
						<div class="image_wrap">
							<img class="place_img"
								src="${pageContext.request.contextPath}/resources/images/남산타워.jpg" />
						</div>
						<div class="place_info">
							<a href='<c:url value="/travel/detail"/>'>
								<p class="travel_title">${travel.travelTitle}
									-
									<fmt:formatDate value="${travel.writeDate}"
										pattern="YYYY-MM-dd" />
								</p>
							</a> <a href='<c:url value="/mypage"/>'>
								<p class="travel_writer">${travel.writer}</p>
							</a>
							<button class="scrap"
								onclick="location.href='<c:url value="/travel/insert"/>'">스크랩</button>
							<div class="icons">
								<img class="views"
									src="${pageContext.request.contextPath}/resources/images/views.png" />
								${travel.viewCnt} <img class="publish"
									src="${pageContext.request.contextPath}/resources/images/publish.png" />${travel.shareCnt}
							</div>
						</div>
					</div>
				</c:forEach>


			</div>
		</div>
		<table>
			<td colspan="4" class="text-center">
				<div>
					<a class="btn btn-outline-primary btn-sm" href="list?pageNo=1">처음</a>
					<c:if test="${pager.groupNo>1}">
						<a class="btn btn-outline-info btn-sm"
							href="list?pageNo=${pager.startPageNo-1}">이전</a>
					</c:if>

					<c:forEach var="i" begin="${pager.startPageNo}"
						end="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
							<a class="btn btn-outline-success btn-sm" href="list?pageNo=${i}">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<a class="btn btn-danger btn-sm" href="list?pageNo=${i}">${i}</a>
						</c:if>
					</c:forEach>

					<c:if test="${pager.groupNo<pager.totalGroupNo}">
						<a class="btn btn-outline-info btn-sm"
							href="list?pageNo=${pager.endPageNo+1}">다음</a>
					</c:if>
					<a class="btn btn-outline-primary btn-sm"
						href="list?pageNo=${pager.totalPageNo}">맨끝</a>
				</div>
			</td>
			</tr>
		</table>





	</div>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).on('click','#btnSearch',function(e){

	e.preventDefault();

	var url = "/travel/search/list";

	url = url + "?searchType=" + $('#searchType').val();

	url = url + "&keyword=" + $('#keyword').val();

	location.href = url;

	console.log(url);

});	
</script>
</body>

</html>

<%@ include file="../common/footer.jsp"%>
</html>