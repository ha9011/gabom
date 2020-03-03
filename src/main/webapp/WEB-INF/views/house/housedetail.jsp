<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙박예약</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	margin:50px 48%;
	width:200px; 
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
	margin-right:3px;
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
#reservation{/*예약 */
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
                                        <input id="changesearch" name="house_address" class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search topics or keywords">
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
				<div id="reservation">
				예약선택
					<form action="reservation">
						<img alt="예약달력" width="30px" height="30px" src="./resources/houseimg/date1.JPG"> 
						<input class="date" type="text" name="sdate" id="datepicker1">
						~~ <img alt="예약달력" width="30px" height="30px"src="./resources/houseimg/date2.JPG"> 
						<input class="date" type="text" name="edate" id="datepicker2">
						<button type="button" id="dtcommit">날짜확정</button><br> 
						총액 : <input name="tprice" type="text" id="totalprice" placeholder="">만원<br>
						인원 : <input name="tperson" type="number" id="person" value="">명 
						<input type="hidden" name="hostid" id="hostid" > 


						<input type="hidden" name="regnum" id="regnum"><br>
						<button style="width: 200px">예약하기</button>
					</form>				
				</div>
			</div>
			<div id="bottom"><!-- 주의사항, 후기, 문의사항  display:flex -->
				<div id="prarea"><!-- 주의사항,후기  display:flex -->
					<div id="Precautions"><!-- 주의사항 -->
						<h2>주의사항</h2>
						<h4>체크인:오후 4:00 - 오후 10:00</h4>
						<h4>체크아웃:오전 11:00</h4>
					
						<div id="nolist">
							<div>
								<!-- <img width="50px;" height="50px;" src="./img/no.JPG">흡연금지 -->
							</div>
						
							<div>
								<!-- img width="50px;" height="50px;" src="./img/nopet.JPG">애완동물
								출입금지 -->
							</div>
						
							<div>
								<!-- <img width="50px;" height="50px;" src="./img/party.png">파티금지 -->
							</div>
						</div>
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
var house =${detailhouse};
console.log(house[0]);

var title = $('<h1>'+house[0].house_name+'</h1>'); // 집 이름 
$("#title").append(title);

var mainimg =$('<img style="width:100%;height:470px" alt='+house[0].house_sysname+' src="'+house[0].house_sysname+'">');
$("#mainimg").append(mainimg);

var a=$('<img class="detail" style="width:49%;height:235px" alt='+house[1].house_sysname+' src="'+house[1].house_sysname.substr(2)+'">');
var b=$('<img style="width:49%;height:235px" alt='+house[1].house_sysname+' src="'+house[2].house_sysname+'">');
var c=$('<img class="detail" style="width:49%;height:235px" alt='+house[1].house_sysname+' src="'+house[3].house_sysname+'">');
var d=$('<img style="width:49%;height:235px" alt='+house[1].house_sysname+' src="'+house[4].house_sysname+'">');
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
</script>

</html>