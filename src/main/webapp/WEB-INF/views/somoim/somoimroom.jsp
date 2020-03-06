<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7e29fa39462f45fc2138a8307dbe830&libraries=services"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<style>
#main {
	width: 100%;
	height: 1000px;
}

#top {
	margin: 50px auto;
	width: 80%;
	height: 200px;
	border: 1px solid black;
}

#bottom {
	margin: 0px auto 50px auto;
	width: 80%;
	height: 700px;
	display: flex;
	justify-content: center;
}
/* margin: 20px 50px 0px 0px */
#out1 {
	margin: 30px 50px 0px 0px;
	width: 45%;
	border: 1px solid black;
}

#out2 {
	margin: 30px 0px 0px 50px;
	width: 45%;
	border: 1px solid black;
}

.nav-item {
	width: 33%;
}

.basicInfoframe {
	margin: 10px 0 10px 0;
	padding: 10px 0 10px 0;
	display: flex;
	border-top: 1px solid;
	border-top-color: #BDBDBD;
	border-bottom: 1px solid;
	border-bottom-color: #BDBDBD;
}

.jmimg {
	width: 15%;
}

.upDate {
	padding: 0px;
	width: 100%;
	height: 30%;
}

.jmday {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

.downDate {
	border-left: 1px solid;
	border-left-color: #bd2130;
	border-right: 1px solid;
	border-right-color: #bd2130;
	border-bottom: 1px solid;
	border-bottom-color: #bd2130;
	height: 65%;
	width: 100%;
	display: table;
}

.jmdetail {
	margin: 0px 20px 0px 20px;
	width: 40%;
}

.Jungmobtns {
	width: 25%;
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: space-between;
}
</style>

</head>
<body>
	<div id="main">
		<div id="top"></div>
		<br>
		<div id="bottom">
			<div id="out1">
				<!-- Nav pills -->
				<ul class="nav nav-pills" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="pill" href="#noti">공지</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="pill"
						href="#board">게시글</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="pill"
						href="#album">사진첩</a></li>
				</ul>




				<!-- Tab panes -->
				<div class="tab-content">
					<div id="noti" class="container tab-pane active">

						<hr>
						<h2 id="introduceTitle"></h2>
						<br>
						<div id="introduceContent"></div>
						<hr>

						<div id="jungmolist">

							<div>

								<img data-somoimnum=${roomnum } data-toggle="modal"
									data-target="#myModal" id="makeSomoim" width="85px"
									height="85px" src="../resources/somoimimage/makemoim.PNG">&nbsp정모만들기

							</div>

						</div>

						<hr>
						<div>회원 회원</div>
						<hr>
						<div>탈퇴하기</div>
					</div>

					<div id="board" class="container tab-pane fade">
						<br>
						<h3>Menu 1</h3>
						<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco
							laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>

					<div id="album" class="container tab-pane fade">
						<br>
						<h3>Menu 2</h3>
						<p>Sed ut perspiciatis unde omnis iste natus error sit
							voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
					</div>
				</div>
			</div>

			<div id="out2">
				<div id="chattingRoom"></div>

				<div id="cont2">
					<input type="text">
					<button></button>
				</div>
			</div>
		</div>
	</div>


	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Modal Heading</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">Modal body..</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
console.log("회원",${JsonMemberList})
console.log("정모모임",${JsonJungmoRoom})
console.log("내참석리스트",${JsonAttendlist})
var Attendlist = ${JsonAttendlist}
for(let add = 0 ; add < ${JsonJungmoRoom}.length-Attendlist.length; add++){
	Attendlist.push({});
}
console.log("기본정보",${JsonBasicInfo})

	$("#makeSomoim").on("click", function(){
		$(".modal-title").text("");
		$(".modal-body").empty();
		
		 $(".modal-body").load("../resources/jsp/somoim/jungmomake.jsp");
		
		
	})

	const formData=()=>{
	console.log("formData 실행")
	//formDATA 사용목적
	//1.multipart/form-data 를 전송시 무조건 사용(파일업로드)
	//2.ajax를 이용한 restFul에서 사용함
	//3.formdata객체는 form의 일부데이터만 서버에 전송할때도 좋슴.
	
	var formData = new FormData(document.getElementById("JMform"));
	console.log("이름",formData.get("jungmo_name"))
	console.log("날짜",formData.get("jungmo_date"))
	console.log("시간",formData.get("jungmo_time"))
	console.log("장소",formData.get("jungmo_location"))
	console.log("돈",formData.get("jungmo_money"))
	console.log($("#makeSomoim")[0].dataset.somoimnum);
	formData.append('somoim_number',$("#makeSomoim")[0].dataset.somoimnum)
	
	$.ajaxSetup({         
      beforeSend : function(xhr){
         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
      });//먼저 보냄
      
	$.ajax({
		url:'jungmomoim',
		type:'post',
		data:formData,
		processData:false,
		contentType:false,  //제이슨 아니니깐 까보지마!!
	 	dataType:"json", //rest 컨트롤 이용	
		success:function(data){
			alert("success");
			console.log(data)
		},
		error:function(error){
			alert("fail")
			console.log(error);
		}
		
	})
}
	
	
	$("#introduceTitle").text(${JsonBasicInfo}.somoim_name);
	$("#introduceContent").text(${JsonBasicInfo}.somoim_introduce);
	
	const week = ['일', '월', '화', '수', '목', '금', '토'];
	
	for( let i of ${JsonJungmoRoom}){
		
		var frame = $("<div class='basicInfoframe' data-jungmonum='"+i.jungmo_number +"'></div>")
		var img = $("<div class='jmimg' ><div class='upDate btn btn-danger btn-sm'>"+week[new Date(i.jungmo_date).getDay()] +"</div><div class='downDate'><div class='jmday'>"+new Date(i.jungmo_date).getDate()+"</div></div></div>")
		var detail = $("<div class='jmdetail'><div><img width='13px' height='13px' src='"+"../resources/somoimimage/time.PNG"+"' >&nbsp&nbsp"+getFormatTime(i.jungmo_date, i.jungmo_time) +"</div><div><img width='13px' height='13px' src='"+"../resources/somoimimage/location.PNG"+"' >&nbsp&nbsp"+i.jungmo_location +"</div><div><img width='13px' height='18px' src='"+"../resources/somoimimage/coin.PNG"+"' >&nbsp&nbsp"+i.jungmo_money +"</div></div>")
		
		var btns = $("<div class='Jungmobtns'></div>");
		
		var joinbtn ;
		
		
		
		var JsonAttendlistIDX = 0;
		for(let j of Attendlist){ // 내 참석 돌리기
			
			if(i.jungmo_number === j.jungmo_number){
				joinbtn= $("<div><button data-jungmonum='"+i.jungmo_number +"' data-somoim='"+i.somoim_number +"' class='jungmojoinbtn'>취소</button></div>");
				Attendlist.splice(JsonAttendlistIDX, 1)
				
			}else{
				joinbtn= $("<div><button data-jungmonum='"+i.jungmo_number +"' data-somoim='"+i.somoim_number +"' class='jungmojoinbtn'>참석</button></div>");
			}	
			JsonAttendlistIDX++;
		}
		
		
		console.log("Attendlist : ",Attendlist.length)
		console.log("Attendlist : ",Attendlist)
			
		
		
		var showjoinlist = $("<div><button>참석자</button></div>");
		btns.append(joinbtn);
		btns.append(showjoinlist);
		
		
		frame.append(img);frame.append(detail);frame.append(btns);
		$("#jungmolist").append(frame);
		
		console.log(getFormatDate(i.jungmo_date))
		getFormatTime(i.jungmo_date, i.jungmo_time);
	}
// 	<div >

// 	<img data-somoimnum=${roomnum} data-toggle="modal"
// 		data-target="#myModal" id="makeSomoim" width="85px"
// 		height="85px" src="../resources/somoimimage/makemoim.PNG">&nbsp정모만들기

// 	</div>
	
	// 날짜 포맷 변환기  str -> date ->str
	function getFormatDate(strdate){
		var date = new Date(strdate);
		console.log(date);
  		 var year = date.getFullYear();              //yyyy
    	var month = (1 + date.getMonth());          //M
    	month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    	var day = date.getDate();                   //d
    	day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    	return  year + '/' + month + '/' + day;
	}
	
	// 시간 포맷 변환기 13:00 -> 오후 1:00 //"2020-03-18 00:00:00.0"  // jungmo_time
	function getFormatTime(strdate, strtime){
		var date = new Date(strdate);
		var year = date.getFullYear();              //yyyy
    	var month = (1 + date.getMonth());          //M
    	month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    	var day = date.getDate();                   //d
    	day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    	
		var totalDate  = year + '-' + month + '-' + day+" "+strtime;  // 시간 형식을 맞추기 위해 어쩔수 없이 더해야함
		//시간제조
		var timeform = new Date(totalDate);
		
		var time = timeform.getHours();
		var min = timeform.getMinutes();
		var result ;
		if(time > 12){
			result = year + '/' + month + '/' + day+" "+"오후 "+time-12+"시 "+min+"분"
		}else{
			result = year + '/' + month + '/' + day+" "+"오전 "+time+"시 "+min+"분"
		}
		
		return result;
	}
	
	
	//참석버튼 클릭시 <->취소 전환   // 참석 있고 없고 -> 
	$(".jungmojoinbtn").on("click", function(e){
		// 참석데이터에 넣기 위한 데이트 모음 : 
		console.log(e.target.dataset.jungmonum)
		console.log(e.target.dataset.somoim)
		console.log(e.target.textContent)
		var url;
		
		e.target.textContent === '참석' ? url='attendjungmo' : url='cancelAttendjunmo';
		
		console.log("url  : " , url)
		
		var data = {
			"jungmo_number" : e.target.dataset.jungmonum,
			"somoim_number" : e.target.dataset.somoim,
		}
		
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		      });//먼저 보냄
	
		      $.ajax({
		  		url: url,
		  		type: 'post',
		  		data: data,
		  		dataType: "json", //rest 컨트롤 이용	
		  		success:function(data){
		  			alert("success");
		  			console.log(data)
		  			if(data.result==="참석"){
		  				$("button[data-jungmonum='"+e.target.dataset.jungmonum+"']").text("취소")
		  			}else{
		  				$("button[data-jungmonum='"+e.target.dataset.jungmonum+"']").text("참석")	
		  			}
		  		},
		  		error:function(error){
		  			alert("fail")
		  			console.log(error);
		  			
		  		}
		  		
		  	})  
		
		
		
		
		
		
	})
	
</script>
</html>