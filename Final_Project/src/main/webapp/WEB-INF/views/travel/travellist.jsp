<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/travellist.css" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>
</head>
<body>
	<img class="main_img" src="${pageContext.request.contextPath}/resources/images/TourList.png"/>
	<div class="container_top">
		<div class="container">
			<br><br>
			
			<div class="category">
				<div>
				<label class="test_obj"><a
					href='<c:url value="/travel/recent/list"/>'> <input
						type="radio" name="category" id="recent" value="recent"><span>최신순</span></a>
				</label> <label class="test_obj"><a
					href='<c:url value="/travel/shareCnt/list"/>'> <input
						type="radio" name="category" id="shareCnt" value="shareCnt"><span>인기순</span></a>
				</label> <label class="test_obj"><a
					href='<c:url value="/travel/viewCnt/list"/>'> <input
						type="radio" name="category" id="viewCnt" value="viewCnt"><span>조회순</span></a>
				</label>
				</div>
				<div>
				<form action="/travel/search/list" method="post">
				<div class="search_area">
					<div class="search">
						<select class="select" name="searchType" id="searchType">
							<option value="title">제목</option>
							<option value="writer">작성자</option>
						</select> <input type="text" class="search_bar" name="keyword" id="keyword"
							value="" placeholder="search.." required onkeyup="characterCheck(this)" onkeydown="characterCheck(this)">
	
						<button type="submit" class="search_btn" name="btnSearch" id="btnSearch">
							<img class="search_img"
								src="${pageContext.request.contextPath}/resources/images/search.png" />
						</button>
					</div>
				</div>
				<input type="hidden" name="page" value="${pager.pageNo }">
			</form>
			</div>
			</div>
			<div class="place_list">
				<c:forEach var="travel" items="${travelList}">
					
					<div class="place">
						<div class="image_wrap">
						<c:choose>
							<c:when test="${travel.fileSavedName eq null }">
								<img class="place_img"
									src="${pageContext.request.contextPath}/resources/images/default.png" />
							</c:when>
							<c:when test="${travel.fileSavedName ne null }">
								<img class="place_img"
                     				src="<spring:url value='/place/${travel.fileSavedName}'/>" />
							</c:when>
						</c:choose>
						</div>
						<div class="place_info">
							<a href='<c:url value="/travel/${travel.travelId}/${travel.writer}"/>'>
								<p class="travel_title">${travel.travelTitle}
									
									<label class="date">작성일 : <fmt:formatDate value="${travel.writeDate}"
										pattern="YY-MM-dd" /></label>
								</p>
							</a> 
							
							<c:if test="${not empty sessionScope.memberId}">
								<a href='<c:url value="/mypage/${travel.writer}"/>'>
									<p class="travel_writer">${travel.writer}</p>
								</a>
								<a href="/travel/scrap?travelId=${travel.travelId}&memberId=${sessionScope.memberId}" onclick="return confirm('스크랩 하시겠습니까?')" role="button" class="share_btn"><button class="scrap">스크랩</button></a>
							</c:if>
							
							<c:if test="${empty sessionScope.memberId}">
									<p class="travel_writer">${travel.writer}</p>
									<a href="/signin" role="button" class="share_btn"><button class="scrap">스크랩</button></a>
							</c:if>
							
							<div class="icons">
								<img class="views"
									src="${pageContext.request.contextPath}/resources/images/views.png" />
								${travel.viewCnt} <img class="publish"
									src="${pageContext.request.contextPath}/resources/images/publish.png" />${travel.originalTravelIdCount}
							</div>
						</div>
					</div>
					
				</c:forEach>


			</div>
		</div>
		<div>
		<ul class="pagebtn">
				
					<a class="btn btn-outline-primary btn-sm" href="list?pageNo=1"><li class="pageli">처음</li></a>
					<c:if test="${pager.groupNo>1}">
						<a class="btn btn-outline-info btn-sm"
							href="list?pageNo=${pager.startPageNo-1}"><li class="pageli">이전</li></a>
					</c:if>

					<c:forEach var="i" begin="${pager.startPageNo}"
						end="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
							<a class="btn btn-outline-success btn-sm"
								href="list?pageNo=${i}&searchType=${searchType}&keyword=${keyword}"><li class="pageli">${i}</li></a>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<a class="btn btn-danger btn-sm"
								href="list?pageNo=${i}&searchType=${searchType}&keyword=${keyword}"><li class="pageli">${i}</li></a>
						</c:if>
					</c:forEach>

					<c:if test="${pager.groupNo<pager.totalGroupNo}">
						<a class="btn btn-outline-info btn-sm"
							href="list?pageNo=${pager.endPageNo+1}"><li class="pageli">다음</li></a>
					</c:if>
					<a class="btn btn-outline-primary btn-sm"
						href="list?pageNo=${pager.totalPageNo}"><li class="pageli">맨끝</li></a>
				
		</ul>
		</div>

	</div>
	<input type="hidden" id="categoryCheck" value="${category}">
</body>	
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script>
		/* $(document).on('click', '#btnSearch', function(e) {
			
			console.log("click in")

			e.preventDefault();

			var url = "/travel/search/list" + "?pageNo=" + ${pager.pageNo};

			url = url + "&searchType=" + $('#searchType').val();

			url = url + "&keyword=" + $('#keyword').val();

			location.href = url;

			console.log(url);

		}); */


		$(document).ready(function() {
			var category = $('#categoryCheck').val();
			var categorylength = $("[name='category']").length;
			var categoryarr = new Array(categorylength);
			for (var i = 0; i < categorylength; i++) {
				categoryarr[i] = $("[name='category']").eq(i).val();
				if (category == categoryarr[i]) {
					$('[name="category"]').eq(i).attr("checked", true);

				}

			}

		});
	</script>
	<script>
	 function scrap(){ 
	     $.ajax({
	            type : "POST",  
	            url : "/travel/scrap",       
	            dataType : "json",   
	            data : {'bno' : bno, 'Id' : memberId },
	            error : function(){
	               alert("통신 에러");
	            },
	            success : function(scrap) {
	                
	                     if(scrap == 0){
	                    	alert("스크랩완료");
	                    	location.reload();
	                     }else if(scrap == 1){
	                    	 alert("스크랩취소");
	                    	 location.reload();
	                     }
	                    
	            }
	        });
	 }
	 
	 function characterCheck(obj){
			var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
			if( regExp.test(obj.value) ){
				alert("특수문자는 입력하실수 없습니다.");
				obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
				}
			}
	</script>


</html>

<%@ include file="../common/footer.jsp"%>
</html>