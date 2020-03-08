<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙박예약</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- 검색창 부트스트랩 -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<!-- 달력 부트스트랩 -->
<style>
body{overflow:scroll;}
.form-control-borderless {
    border:none;
}

.form-control-borderless:hover, .form-control-borderless:active, .form-control-borderless:focus {
    outline: none;
    box-shadow: none;
    border:1px solid lightgray;
}
#title{/*숙소명 */
	text-align:center;
	margin:50px 40%;
	width:300px; 
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
	margin:3px;
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
#nolist{
	display:flex;
}
#insertbtn{
margin:-30px 65%;
}
#reservation{
margin:0 10%;
}
input{
width:200px;
height:30px;
margin:5px;
}
</style>

</head>
<body>
		
<form action="searchhouse" method="get" > <!-- housemain page에서 검색하는 것  -->
	<div class="container">
		<div class="row justify-content-center">
                        <div class="col-12 col-md-10 col-lg-8">
                                <div class="card-body row no-gutters align-items-center">
                                    <div class="col-auto"> <!-- 돋보기 -->
                                        <i class="fas fa-search h4 text-body"></i>
                                    </div>
                                    <!--end of col-->
                                    <div class="col"><!-- 검색창 -->
                                        <input id="searchhouse" name="house_address" class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search topics or keywords">
                                    </div>
                                    <!--end of col-->
                                    <div class="col-auto"><!-- 검색버튼 -->
                                        <button style="background-color:#064D84" id="searchbtn" class="btn btn-lg btn-success" type="submit">Search</button>
                                    </div>
                                    <!--end of col-->
                                </div>
                        </div>
                        <!--end of col-->
          </div>
	</div>
	</form>
		
		<div id="house_main"><!-- 타이틀, 사진, 정보, 주의사항, 댓글, 후기, 예약이 담긴 div-->
			<div id="title"></div><!-- house_name -->
			<div id="Imagearea">
				<!-- house_mainImage크게  , house_detailImage 작게 4개 이상-->
				<div id="mainimg"></div>
				<div id="detail"><!-- display:flex -->
					<div id="detailimg1"></div>
					<div id="detailimg2"></div>
				</div>
				
			</div>
			<div id="middle"><!-- 숙소정보, 예약 display:flex-->
				<div id="info">숙소정보</div>
				<div id="reser">
				<br>
					<form id="reservation" name="reservation" method="post">
						<img alt="예약달력" width="30px" height="30px" src="./resources/houseimg/date1.JPG"> 
						<input class="date" type="text" name="reservation_checkin" id="datepicker1">
						~~ 
						<img alt="예약달력" width="30px" height="30px"src="./resources/houseimg/date2.JPG"> 
						<input class="date" type="text" name="reservation_checkout" id="datepicker2">
						<button style="background-color:#064D84" type="button" id="dtcommit" class="btn btn-primary">날짜확정</button><br> 
						
						총액 : <input name="reservation_totalprice" type="text" id="totalprice" placeholder="">만원<br>
						인원 : <input name="reservation_person" type="number" id="person" value="">명 
						<input type="hidden" name="house_hostid" id="hostid" > 
						<input type="hidden" name="house_number" id="house_number"><br>
						
						<button style="width: 300px;background-color:#064D84" type="submit" id="insertbtn" class="btn btn-secondary btn-lg">예약하기</button>
					</form>
				</div>
			</div>
			
			<div id="bottom"><!-- 주의사항, 후기, 문의사항  display:flex -->
				<div id="prarea"><!-- 주의사항,후기  display:flex -->
					<div id="Precautions"><!-- 주의사항 -->
						<h2>주의사항</h2>
						<h5>체크인:오후 4:00 - 오후 10:00</h5>
						<h5>체크아웃:오전 11:00</h5>
					
						<div id="nolist">
							<div>
								 <img width="50px;" height="50px;" src="./resources/houseimg/no.JPG">흡연금지
							</div>
						
							<div>
								 <img width="50px;" height="50px;" src="./resources/houseimg/nopet.JPG">애완동물
								출입금지 
							</div>
						
							<div>
								<img width="50px;" height="50px;" src="./resources/houseimg/party.png">파티금지 
							</div>
						</div>
					<h4>예약 취소</h4>
					<h6>48시간 동안 취소 수수료 없음</h6>
					<h6>그 이후로 체크인 5일 전까지 취소하면 서비스 수수료를 제외한 전액이 환불됩니다.</h6>
						
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
var house =${detailhouse};
var test =${detailreser};
console.log(house[0]);
console.log(test);

