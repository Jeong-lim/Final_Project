<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/travelinsert.css" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
.daterange1{
	width:
}
</style>
</head>
<body>
	<input type="hidden" class="memberId" value="${sessionScope.memberId}"/>
	<input type="hidden" class="travelId" value="${travelId}"/>

	<div class="outer">
		<div class="inner">
		
			<div class="selectdiv1">
				<label class="top_title">여행 일정 수정하기</label> <span> 
				<input type="radio" name="travelPrivacy" class="open_radio" id="open_radio1" value="a" <c:if test="${travelPrivacy eq 'a'}">checked</c:if>><label for="open_radio1" class="open_radio_label">전체 공개</label> 
				<input type="radio" name="travelPrivacy" class="open_radio" id="open_radio2" value="f" <c:if test="${travelPrivacy eq 'f'}">checked</c:if>><label for="open_radio2" class="open_radio_label">팔로우 공개</label> 
				<input type="radio" name="travelPrivacy" class="open_radio" id="open_radio3" value="p" <c:if test="${travelPrivacy eq 'p'}">checked</c:if>><label for="open_radio3" class="open_radio_label">비공개</label></span> 
				<input type="text"  class="daterange1" id="startDate" value="${startDate}"/>-
				<input type="text"  class="daterange1" id="endDate" value="${endDate}"/>
			</div>
			<div class="title_input_box">
				<input type="text" id="title_input" class="title_input" value="${travelTitle}" name="travelTitle">
				<img class="title_input_img" id="title_input_img" src="${pageContext.request.contextPath}/resources/images/pen.png">
			</div>

			<hr class="uk-divider-icon">

		
			<c:forEach var="detailList" items="${detailList}" varStatus="status">
				
					<form action="<c:url value='/travel/insertTravelDetail'/>" method="post" class="insertform" id="form${status.count}">
					<input type="hidden" class="travelId" name="travelId" value="${travelId}">
						<div class="content_wrap">
						
							<div class="content_title">
								<label class="dayseq">DAY  ${status.count}</label> 
								<input type="text" class="travelDate" name="travelDate" value="${detailList.travelDate}" />
								<button type="button" class="modal_btn2" name="modal_btn2" onClick="openModal2(this.id)" id="memomodal${status.count}">
									<input type="hidden" name="memo" class="memomodal${status.count}" value="${detailList.travelMemo}" /> 
									<img src="${pageContext.request.contextPath}/resources/images/note.png">
								</button>
							</div>
							<c:set var="num1" value="${detailList.travelDate}"></c:set>
							<c:forEach var="detailTravel" items="${detailTravel}" varStatus="statusNm">
								<c:set var="num2" value="${detailTravel.travelDate}"></c:set>
								<c:if test="${num1 eq num2 }">
								<div class="schedule_box" id="scheduledelete${statusNm.count}">
										<input type="text" class="schedule" value="${detailTravel.placeName}" name="placeName" readonly>
										<button type="button" class="insert_num" onClick="cancelSchedule(this.id)" id="delete${statusNm.count}">X</button>
								</div>
								</c:if>
								<input type="hidden" class="count2" value="${statusNm.count}"/>
							</c:forEach>
							
							
							<button type="button" class="modal_btn" name="modal_btn"
								onClick="openModal(this.id)" id="placemodal${status.count}">
								<img
									src="${pageContext.request.contextPath}/resources/images/add.png">
								<label>일정 추가하기</label>
							</button>
						</div>
					</form>
					
			<input type="hidden" class="count" value="${status.count}"/>
			
			</c:forEach>
			<%-- <button type="button" class="modal_btn3" name="modal_btn3" onClick="dayadd(this.id)" id="dayadd">
				<img src="${pageContext.request.contextPath}/resources/images/add.png">
				<label>날짜 추가하기</label>
			</button> --%>
			
			

				<button class="save">확인</button>
				
				
		
				
			<!-- 장소모달 -->
			<div class="black_bg" id="black_bg1"></div>
			<div class="modal_wrap">
				<div>
					<div class="modal_wrap_box">
						<div class="place_sel_box">
							<img src="${pageContext.request.contextPath}/resources/images/logo.png" class="place_sel_logo"><label
								class="place_title">관광지 선택하기</label><img
								src="${pageContext.request.contextPath}/resources/images/x.png" class="place_title_x"
								id="place_title_x">
						</div>
						<div class="place_search_box">
							<span><select name="sido1" id="sido1" class="sido1"></select>
								<select name="searchType" id="searchType" class="gugun1"></select>
								<div class="search">
									<input type="text" class="select" spellcheck="false" name="keyword" id="keyword" value="${Search.keyword}"> 
									<button id="btnSearch" class="btnSearch">
									<img 
										src="${pageContext.request.contextPath}/resources/images/search.png"></button>
								</div></span>
							<button type="button" id="modal_close" class="place_btn" onClick="closeModal()">확인</button>
						</div>
					</div>
					<div class="place_box">
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
                     				src="/place/${place.fileSavedName}" />
							</c:when>
						</c:choose>
						</div>
						<div class="place_content">
						<div class="title">
								<label class="place_name" id="place_name">${place.placeName}</label>
								<input type="checkbox" class="checkbox" name="checkbox" value="${place.placeName}">
								</div>
							<p class="place_area" id="place_area">${place.areaName}</p>
							<label class="category_label"> <span id="category_label">${place.category}</span></label>
						</div>
					</div>
				</c:forEach>  
					<c:if test="${placeList eq null }">
						<p>${message }</p>
					</c:if>
			</div>

					</div>
				</div>
			</div>

			<!-- 메모모달 -->
			<div class="black_bg" id="black_bg2"></div>
			<div class="modal_wrap2" id="modal_wrap2">
				<div>
					<div class="memo_title">
						<img src="${pageContext.request.contextPath}/resources/images/logo.png" class="memo_title_logo"><img
							src="${pageContext.request.contextPath}/resources/images/x.png" class="memo_title_x"
							id="memo_title_x">
					</div>
					<textarea class="memo_textarea" rows="10" cols="50"
						spellcheck="false"></textarea>
					<button type="button" class="memo_btn" id="modal_close2" onClick="closeModal2()">확인</button>

				</div>
			</div>



		</div>
	</div>





