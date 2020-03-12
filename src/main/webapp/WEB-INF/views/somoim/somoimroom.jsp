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
#dropout {
	width: 100%;
}

.tab-content {
	height: 93%;
	overflow: auto;
}

#noti {
	
}

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

.attendListFrame {
	border: 1px solid black;
	margin-top: 3px;
	display: flex;
}

.attendPic {
	width: 100%;
	height: 100%;
	margin
}

.attendPicFrame {
	width: 15%;
}

.attendCont {
	margin-left: 10px;
}

/* 게시글 */
.boardCamera {
	width: 20%;
	height: 20%
}

.boardFrame {
	height: 10%;
	border: 1px solid black;
	margin: 5px 0 5px 0;
}

.profileFrame {
	display: flex;
	margin: 0 0 10px 0;
}

.photoSection {
	width: 10%;
	height: 10%;
}

.contentFrame {
	display: flex;
	
}

.picSection {
	width: 20%;
	height: 20%;
}

.titleSection {
	margin-left: 4%;
	width: 76%;
	height: 76%;
	width: 76%;
}
#boardlikeframe{
	display:flex;
	flex-direction: row;
	justify-content: space-around;
	align-items: center;
	height: 30px;
}
.boardlikebtn{
	width: 30px;
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
					<li class="nav-item"><a id="boardListSection"
						onclick="showboardlist()" class="nav-link" data-toggle="pill"
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
									data-target="#mySMModal" id="makeSomoim" width="85px"
									height="85px" src="../resources/somoimimage/makemoim.PNG">&nbsp정모만들기

							</div>

						</div>

						<hr>
						<div id="MemberList">회원 회원</div>
						<hr>
						<div>
							<button id="dropout" data-somoimnum=${roomnum
								}
								class="btn btn-danger">탈퇴하기</button>
						</div>
					</div>

					<div id="board" class="container tab-pane fade">
						<br>
						<button data-toggle="modal" data-target="#myBoardModal"
							id="boardWriteBtn" class="btn btn-info">글쓰기</button>
						<div id="somoimBoardCont"></div>


					</div>


					<div id="album" class="container tab-pane fade">
						<br>
						<div>
							<jsp:include page="/WEB-INF/views/somoim/jungmoalbum.jsp" /> 
						</div>
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


	<!-- The Modal 작은창 -->
	<div class="modal fade" id="mySMModal">
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

	<!-- The Modal 작은창 board창  -->
	<div class="modal fade" id="myBoardModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">글쓰기</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">

					<form action="boardwrite" name="boardFrm" id="boardFrm"
						method="post" enctype="multipart/form-data">
						<label for="type">종 류</label> <select name="boardtype"
							class="custom-select" required="required">
							<option selected>선택하세요</option>
							<option value="introduce">가입인사</option>
							<option value="free">자유게시판</option>
							<option value="noti">공지사항</option>
							<option value="jungmo">정모</option>
						</select> <br> <br>
						<div class="form-group">
							<label for="title">글 제목</label> <input type="text"
								class="form-control" placeholder="글 제목(20)" name="boardtitle"
								id="boardtitle">
						</div>

						<div class="form-group">
							<label for="content">글 내용 </label>
							<textarea placeholder="글 내용" class="form-control" rows="5"
								id="boardCont" name="boardCont"></textarea>

						</div>


						<div>
							<label for="title">사진 </label><br> <img id="imgfirstPic"
								data-input="firstPic" class="boardCamera"
								src="../resources/somoimimage/camera.PNG" /> <img
								id="imgsecondPic" data-input="secondPic" class="boardCamera"
								src="../resources/somoimimage/camera.PNG" /> <img
								id="imgthirdPic" data-input="thirdPic" class="boardCamera"
								src="../resources/somoimimage/camera.PNG" />
						</div>

						<input type="file" id="firstPic" name="firstPic"
							class='boardInputFile' style="display: none"> <input
							type="file" id="secondPic" name="secondPic"
							class='boardInputFile' style="display: none"> <input
							type="file" id="thirdPic" name="thirdPic" class='boardInputFile'
							style="display: none;"> <br> <br>
						<div class="form-group form-check">
							<label class="form-check-label"> <input
								class="form-check-input" type="checkbox" name="mainboard"
								id="mainboard" value="고정">게시글 상위고정
							</label>
						</div>

						<button type="button" onclick="formBoardData()"
							data-dismiss="modal" class="btn btn-primary">작성하기</button>
					</form>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>

	<!-- The Modal 게시글 보여주기-->
	<div class="modal fade" id="ShowBoardModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">글쓰기</h4>
					<!-- 					<div id="writerProfile"> -->
					<!-- 						<div></div> -->
					<!-- 						<div> -->
					<!-- 							<div></div> -->
					<!-- 							<div></div> -->
					<!-- 						</div> -->
					<!-- 						<div></div> -->
					<!-- 					</div> -->
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">

					<div>
						<div id="showBoardTitle">제목</div>
						<hr>
						<br>
						<div id="showBoardContent">내용</div>
						
						<div id="showfirstPic">사진1</div>

						<div id="showsecondPic">사진2</div>

						<div id="showthirdPic">사진3</div>
					</div>
					<hr>
					
					<div id="boardlikeframe">
						<div class='boardlikebtn' id="boardlikebtnframe"></div>
						<div class='boardlikebtn'><img  onclick="boardreplebtn(this)" data-reple='0' width='100%' height='100%' src="../resources/somoimboard/reple.PNG"></div>
					</div>
					<hr>
					<div>
						<div><img width='5%' height='5%' src="../resources/somoimboard/like.PNG"><span id="countlike"></span> 명이 이 글을 좋아합니다</div>
					</div>
					<hr>
					
					<div id="boardreplebtnframe" >
						<input id="repleinput" style='width:85%;' type="text" >
					</div>
					<hr>
					<div id="replelist">
					댓글창 보여주기
					</div>
					
					<ul id="replepaging" class="pagination">
  					 
  					</ul>
  					
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>


</body>
<script type="text/javascript">
 $(document).ready(function(){
	 console.log("---------시작")
	 $(document).on("click",".pagebtn", function(e){
		 console.log(e.target.dataset.bnum);
		 console.log(e.target.dataset.page);

		 var board_number =e.target.dataset.bnum;
		 var paging_number =e.target.dataset.page;
		 console.log("board_number  : " + board_number );
		 console.log("paging_number  : " + paging_number );
		 var data = {
				 "board_number" : board_number,
				 "paging_number" : paging_number,
		 }
		 console.log("data  : " + data);
		 $.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		      });//먼저 보냄
		      
			$.ajax({
				url:'replelist',
				type:'post',
				data:data,
			 	dataType:"json", //rest 컨트롤 이용	
				success:function(data){
					alert("success");
					console.log(data)
					
					
					//댓글
					$("#replelist").empty();
					//페이징 
					$("#replepaging").empty();
					
					// 페이징 채우기
					$("#replepaging").html(data.htmlPaging)
					
					//게시글 채우기
					for(let v of data.somoimreple){
		  				var time = new Date(v.somoim_board_reple_date).getHours();
						var min = new Date(v.somoim_board_reple_date).getMinutes();
						
						var resulttime ;
						if(parseInt(time) > 12){
							resulttime = " 오후 "+(parseInt(time)-12)+"시 "+min+"분"
						}else{
							resulttime = " 오전 "+time+"시 "+min+"분"
						}
						
						var boardFrame = $("<div  data-Bnum='"+v.board_number+"' data-Snum='"+v.somoim_number+"'   class='boardFrame showBoard'></div>")
						
						var profileFrame = $("<div class='profileFrame'></div>")
						var photoSection = $("<div class='photoSection'><img class='rounded-circle' width='90%' height='90%' src='."+v.member_profile_picture+"'></div>")
						var nameSection = $("<div><div>"+v.somoim_board_reple_name+"</div> <div>"+getFormatDate(v.somoim_board_reple_date)+resulttime+"</div></div>")
						profileFrame.append(photoSection);
						profileFrame.append(nameSection);
						
						var contentFrame = $("<div class='contentFrame'></div>")
						let content=v.board_content
						
						var contentSection = $("<div class='titleSection'><div>"+v.somoim_board_reple_content+"</div></div>")
						contentFrame.append(contentSection);
						

						boardFrame.append(profileFrame);
						boardFrame.append(contentFrame);
						
						$("#replelist").append(boardFrame);
		  			
		  			}
					
				},
				error:function(error){
					alert("fail")
					console.log(error);
				}
			})
		 
		 
		 
		 
		 
	})
 })

