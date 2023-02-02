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
</head>
<body>
	<input type="hidden" class="memberId" value="${sessionScope.memberId}">

	<div class="outer">
		<div class="inner">
		
			<div class="selectdiv1">
				<label class="top_title">여행 일정 등록하기</label> <span> 
				<input type="radio" name="travelPrivacy" class="open_radio" id="open_radio1" value="a" checked><label for="open_radio1" class="open_radio_label">전체 공개</label> 
				<input type="radio" name="travelPrivacy" class="open_radio" id="open_radio2" value="f"><label for="open_radio2" class="open_radio_label">팔로우 공개</label> 
				<input type="radio" name="travelPrivacy" class="open_radio" id="open_radio3" value="p"><label for="open_radio3" class="open_radio_label">비공개</label></span> 
				<input type="text" name="daterange" class="daterange"
					value="01/01/2023 - 01/02/2023" readonly />
			</div>
			<div class="title_input_box">
				<input type="text" id="title_input" class="title_input" placeholder="일정 제목을 입력해주세요" name="travelTitle">
				<img class="title_input_img" id="title_input_img" src="../resources/images/pen.png">
			</div>

			<hr class="uk-divider-icon">

			<div class="content_wrap" id="test">
				<label class="firstlabel">여행 날짜를 선택해 주세요!</label>
				<input type="hidden" class="modal_btn2" name="modal_btn2">
				<input type="hidden" class="modal_btn" name="modal_btn">
			</div>	

			
				
				
		
				
			<!-- 장소모달 -->
			<div class="black_bg" id="black_bg1"></div>
			<div class="modal_wrap">
				<div>
					<div class="modal_wrap_box">
						<div class="place_sel_box">
							<img src="../resources/images/logo.png" class="place_sel_logo"><label
								class="place_title">관광지 선택하기</label><img
								src="../resources/images/x.png" class="place_title_x"
								id="place_title_x">
						</div>
						<div class="place_search_box">
							<span><select name="sido1" id="sido1" class="sido1"></select>
								<select name="searchType" id="searchType" class="gugun1"></select>
								<div class="search">
									<input type="text" class="select" spellcheck="false" name="keyword" id="keyword" value="${Search.keyword}"> 
									<button id="btnSearch" class="btnSearch">
									<img 
										src="../resources/images/search.png"></button>
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
						<img src="../resources/images/logo.png" class="memo_title_logo"><img
							src="../resources/images/x.png" class="memo_title_x"
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
	
	

window.onload = function() {
	var btnClear = document.querySelector('#title_input_img');
	btnClear.addEventListener('click', function(){
		console.log("click");
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
           console.log("클릭됨");
          $(".modal_wrap2").show();
          $("#black_bg2").show();
        });
       
       $(document).on("click", "button[name='modal_close2']", function () {
           console.log("클릭됨");
          $(".modal_wrap2").hide();
          $("#black_bg2").hide();
        });
       
      });
   
   
   
   $(function () {
	   
       $(document).on("click", "button[name='modal_btn']", function () {
           console.log("클릭됨");
          $(".modal_wrap").show();
          $(".black_bg").show();
          $("#black_bg2").hide();
          
         
         
 
        }); 
       
  
       
      });
	
</script>
<script>
var travelStart;
var travelEnd;
var datearr=new Array();
var days;
var id; //일정 추가버튼 아이디
var id2; //메모버튼 아이디
var id3=0; //스케줄 삭제 아이디
var id4;
var value;
var arr= new Array();
var alldata=[];
var placearr=[];
var memodata=[];
var travelmemo;