<%@ include file="../common/footer.jsp"%>
</body>
<script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script>
$('document').ready(function() {
	 var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	  var area1 = ["서울"];
	   var area2 = ["인천"];
	   var area3 = ["대전"];
	   var area4 = ["광주"];
	   var area5 = ["대구"];
	   var area6 = ["울산"];
	   var area7 = ["부산"];
	   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	   var area16 = ["제주","서귀포"];



	 $("select[name^=sido]").each(function() {
	  $selsido = $(this);
	  $.each(eval(area0), function() {
	   $selsido.append("<option value='"+this+"'>"+this+"</option>");
	  });
	  $selsido.next().append("<option value=''>구/군 선택</option>");
	 });

	 

	 $("select[name^=sido]").change(function() {
	  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	  var $gugun = $(this).next(); // 선택영역 군구 객체
	  $("option",$gugun).remove(); // 구군 초기화

	  if(area == "area0")
	   $gugun.append("<option value=''>구/군 선택</option>");
	  else {
	   $.each(eval(area), function() {
	    $gugun.append("<option value='"+this+"'>"+this+"</option>");
	   });
	  }
	 });


	});
	
	
var arr= new Array();

window.onload = function() {
	var btnClear = document.querySelector('#title_input_img');
	arr=[];
	btnClear.addEventListener('click', function(){
	    document.querySelector('#title_input').value="";
	    
	})
	
	 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
        document.body.style.overflow = "hidden";
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
        document.body.style.overflow = "unset";
    }
    
    function onClick2(){
    	 document.querySelector('.modal_wrap2').style.display ='block';
         document.querySelector('#black_bg2').style.display ='block';
         document.body.style.overflow = "hidden";
    }
    function offClick2() {
        document.querySelector('.modal_wrap2').style.display ='none';
        document.querySelector('#black_bg2').style.display ='none';
        document.body.style.overflow = "unset";
    }

    document.querySelector('.modal_btn').addEventListener('click', onClick);
    document.querySelector('#modal_close').addEventListener('click', offClick);
    document.querySelector('.modal_btn2').addEventListener('click', onClick2);
    document.querySelector('#modal_close2').addEventListener('click', offClick2);
    
    document.querySelector('#black_bg1').addEventListener('click', offClick);
    document.querySelector('#black_bg2').addEventListener('click', offClick2);
    
    document.querySelector('#memo_title_x').addEventListener('click',offClick2);
    document.querySelector('#place_title_x').addEventListener('click',offClick);
    
    

   
 
};


   
   
   $(function () {
       $(document).on("click", "button[name='modal_btn2']", function () {
          $(".modal_wrap2").show();
          $("#black_bg2").show();
        });
       
       $(document).on("click", "button[name='modal_close2']", function () {
          $(".modal_wrap2").hide();
          $("#black_bg2").hide();
        });
       
      });
   
   
   
   $(function () {
	   
       $(document).on("click", "button[name='modal_btn']", function () {
          $(".modal_wrap").show();
          $(".black_bg").show();
          $("#black_bg2").hide();
          
         
         
 
        }); 
       
  
       
      });
	