console.log("회원",${JsonMemberList})
console.log("정모모임",${JsonJungmoRoom})
console.log("내참석리스트",${JsonAttendlist})
var Attendlist = ${JsonAttendlist};
var boardlist = ${JsonBoardList};
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
			
			// 기존 페이징 empty 게시글 empty
			
			
			
			
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
			
		
		
		var showjoinlist = $("<div><button data-toggle='modal' data-title='"+getFormatTime(i.jungmo_date, i.jungmo_time)+"'data-target='#mySMModal' class='showAttendList' data-jungmonum='"+i.jungmo_number +"'>참석자</button></div>");
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
		
		
		
	})//end
	
	
	//참석리스트 보기
	$(".showAttendList").on("click", function(e){
		console.log("gg")
		console.log("정모번호 : ", e.target.dataset.jungmonum);
		$(".modal-title").text("");  // 작은 모달 초기화
		$(".modal-body").empty(); // 작은 모달 초기화
		
		$(".modal-title").text(e.target.dataset.title);  // title 제목  ;;
		
		//ajax로 리스트 부르기
		var JungmoNumber = {"JungmoNumber" : e.target.dataset.jungmonum}
		
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");} 
		});

		
		$.ajax({
	  		url: "jungmoattendlist",
	  		type: 'post',
	  		data: JungmoNumber,
	  		dataType: "json", //rest 컨트롤 이용	
	  		success:function(data){
	  			console.log("success");
	  			console.log(data)
				//$(".modal-body").empty(); // 작은 모달 초기화
				for(let v of data){
					var attendListFrame = $("<div class='attendListFrame'> </div>");
					var attendPic = $("<div class='attendPicFrame'> <img src='."+v.member_profile_picture+"' class='rounded-circle attendPic' alt='Cinque Terre'> </div>");
		  			var attendCont =  $("<div class='attendCont'> </div>");	
		  			var attendTitle = $("<div class='attendTitle'>"+v.member_name+"</div>");	
		  			var attendIntroduce = $("<div class='attendIntroduce'>"+v.member_profile_contents+"</div>");
		  			attendCont.append(attendTitle);
		  			attendCont.append(attendIntroduce);
		  			
		  			attendListFrame.append(attendPic);
		  			attendListFrame.append(attendCont);
		  			
		  			$(".modal-body").append(attendListFrame);
		  			
				}
	  		},
	  		error:function(error){
	  			alert("fail")
	  			console.log(error);
	  		}
	  		
	  	}) //ajax end
	
	})//참석 리스트 end
	
	//맴버 리스트 모두 호출 class 이름 조심.... 
	var JsonMemberList = ${JsonMemberList};
	for( v of JsonMemberList){
		var MemberListFrame = $("<div class='attendListFrame'> </div>");
		var MemberListPic = $("<div class='attendPicFrame'> <img src='."+v.member_profile_picture+"' class='rounded-circle attendPic' alt='Cinque Terre'> </div>");
			var MemberListCont =  $("<div class='attendCont'> </div>");	
			var MemberListTitle = $("<div class='attendTitle'>"+v.MEMBER_NAME+"</div>");	
			var MemberListIntroduce = $("<div class='attendIntroduce'>"+v.MEMBER_PROFILE_CONTENTS+"</div>");
			
			MemberListCont.append(MemberListTitle);
			MemberListCont.append(MemberListIntroduce);
			
			MemberListFrame.append(MemberListPic);
			MemberListFrame.append(MemberListCont);
			
			$("#MemberList").append(MemberListFrame);
			
	}
	
	
	$("#dropout").on("click",function(e){
		
		console.log("삭제버튼 클릭")
		
		//var somoimnum = {"somoimnum" : e.target.dataset.somoimnum};
		var data = {"somoimnum" : e.target.dataset.somoimnum,
					"somoimmaker" : ${JsonBasicInfo}.somoim_maker};
		console.log(data)
		
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");} 
		});
		$.ajax({
	  		url: "dropoutsomoim",
	  		type: 'post',
	  		data : data,
	  		dataType: "json", //rest 컨트롤 이용	
	  		success:function(data){
	  			alert("success");
	  			console.log(data)
	  			location.href = "./mainsomoim";
			
	  		},
	  		error:function(error){
	  			alert("fail")
	  			console.log(error);
	  		}
	  		
	  	}) //ajax end
		
		//window.close();
		
	})//탈퇴 end
	
	
	
	
	
	
