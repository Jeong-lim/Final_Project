<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
 <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


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
	

</script>
<script>
$(function() {
  $('input[name="daterange"]').daterangepicker({
    opens: 'left'
  }, function(start, end, label) {
    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
  });

	
  
});

window.onload = function() {
	 
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

    document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('#modal_close').addEventListener('click', offClick);
    document.getElementById('modal_btn2').addEventListener('click', onClick2);
    document.querySelector('#modal_close2').addEventListener('click', offClick2);
    
    document.querySelector('#black_bg1').addEventListener('click', offClick);
    document.querySelector('#black_bg2').addEventListener('click', offClick2);
    
    document.querySelector('#memo_title_x').addEventListener('click',offClick2);
    document.querySelector('#place_title_x').addEventListener('click',offClick);
    
    

   
 
};

</script>
<style>
	.outer{
		text-align: center;
	}
	.inner{
		width:1000px;
		margin:auto;
		margin-top:50px;
		height:auto;
	}
	

	.sido1,.gugun1{
		background-color: white;
    cursor: pointer;
    width: 100px;
    height: 35px;
    border-radius: 27px;
    text-align: center;
	}
	
	
	
	.sido1 + .gugun1:focus{
		outline:0;
	}
	
	.daterange{
		width: 260px;
    height: 35px;
    text-align: center;
    margin-left: 100px;
    float: right;
    cursor: pointer;
    letter-spacing: 2px;
    border-radius: 19px;
    border:hidden;
    box-shadow: 0 1px 1px 1px gray;
	}
	
	.daterange:hover{
		background-color: #3B82F6;
		color:white;
		font-weight: bold;
		border:hidden;
		box-shadow: 0 2px 2px 2px gray;
	}
	
	.selectdiv1{
		width: 1000px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom:35px;

	}
	.daterange:focus{
		outline:none;
	}
	.content{
		width:1000px;
		height:200px;
		border:1px solid black;
		margin:auto;
		margin-top:40px;
	}
	
	.contentdiv{
		width:1000px;
		border-top:1px solid black;
		margin:20px auto;
	}
	.content_title{
		height: 45px;
    padding: 5px;
    margin-top: 30px;
    background: #FED049;
    border-radius: 15px;
    box-shadow: 2px 2px 2px lightgrey;
    display:flex;
	}
	.content_title label{
		font-size:23px;
		font-weight:bold;
		float:left;
		margin-left:10px;
		line-height:45px;
	}
	.content_title :nth-child(2){
		font-size:13px;
		font-weight:bold;
		float:left;
		line-height:45px;
		margin-left:10px;
		vertical-align: baseline;
	}
	.content_title img{
		width:35px;
		height:35px;
		float:left;
		margin-left:10px;
		padding:5px;

	}
	.content_box{
		vertical-align: middle;
		line-height:144px;
		height:144px;
		width:1000px;

	}
	.schedule_box img{
		width:35px;
		height:35px;
		float:left;
		margin:10px;
		
	}

	.modal_wrap{
        display: none;
       width: 800px;
    height: 600px;
    position: fixed;
    top: 45%;
    left: 41%;
    margin: -250px 0 0 -250px;
    background: white;
    z-index: 2;
    overflow: scroll;
    }
    .modal_wrap2{
        display: none;
       width: 500px;
    height: 380px;
    position: fixed;
    top: 50%;
    left: 50%;
    margin: -250px 0 0 -250px;
    background: white;
    z-index: 2;
    overflow: scroll;
    border-radius: 23px;
    }
    ::-webkit-scrollbar {
  		display: none;
	}
    .black_bg{
       display: none; 
    position: fixed;
    content: "";
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0,0, 0.5);
    top: 0;
    left: 0;
    z-index: 1;
    cursor:pointer;
    }
    .modal_close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
        cursor:pointer;
    }
    .modal_close> a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }
    .schedule_box button{
    	border: none;
    background-color: transparent;
    font-weight: bold;
    display: flex;
    align-items: center;
    cursor:pointer;
    }
    #modal_btn{
    width:130px;
    margin-top:20px;
    	border: none;
    background-color: transparent;
    border: 1px solid transparent;
    font-weight: bold;
    cursor: pointer;
    display: flex;
    align-items: center;
    border-radius: .25rem;
                    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
                    color: #0d6efd;
                    border-color: #0d6efd;
                    margin-left:10px;
    }
    #modal_btn:hover {
                        color: #fff;
                        background-color: #0d6efd;
                        border-color: #0d6efd;
                    }
    #modal_btn img{
    	width:35px;
    	height:35px;
    }
    .content_title button{
    	border:0;
    	background-color:transparent;
    	float:left;
    	cursor:pointer;
    }
    .memo_textarea{
    	margin-top: 37px;
    resize: none;
    width: 400px;
    font-size: 20px;
    height: 180px;
    padding: 10px;
    border: 2px solid #cfd2cf;
    	
    }
    .memo_textarea:focus{
    	outline:0;
    }
    .memo_title{
    	display: flex;
    height: 50px;
    align-items: center;
    justify-content: space-between;
    padding: 0 25px;
    box-shadow: 0 3px 6px rgb(0 0 0 / 0%), 0 3px 6px rgb(0 0 0 / 17%);
    	
    }
    .memo_title_logo{
    	width:150px;
    	height:45px;
    }
    .memo_title_x,.place_title_x{
    	width:20px;
    	height:20px;
    	cursor:pointer;
    }
    .memo_btn{
    	display: block;
    margin: auto;
    margin-top: 20px;
    border: 0;
    background-color: #3B82F6;
    width: 120px;
    height: 30px;
    border-radius: 20px;
    color: white;
    font-weight: bold;
    box-shadow: 3px 3px 3px grey;
    cursor: pointer;
 
    }
	.place_title{
    line-height: 40px;
    font-size: 20px;
    font-weight: bold;
    display: inline-block;
    margin-right: 25px;
    	
	}
	.place img{
		display:inline-block;
		width:200px;
		height:150px;
		margin:0;
		float:left;
	}
	.place{
		height:150px;
		border-top:1px solid black;
	}
	
	
	.place_btn{
	float: right;
    width: 50px;
    height: 35px;
    margin: 5px;
    border: none;
    box-shadow: 0 1px 1px 1px grey;
    background-color: #3B82F6;
    color: white;
    font-weight: bold;
    border-radius: 5px;
    cursor:pointer;
	}
	.place_btn:hover{
		background-color:#205295;
	}
	.memo_btn:hover{
		background-color: #205295;
	}
	.modal_wrap_box{
		position: fixed;
    height: 101px;
    z-index: 2;
	}
	.place_sel_box{
    width: 800px;
    height: 45px;
    background-color: white;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-sizing: border-box;
    padding: 0 10px;
    box-shadow: 0 3.2px 7.2px 0 rgb(0 0 0 / 13%), 0 0.6px 1.8px 0 rgb(0 0 0 / 11%);
    border-bottom:1px solid gray;
		
	}
	.place_search_box{
	background-color: white;
    display: flex;
    align-items: center;
    justify-content: space-between;
    box-sizing: border-box;
    padding: 0 4px 0 13px;
    border-bottom: 1px solid black;
    height: 56px;
    box-shadow: 0 3.2px 7.2px 0 rgb(0 0 0 / 13%), 0 0.6px 1.8px 0 rgb(0 0 0 / 11%);
		
	}
	.place_sel_logo{
		width:150px;
		height:45px;
	}
	.search img{
		width: 25px;
    height: 25px;
    padding: 3px;
    cursor:pointer;
	}
	.search{
		border: 1px solid black;
    display: inline-flex;
    border-radius: 16px;
    width: 176px;
    height: 33px;
    margin-left: 5px;
	}
	.select{
	border: none;
    padding: 5px;
    border-radius: 17px;
    cursor: pointer;
    width: 130px;
	}
	.select:focus{
		outline:0;
	}

	
	
	.place_content{
		display: inline-block;
    width: 600px;
    text-align: left;
	}
	
	.title{
		font-size:22px;
		font-weight:bold;
		margin:15px;
		
	}
	.title_s{
		font-size:12px;
		margin-left:15px;
	}
	input[type=checkbox]{
		width:25px;
		height:25px;
		float:right;
		cursor:pointer;
		
	}
	.schedule_box{
		height: 50px;
    overflow: scroll;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    margin-top: 13px;
	}
	
	.schedule{
	display: inline-block;
    height: 40px;
    width: 100%;
    line-height: 40px;
    text-align: left;
    margin: 0 10px;
    padding-left: 10px;
    box-shadow: 0 3px 6px rgb(0 0 0 / 16%), 0 3px 6px rgb(0 0 0 / 23%);
	}
	.save{
		display: inline-block;
    width: 150px;
    height: 40px;
    cursor: pointer;
    margin: 30px 0px;
    border: none;
    font-size: 20px;
    font-weight: bold;
    background-color: #3B82F6;
    color: white;
    border-radius: 5px;
    box-shadow: 0px 2px 2px 2px dimgrey;
	}
	.save:hover{
		color: #fff;
                        background-color: #0d6efd;
                        border-color: #0d6efd;
	}
	.open_radio{
		accent-color:#3B82F6;
		cursor:pointer;
	}
	.open_radio:checked + label {
		color:#3B82F6;
		accent-color:#3B82F6;
	}
	.open_radio_label{
		font-size: 18px;
		font-weight:bold;
		color:gray;
		cursor:pointer;
	}
	.top_title{
		font-size:32px;
	}
	.place_box{
		margin-top: 101px;
    position: absolute;
    z-index: 1;
    width: 800px;
	}
	.schedule_insert_box{
		height: 35px;
    width: 130px;
    border: 1px solid black;
    margin-top: 15px;
	}
	.schedule_insert_box img{
		height:35px;
		width:35px;
	}
	.insert_num{
	display: flex;
    width: 40px;
    height: 40px;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    box-shadow: 0 3px 6px rgb(0 0 0 / 16%), 0 3px 6px rgb(0 0 0 / 23%);
    margin-left: 5px;
	}
	