var travelStart;
var travelEnd;
var datearr=new Array();
var days;
var id; //일정 추가버튼 아이디
var id2; //메모버튼 아이디
var id3; //스케줄 삭제 아이디
var value;

var alldata=[];
var placearr=[];
var memodata=[];
var travelmemo;
var count=$('.count:last').val();
var count2=$('.count2:last').val();

$(function() {
	   $(function() {
	      
	        $('input[name="daterange"]').daterangepicker({
	          opens: 'left'
	       
	        }, function(start, end, label) {
	        	$('.content_wrap').empty();
	          const getDateDiff = (start, end) => {
	               const date1 = new Date(start);
	               const date2 = new Date(end);
	               const datearr=new Array();
               
	               const diffDate = date1.getTime() - date2.getTime();
	               days=Math.ceil(Math.abs(diffDate / (1000 * 60 * 60 * 24))); 
	               //console.log(days); //일 수
	               //console.log(date1); //Date 형식으로
	               const date=end.format('YYYY/MM/DD');
	               travelStart=start.format('YYYY/MM/DD');
	               travelEnd=end.format('YYYY/MM/DD');
	            
	               //console.log(date); //문자열식으로 가능
	               //document.querySelector(".dayseq1").append(days);
	               //document.querySelector(".firstdate").append(date);
	               
	                //date2.setDate(date.getDate())
           
	                 
	           	for(var j=days; j>0; j--){
	           			
	           			date22=date2.toISOString().substring(0,10);
	           			
	                    $(".uk-divider-icon").after(`<form action="<c:url value='/travel/insertTravelDetail'/>" method="post"  class="insertform"><div class="content_wrap"><div class="content_title"><label class="dayseq">DAY </label><label class="date"></label><input type="text" class="travelDate" name="travelDate" value=""/><button type="button" class="modal_btn2" name="modal_btn2" onClick="openModal2(this.id)"><input type="hidden" name="memo" value=""/><img src="${pageContext.request.contextPath}/resources/images/note.png"></button></div><button type="button" class="modal_btn" name="modal_btn" onClick="openModal(this.id)"><img src="${pageContext.request.contextPath}/resources/images/add.png"><label>일정 추가하기</label></button></div></form>`  );
	                    const dayseqs=j;
	                    const placemodal='placemodal'+j;
	                    const memomodal='memo'+j;
	                    const formid='form'+j;
	                    
	                    document.querySelector(".dayseq").id=dayseqs;
	                    document.querySelector(".date").id='traveldate'+dayseqs;
	                    document.querySelector(".dayseq").append(j);
	                    document.querySelector(".modal_btn").id=placemodal;
	                    document.querySelector(".modal_btn2").id=memomodal;
	                    document.querySelector(".insertform").id=formid;
	                    document.querySelector(".date").append(date22);
	                    document.querySelector(".travelDate").value=date22;
	                    document.querySelector(".modal_btn2").id=memomodal;
	                    document.querySelector("[name=memo]").classList.add(memomodal);
	                    //$('input[name=memo]').attr('class',memomodal);
	                    date2.setDate(date2.getDate()-1);
	                    //datearr.push(date22);
	                    
	                    
	                    console.log(date22);
	                    //console.log(date2.toISOString().substring(0,10));
	                  
	                  
	        		}
       
	             }
	          
	   
	             getDateDiff(start, end);
	        });
	        
	        
	        
	      });
	   
	    
	    
	});
	
	
	
 $(function () {
	
    $(document).on("click", "button[class='save']", function () {
    	if(confirm("저장 하시겠습니까?")==true){  
    	
    	var travelTitleValue=document.getElementById('title_input').value;
    	var travelStartValue=document.getElementById('startDate').value;
    	var travelEndValue=document.getElementById('endDate').value;
    	var travelDateValue=$('.travelDate').val();
    	if(!travelTitleValue){
    		document.getElementById('title_input').focus();
    	    alert("제목을 입력해주세요.");
    		console.log("제목없음");
    	}else if(!travelStartValue){
    		document.querySelector("#startDate").focus();
    	    alert("여행 시작일을 입력해주세요.");
    		console.log("시작일없음");
    	}else if(!travelEndValue){
    		document.querySelector("#endDate").focus();
    	    alert("여행 종료일을 입력해주세요.");
    		console.log("종료일없음");
    	}else if(!travelDateValue){
    	    alert("여행 일자를 빠짐없이 입력해주세요");
    		console.log("여행날짜없음");
    	}else{
    	
    	
        var travelStart1=$('#startDate').val();
        var travelEnd1=$('#endDate').val();
        var travelPrivacy= $('.open_radio:checked').val();
        var travelTitle= $('.title_input').val();
        var memberid=$('.memberId').val();
        var travelId=$('.travelId').val();
        
        //
        
      //비동기 요청을 함
        $.ajax({
           url:"/travel/updateTravel?value="+travelStart1+"&value2="+travelEnd1+"&value3="+travelTitle+"&value4="+travelPrivacy+"&value5="+travelId,
           method: "POST",
           success:function(result1){
        	   
        	  for(var k=1; k<=count; k++){
        		  (function(k){
        			  $.ajax({
                  		   url:"/travel/updateTravelDetail",
                  		   method: "POST",
                  		   data: $('#form'+k).serialize(),
                  		   success:function(result2){
                  			   if(k==count){ 
                  				location.replace("/travel/"+result2+"/"+memberid);
                  			   }
                  			   
                  			  
                  		   }
                  		   
                  	   });
        		  })(k);
  
        	  } 
        	  
			  
        	  	   
       		
           }
           
        });
      
      
     		
    	}
    	
    	
    }//확인 alert
    else {
    	return false;
    }
    

     });
}); 
 

	function cancelSchedule(clicked_id){
	
	id3=clicked_id;
	document.querySelector("#schedule"+id3).remove();

	}
	var dayaddnum=parseInt(count)+1;
	
	/* function dayadd(clicked_id){
		
		$(".modal_btn3").before(`<form action="<c:url value='/travel/insertTravelDetail'/>" method="post"  class="insertform0"><div class="content_wrap"><div class="content_title"><label class="dayseq0">DAY </label><label class="date0"></label><input type="text" class="travelDate" name="travelDate" value=""/><button type="button" class="modal_btn20" name="modal_btn2" onClick="openModal2(this.id)"><input type="hidden" name="memo0" value=""/><img src="${pageContext.request.contextPath}/resources/images/note.png"></button></div><button type="button" class="modal_btn" name="modal_btn" onClick="openModal(this.id)"><img src="${pageContext.request.contextPath}/resources/images/add.png"><label>일정 추가하기</label></button></div></form>`  );
        
		//const dayseqs=j;
		
		console.log(dayaddnum);
        const placemodal2='placemodal'+dayaddnum;
        const memomodal2='memo'+dayaddnum;
        const formid2='form'+dayaddnum;
        
        document.querySelector(".dayseq0").id=dayaddnum;
        document.querySelector(".date0").id='traveldate'+dayaddnum;
        document.querySelector(".dayseq0").append(dayaddnum);
        //document.querySelector(".modal_btn0").id=placemodal2;
        document.querySelector(".modal_btn20").id=memomodal2;
        document.querySelector(".insertform0").id=formid2;
        //document.querySelector(".date").append(date22);
        //document.querySelector(".travelDate").value=date22;
        document.querySelector(".modal_btn20").id=memomodal2;
        document.querySelector("[name=memo0]").classList.add(memomodal2);
       
        //date2.setDate(date2.getDate()-1); 
		dayaddnum+=1;

		} */
   

	function openModal(clicked_id){
	//console.log(clicked_id);
	id=clicked_id;
	document.querySelectorAll(".checkbox").forEach(function(v, i) {
		v.checked = false;
			}); 
		arr=[];
 
	}
	
	
	function openModal2(clicked_id){
		//console.log(clicked_id);
		$('.memo_textarea').val('');
		id2=clicked_id;
		var memos=document.querySelector("."+id2).value;
		$('.memo_textarea').val(memos);
		
	 
		}
	
  	  
	function closeModal() {
    
    $('input:checkbox[name=checkbox]').each(function (index) {
		if($(this).is(":checked")==true){
	    	arr.push($(this).val());
	    }
	})
	
    //console.log(id);
    //console.log(count2);
    count2=parseInt(count2);
    var count22=count2+1;
    var schedule="schedule"+count22;
    //console.log(schedule);
    var deletePlace="deletePlace"+count22;
    //console.log(arr[0]);
    	
    	for(var i=0; i<arr.length; i++){
    		var selectedplacename="";
    		//var num=i+1;
    		//console.log("카운트2: "+count2);
    		selectedplacename+='<div class="schedule_box" id="scheduledelete'+count22+'"><input type="text" class="schedule" value="'+arr[i]+'" name="placeName" readonly><button class="insert_num" onClick="cancelSchedule(this.id)" id="delete'+count22+'">X</button></div></div>';
    		document.getElementById(id).insertAdjacentHTML("beforeBegin",selectedplacename);
		
    		placearr.push(arr[i]);
    		count22+=1;
    		
	
    	} 
  
 
	
    	
  	 $(".modal_wrap").hide();
  	 $(".black_bg").hide();
 	 
   
 	}
	
	function closeModal2() {
	    
	    travelmemo= $('.memo_textarea').val();
	    console.log(id2);
	    //$("."+id).attr('value',travelmemo);
	    document.querySelector("."+id2).value=travelmemo;
	    		
	    	
	  	 $(".modal_wrap").hide();
	  	 $(".black_bg").hide();
	 	 
	   
	 	}


