<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/placelist.css" />

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
			<form action="/searchPlace" method="post" id="searchform">
			<div class="search">
				<select class="select" name="key">
					<option value="p.area_name">지역명</option>
					<option value="p.place_name">관광지명</option>
				</select> <input type="text" class="search_bar"  name="keyword" value=""
					placeholder="search..">
				<button type="submit" class="search_btn">
					<img class="search_img"
						src="${pageContext.request.contextPath}/resources/images/search.png" />
				</button>
			</div>
			</form>
			<div class="category">
				<label class="test_obj"><a href="place?category=THE00030"> <input type="radio" name="category"
					value="THE00030"> <span>자연/힐링</span>
				</a></label> <label class="test_obj"><a href="place?category=THE00050"> <input type="radio"
					name="category" value="THE00050" ><span>종교/역사/전통</span>
				</a></label><label class="test_obj"><a href="place?category=THE00020">  <input type="radio"
					name="category" value="THE00020" > <span>체험/학습/산업</span>
				</a></label> <label class="test_obj"><a href="place?category=THE00060"> <input type="radio"
					name="category" value="THE00060" > <span>쇼핑/놀이</span>
				</a></label> <label class="test_obj"><a href="place?category=THE00040"> <input type="radio"
					name="category" value="THE00040" > <span>캠핑/스포츠</span>
				</a></label> <label class="test_obj"><a href="place?category=THE00010"> <input type="radio"
					name="category" value="THE00010" ><span>문화/예술</span>
				</a></label>
			</div>
			
			
			<div class="place_list" id="place_list">
				
				   <c:forEach var="place" items="${placeList}">
					<div class="place">
						<div class="image_wrap">
						<c:choose>
							<c:when test="${place.fileSavedName eq null }">
								<img class="place_img"
									src="${pageContext.request.contextPath}/resources/images/default.png" />
							</c:when>
							<c:when test="${place.fileSavedName ne null }">
								<img class="place_img"
                     				src="<spring:url value='/place/${place.fileSavedName}'/>" />
							</c:when>
						</c:choose>
							
						</div>
						<div class="place_info">
						
							<a href='<c:url value="/place/detail/${place.placeName}"/>'>
								<p class="place_name" id="place_name">${place.placeName}</p>
							</a>
							<p class="place_area" id="place_area">${place.areaName}</p>
							<label class="category_label"> <span id="category_label">${place.category}</span></label>
						</div>
					</div>
				</c:forEach>  
					<c:if test="${placeList eq null }">
						<p>${message }</p>
					</c:if>
			</div>
			
			
		
		
					 <div>
					 <ul class="pagebtn">
						 <c:if test="${keyword ne null }">
							<a  href="searchPlace?pageNo=1"><li class="pageli">처음</li></a>
						</c:if>
						<c:if test="${category ne null }">
							<a  href="place?pageNo=1"><li class="pageli">처음</li></a>
						</c:if>
					
					
						<c:if test="${pager.groupNo>1}">
							<c:if test="${category ne null }">
								<a  href="place?pageNo=${pager.startPageNo-1}&category=${category}"><li class="pageli">이전</li></a>
							</c:if>
							<c:if test="${keyword ne null  }">
								<a href="searchPlace?pageNo=${pager.startPageNo-1 }&key=${key}&keyword=${keyword}"><li class="pageli">이전</li></a>
							</c:if>
						</c:if>
						
						
						
						<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							<c:if test="${pager.pageNo != i}">
								<c:if test="${category ne null }">
									<a  href="place?pageNo=${i}&category=${category}"><li class="pageli">${i}</li></a>
								</c:if>
								<c:if test="${keyword ne null }">
									<a href="searchPlace?pageNo=${i}&key=${key}&keyword=${keyword}"><li class="pageli">${i}</li></a>
								</c:if>
							</c:if>
							
							<c:if test="${pager.pageNo == i}">
								<c:if test="${category ne null }">
									<a  href="place?pageNo=${i}&category=${category}"><li class="pageli">${i}</li></a>
								</c:if>
								
								 <c:if test="${keyword ne null }">
									<a href="searchPlace?pageNo=${i}&key=${key}&keyword=${keyword}"><li class="pageli">${i}</li></a>
								</c:if> 
								
							</c:if>
						</c:forEach>
						
						
						
						<c:if test="${pager.groupNo<pager.totalGroupNo}">
							<c:if test="${category ne null }">
								<a  href="place?pageNo=${pager.endPageNo+1}&category=${category}"><li class="pageli">다음</li></a>
							</c:if>
							<c:if test="${keyword ne null  }">
								<a href="searchPlace?pageNo=${pager.endPageNo+1 }&key=${key}&keyword=${keyword}"><li class="pageli">다음</li></a>
							</c:if>
						</c:if>
						
						<c:if test="${category ne null }">
							<a  href="place?pageNo=${pager.totalPageNo}&category=${category}"><li class="pageli">맨끝</li></a>
						</c:if>
						<c:if test="${keyword ne null }">
							<a href="searchPlace?pageNo=${pager.totalPageNo }&key=${key}&keyword=${keyword}"><li class="pageli">맨끝</li></a>
						</c:if>
					</ul>
					</div>
				 
			
		</div>
		
	</div>

<input type="hidden" id="categoryCheck" value="${category }">

</body>
<%@ include file="../common/footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var category=$("#categoryCheck").val();
		var categorylength =$("[name='category']").length;
		var categoryarr=new Array(categorylength);
		for(var i=0;i<categorylength; i++){
			categoryarr[i]=$("[name='category']").eq(i).val();
			if(category==categoryarr[i]){
				$('[name="category"]').eq(i).attr("checked",true);
				
			}
			
		}
		
		
	});
	
	$('#searchform').submit(function(){
		$('#categoryCheck').val('');
		
		$('[name="category"]').prop("checked",false);
		
	});
	
	
</script>

</html>