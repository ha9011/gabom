<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙박예약</title>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 날짜 시간 --><!-- 
<link rel="stylesheet" href="./resources/css/timepicker-addon.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->

<!-- 검색창 부트스트랩 -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous"> 


<style>
body{overflow:scroll;}
.form-control-borderless {
    border:none;
}

.form-control-borderless:hover, .form-control-borderless:active, .form-control-borderless:focus {
    border: none;
    outline: none;
    box-shadow: none;
}
#title{/*숙소명 */
	margin:50px 40%;
	width:600px; 
}
#Imagearea{/*사진영역 */
	margin:10px 5%;
	width:90%;
	height:500px;
	display:flex;
}
#mainimg{
	margin:10px 0;
	margin-right:30px;
	width:50%
}
#detail{
	margin-left:20px;	
	margin:10px 0;
	width:50%
}
.detail{
	margin:5px;
}
#middle{/*숙소정보, 예약 */
	display:flex;
	margin:10px 5%;
	width:90%;
}
#info{/*숙소정보 */
	width:50%;
	margin-right:10px;
	height:200px;
	border:2px solid black;
}
#reser{/*예약 */
	margin-left:20px;
	width:50%;
	height:200px;
	border:2px solid black;
}
#bottom{/*주의사항, 후기, 문의사항 */
	display:flex;
	margin:10px 5%;
	width:90%;
	height:300px;
}
#reple{/*댓글 */
	margin-left:20px;
	width:50%;
	border:2px solid black;
}
#prarea{
	margin-right:10px;
	width:50%;
}
#Precautions{/*주의사항 */
	width:100%;
	margin-right:10px;
	border:2px solid black;
}

#review{
	width:100%;
	margin:10px 0;
	margin-right:10px;
	border:2px solid black;
	
}
</style>

</head>
<body>
		
<div class="container">
	<div class="row justify-content-center">
                        <div class="col-12 col-md-10 col-lg-8">
                                <div class="card-body row no-gutters align-items-center">
                                    <div class="col-auto"> <!-- 돋보기 -->
                                        <i class="fas fa-search h4 text-body"></i>
                                    </div>
                                    <!--end of col-->
                                    <div class="col"><!-- 검색창 -->
                                        <input id="changesearch" name="food_address" class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search topics or keywords">
                                    </div>
                                    <!--end of col-->
                                    <div class="col-auto"><!-- 검색버튼 -->
                                        <button id="searchbtn" class="btn btn-lg btn-success" type="submit">Search</button>
                                    </div>
                                    <!--end of col-->
                                </div>
                        </div>
                        <!--end of col-->
                    </div>
</div>
		
		<div id="food_main"><!-- 타이틀, 사진, 정보, 주의사항, 댓글, 후기, 예약이 담긴 div-->
			<div id="title"></div><!-- food_name -->
			<div id="Imagearea">
				<!-- food_mainImage크게  , food_detailImage 작게 4개 이상-->
				<div id="mainimg"></div>
				<div id="detail"><!-- display:flex -->
					<div id="detailimg1"></div>
					<div id="detailimg2"></div>
				</div>
				
			</div>
			<div id="middle"><!-- 음식점정보, 예약 display:flex-->
				<div id="info">정보</div>
				<div id="reser">
				예약선택
					<form id="reservation" name="reservation"  method="post">
						<!-- <img alt="예약달력" width="30px" height="30px" src="./resources/houseimg/date1.JPG"> 
						<input class="date" type="text" name="foodreservation_date" id="datepicker1">
						<img alt="예약시간" width="30px" height="30px" src="./resources/houseimg/time.JPG"> 
						<input class="time" type="time" name="foodreservation_time" id="time"> -->
						날짜:<input type="text" id="datepicker" class="datepicker" />
                                                          시간:<input type="text" id="timepicker" class="timepicker" />
						인원 : <input name="foodreservation_person" type="number" id="person">명 
						<input type="hidden" name="food_hostid" id="hostid" > 
						<input type="hidden" name="food_number" id="food_number"><br>
						<button style="width: 200px" type="submit" id="insertbtn">예약하기</button>
					</form>	
					 
				</div>
			</div>
			
			<div id="bottom"><!-- 주의사항, 후기, 문의사항  display:flex -->
				<div id="prarea"><!-- 주의사항,후기  display:flex -->
					<div id="Precautions"><!-- 주의사항 -->
						<h2>주의사항</h2>
						<h4>예약 취소</h4>
						<h5>48시간 동안 취소 수수료 없음</h5>
						<h5>그 이후로 체크인 5일 전까지 취소하면 서비스 수수료를 제외한 전액이 환불됩니다.</h5>
					</div>
					<div id="review"><!-- 후기 -->
						<h4>후기</h4>
					</div>
				</div>
				<div id="reple"><!-- 댓글 -->
					<h4>댓글문의사항</h4>
				</div>
			</div>
		</div>
		