$(function(){
	   // 여기에 코드를 작성하면 HTML 문서가 로드된 후 실행
	   // console.log("Hello")
	   
	   $('#btnSearch').click(function(){
	      
	      var searchType0= $('#searchType').val();
	      var searchType=searchType0.substr(0,2);
	      var keyword= $('#keyword').val();
	      
	      //비동기 요청을 함
	      var request=$.ajax({
	         url:"/travel/insert/placelist",
	         method: "POST",
	         data:{searchType,keyword}
	         
	      });
	      request.done(function(data){
	          var leng=data.length;
	           //console.log(data[1]);
	           $('#place_list').empty(); 
	           
	           
	            for(i=0; i <leng; i++){
	               
	               var str="";
	               var fileSavedName=data[i].fileSavedName;
	               var filestr="";
	               if (fileSavedName===null){
	                  filestr+='<img class="place_img" src="${pageContext.request.contextPath}/resources/images/default.png"/>';
	               }
	               if (fileSavedName!==null){
	                  filestr+='<img class="place_img" src="/place/'+data[i].fileSavedName+'" />';
	               }
	               
	              str+='<div class="place"><div class="image_wrap">'+filestr+'</div>';
	              str+='<div class="place_content"><div class="title"><label class="place_name" id="place_name">'+data[i].placeName+'</label>';
	              str+='<input type="checkbox" class="checkbox" name="checkbox" value="'+data[i].placeName+'"></div>'
	              str+='<p class="place_area" id="place_area">'+data[i].areaName+'</p>';
	              str+='<label class="category_label"> <span id="category_label">'+data[i].category+'</span></label></div></div>';
	                  

	                 $('#place_list').append(str); 
	            
	            }
	               
	                  
	          
	            
	      });
	       request.fail(function( jqXHR, textStatus ) {
	            alert( "Request failed: " + textStatus );
	        });
	        request.always(function() {
	           
	        });
	        
	        
	      
	      
	   });
   
	   
	});

</script>

</html>