// 	$('#firstPic').bind('click', function () {  });
// 	$('#secondPic').bind('click', function () { alert('2') });
// 	$('#thirdPic').bind('click', function () { alert('3') });
	$(".boardCamera").on("click",function(e){
		console.log("...사진클릭")
		console.log(e.target.dataset.input)  // firstPic  secondPic  thirdPic
		 $("#"+e.target.dataset.input).click();
	})

	$(".boardInputFile").on("change",function(e){
		console.log(e)
		console.dir(e)
		console.log(e.target.name)
		
		var id = "#img"+e.target.name
		$(id).attr('src', "../resources/somoimimage/camera.PNG" );
		var get_file = e.target.files;
		 
        var preview = document.querySelector(id);
        
        if (get_file && get_file[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $(id).attr('src', e.target.result);
                }

              reader.readAsDataURL(get_file[0]);
            }

	});

	//boardFrm
	const formBoardData =()=>{
		console.log("boardData")
		
		var formdata = new FormData(document.getElementById("boardFrm"));
		formdata.append("somoim_number", ${JsonBasicInfo}.somoim_number)
		console.log("==")
		for(var k of formdata.keys()){
			console.log(k+ " : ",formdata.get(k))
			
		}
		
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		      });//먼저 보냄
		      
		$.ajax({
			url:'boardwrite',
			type:'post',
			data:formdata,
			processData:false,
			contentType:false,  //제이슨 아니니깐 까보지마!!
		 	dataType:"json", //rest 컨트롤 이용	
			success:function(data){
				$("#somoimBoardCont").empty();
				alert("board 게시글 작성 성공");
				//somoimBoardCont
				console.log(data.result)
				console.log(typeof data.result)
				
				var boardData = JSON.parse(data.result)  
				boardlist = boardData;
				console.log(boardData)
				console.dir(boardData)
				var noti = boardData["공지"];
				var unnoti = boardData["비공지"];
				
				for(let  v of noti){
					var time = new Date(v.board_write_date).getHours();
					var min = new Date(v.board_write_date).getMinutes();
					
					var boardFrame = $("<div data-fix='"+v.board_fix+"' data-Bnum='"+v.board_number+"' data-Snum='"+v.somoim_number+"' data-writer='"+v.board_writer+"' onclick='showBoard(this)' data-toggle='modal' 	data-target='#ShowBoardModal' class='boardFrame showBoard'></div>")
					
					var profileFrame = $("<div class='profileFrame'></div>")
					var photoSection = $("<div class='photoSection'><img class='rounded-circle' width='90%' height='90%' src='."+v.member_profile_picture+"'></div>")
					var nameSection = $("<div><div >"+v.board_writer+"</div><div>"+getFormatTime(v.board_write_date,time+":"+min)+"</div></div>")
					profileFrame.append(photoSection);
					profileFrame.append(nameSection);
					
					var contentFrame = $("<div class='contentFrame'></div>")
					let content;
					if(v.board_content.length == 25){
						content=v.board_content.substring(0,25)+"...";
					}else{
						content=v.board_content
					}
					var titleSection = $("<div class='titleSection'><div>"+v.board_title+"</div><div>"+v.board_content+"</div></div>")
					
					contentFrame.append(titleSection);
					let picSection;
					if(v.board_first_syspic === '없음'){
						console.log("2")
						 picSection = $("<div class='picSection'></div>")
						contentFrame.append(picSection);
					}else{
						console.log("1")
						 picSection = $("<div class='picSection'><img width='90%' height='90%' src='."+v.board_first_syspic+"'></div>")
						contentFrame.append(picSection);
						
					}
					
					

					boardFrame.append(profileFrame);
					boardFrame.append(contentFrame);
					
					$("#somoimBoardCont").append(boardFrame);
				}
				
				for(let  v of unnoti){
					var time = new Date(v.board_write_date).getHours();
					var min = new Date(v.board_write_date).getMinutes();
					
					var boardFrame = $("<div data-fix='"+v.board_fix+"' data-Bnum='"+v.board_number+"' data-Snum='"+v.somoim_number+"' data-writer='"+v.board_writer+"' onclick='showBoard(this)' data-toggle='modal' 	data-target='#ShowBoardModal' class='boardFrame showBoard'></div>")
					
					var profileFrame = $("<div class='profileFrame'></div>")
					var photoSection = $("<div class='photoSection'><img class='rounded-circle' width='90%' height='90%' src='."+v.member_profile_picture+"'></div>")
					var nameSection = $("<div><div >"+v.board_writer+"</div><div>"+getFormatTime(v.board_write_date,time+":"+min)+"</div></div>")
					profileFrame.append(photoSection);
					profileFrame.append(nameSection);
					
					var contentFrame = $("<div class='contentFrame'></div>")
					let content;
					if(v.board_content.length == 25){
						content=v.board_content.substring(0,25)+"...";
					}else{
						content=v.board_content
					}
					var titleSection = $("<div class='titleSection'><div>"+v.board_title+"</div><div>"+v.board_content+"</div></div>")
					
					contentFrame.append(titleSection);
					let picSection;
					if(v.board_first_syspic === '없음'){
						console.log("2")
						 picSection = $("<div class='picSection'></div>")
						contentFrame.append(picSection);
					}else{
						console.log("1")
						 picSection = $("<div class='picSection'><img width='90%' height='90%' src='."+v.board_first_syspic+"'></div>")
						contentFrame.append(picSection);
						
					}
					
					

					boardFrame.append(profileFrame);
					boardFrame.append(contentFrame);
					
					$("#somoimBoardCont").append(boardFrame);
				}
				
			},
			error:function(error){
				alert("fail")
				console.log(error);
			}
			
		})
	}
	
	
	const showboardlist = ()=>{
		$("#somoimBoardCont").empty();
		console.log(boardlist);
		var noti = boardlist["공지"];
		var unnoti = boardlist["비공지"];
		
		for(let  v of noti){
			var time = new Date(v.board_write_date).getHours();
			var min = new Date(v.board_write_date).getMinutes();
			
			var boardFrame = $("<div data-fix='"+v.board_fix+"' data-Bnum='"+v.board_number+"' data-Snum='"+v.somoim_number+"' data-writer='"+v.board_writer+"' onclick='showBoard(this)' data-toggle='modal' 	data-target='#ShowBoardModal' class='boardFrame showBoard'></div>")
			
			var profileFrame = $("<div class='profileFrame'></div>")
			var photoSection = $("<div class='photoSection'><img class='rounded-circle' width='90%' height='90%' src='."+v.member_profile_picture+"'></div>")
			var nameSection = $("<div><div >"+v.board_writer+"</div><div>"+getFormatTime(v.board_write_date,time+":"+min)+"</div></div>")
			profileFrame.append(photoSection);
			profileFrame.append(nameSection);
			
			var contentFrame = $("<div class='contentFrame'></div>")
			let content;
			if(v.board_content.length == 25){
				content=v.board_content.substring(0,25)+"...";
			}else{
				content=v.board_content
			}
			var titleSection = $("<div class='titleSection'><div>"+v.board_title+"</div><div>"+v.board_content+"</div></div>")
			
			contentFrame.append(titleSection);
			let picSection;
			if(v.board_first_syspic === '없음'){
				console.log("2")
				 picSection = $("<div class='picSection'></div>")
				contentFrame.append(picSection);
			}else{
				console.log("1")
				 picSection = $("<div class='picSection'><img width='90%' height='90%' src='."+v.board_first_syspic+"'></div>")
				contentFrame.append(picSection);
				
			}
			
			

			boardFrame.append(profileFrame);
			boardFrame.append(contentFrame);
			
			$("#somoimBoardCont").append(boardFrame);
		}
		
		for(let  v of unnoti){
			var time = new Date(v.board_write_date).getHours();
			var min = new Date(v.board_write_date).getMinutes();
			
			var boardFrame = $("<div data-fix='"+v.board_fix+"' data-Bnum='"+v.board_number+"' data-Snum='"+v.somoim_number+"' data-writer='"+v.board_writer+"' onclick='showBoard(this)' data-toggle='modal' 	data-target='#ShowBoardModal' class='boardFrame showBoard'></div>")
			
			var profileFrame = $("<div class='profileFrame'></div>")
			var photoSection = $("<div class='photoSection'><img class='rounded-circle' width='90%' height='90%' src='."+v.member_profile_picture+"'></div>")
			var nameSection = $("<div><div >"+v.board_writer+"</div><div>"+getFormatTime(v.board_write_date,time+":"+min)+"</div></div>")
			profileFrame.append(photoSection);
			profileFrame.append(nameSection);
			
			var contentFrame = $("<div class='contentFrame'></div>")
			let content;
			if(v.board_content.length == 25){
				content=v.board_content.substring(0,25)+"...";
			}else{
				content=v.board_content
			}
			var titleSection = $("<div class='titleSection'><div>"+v.board_title+"</div><div>"+v.board_content+"</div></div>")
			
			contentFrame.append(titleSection);
			let picSection;
			if(v.board_first_syspic === '없음'){
				console.log("2")
				 picSection = $("<div class='picSection'></div>")
				contentFrame.append(picSection);
			}else{
				console.log("1")
				 picSection = $("<div class='picSection'><img width='90%' height='90%' src='."+v.board_first_syspic+"'></div>")
				contentFrame.append(picSection);
				
			}
			
			

			boardFrame.append(profileFrame);
			boardFrame.append(contentFrame);
			
			$("#somoimBoardCont").append(boardFrame);
		}
		
	}
	
	
	//해당 게시글 클릭할때 자세히 나오게 하기;
	const showBoard = (e)=>{
		console.log("??");
		console.dir(e)
		console.dir(e.dataset.bnum);
		console.dir(e.dataset.fix);
		console.dir(e.dataset.snum);
		console.dir(e.dataset.writer);
		//boardlist 모든 데이터;
		var fix = e.dataset.fix
		var bnum = e.dataset.bnum;
		var snum = e.dataset.snum;
		var writer = e.dataset.writer;
		
		var data = {"board_number" : bnum};
		$("#boardlikebtn").data("bnum", bnum )
		$("#boardlikebtn").data("snum", snum )
		$("#boardreplebtn").data("bnum", bnum )
		$("#boardreplebtn").data("snum", snum )
		
		$('#boardreplebtnframe').hide(); // 댓글 input 숨기기 
		
		console.log("data출력")
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");} 
		});
		
		$.ajax({
	  		url: "showsomoimboard",
	  		type: 'post',
	  		data : data,
	  		dataType: "json", //rest 컨트롤 이용	
	  		success:function(data){
	  			//alert("success");
	  			console.log(data);
	  			$("#boardlikebtnframe").empty()
	  			$("#countlike").empty()
	  			$("#showBoardTitle").empty()
	  			$("#showBoardContent").empty()
	  			$("#showfirstPic").empty()
	  			$("#showsecondPic").empty()
	  			$("#showthirdPic").empty()
// 	  			<div id="showBoardTitle">제목</div>
				
// 				<div id="showBoardContent">내용</div>
				
// 				<div id="showfirstPic">사진1</div>
				
// 				<div id="showsecondPic">사진2</div>
				
// 				<div id="showthirdPic">사진3</div>
	  			
	  			$("#showBoardTitle").text(data.board_title);
	  			$("#showBoardContent").text(data.board_content);
	  			
	  			if(data.board_first_syspic==="없음"){
	  				
	  			}else{
	  				var img = $("<img width='100%' height='100%' src='."+data.board_first_syspic+"'>")
	  				$("#showfirstPic").append(img);
	  				$("#showfirstPic").append($("<hr>"));
	  			}
	  			
				if(data.board_second_syspic==="없음"){
					
	  			}else{
	  				var img = $("<img width='100%' height='100%' src='."+data.board_second_syspic+"'>")
	  				$("#showsecondPic").append(img);
	  				$("#showsecondPic").append($("<hr>"));
	  			}
	  			
				if(data.board_third_syspic==="없음"){
		
				}else{
					var img = $("<img width='100%' height='100%' src='."+data.board_third_syspic+"'>")
					$("#showthirdPic").append(img);
					$("#showthirdPic").append($("<hr>"));
				}	
				
				console.log('라이크 체크 : ' + data.board_like)
				var likebtn ;
				if(data.board_like === 1){ // 좋아요 클릭 상태이면
					likebtn = $("<img id='boardlikebtn' data-like='"+data.board_like+"' data-snum='"+snum+"' data-bnum='"+bnum+"' onclick='boardlikebtn(this)' width='100%' height='100%' src='../resources/somoimboard/like.PNG'>");
				}else{ // 클릭 상태가 아니라면
					likebtn = $("<img id='boardlikebtn' data-like='"+data.board_like+"' data-snum='"+snum+"' data-bnum='"+bnum+"' onclick='boardlikebtn(this)' width='100%' height='100%' src='../resources/somoimboard/unlike.PNG'>");
				}
				$("#boardlikebtnframe").append(likebtn);
				
				
				var replebtn = $("<button id='boardreplebtn' class='btn btn-primary' data-snum='"+snum+"' data-bnum='"+bnum+"' onclick='reple(this)'>전송</button>");
				$("#boardreplebtnframe").append(replebtn);
				
				$("#countlike").text(data.total_like);
			
	  			
				$("#replelist").empty();
				
				for(let v of data.somoimreple){
	  				var time = new Date(v.somoim_board_reple_date).getHours();
					var min = new Date(v.somoim_board_reple_date).getMinutes();
					
					var resulttime ;
					if(parseInt(time) > 12){
						resulttime = " 오후 "+(parseInt(time)-12)+"시 "+min+"분"
					}else{
						resulttime = " 오전 "+time+"시 "+min+"분"
					}
					
					
					
					
					var boardFrame = $("<div  data-Bnum='"+v.board_number+"' data-Snum='"+v.somoim_number+"'   class='boardFrame showBoard'></div>")
					
					var profileFrame = $("<div class='profileFrame'></div>")
					var photoSection = $("<div class='photoSection'><img class='rounded-circle' width='90%' height='90%' src='."+v.member_profile_picture+"'></div>")
					var nameSection = $("<div><div>"+v.somoim_board_reple_name+"</div> <div>"+getFormatDate(v.somoim_board_reple_date)+resulttime+"</div></div>")
					profileFrame.append(photoSection);
					profileFrame.append(nameSection);
					
					var contentFrame = $("<div class='contentFrame'></div>")
					let content=v.board_content
					
					var contentSection = $("<div class='titleSection'><div>"+v.somoim_board_reple_content+"</div></div>")
					contentFrame.append(contentSection);
					

					boardFrame.append(profileFrame);
					boardFrame.append(contentFrame);
					
					$("#replelist").append(boardFrame);
	  			
	  			}
				
				
				//페이징 
				$("#replepaging").html(data.htmlPaging)
				
				
	  		},
	  		error:function(error){
	  			alert("fail")
	  			console.log(error);
	  		}
	  		
	  	}) //ajax end
		
	  	
	}
	
	const boardlikebtn = (e)=>{
		console.log("like");
		console.log(e.dataset.snum)
		console.log(e.dataset.bnum)
		
		var snum = e.dataset.snum;
		var bnum = e.dataset.bnum;
		var like = e.dataset.like;
		//내가 좋아요 인지 아닌지 확인해야함.
		var data = { "somoim_number" : snum,
					"board_number" : bnum,
					"board_like" : like}
		
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");} 
		});
		$.ajax({
	  		url: "boardlike",
	  		type: 'post',
	  		data : data,
	  		dataType: "json", //rest 컨트롤 이용	
	  		success:function(data){
	  			alert("success");
	  			console.log(data)
	  			
	  			$("#boardlikebtnframe").empty()
	  			$("#countlike").empty();
	  			
	  			console.log('라이크 체크 클릭 : ' + data.board_like)
				var likebtn ;
				if(data.board_like === 1){ // 좋아요 클릭 상태이면
					likebtn = $("<img id='boardlikebtn' data-like='"+data.board_like+"' data-snum='"+snum+"' data-bnum='"+bnum+"' onclick='boardlikebtn(this)' width='100%' height='100%' src='../resources/somoimboard/like.PNG'>");
				}else{ // 클릭 상태가 아니라면
					likebtn = $("<img id='boardlikebtn' data-like='"+data.board_like+"' data-snum='"+snum+"' data-bnum='"+bnum+"' onclick='boardlikebtn(this)' width='100%' height='100%' src='../resources/somoimboard/unlike.PNG'>");
				}
				$("#boardlikebtnframe").append(likebtn);
				$("#countlike").text(data.total_like);
				
				
				
	  		},
	  		error:function(error){
	  			alert("fail")
	  			console.log(error);
	  		}
	  		
	  	}) //ajax end
	}
	
	const boardreplebtn = (e)=>{
		console.log("댓글 버튼 누르기")
		console.log(e.dataset.reple)
		if(e.dataset.reple==0){
			$('#boardreplebtnframe').show(); // 댓글 input 숨기기 
			e.dataset.reple="1";
			$("#repleinput").focus();
		}else{
			$('#boardreplebtnframe').hide(); // 댓글 input 숨기기 
			e.dataset.reple="0";
		}
	}
	
	
	const reple= (e) =>{
		console.log("리플달기")
		console.log("댓글내용",$("#repleinput").val());
		console.dir(e);
		var snum = e.dataset.snum;
		var bnum = e.dataset.bnum;
		var cont = $("#repleinput").val();
		
		var data = { "somoim_number" : snum,
				"board_number" : bnum,
				"somoim_board_reple_content" : cont}
	
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");} 
	});
	$.ajax({
  		url: "inputboardreple",
  		type: 'post',
  		data : data,
  		dataType: "json", //rest 컨트롤 이용	
  		success:function(data){
  			alert("success");
  			console.log(data)
  			
  			//input 지우기
  			$("#repleinput").val("")
  			//reple 지우기
  			$("#replelist").empty();
  			console.log("??",data.somoimreple)
  			console.log("??",data.somoimreple.somoim_board_reple_date)
  			
  			for(let v of data.somoimreple){
  				var time = new Date(v.somoim_board_reple_date).getHours();
				var min = new Date(v.somoim_board_reple_date).getMinutes();
				
				var resulttime ;
				if(parseInt(time) > 12){
					resulttime = " 오후 "+(parseInt(time)-12)+"시 "+min+"분"
				}else{
					resulttime = " 오전 "+time+"시 "+min+"분"
				}
				
				
				
				
				var boardFrame = $("<div  data-Bnum='"+v.board_number+"' data-Snum='"+v.somoim_number+"'   class='boardFrame showBoard'></div>")
				
				var profileFrame = $("<div class='profileFrame'></div>")
				var photoSection = $("<div class='photoSection'><img class='rounded-circle' width='90%' height='90%' src='."+v.member_profile_picture+"'></div>")
				var nameSection = $("<div><div>"+v.somoim_board_reple_name+"</div> <div>"+getFormatDate(v.somoim_board_reple_date)+resulttime+"</div></div>")
				profileFrame.append(photoSection);
				profileFrame.append(nameSection);
				
				var contentFrame = $("<div class='contentFrame'></div>")
				let content=v.board_content
				
				var contentSection = $("<div class='titleSection'><div>"+v.somoim_board_reple_content+"</div></div>")
				contentFrame.append(contentSection);
				

				boardFrame.append(profileFrame);
				boardFrame.append(contentFrame);
				
				$("#replelist").append(boardFrame);
  			
  			}
  			
  			//페이징 
  			
			$("#replepaging").html(data.htmlPaging)
			
  		},
  		error:function(error){
  			alert("fail")
  			console.log(error);
  		}
  		
  	}) //ajax end
	
		
		
		
	}
</script>

</html>