</style>
</head>
<body>
<%@ include file="../common/header.jsp"%>

<div class="outer">
	<div class="inner">
		<div class="selectdiv1" >
			<label class="top_title">여행 일정 등록하기</label>
			<span>
				<input type="radio" name="open_radio" class="open_radio" id="open_radio1" value="all" checked ><label for="open_radio1" class="open_radio_label">전체 공개</label>
				<input type="radio" name="open_radio" class="open_radio" id="open_radio2" value="follow" ><label for="open_radio2" class="open_radio_label">팔로우 공개</label>
				<input type="radio" name="open_radio" class="open_radio" id="open_radio3" value="private" ><label for="open_radio3" class="open_radio_label">비공개</label>
			</span>
			<input type="text" name="daterange" class="daterange" value="01/01/2023 - 01/02/2023" readonly/>
	    </div>
	    
	    <hr class="uk-divider-icon">
	    
	    
	    	
	    		<div class="content_title"><label>DAY 1</label><label>- 2022.2.14</label><button type="button" id="modal_btn2"><img src="${pageContext.request.contextPath}/resources/images/note.png"></button></div>
	    		<button type="button" class="modal_btn" id="modal_btn"><img src="${pageContext.request.contextPath}/resources/images/add.png"><label>일정 추가하기</label></button>
	    		
	    	
	    	
	    	
	    	
	    	
	    			<div class="content_title"><label>DAY 2</label><label>- 2022.2.15</label><button type="button" id="modal_btn2"><img src="${pageContext.request.contextPath}/resources/images/note.png"></button></div>
	    		
		    		<div class="schedule_box"><div class="insert_num">1</div><div class="schedule">경복궁</div></div>
		    		<div class="schedule_box"><div class="insert_num">2</div><div class="schedule">남산타워</div></div>
		    		<div class="schedule_box"><div class="insert_num">3</div><div class="schedule">청계천</div></div>
		    		<div class="schedule_box"><div class="insert_num">4</div><div class="schedule">북촌한옥마을</div></div>
		    		
		    		
		    		<button type="button" class="modal_btn" id="modal_btn"><img src="${pageContext.request.contextPath}/resources/images/add.png"><label>일정 추가하기</label></button>
	    		
	    	
	    	
	    	
	    	
	    	<div class="content_title"><label>DAY 3</label><label>- 2022.2.16</label><button type="button" id="modal_btn2"><img src="${pageContext.request.contextPath}/resources/images/note.png"></button></div>
	    		
	    			<button type="button" class="modal_btn" id="modal_btn"><img src="${pageContext.request.contextPath}/resources/images/add.png"><label>일정 추가하기</label></button>
	    	
	    	
	    	
	    	<button class="save" onclick="location.href='<c:url value="/travel/detail"/>'">확인</button>
	    
	    
	    
	    
	    
		<!-- 장소모달 -->