$(document).ready(function() {
    $('#hostid').val(house[0].house_hostid);
    $('#house_number').val(house[0].house_number);
});

var title = $('<h1>'+house[0].house_name+'</h1>'); // 집 이름 
$("#title").append(title);

var mainimg =$('<img style="width:100%;height:470px" alt='+house[0].house_sysname+' src="'+house[0].house_sysname+'">');
$("#mainimg").append(mainimg);

var a=$('<img class="detail" style="width:48%;height:235px" alt='+house[1].house_sysname+' src="'+house[1].house_sysname+'">');
var b=$('<img class="detail" style="width:48%;height:235px" alt='+house[1].house_sysname+' src="'+house[2].house_sysname+'">');
var c=$('<img class="detail" style="width:48%;height:235px" alt='+house[1].house_sysname+' src="'+house[3].house_sysname+'">');
var d=$('<img class="detail" style="width:48%;height:235px" alt='+house[1].house_sysname+' src="'+house[4].house_sysname+'">');
$("#detailimg1").append(a);
$("#detailimg1").append(b);
$("#detailimg2").append(c);
$("#detailimg2").append(d);
//------------------------------------------------------------------------------이미지 영역

var house_info= $('<div class="info"><img alt=집 width="30px" height="25px" src="./resources/houseimg/house.JPG">'+'&nbsp'+'&nbsp'+'주소:'+house[0].house_address+'  '+'<br>'
        +'<img alt=돈 width="25px" height="20px" src="./resources/houseimg/money.JPG">' +'&nbsp'+'&nbsp'+'1박가격:'+house[0].house_price+'만원'+'<br>'
        +'<img alt=사람 width="25px" height="30px" src="./resources/houseimg/person.JPG">' +'&nbsp'+'&nbsp'+'수용가능인원:'+house[0].house_person+'<br>'
        +'<img alt=주차장 width="30px" height="25px" src="./resources/houseimg/parking.JPG">'+'&nbsp'+'&nbsp' +'주차장:'+house[0].house_parkable+'<br>'
        +'<img alt=방 width="30px" height="25px" src="./resources/houseimg/bed.JPG">'+'&nbsp'+'&nbsp'+'방갯수:'+house[0].house_rooms+'&nbsp'
        +'& 침대수:'+house[0].house_beds+'<br>'
        +'<img alt=욕실 width="25px" height="30px" src="./resources/houseimg/bath.JPG">'+'&nbsp'+'&nbsp'+'욕실:'+house[0].house_bathrooms+'<br>'+
        '</div>')