$(function() {
	   $(function() {
	      
	        $('input[name="daterange"]').daterangepicker({
	          opens: 'left'
	       
	        }, function(start, end, label) {
	        	$('.content_wrap').empty();
	          console.log("A new date selection was made: " + start.format('YYYY/MM/DD') + ' to ' + end.format('YYYY/MM/DD'));
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
	           			
	                    $(".uk-divider-icon").after(`<form action="<c:url value='/travel/insertTravelDetail'/>" method="post"  class="insertform"><div class="content_wrap"><div class="content_title"><label class="dayseq">DAY </label><label class="date"></label><input type="hidden" class="travelDate" name="travelDate" value=""/><button type="button" class="modal_btn2" name="modal_btn2" onClick="openModal2(this.id)"><input type="hidden" name="memo" value=""/><img src="${pageContext.request.contextPath}/resources/images/note.png"></button></div><button type="button" class="modal_btn" name="modal_btn" onClick="openModal(this.id)"><img src="${pageContext.request.contextPath}/resources/images/add.png"><label>일정 추가하기</label></button></div></form>`  );
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
	                
	           		 $("#test").after('<button class="save">확인</button>');
       
	             }
	          
	   
	             getDateDiff(start, end);
	        });
	        
	        
	        
	      });
	   
	    
	    
	});
	
	
	
 $(function () {
	
    $(document).on("click", "button[class='save']", function () {
    	
    	var travelTitleValue=document.getElementById('title_input').value;
    	if(!travelTitleValue){
    		document.getElementById('title_input').focus();
    	    alert("제목을 입력해 주세요.");
    		console.log("제목없음");
    	}else if(!travelStart){
    		document.querySelector(".daterange").focus();
    	    alert("날짜을 선택해 주세요.");
    		console.log("날짜없음");
    	}else if(id3==0){
    	    alert("일정을 선택해 주세요.");
    		console.log("일정없음");
    	}else{
      	

            console.log("날짜 전송");
            var travelStart1=travelStart.toString();
            var travelEnd1=travelEnd.toString();
            var travelPrivacy= $('.open_radio:checked').val();
            var travelTitle= $('.title_input').val();
            var memberid=$('.memberId').val();
            
            console.log(travelPrivacy);
            console.log(travelTitle);
            console.log(id);
        	
        
      //비동기 요청을 함
        $.ajax({
           url:"/travel/insertTravel?value="+travelStart1+"&value2="+travelEnd1+"&value3="+travelTitle+"&value4="+travelPrivacy,
           method: "POST",
           success:function(result1){
        	   console.log("travel전송");
        	   
        	  for(var k=1; k<=days; k++){
        		  (function(k){
        			  $.ajax({
                  		   url:"/travel/insertTravelDetail",
                  		   method: "POST",
                  		   data: $('#form'+k).serialize(),
                  		   success:function(result2){
                  			   console.log("form"+k+"전송");
                  			   console.log("k:"+k);
                  			   console.log("days:"+days)
                  			   if(k==days){ 
                  				console.log(result2);
                  				location.replace("/travel/"+result2+"/"+memberid);
                  			   }
	   
                  			  
                  		   }
        			  		
                  		   
                  	   });
        		  })(k);
  
        	  } 
        	  
  	   
       		
           }
           
        })
        .done(function(result) {
        	location.replace("/travel/list");
        });
      
      
    	}
    	
      
      
     		


     });
}); 
 
 	

	
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
	
/* 	function boxChecked(checked_value){
		value=checked_value;
		console.log(value);
		arr.push(value);
	} */

	function closeModal() {
    console.log("장소닫기");
    console.log(id);
    //console.log(arr[0]);
    
    $('input:checkbox[name=checkbox]').each(function (index) {
		if($(this).is(":checked")==true){
	    	console.log($(this).val());
	    	arr.push($(this).val());
	    }
	})
    	
    	for(var i=0; i<arr.length; i++){
    		var selectedplacename="";
    		var num=i+1;
    		id3+=1;
    		
    		selectedplacename+='<div class="schedule_box" id="scheduledelete'+id3+'"><input type="text" class="schedule" value="'+arr[i]+'" name="placeName" readonly><div class="insert_num" onClick="cancelSchedule(this.id)" id="delete'+id3+'">X</div></div></div>';	
    		document.getElementById(id).insertAdjacentHTML("beforeBegin",selectedplacename);
    		placearr.push(arr[i]);
    		console.log(arr[i]);
	
    	} 


    
    
  	 $(".modal_wrap").hide();
  	 $(".black_bg").hide();
 	 
   
 	}
	
	function cancelSchedule(clicked_id){
		
		id4=clicked_id;
		console.log(id4);
		document.querySelector("#schedule"+id4).remove();

		}
	
	function closeModal2() {
	    console.log("메모닫기");
	    
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

	      console.log(searchType);
	      console.log(keyword);
	      
	      //비동기 요청을 함
	      var request=$.ajax({
	         url:"/travel/insert/placelist",
	         method: "POST",
	         data:{searchType,keyword}
	         
	      });
	      request.done(function(data){
	         console.log(data);
	          var leng=data.length;
	           console.log(leng);
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
	            console.log('완료');
	           
	        });
	        
	        
	      
	      
	   });
   
	   
	});

</script>

</html>