<div class="black_bg" id="black_bg1"></div>
<div class="modal_wrap">
        <div>
	        <div class="modal_wrap_box">
		    	<div class="place_sel_box"><img src="../resources/images/logo.png" class="place_sel_logo"><label class="place_title">관광지 선택하기</label><img src="../resources/images/x.png" class="place_title_x" id="place_title_x"></div>
		    	<div class="place_search_box"><span><select name="sido1" id="sido1" class="sido1"></select> <select name="gugun1" id="gugun1" class="gugun1"></select><div class="search"><input type="text" class="select" spellcheck="false"> <img src="../resources/images/search.png"></div></span> <button type="button" id="modal_close" class="place_btn">확인</button></div>
	    	</div>          
    	<div class="place_box">
	        	  <div class="place"><img src="${pageContext.request.contextPath}/resources/images/경복궁.jpg"><div class="place_content"><div class="title"><label>경복궁</label><input type="checkbox"></div> <div class="title_s">경복궁입니댱~~</div></div>
	        </div><div class="place"><img src="${pageContext.request.contextPath}/resources/images/남산타워.jpg"><div class="place_content"><div class="title"><label>남산타워</label><input type="checkbox"></div> <div class="title_s">소개글</div></div>
	        </div><div class="place"><img src="${pageContext.request.contextPath}/resources/images/청계천.jpg"><div class="place_content"><div class="title"><label>청계천</label><input type="checkbox"></div> <div class="title_s">소개글</div></div>
	        </div><div class="place"><img src="${pageContext.request.contextPath}/resources/images/travellist1.jpg"><div class="place_content"><div class="title"><label>북촌한옥마을</label><input type="checkbox"></div> <div class="title_s">소개글</div></div>
	        </div><div class="place"><img src="${pageContext.request.contextPath}/resources/images/travellist2.jpg"><div class="place_content"><div class="title"><label>국립중앙박물관</label><input type="checkbox"></div> <div class="title_s">소개글</div></div>
	        </div><div class="place"><img src="${pageContext.request.contextPath}/resources/images/travellist3.jpg"><div class="place_content"><div class="title"><label>남산타워</label><input type="checkbox"></div> <div class="title_s">소개글</div></div>
	        </div>
	    </div>
    </div>
</div>

<!-- 메모모달 -->
<div class="black_bg" id="black_bg2" ></div>
<div class="modal_wrap2" id="modal_wrap2">
    <div>
    	<div class="memo_title"><img src="../resources/images/logo.png" class="memo_title_logo"><img src="../resources/images/x.png" class="memo_title_x" id="memo_title_x"></div>
		<textarea class="memo_textarea" rows="10" cols="50" spellcheck="false"></textarea>
		<button type="button" class="memo_btn" id="modal_close2" >확인</button>

    </div>
</div>



	</div>
</div>

	



<%@ include file="../common/footer.jsp"%>
</body>

</html>