$("#info").append(house_info);
//-----------------------------------------------------------------------------------------info영역
 
 $("#totalprice").attr('placeholder', 'PRICE PER night : '+house[0].house_price +"원"  ); 
 $("#person").attr('placeholder', '최대인원 : '+house[0].house_person+"명"  ); // 넘길때 이벤트 줘야함.

 //인원 버튼 
   $("#person").keyup(function(){
	   console.log(typeof house[0].house_person)
	   if($(this).val()>Number(house[0].house_person)){
		   alert("수용인원을 초과하였습니다. 최대인원 : "+house[0].house_person);   
		   $(this).val("")	;
		   $(this).focus()	;
	   }else{
		      
	   }
	    
   })
 //-----------------------------------------------------------------------------------------------인원 및 총가격
  $("#insertbtn").on("click", function (e) {
	  	e.preventDefault();
	 	console.log("ajax 예약");
        //var formData = $("#reservation").serializeObject();
       var formData = new FormData(document.getElementById("reservation")); 
        	
       console.log(formData.get("reservation_checkin"));
       $.ajaxSetup({         
    	      beforeSend : function(xhr){
    	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
    	      });//먼저 보냄
        
        $.ajax({
            url:'hrest/housereservation',
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
	var disabledDays = [];  //"2020-01-15"
		
	$(document).ready(function(){
		
		$("#datepicker1").datepicker({
			
		 	dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		  
		    minDate:new Date(),
		    maxDate: new Date(house[0].house_maxdate.substr(0,10)),
			beforeShowDay:function(date){
				console.log("date:",date);
		        var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
		        return [ disabledDays.indexOf(string) == -1 ]
		    },
 		    onSelect: function(dateText) {  
		    	console.log(typeof dateText)
		    	console.log(dateText)  // 2020-01-21
		    	var select = new Date(dateText);
		    	
		    	if(a=="Invalid Date"){
		    		
		    	}else{
		    		$("#datepicker1").datepicker('option', 'minDate', new Date(dateText));
		    		$("#datepicker2").datepicker('option', 'minDate', new Date(dateText));
	    			
		    		
		    		for(i in disabledDays){
		    			var ss = new Date(disabledDays[i])
		    			console.log(select.getDate());
		    			console.log(ss.getDate());
		    			console.log(ss.getDate()-select.getDate())
		    			if(ss.getDate()-select.getDate()>0){ //양수일때  // 1일차이일때 이벤트도 줘야함.
		    				$("#datepicker1").datepicker('option', 'maxDate', new Date(disabledDays[i]));
		    				$("#datepicker2").datepicker('option', 'maxDate', new Date(disabledDays[i]));
		    				break;
		    			}else{ //음수일때
		    				
		    			}
		    			
		    		}
		    		
		    	}
		    	
 		    }



			});
		
		
	$("#datepicker2").datepicker({
			
		 	dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		  
		    minDate:new Date(),
		    maxDate: new Date(house[0].house_maxdate.substr(0,10)),
			beforeShowDay:function(date){
		        var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
		        return [ disabledDays.indexOf(string) == -1 ]
		    },
 		    onSelect: function(dateText) {  
		    	console.log(dateText)
		    	var a = new Date(disabledDays[0]);
		    	
 		    }



			});
			
			
		
	});
	
	$('#dtcommit').on('click',function(){
		console.log("testtest");
		
		var sdate = $('#datepicker1').val();  
		var ddate = $('#datepicker2').val();  
		  
		var ar1 = sdate.split('-');
	    var ar2 = ddate.split('-');  
	    
	    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
	    var da2 = new Date(ar2[0], ar2[1], ar2[2]);
		  
	    var dif = da2 - da1;
	    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
	    var cMonth = cDay * 30;// 월 만듬
	    var cYear = cMonth * 12; // 년 만듬
		
	    if(sdate && ddate){
			console.log(parseInt(dif/cDay))
			$("#totalprice").val(parseInt(dif/cDay)*house[0].house_price);
		 } 

	})
	
	
var listDate = [];
var checkeddate = ${detailreser};
for(i of checkeddate){
	
	var st = new Date(i.reservation_checkin);

	var smonth = st.getUTCMonth() + 1; //months from 1-12
	var sday = st.getUTCDate();
	if(sday<10){
		sday = "0"+sday;
	}		
	
	
	
	var syear = st.getUTCFullYear();
	if(smonth<10){
		st = syear + "-0" + smonth + "-" + sday;
			
	}else{
		st = syear + "-" + smonth + "-" + sday;
		
	}
	
	
	
	console.log("st : " +st)
	//
	var ed = new Date(i.reservation_checkout);

	var emonth = ed.getUTCMonth() + 1; //months from 1-12
	var eday = ed.getUTCDate();
	if(eday<10){
		eday = "0"+eday;
	}	
	var eyear = ed.getUTCFullYear();

	if(emonth<10){
		ed = eyear + "-0" + emonth + "-" + eday;
			
	}else{
		ed = eyear + "-" + emonth + "-" + eday;
		
	}
	
	console.log("ed : " +ed)
	//
	disabledDays = getDateRange(st,ed,disabledDays)
	console.log()
} 

	function getDateRange(startDate, endDate, listDate){

        var dateMove = new Date(startDate);
        var strDate = startDate;

        if (startDate == endDate){

            var strDate = dateMove.toISOString().slice(0,10);
			console.log("strDate ",strDate);
            listDate.push(strDate);

        }else{

            while (strDate < endDate){

                var strDate = dateMove.toISOString().slice(0, 10);
                console.log("strDate ",strDate);
                listDate.push(strDate);

                dateMove.setDate(dateMove.getDate() + 1);

            }

        }

        return listDate;

    };
   
	
	console.log(disabledDays);
</script>

</html>