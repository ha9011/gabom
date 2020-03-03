<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙박예약</title>
<!-- jQuery -->
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
			<div id="middle"><!-- 숙소정보, 예약 display:flex-->
				<div id="info">숙소정보</div>
				<div id="reservation">
				예약선택
					<form action="reservation">
						<input type="text" name="datefilter" value="" />
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

var title = $('<h1>'+food[0].food_name+'</h1>'); // 집 이름 
$("#title").append(title);

var mainimg =$('<img style="width:100%;height:470px" alt='+food[0].food_sysname+' src="'+food[0].food_sysname+'">');
$("#mainimg").append(mainimg);

var a=$('<img class="detail" style="width:49%;height:235px" alt='+food[1].food_sysname+' src="'+food[1].food_sysname+'">');
var b=$('<img style="width:49%;height:235px" alt='+food[1].food_sysname+' src="'+food[2].food_sysname+'">');
var c=$('<img class="detail" style="width:49%;height:235px" alt='+food[1].food_sysname+' src="'+food[3].food_sysname+'">');
var d=$('<img style="width:49%;height:235px" alt='+food[1].food_sysname+' src="'+food[4].food_sysname+'">');
$("#detailimg1").append(a);
$("#detailimg1").append(b);
$("#detailimg2").append(c);
$("#detailimg2").append(d);
//------------------------------------------------------------------------------이미지 영역

var food_info= $('<div class="info"><img alt=집 width="30px" height="25px" src="./resources/foodimg/food.JPG">'+'&nbsp'+'&nbsp'+'주소:'+food[0].food_address+'  '+'<br>'
        +'<img alt=사람 width="25px" height="30px" src="./resources/foodimg/person.JPG">' +'&nbsp'+'&nbsp'+'수용가능인원:'+food[0].food_person+'<br>'
        +'<img alt=주차장 width="30px" height="25px" src="./resources/foodimg/parking.JPG">'+'&nbsp'+'&nbsp' +'주차장:'+food[0].food_parkable+'<br>'
        +'<img alt=영업시간 width="30px" height="25px" src="./resources/foodimg/open.JPG">'+'&nbsp'+'&nbsp' +'오픈시간:'+food[0].food_mintime+'<br>'
        +'<img alt=영업시간 width="30px" height="25px" src="./resources/foodimg/open.JPG">'+'&nbsp'+'&nbsp' +'마감시간:'+food[0].food_maxtime+
        '</div>')
$("#info").append(food_info);
//-----------------------------------------------------------------------------------------info영역

</script>

</html>