</body>
<script>
var food =${detailfood};
console.log(food[0]);

$(document).ready(function() {
    $('#hostid').val(food[0].food_hostid);
    $('#food_number').val(food[0].food_number);
});

var title = $('<h1>'+food[0].food_name+'</h1>'); // 집 이름 
$("#title").append(title);

var mainimg =$('<img style="width:100%;height:470px" alt='+food[0].food_sysname+' src="'+food[0].food_sysname+'">');
$("#mainimg").append(mainimg);

var a=$('<img class="detail" style="width:48%;height:235px" alt='+food[1].food_sysname+' src="'+food[1].food_sysname+'">');
var b=$('<img class="detail" style="width:48%;height:235px" alt='+food[1].food_sysname+' src="'+food[2].food_sysname+'">');
var c=$('<img class="detail" style="width:48%;height:235px" alt='+food[1].food_sysname+' src="'+food[3].food_sysname+'">');
var d=$('<img class="detail" style="width:48%;height:235px" alt='+food[1].food_sysname+' src="'+food[4].food_sysname+'">');
$("#detailimg1").append(a);
$("#detailimg1").append(b);
$("#detailimg2").append(c);
$("#detailimg2").append(d);
//------------------------------------------------------------------------------이미지 영역

var food_info= $('<div class="info"><img alt=가게 width="30px" height="25px" src="./resources/foodimg/food.JPG">'+'&nbsp'+'&nbsp'+'주소:'+food[0].food_address+'  '+'<br>'
        +'<img alt=사람 width="25px" height="30px" src="./resources/foodimg/person.JPG">' +'&nbsp'+'&nbsp'+'수용가능인원:'+food[0].food_person+'명'+'<br>'
        +'<img alt=주차장 width="30px" height="25px" src="./resources/foodimg/parking.JPG">'+'&nbsp'+'&nbsp' +'주차장:'+food[0].food_parkable+'<br>'
        +'<img alt=영업시간 width="30px" height="25px" src="./resources/foodimg/open.JPG">'+'&nbsp'+'&nbsp' +'오픈시간:'+food[0].food_mintime+'<br>'
        +'<img alt=영업시간 width="30px" height="25px" src="./resources/foodimg/open.JPG">'+'&nbsp'+'&nbsp' +'마감시간:'+food[0].food_maxtime+
        '</div>')
$("#info").append(food_info);
//-----------------------------------------------------------------------------------------info영역
$("#insertbtn").on("click", function (e) {
	  	e.preventDefault();
	 	console.log("ajax 예약");
        //var formData = $("#reservation").serializeObject();
       var formData = new FormData(document.getElementById("reservation")); 
        	
       //console.log(formData.get("reservation_checkin"));
       $.ajaxSetup({         
    	      beforeSend : function(xhr){
    	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
    	      });//먼저 보냄
        
        $.ajax({
            url:'frest/foodreservation',
            type:'post',
            data:formData,
            processData:false,
            contentType:false,  //제이슨 아니니깐 까보지마!!
             dataType:"json", //rest 컨트롤 이용   
            success:function(data){
               alert("예약완료");
               console.log(data)
               $("#reservation")[0].reset();
               
            },
            error:function(error){
               alert("예약실패")
               console.log(error);
            }
            
         })
    });
 
</script>
<script>

$(function() {
   //모든 datepicker에 대한 공통 옵션 설정
   $.datepicker.setDefaults({
      dateFormat: 'yy-mm-dd' //Input Display Format 변경
       ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
       ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
       ,changeYear: true //콤보박스에서 년 선택 가능
       ,changeMonth: true //콤보박스에서 월 선택 가능                
       ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
       ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
       ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
       ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
       ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
       ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
       ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
       ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
       ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
       ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
       ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
      
   });
   $.timepicker.setDefaults({
         // timepicker 설정
       timeFormat:'HH:mm:ss',
       controlType:'select',
       oneLine:true,      
   });
   
   $("#timepicker").timepicker();
   $("#timepicker").timepicker('setTime', new Date());

   //input을 datepicker로 선언
   $("#datepicker").datepicker();                    

   //From의 초기값을 오늘 날짜로 설정
   $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
   });
</script>
</html>