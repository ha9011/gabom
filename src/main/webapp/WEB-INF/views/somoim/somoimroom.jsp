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
<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>

<style>
.managebtn{
	border-radius: 10px;
}

.slow  .toggle-group { transition: left 0.7s; -webkit-transition: left 0.7s; }
/* 채팅날짜 */
#chatDate {
	position: absolute;
	left: 65.5%;
	top: 33%;
	width: 200px;
	height: 35px;
	border-radius: 10px;
	background: rgba(0, 0, 0, 0.3);
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

.item1 {
	flex-grow: 1;
}

.item2 {
	flex-grow: 17;
}

.item3 {
	flex-grow: 2;
	align-self: center;
}
/*------------------------------ */
#dropout {
	width: 100%;
}

#joinsomoim {
	width: 100%;
}

.tab-content {
	height: 93%;
	overflow: auto;
}
#main {
	width: 100%;
	height: 100%;
}

#top {
	margin: 50px auto;
	width: 40%;
	height: 200px;
	border: 1px solid black;
}

#bottom {
	margin: 0px auto 50px auto;
	width: 80%;
	height: 700px;
	display: flex;
	justify-content: center;
	padding-top: 2rem;
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
	margin-left: 120px;
}

/* 게시글 */
.boardCamera {
	width: 96%;
	height: 96%
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
.pics{
	position: relative;
	width:150px;
}
.deletepic{
	position: absolute;
	left: 76%;
	top: 3%;
}

.titleSection {
	margin-left: 4%;
	width: 76%;
	height: 76%;
	width: 76%;
}

#boardlikeframe {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-items: center;
	height: 30px;
}

.boardlikebtn {
	width: 30px;
}

#boardWriteBtn {
	width: 100%
}

#tablist {
	width: 100%;
	display: flex;
}

.modal-header {
	
}
/* 채팅 */
#chattingRoom {
	overflow: auto;
	height: 80%;
	display: flex;
	flex-direction: column;
	background-color: #99BFE4;
}

.yourCommnet {
	margin: 15px 0 15px 20px;
	font-size: 15px;
	align-self: flex-start;
	text-align: left;
	background: white;
	border-radius: 10px;
	position:relative;
}

.yourCommnet:after{
 border-top:15px solid white;
 border-left: 15px solid transparent;
 border-right: 0px solid transparent;
 border-bottom: 0px solid transparent;
 content:"";
 position:absolute;
 top:10px;
 left:-15px;
}

.myCommnet {
	margin: 15px 20px 15px 0;
	font-size: 15px;
	align-self: flex-end;
	text-align: right;
	background: yellow;
	border-radius: 10px;
	position:relative;
}
.myCommnet:after {
 border-top:15px solid yellow;
 border-left: 0px solid transparent;
 border-right: 15px solid transparent;
 border-bottom: 0px solid transparent;
 content:"";
 position:absolute;
 top:10px;
 right:-15px;
}
 
#chattingInput {
	width: 89%;
	border:none;
	height:100%;
}

#chattingBtn{
background-color:lightgray;
color:white;
}

#chattingBtn:hover{
background-color:yellow;
color:black;
}

.chatFrame {
	display: flex;
	flex-direction: column;
}

#day1 {
	background-color: #93b7d9;
	text-align: center;
	height: 10%;
}

.panel {
	margin: 5px 0;
}

#photoframe{
display : flex;
}
</style>

</head>
<body>

	<header>
		<jsp:include page="/WEB-INF/views/header/somoimheader.jsp" />
	</header>



	<div id="main">
		<div id="bottom">
			<div id="out1">
				<!-- Nav pills -->
				<ul class="nav nav-pills" role="tablist" id="tablist">
					<li class="nav-item"><a class="nav-link active"
						onclick="showNotiMember()" data-toggle="pill" href="#noti">공지</a></li>

					<li class="nav-item"><a id="boardListSection"
						onclick="showboardlist()" class="nav-link" data-toggle="pill"
						href="#board">게시글</a></li>

					<li class="nav-item"><a class="nav-link" data-toggle="pill"
						onclick="showalbumlist()" href="#album">사진첩</a></li>
				</ul>




				<!-- Tab panes -->
				<div class="tab-content">
					<div id="noti" class="container tab-pane active">

						<hr>
						<h2 id="introduceTitle"></h2>
						<br>
						<div id="introduceContent"></div>
						<hr>
						<div id="jungmomake"></div>
						<div id="jungmolist"></div>

						<hr>
						<div id="MemberList">회원 회원</div>
						<hr>
						<div>
							<button id="joinsomoim" data-somoimnum=${roomnum
								}
								class="btn btn-warning">가입하기</button>

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

					<div id="member" class="container tab-pane fade">

						<div class="container">


							<div>
							<div  class="container p-3 my-3 bg-dark text-white  managebtn" >승인 신청 MEMBER LIST &nbsp&nbsp&nbsp<button class="btn btn-light" id="applicantToggle" >ON</button></div>
							<div  style="display:none;" id="applicantMember"> </div>
							</div>
							
							
							<div>
							<div  class="container p-3 my-3 bg-dark text-white  managebtn" >기존 MEMBER LIST &nbsp&nbsp&nbsp<button class="btn btn-light" id="originMemberToggle">ON</button></div>
							<div style="display:none;" id="originMember" > </div>
							</div>


						</div>




					</div>



				</div>
			</div>

			<div id="out2">
				<div id="day1">소모임 이름</div>
				<div id="chattingRoom"></div>
				<div id="cont2" style="height: 10%;">
					<input type="text" id="chattingInput" onkeypress="if( event.keyCode == 13 ){ $('#chattingBtn').trigger('click')}" >
					<button id="chattingBtn" class="btn">전송</button>
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

	<!-- The 정모게시판 만들기-->
	<div class="modal fade" id="makeJungmo">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header modaljmh">
					<h4 class="modal-title">정모게시글</h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body modaljmb">
					<jsp:include page="/WEB-INF/views/somoim/jungmomake.jsp" />
				</div>

				<!-- Modal footer -->
				<div class="modal-footer modaljm">
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						id="jmmakeclose">닫기</button>
				</div>

			</div>
		</div>
	</div>


	<!-- The 정모 정보 보기 모달-->
	<div class="modal fade" id="infoJungmo">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header infomodaljmh"></div>


				<!-- Modal body -->
				<div class="modal-body infomodaljmb"></div>

				<!-- Modal footer -->
				<div class="modal-footer modaljm">
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						id="jmmakeclose">닫기</button>
				</div>

			</div>
		</div>
	</div>



	<!-- The Modal 작은창 board창  게시글 -->

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
						<label for="type">종 류</label> <select id="boardtype"
							name="boardtype" class="custom-select" required="required">
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
							<label for="title">사진 </label><br> 
							<div id="photoframe">
								<div id="firstPicFrame" class="pics" ><img id="imgfirstPic"
									data-input="firstPic" class="boardCamera"
									src="../resources/somoimimage/camera.PNG" /></div>
								 
								<div id="secondPicFrame" class="pics"><img
									id="imgsecondPic" data-input="secondPic" class="boardCamera"
									src="../resources/somoimimage/camera.PNG" /></div>
							
								<div id="thirdPicFrame" class="pics"><img
									id="imgthirdPic" data-input="thirdPic" class="boardCamera"
									src="../resources/somoimimage/camera.PNG" /></div>
							</div>
						</div>

						<input type="file" id="firstPic" name="firstPic"
							class='boardInputFile' style="display: none"> 
							
							<input
							type="file" id="secondPic" name="secondPic"
							class='boardInputFile' style="display: none"> 
							
							<input
							type="file" id="thirdPic" name="thirdPic" class='boardInputFile'
							style="display: none;"> <br> <br>
						<div class="form-group form-check">
							<label class="form-check-label"> <input
								class="form-check-input" type="checkbox" name="mainboard"
								id="mainboard" value="고정">게시글 상위고정
							</label>
						</div>


						<button id="makeBoardBtn" type="button" onclick="formBoardData()"
							data-dismiss="modal" class="btn btn-primary">작성하기</button>

						<input id="modiBoardBtn" type="button" class="btn btn-primary"
							onclick="modiBoardData()" value="수정하기" data-dismiss="modal">

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
				<div class="modal-header showboardh">
					<h4 class="modal-title"></h4>

				</div>

				<!-- Modal body -->
				<div class="modal-body">

					<div>

						<div id="showBoardContent">내용</div>
						<hr>
						<div id="showfirstPic">사진1</div>
						<div id="showsecondPic">사진2</div>
						<div id="showthirdPic">사진3</div>
						
					</div>
					<hr>

					<div id="boardlikeframe">
						<div class='boardlikebtn' id="boardlikebtnframe"></div>
						<div class='boardlikebtn'>
							<img onclick="boardreplebtn(this)" data-reple='0' width='100%'
								height='100%' src="../resources/somoimboard/reple.PNG">
						</div>
					</div>
					<hr>
					<div>
						<div>
							<img width='5%' height='5%'
								src="../resources/somoimboard/like.PNG"><span
								id="countlike"></span> 명이 이 글을 좋아합니다
						</div>
					</div>
					<hr>

					<div id="boardreplebtnframe"></div>
					<hr>
					<div id="replelist">댓글창 보여주기</div>

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

	<button style='display: none' id='qwe' data-toggle="modal"
		data-target='#makeJungmo'></button>
	<button style='display: none' id='boardTrigger' data-toggle="modal"
		data-target='#myBoardModal'></button>

<!-- 	//style="display:none;"  -->
	<div id="chatDate"></div> 

	<footer>
		<jsp:include page="/WEB-INF/views/footer/footer.jsp" />
	</footer>


	<script type="text/javascript">
//정모리스트 호출하는 메소드
const showJungmoList = (JungmoRoom)=>{
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	
	for( let i of JungmoRoom){
		//mySMModal
		var frame = $("<div class='basicInfoframe' data-jungmonum='"+i.jungmo_number +"'></div>")
		var img = $("<div class='jmimg' data-target='#infoJungmo' data-toggle='modal'  ><div class='upDate btn btn-danger btn-sm'>"+week[new Date(i.jungmo_date).getDay()] +"</div><div class='downDate'><div class='jmday'>"+new Date(i.jungmo_date).getDate()+"</div></div></div>")
		var detail = $("<div class='jmdetail'><div><img width='13px' height='13px' src='"+"../resources/somoimimage/time.PNG"+"' >&nbsp&nbsp"+getFormatTime(i.jungmo_date, i.jungmo_time) +"</div><div><img width='13px' height='13px' src='"+"../resources/somoimimage/location.PNG"+"' >&nbsp&nbsp"+i.jungmo_location +"</div><div><img width='13px' height='18px' src='"+"../resources/somoimimage/coin.PNG"+"' >&nbsp&nbsp"+i.jungmo_money +"</div></div>")
		var btns = $("<div class='Jungmobtns'></div>");
		var joinbtn ;
		
		
		
		
		if(i.my_attend_check == 1){
			joinbtn= $("<div><button data-jungmonum='"+i.jungmo_number +"' data-somoim='"+i.somoim_number +"' class='jungmojoinbtn'>취소</button></div>");
		}else{
			joinbtn= $("<div><button data-jungmonum='"+i.jungmo_number +"' data-somoim='"+i.somoim_number +"' class='jungmojoinbtn'>참석</button></div>");
		}	
		
		
		console.log("Attendlist : ",Attendlist.length)
		console.log("Attendlist : ",Attendlist)
			
		
		
		var showjoinlist = $("<div><button data-toggle='modal' data-title='"+getFormatTime(i.jungmo_date, i.jungmo_time)+"' data-target='#infoJungmo' class='showAttendList' data-jungmonumattend='"+i.jungmo_number +"'>참석자</button></div>");
		btns.append(joinbtn);
		btns.append(showjoinlist);
		
		
		frame.append(img);frame.append(detail);frame.append(btns);
		$("#jungmolist").append(frame);
		
		console.log(getFormatDate(i.jungmo_date))
		getFormatTime(i.jungmo_date, i.jungmo_time);
	}
}

//회원관리 호출(가입승인/거부/강퇴)
const showManagelist = ()=>{
	console.log("관리창 보여주기")
	var somoim_number = ${JsonBasicInfo}.somoim_number
	
	var data = {"somoim_number" : somoim_number}
	
	
	$.ajaxSetup({         
		beforeSend : function(xhr){
		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	});//먼저 보냄
		      
	$.ajax({
		url:'managementSomoim',
		type:'post',
		data:data,
		dataType:"json", //rest 컨트롤 이용	
		success:function(data){
			$("#originMember").empty();
			$("#applicantMember").empty();
			console.log(data)
			console.log(data['기존'])
			console.log(data['대기'])
			showOriginMember(data);  //기존 맴버 부르는 메소드
			showIngMember(data);  // 등록 대기중인 맴버 부르는 메소드
		},
		error:function(error){
			alert("fail")
			console.log(error);
		}
	})
	
	
}


//맴버 리스트 
const showAllMemberList= (JsonMemberList)=>{
	
	for( v of JsonMemberList){
		console.log("맴버 리스트 나옴?")
		var MemberListFrame = $("<div class='attendListFrame'> </div>");
		var MemberListPic = $("<div class='attendPicFrame'> <img src='"+v.member_profile_picture+"' class='rounded-circle attendPic' alt='Cinque Terre'> </div>");
			var MemberListCont =  $("<div class='attendCont'> </div>");	
			var MemberListTitle = $("<div class='attendTitle'>"+v.member_name+"</div>");	
			var MemberListIntroduce = $("<div class='attendIntroduce'>"+v.member_profile_contents+"</div>");
			
			MemberListCont.append(MemberListTitle);
			MemberListCont.append(MemberListIntroduce);
			
			MemberListFrame.append(MemberListPic);
			MemberListFrame.append(MemberListCont);
			
			$("#MemberList").append(MemberListFrame);
			
	}
	
	
	
}

//게시글 호출하는 메소드
const showAllList = (boardlist)=>{

	
	var noti = boardlist["공지"];
	var unnoti = boardlist["비공지"];
	
	for(let  v of noti){
		var time = new Date(v.board_write_date).getHours();
		var min = new Date(v.board_write_date).getMinutes();
		
		
		//회원과 비회원
		var boardFrame;
		if(mysomoimInfo==null){
			boardFrame = $("<div data-fix='"+v.board_fix+"' data-Bnum='"+v.board_number+"' data-Snum='"+v.somoim_number+"' data-writer='"+v.board_writer+"'  class='boardFrame showBoard'></div>")
		}else if(mysomoimInfo.member_status == 1){  // 0 - 대기, 1 - 승인, 2 - 탈퇴회면
			boardFrame = $("<div data-fix='"+v.board_fix+"' data-Bnum='"+v.board_number+"' data-Snum='"+v.somoim_number+"' data-writer='"+v.board_writer+"' onclick='showBoard(this)' data-toggle='modal' 	data-target='#ShowBoardModal' class='boardFrame showBoard'></div>")
		}else{
			boardFrame = $("<div data-fix='"+v.board_fix+"' data-Bnum='"+v.board_number+"' data-Snum='"+v.somoim_number+"' data-writer='"+v.board_writer+"'  class='boardFrame showBoard'></div>")
		}
		
		var profileFrame = $("<div class='profileFrame'></div>")
		var photoSection = $("<div class='photoSection'><img class='rounded-circle' width='90%' height='90%' src='"+v.member_profile_picture+"'></div>")
		var nameSection = $("<div style='width : 55%'><div >"+v.board_writer+"</div><div>"+getFormatTime(v.board_write_date,time+":"+min)+"</div></div>")
		
		var likeRepleCnt = $("<div style='text-align : right; width : 30%;'><img width='20%' height='40%' src='../resources/somoimboard/like.PNG'>"+v.total_like+"<span>&nbsp&nbsp&nbsp&nbsp</span><img width='20%' height='40%' src='../resources/somoimboard/reple.PNG'>"+v.total_reple+"</div>")
		
		
		profileFrame.append(photoSection);
		profileFrame.append(nameSection);
		profileFrame.append(likeRepleCnt);
		
		
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
		if(v.board_first_syspic === ""){
			console.log("2")
			 picSection = $("<div class='picSection'></div>")
			contentFrame.append(picSection);
		}else{
			console.log("1")
			 picSection = $("<div class='picSection'><img width='90%' height='90%' src='"+v.board_first_syspic+"'></div>")
			contentFrame.append(picSection);
			
		}
		
		

		boardFrame.append(profileFrame);
		boardFrame.append(contentFrame);
		
		$("#somoimBoardCont").append(boardFrame);
	}
	
	for(let  v of unnoti){
		var time = new Date(v.board_write_date).getHours();
		var min = new Date(v.board_write_date).getMinutes();
		
		
		//회원과 비회원
		var boardFrame;
		if(mysomoimInfo==null){
			boardFrame = $("<div data-fix='"+v.board_fix+"' data-Bnum='"+v.board_number+"' data-Snum='"+v.somoim_number+"' data-writer='"+v.board_writer+"'  class='boardFrame showBoard'></div>")
		}else if(mysomoimInfo.member_status == 1){  // 0 - 대기, 1 - 승인, 2 - 탈퇴회면
			boardFrame = $("<div data-fix='"+v.board_fix+"' data-Bnum='"+v.board_number+"' data-Snum='"+v.somoim_number+"' data-writer='"+v.board_writer+"' onclick='showBoard(this)' data-toggle='modal' 	data-target='#ShowBoardModal' class='boardFrame showBoard'></div>")
		}else{
			boardFrame = $("<div data-fix='"+v.board_fix+"' data-Bnum='"+v.board_number+"' data-Snum='"+v.somoim_number+"' data-writer='"+v.board_writer+"'  class='boardFrame showBoard'></div>")
		}
		
		var profileFrame = $("<div class='profileFrame'></div>")
		var photoSection = $("<div class='photoSection'><img class='rounded-circle' width='90%' height='90%' src='"+v.member_profile_picture+"'></div>")
		var nameSection = $("<div style='width : 55%'><div >"+v.board_writer+"</div><div>"+getFormatTime(v.board_write_date,time+":"+min)+"</div></div>")
		
		var likeRepleCnt = $("<div style='text-align : right; width : 30%;'><img width='20%' height='40%' src='../resources/somoimboard/like.PNG'>"+v.total_like+"<span>&nbsp&nbsp&nbsp&nbsp</span><img width='20%' height='40%' src='../resources/somoimboard/reple.PNG'>"+v.total_reple+"</div>")
		
		
		profileFrame.append(photoSection);
		profileFrame.append(nameSection);
		profileFrame.append(likeRepleCnt);
		
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
		if(v.board_first_syspic === ""){
			console.log("2")
			 picSection = $("<div class='picSection'></div>")
			contentFrame.append(picSection);
		}else{
			console.log("1")
			 picSection = $("<div class='picSection'><img width='90%' height='90%' src='"+v.board_first_syspic+"'></div>")
			contentFrame.append(picSection);
			
		}
		
		

		boardFrame.append(profileFrame);
		boardFrame.append(contentFrame);
		
		$("#somoimBoardCont").append(boardFrame);
	}
}



//강퇴
$(document).on("click","#kickOut",function(e){
	console.log("강퇴 할 아이디 : " + e.target.dataset.id)  // 소모임번호랑 아이디만 알면됨요 
	var id = e.target.dataset.id;
	var sNumber = ${JsonBasicInfo}.somoim_number
	var data = {
			"id":id,
			"sNumber" : sNumber		
	}
	
	$.ajaxSetup({         
  	  beforeSend : function(xhr){
    	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	});//먼저 보냄
	
	$.ajax({
		url:'deletemember',
		type:'post',
		data:data,
		dataType:'json',
		success:function(data){
			showOriginMember(data);
			JsonMemberList = data['기존']
			
			
		},
		error:function(error){
			alert("fail")
			console.log(error);
		}
	})
	
})

//승인
$(document).on("click","#agreeSomoim",function(e){
	console.log("승인 할 아이디 : " + e.target.dataset.id)  // 소모임번호랑 아이디만 알면됨요 
	var id = e.target.dataset.id;
	var sNumber = ${JsonBasicInfo}.somoim_number
	var data = {
			"id":id,
			"sNumber" : sNumber		
	}
	
	$.ajaxSetup({         
  	  beforeSend : function(xhr){
    	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	});//먼저 보냄
	
	$.ajax({
		url:'permitmember',
		type:'post',
		data:data,
		dataType:'json',
		success:function(data){
			showOriginMember(data);
			showIngMember(data);
			JsonMemberList = data['기존']
		},
		error:function(error){
			alert("fail")
			console.log(error);
		}
	})
	
})

//거절
$(document).on("click","#rejectSomoim",function(e){
	console.log("거절 할 아이디 : " + e.target.dataset.id)  // 소모임번호랑 아이디만 알면됨요 
	var id = e.target.dataset.id;
	var sNumber = ${JsonBasicInfo}.somoim_number
	var data = {
			"id":id,
			"sNumber" : sNumber		
	}
	
	$.ajaxSetup({         
  	  beforeSend : function(xhr){
    	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	});//먼저 보냄
	
	$.ajax({
		url:'deletemember',
		type:'post',
		data:data,
		dataType:'json',
		success:function(data){
			showIngMember(data);
		},
		error:function(error){
			alert("fail")
			console.log(error);
		}
	})
	
})

 $(document).ready(function(){
	 
	 var socketalarm =null; //알람
	 var socket = null;
	 //채팅 메소드 연결
	 connect();
 	 //applicantToggle applicantMember
// 	 originMemberToggle originMember
	 
	$(document).on("click","#applicantToggle", function(e){
		console.log("신청 맴버 화면 보여주기")
		var text = e.target.innerText;
		console.log("text : "+ text)
		if(text == "ON"){
			console.log("on에서 눌렀으니 보이게 하고 OFF로 바꾸기")
			$("#applicantMember").show();
			$("#applicantToggle").text("OFF")
		}else if(text == "OFF"){
			console.log("off에서 눌렀으니 가리고 on으로로 바꾸기")
			$("#applicantMember").hide();
			$("#applicantToggle").text("ON")
			
		}
	
	});	
	
	$(document).on("click","#originMemberToggle", function(e){
		console.log("신청 맴버 화면 보여주기")
		var text = e.target.innerText;
		console.log("text : "+ text)
		if(text == "ON"){
			console.log("on에서 눌렀으니 보이게 하고 OFF로 바꾸기")
			$("#originMember").show();
			$("#originMemberToggle").text("OFF")
		}else if(text == "OFF"){
			console.log("off에서 눌렀으니 가리고 on으로로 바꾸기")
			$("#originMember").hide();
			$("#originMemberToggle").text("ON")
			
		}
	
	});	
		
	 console.log("---------시작")
	 //게시글 사진 변경
	if(${JsonchatData}.length==0){
		
	} else{
		var showchatdate = (${JsonchatData}[${JsonchatData}.length-1].chatting_date).split("-").join("/")
		 $("#chatDate").text(showchatdate);
			
	}
	 
	 
	 
	 //스크롤이벤트
	
	let basicDate = new Date("${nextDay}");
	console.log("다음 검색 할 날짜..? : " + basicDate)
	let selectDay = basicDate;  // 기준날짜 
	//console.log("날짜")
	//console.log(selectDay);
	
	let chatScrollToggle = 0;
	
	 $("#chattingRoom").scroll(function(e){
		 console.log("===")
		 //console.log(e);
		 //console.dir(e);
		// console.log("===")
        let scrollTop = e.target.scrollTop ;
		let scrollHeight = e.target.scrollHeight;
		let clientHeight = e.target.clientHeight;
		
        
        //chatDate.
        
        let index = 0 ;
        for(let v of e.target.children){
        	console.log("----");
         	let total = Number(v.offsetTop)+Number(v.offsetHeight) 
        	if(v.offsetTop < scrollTop && (total) > scrollTop ){
        		console.log("채팅날짜 이벤트 실행")
        		console.log("v.dataset.date",v.dataset.date)
        		$("#chatDate").text(v.dataset.date);
        		$("#chatDate").show();
        		break;
        	}
        	index++;
        }
        
        console.log("scrollTop : " +  scrollTop)
     	console.log("scrollHeight : " +  scrollHeight)
     	console.log("clientHeight : " +  clientHeight)

		console.log("toggle 이벤트 시작전  : " + chatScrollToggle)
		// 인피니티 시작이다.
        if (scrollTop <= (scrollHeight/8) && scrollHeight >= clientHeight && chatScrollToggle==0 && selectDay!='없음') {
        	console.log("이벤트발생")
        	console.log("toggle key : " + chatScrollToggle)
        	console.log("검색날짜 : " + getFormatDate(selectDay) )
        		
            	
        		chatScrollToggle=1;
        		setTimeout(() => {
        			console.log("셋타임아웃")
        			console.log("toggle key : " + chatScrollToggle)
        			chatScrollToggle=0;
        			
        			let chatData = {
    		    			"date":getFormatDate(selectDay),
    		    			"somoimNumber": ${JsonBasicInfo}.somoim_number,
    				}
            	//성공시 날짜변경
    			//selectDay.setDate(selectDay.getDate()-1);
    			//	console.log("변경된 날짜")
    			//	console.log(selectDay);
        			console.log("인피니티 하기 위해 서버에 보낼 data",chatData)
        			
					let iDate =getFormatDate(selectDay)
					let iDateChatFrame = $("<div id='yesterday' class='chatFrame' data-date='"+iDate+"'> </div>");
        		
        		console.log("NaN/0NaN/0NaN", chatData.date == "NaN/0NaN/0NaN" )
        		if(chatData.date == "NaN/0NaN/0NaN" ){
        			console.log("인피티니 검색 데이터 없음")
        		}else{
        			
        		
            	$.ajaxSetup({         
    			    	  beforeSend : function(xhr){
    			      	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
    				});//먼저 보냄
    				
    				$.ajax({
    					url:'selectDateChatting',
    					type:'post',
    					data:chatData,
    					dataType: "json",
    					success:function(data){
    						
    						//alert("success");
    						//console.log(data)
    						console.log("채팅 인피니티 성공--")
    						console.log(data)
    						
    						if(data.hasOwnProperty('date')){ // date가 있으면 진행
    							selectDay = new Date(data.date);
    						}else{ // 없으면 다음 date가 없다는 거임 
    							selectDay = '없음';	  // 그러니 ajax 안해도 된다는 걸 의미
    						}
    						
    						console.log(chatData)
    						console.log("select Day : "+ selectDay)
    						
    						
    						for(let v of data.chattingData ){
    							
    							//c chatting
    							let cSomoimNumber = v.somoim_number;
    							let cId = v.chatting_name;
    							let cCont = v.chatting_content;
    							let cDate = getFormatDate(v.chatting_date);
    							let cTime = getFormatOnlyTime(v.chatting_date)
    							let cProfile =v.chatting_profile;
    							
									if(${JsonMysomoimInfo} == null){
										
    								}else if(cId===${JsonMysomoimInfo}.member_name){ //내가 보낸 데이터일 경우
    									
    									let media = $("<div class='media border p-3 myCommnet' data-date='"+getFormatDate(new Date())+"' ></div>");
    									let mediabody = $("<div class='media-body'></div>");
    											
    									let bodyName = $("<h4><small><i> "+cTime+" </i></small></h4>");
    									let bodyCont = $("<p>"+cCont+"</p>");
    									
    									mediabody.append(bodyCont);
    									mediabody.append(bodyName);
    											
    									media.append(mediabody);
    									iDateChatFrame.append(media)
    									
    						 		}else{ //타인이 보낸 데이터 일경우
    						 			let media = $("<div class='media border p-3 yourCommnet'></div>");
    							 			
    						 			let img = $("<img src='"+cProfile+"' alt='John Doe' class='mr-3 mt-3 rounded-circle' style='width:60px;'>")
    							 		media.append(img);
    							 		
    						 			let mediabody = $("<div class='media-body'></div>");
    							 		
    						 			let bodyCont = $("<p>"+cCont+"</p>");
    						 			let bodyName = $("<h4>"+cId+"<small><i>"+cTime+"</i></small></h4>");
    							 		
    							 		mediabody.append(bodyCont);
    							 		mediabody.append(bodyName);
    							 		
    							 		media.append(mediabody);
    							 		iDateChatFrame.append(media)
    						 		}
    							$("#chattingRoom").prepend(iDateChatFrame)
    							
    						}
    						
    						if(iDateChatFrame[0].clientHeight!=0){
    							$("#chattingRoom").scrollTop(iDateChatFrame[0].clientHeight);
        							
    						}
    						
    					},
    					error:function(error){
    						alert("fail")
    						console.log(error);
    					}
    				})
        		}
			}, 400);
        	
        	
        } else {
        	console.log("======아직 인피니티 아님===")
        	//$("#confirm").attr('disabled', true);
        }
	
	});
	 
	 //채팅
	
	 
	 function connect(){  //localhost
		 var somoim_number = ${JsonBasicInfo}.somoim_number;
		 var weAddress="ws://192.168.0.119:80/gabom/somoim/Chat?somoim_number=" + somoim_number;
		 var ws = new WebSocket(weAddress);
		 socket = ws;
		    ws.onopen = function () {   //커넥션이 연결됬을때
		        console.log('Info: connection opened.');
		        
		        ws.onmessage = function (event) {
		            console.log("receiveMessage : " + event.data+'\n');
		            
		            var data = JSON.parse(event.data);
		            var date = new Date();
		            var chatTime = 	getFormatOnlyTime(date);
		            console.log("---------------")
		            console.log(data);
		    		//여기서 데이터 쏴주고, 쏴준후 db 저장해야하는데 트랜잭션...어떻게?
		    				
		    				
		    		if(data.id === ${JsonMysomoimInfo}.member_name ){ //내가 보낸 데이터 일경우
		    			//chattingRoom	
		    			
		    			var media = $("<div class='media border p-3 myCommnet' data-date='"+getFormatDate(new Date())+"' ></div>");
						var mediabody = $("<div class='media-body'></div>");
						
						var bodyName = $("<h4><small><i> "+chatTime+" </i></small></h4>");
						var bodyCont = $("<p>"+data.msg+"</p>");
						
						mediabody.append(bodyCont);
						mediabody.append(bodyName);
						
						media.append(mediabody);
						$("#chattingRoom").append(media)
						
						//$("#chattingRoom").append($("<div class='myCommnet' >"+data.msg+"</div>"))
		    		}else{ // 내가 보낸 데이터가 아닐경우


						var media = $("<div class='media border p-3 yourCommnet'></div>");
						
						var img = $("<img src='"+data.profilePicture+"' alt='John Doe' class='mr-3 mt-3 rounded-circle' style='width:60px;'>")
						media.append(img);
						
						var mediabody = $("<div class='media-body'></div>");
						
						var bodyCont = $("<p>"+data.msg+"</p>");
						var bodyName = $("<h4>"+data.id+"<small><i>"+chatTime+"</i></small></h4>");
						
						mediabody.append(bodyCont);
						mediabody.append(bodyName);
						
						media.append(mediabody);
						$("#chattingRoom").append(media)
		    		
		    		
		    		}
		    		
		    		console.log($("#chattingRoom"));
		    		console.dir($("#chattingRoom"));
		    		$("#chattingRoom").scrollTop($("#chattingRoom")[0].scrollHeight);
		        
// 		    	//-------------채팅내용 저장
// 		    	//아이디, 내용, 소모임 번호
// 		    	var chatData = {
// 		    			"id":data.id,
// 		    			"msg":data.msg,
// 		    			"somoimNumber": ${JsonBasicInfo}.somoim_number,
// 		    			"date" : date
// 		    	}
		    	
// 		    	console.log(chatData);
// 		    	$.ajaxSetup({         
// 			    	  beforeSend : function(xhr){
// 			      	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
// 				});//먼저 보냄
				
// 				$.ajax({
// 					url:'insertchatting',
// 					type:'post',
// 					data:chatData,
// 					success:function(data){
// 						alert("success");
// 						console.log(data)
						
						
// 					},
// 					error:function(error){
// 						alert("fail")
// 						console.log(error);
// 					}
// 				})
		    		
		    		
		    		
		    		
		        };
		    
		    
		    };

			
		    ws.onclose = function (event) { 
		    	console.log('Info: ', event);
		    	//setTimeout( function(){ connect(); }, 1000); // retry connection!!
				   
		    };
		    
		    ws.onerror = function (err) { console.log('Error: ', err); };
	 }
	
	 
	 
    $('#chattingBtn').on('click', function(evt) {
      console.log("실행되는건가?");
	  evt.preventDefault();
	  if (socket.readyState !== 1) return;
	  		
    	  let data = {
  	  			"id" : ${JsonMysomoimInfo}.member_name,
    			"msg" :  $('#chattingInput').val(),
  	  			"somoimnumber" : ${JsonBasicInfo}.somoim_number,
  	  	  		"profilePicture" : ${JsonMysomoimInfo}.member_profile_picture
    	  }
  	  	  let resultChatData = JSON.stringify(data);
    	  console.log("resultChatData : " +resultChatData)
    	  var date = new Date();
    	  
    	  socket.send(resultChatData);
    	  
    	 	//-------------채팅내용 저장
	    	//아이디, 내용, 소모임 번호
	    	var chatData = {
	    			"id":${JsonMysomoimInfo}.member_name,
	    			"msg":$('#chattingInput').val(),
	    			"somoimNumber": ${JsonBasicInfo}.somoim_number,
	    			"date" : date
	    	}
	    	
	    	console.log(chatData);
	    	$.ajaxSetup({         
		    	  beforeSend : function(xhr){
		      	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
			});//먼저 보냄
			
			$.ajax({
				url:'insertchatting',
				type:'post',
				data:chatData,
				success:function(data){
					console.log(data)
					 $('#chattingInput').val("");
			    	  $('#chattingInput').focus();
					
				},
				error:function(error){
					alert("fail")
					console.log(error);
				}
			})
    	  
    });

    
    // chatting end
	 
	 $(document).on("change","#firstPic",function(){
		 console.log("sadsadchange")
	 })
	 //$("#"+e.target.dataset.input).click(); // firstPic  secondPic  thirdPic
	 
	 if(${JsonMysomoimInfo} == null){ // 신청도 안한 회원일때 
		 $("#chattingRoom").append($("<img width='100%' height='650px' src='../resources/somoimimage/chat.PNG' >"))
	 	 $("#cont2").hide()
	 }else if(${JsonMysomoimInfo}.member_status !== 1 ){
		 $("#chattingRoom").append($("<img width='100%' height='650px' src='../resources/somoimimage/chat.PNG' >"))
	 	 $("#cont2").hide()
	 }else {
		 
	 }
	 
	 //댓글 삭제 버튼
	 $(document).on("click",".deleteReple",function(e){
		console.log("댓글삭제")
		console.log(e.target.dataset.num)
		console.log("댓글 삭제시 해당 현재 페이지 : " + paging_number )
		var data = { 
			"somoim_board_reple_number" : e.target.dataset.num,
			"board_number" : boardinfo.board_number,
			"paging_number" : paging_number
			}
		
		
		$.ajaxSetup({         
			      beforeSend : function(xhr){
			      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		});//먼저 보냄
				$.ajax({
					url:'deleteboardreple',
					type:'post',
					data:data,
				 	dataType:"json", //rest 컨트롤 이용	
					success:function(data){
						console.log(data)
						
					    $("#replelist").empty();
						//
						
						// 페이징 채우기
						$("#replepaging").empty()
						$("#replepaging").html(data.htmlPaging)
					
						//댓글모두 부르기
						showboardreple(data)
						
						
					},
					error:function(error){
						alert("fail")
						console.log(error);
					}
				})
	})
	
	//댓글 수정
	 $(document).on("click",".modiReple",function(e){
		console.log("댓글수정")
		console.log("타겟 넘버")
		console.log(e.target.dataset.num)
		var targetNum = e.target.dataset.num;
		
		$(e.target.parentNode.children[0]).hide();  // 수정은 hide로
		$(e.target.parentNode.children[1]).show();  // 취소버튼 생기고,
		$(e.target.parentNode.children[2]).show();  // 확정버튼 생기고
		
		var newvar = $("#reple"+targetNum).text();
		$("#modireple"+targetNum).val(newvar);
		
		$("#modireple"+targetNum).show();
		$("#reple"+targetNum).hide();
		
		
		
		
		
		
		$(e.target.parentNode.children[1]).on("click",function(e){
			
			console.log("수정취소")
			
			
			
			$(e.target.parentNode.children[0]).show();  //수정버튼 생기고
			$(e.target.parentNode.children[1]).hide();  // 취소버튼 사라지고,
			$(e.target.parentNode.children[2]).hide();  // 확정버튼 사라지고
			$("#modireple"+targetNum).hide();
			$("#reple"+targetNum).show();
			
		})
		
		$(e.target.parentNode.children[2]).on("click",function(e){  //확정 누르면 db 가기
			var newvar = $("#modireple"+targetNum).val();
			$("#reple"+targetNum).text(newvar);
			
			
			var data = {
					 "reple_number": targetNum,
					 "reple_content": newvar
			}
		 	 
			$.ajaxSetup({         
				      beforeSend : function(xhr){
				      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
			});//먼저 보냄
					$.ajax({
						url:'repleModify',
						type:'post',
						data:data,
						success:function(data){
							console.log(data)
							
						},
						error:function(error){
							alert("fail")
							console.log(error);
						}
					})
			
			
			
			
			
			
			
			
			
			
			//성공시 사라지게 하기
			$(e.target.parentNode.children[0]).show();  //수정버튼 생기고
 			$(e.target.parentNode.children[1]).hide();  // 취소버튼 사라지고,
 			$(e.target.parentNode.children[2]).hide();  // 확정버튼 사라지고
 			$("#modireple"+targetNum).hide();
			$("#reple"+targetNum).show();
 			
		})
		
		
		
	})
	
	  // 게시글 수정 버튼 누를 때 트리거 후 실행되는 이벤트
	 $(document).on("click","#boardTrigger",function(e){
		 $("#makeBoardBtn").hide();
		 $("#modiBoardBtn").show();
		 $(".deletepic").remove();
		 //이미지, 버튼 초기화
						
		 
		 
		 
		 console.log("게시글 : " )
		 console.log(boardinfo);
		 $(".modal-title").text("게시글 수정하기");
		 $("#boardtype").val(boardinfo.board_type);
		 $("#boardtitle").val(boardinfo.board_title);
		 $("#boardCont").val(boardinfo.board_content);
		 
		 if(boardinfo.board_first_syspic !== ""){
			 console.log(boardinfo.board_first_syspic)
			 console.log($("#firstPic"))
			 $("#imgfirstPic").attr('src',""+boardinfo.board_first_syspic );
			 $("#firstPicFrame").append($("<button data-pic='1' type='button' class='btn btn-dark deletepic'>×</button>"))
				 
		 }else{
			 $("#imgfirstPic").attr("src","../resources/somoimimage/camera.PNG");
		 }
		
		 if(boardinfo.board_second_syspic !== ""){
			 $("#imgsecondPic").attr('src',""+boardinfo.board_second_syspic);
			 $("#secondPicFrame").append($("<button data-pic='2' type='button' class='btn btn-dark deletepic'>×</button>"))
		 }else{
			 $("#imgsecondPic").attr("src","../resources/somoimimage/camera.PNG");
		 }
	
		 if(boardinfo.board_third_syspic !== ""){
			 $("#imgthirdPic").attr('src',""+boardinfo.board_third_syspic);
			 $("#thirdPicFrame").append($("<button data-pic='3' type='button' class='btn btn-dark deletepic'>×</button>"))
		 }else{
			 $("#imgthirdPic").attr("src","../resources/somoimimage/camera.PNG");
		 }
	
		if(boardinfo.board_fix === '고정'){
			$("#mainboard").prop("checked", true);
		}
		 
	 
		
		
		
	 })
	 
	 
	 
	 //수정 버튼 누를때 (게시판) 트리거 실행
	 $(document).on("click","#boardModify",function(e){
		 console.log("board 수정 ");
	
	 	setTimeout(function() {
	 		$('#boardTrigger').trigger("click");	
	 	}, 200)

	 	
	 	
	 })
	 
	
	 
	 $(document).on("click","#boardDelete",function(e){
	 	console.log("board 삭제 ");
	 	console.log(e.target);
	 	console.log("정보 : " ,boardinfo);
	 	
	 	var data = {
				 "board_number": boardinfo.board_number,
				 "somoim_number": boardinfo.somoim_number,
		}
	 	 
		$.ajaxSetup({         
			      beforeSend : function(xhr){
			      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		});//먼저 보냄
				$.ajax({
					url:'deleteboard',
					type:'post',
					data:data,
				 	dataType:"json", //rest 컨트롤 이용	
					success:function(data){
						console.log(data)
					    $("#somoimBoardCont").empty();
						
						showAllList(data);
						// showboardlist...이놈 써야함;
						
					},
					error:function(error){
						alert("fail")
						console.log(error);
					}
				})
				
	 })
	 
	 
	 // 트리어 실행. 무언의 버튼 qwe
	 $(document).on("click","#qwe",function(e){
		 $("#makeJunmobtn").hide();
		 $("#modiJunmobtn").show();
		 
		 console.log("jminfo : " )
		 console.log(jminfo);
		 
		 $("#jungmo_name").val($("#jmName").text());
		 console.log($("#jminputDate").val().substr(0, 10));
		 $("#jungmo_date").val($("#jminputDate").val().substr(0, 10));
		 console.log($("#jminputDate").val());
		 $("#jungmo_time").val($("#jminputTime").val());
		 $("#jungmo_location").val($("#jmLocation").text());
		 $("#jungmo_money").val($("#jmMoney").text());
		 $("#mapp").hide();
	 
	 })
	 
	 $(document).on("click","#jmModify",function(e){
	 	console.log("수정")
	 	
// 	 	var test = $("<button style='display:none' id='qwe' data-target='#makeJungmo' > </button>");
// 	 	$(".infomodaljmh").append(test);
	 	setTimeout(function() {
	 		$('#qwe').trigger("click");	
	 	}, 200)
	 	
	 })
	 
	 $(document).on("click","#jmDelete",function(e){
		 console.log("삭제 : " +e.target.dataset.jmnumber)
		 
		 //삭제번호와 다시 부를 소모임 번호 필요 번호가 필요
		 var data = {
			 "jungmo_number": e.target.dataset.jmnumber,
			 "somoim_number": e.target.dataset.smnumber,
		 }
		 
		 $.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		      });//먼저 보냄
		      
			$.ajax({
				url:'deletejunmo',
				type:'post',
				data:data,
			 	dataType:"json", //rest 컨트롤 이용	
				success:function(data){
					console.log(data)
					$("#jungmolist").empty();
					showJungmoList(data);
					
					// 정모방 부르는 메소드 
					
					
				},
				error:function(error){
					alert("fail")
					console.log(error);
				}
			})
		 
		 
		 
	 })
	 
	 $("#modal-backdrop").on("click", function(){
		 console.log("????")
	 })
	 
	 $(document).on("click",".pagebtn", function(e){
		 console.log(e.target.dataset.bnum);
		 console.log(e.target.dataset.page);

		 var board_number =e.target.dataset.bnum;
		 paging_number =e.target.dataset.page;
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
					console.log(data)
					
					
					//댓글
					$("#replelist").empty();
					//페이징 
					$("#replepaging").empty();
					
					// 페이징 채우기
					$("#replepaging").html(data.htmlPaging)
					
					//게시글 채우기
					
					showboardreple(data);
					
					
				},
				error:function(error){
					alert("fail")
					console.log(error);
				}
			})
		 
		 
	})
	
	
	//방장과 아닌 사람  // 정모 만들기, 
	var mysomoimInfo = ${JsonMysomoimInfo}
	
	 
	if(mysomoimInfo ==null){
		
	}else if(mysomoimInfo.member_grade == 2){  // 방장일때
		$("#jungmomake").append($("<img data-somoimnum=${roomnum } data-toggle='modal' data-target='#makeJungmo' id='makeSomoim' width='85px' height='85px' src='../resources/somoimimage/makemoim.PNG'> "))
		$("#jungmomake").append($("<span>&nbsp정모만들기</span>"));
	
	
		$("#tablist").append($("<li class='nav-item'><a class='nav-link' data-toggle='pill' onclick='showManagelist()' href='#member'>회원관리</a></li>"));
		$(".nav-item").css("width","25%");
		
		
	}else{ // 방장이 아닐때
		
	
	}

	//회원과 비회원
	if(mysomoimInfo==null){
		$("#joinsomoim").show();
		$("#dropout").hide();
		$(".jungmojoinbtn").hide();
		$(".showAttendList").hide();
		$("#boardWriteBtn").hide();
		$("#title").hide();
		
	}else if(mysomoimInfo.member_status == 1){  // 0 - 대기, 1 - 승인, 2 - 탈퇴회면 
			
		//1. 가입버튼 사라지기 joinsomoim
		$("#joinsomoim").hide();
	

		$(".showBoard").removeAttr("data-fix"); 
	}else{ // 비회원일때 
		
		
		//1. 탈퇴 버튼 보이고,
		$("#dropout").show();
		$("#dropout").text("가입 취소하기");
		
		$("#joinsomoim").hide();
		//2. 취소, 참석자 버튼 안나오게 하기
		$(".jungmojoinbtn").hide();
		$(".showAttendList").hide();
		$("#boardWriteBtn").hide();
		$("#title").hide();
	}
	
	
	$("#jmmakeclose").on("click",function(){
		$("#jungmo_name").val("");
		$("#jungmo_date").val("");
		$("#jungmo_time").val("");
		$("#jungmo_location").val("");
		$("#jungmo_money").val("");
		$("#mapp").hide();
		
	})
	
	$("#makeSomoim").on("click", function(){
		console.log("정모 버튼 누름")
		$('#modiJunmobtn').hide();
		$('#makeJunmobtn').show();
		
	})
			
 })// end ready

 
 var jminfo ;
 //정모 누를때 버튼
 $(document).on("click",'.jmimg',function(e){
	 //부모의 dataset 가져오기
	 console.log(e.currentTarget.parentElement.dataset.jungmonum);
	 
	 var data = { "jungmo_number":e.currentTarget.parentElement.dataset.jungmonum};
	 
	 $.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
	      
		$.ajax({
			url:'jungmoinfo',
			type:'post',
			data:data,
		 	dataType:"json", //rest 컨트롤 이용	
			success:function(data){
				jminfo=data
				$(".infomodaljmb").empty();
				//#mySMModal 모달 바디 싹다 지우기 modaljmb  
				$(".modal-title").text("");  // 작은 모달 초기화
				$(".modal-title").text("정모");  // 작은 모달 초기화
				//$(".modal-body").empty(); // 작은 모달 초기화
		
				console.log("정모정보 ",data)
				console.log("시간",getFormatTime(data.jungmo_date, data.jungmo_time))
				console.log("위치",data.jungmo_location);
				console.log("돈",data.jungmo_money);
				console.log("x",data.jungmo_xpoint);
				console.log("y",data.jungmo_ypoint);
				
				//<div id="map" style="width: 100%; height: 200px; margin-top: 10px;"></div>
				
				//
				
				var jmTime = $("<div id='jmTime'>"+getFormatTime(data.jungmo_date, data.jungmo_time)+"</div><hr>")
				$(".infomodaljmb").append(jmTime);
				
				var jminputDate = $("<input type='hidden' id='jminputDate' value='"+data.jungmo_date+"' >");
				$(".infomodaljmb").append(jminputDate);
				
				var jminputTime = $("<input type='hidden' id='jminputTime'  value='"+data.jungmo_time+"' >");
				$(".infomodaljmb").append(jminputTime);
				
				var jmLocation = $("<div id='jmLocation' style='margin-bottom: 12px;' >"+data.jungmo_location+"</div>")
				$(".infomodaljmb").append(jmLocation);
				// 지도 업로드하기
				var map = $("<div id='map' style='width:100%; height:300px'></div><hr>")
				$(".infomodaljmb").append(map);
				//------------------------------------------------------
				
				
				setTimeout(function() {
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(33.450701,
								126.570667), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption);

					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();

					// 주소로 좌표를 검색합니다
					geocoder
							.addressSearch(
									$searchAddr,
									function(result, status) {

										console.log("result : ", result)
										console.log("status : " + status)

										// 정상적으로 검색이 완료됐으면 
										if (status === kakao.maps.services.Status.OK) {

											x = result[0].x;
											y = result[0].y;

											$("#x").val(x);
											$("#y").val(y);

											var coords = new kakao.maps.LatLng(
													result[0].y,
													result[0].x);

											console.dir(x);
											console.dir(y);

											// 결과값으로 받은 위치를 마커로 표시합니다
											var marker = new kakao.maps.Marker(
													{
														map : map,
														position : coords
													});

											// 인포윈도우로 장소에 대한 설명을 표시합니다
											var infowindow = new kakao.maps.InfoWindow(
													{
														content : '<div style="width:150px;text-align:center;padding:6px 0;">'+$searchAddr+'</div>'
													});
											infowindow.open(map, marker);

											// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
											map.setCenter(coords);
										}
									});
				}, 200) 
				
				var $searchAddr = data.jungmo_location;

				console.log("검색 주소 : " + $searchAddr)

				
				var jmMoney = $("<div id='jmMoney' >"+data.jungmo_money+"</div>")
				$(".infomodaljmb").append(jmMoney);
				
				//여기에 수정 삭제 넣기 . 조건을 뭘로할까? 방장일때 -> 2로 구분
						
				console.log("등급 : " +  ${JsonMysomoimInfo}.member_grade)
				
				$(".infomodaljmh").empty();
				$(".infomodaljmh").append($("<h4 id='jmName'>"+data.jungmo_name+"</h4>"));				
				if(${JsonMysomoimInfo}.member_grade == 2){
					$(".infomodaljmh").append($("<div><button  data-dismiss='modal' id='jmModify' data-jmnumber='"+data.jungmo_number+"' data-smnumber='"+data.somoim_number+"' >수정</button><button id='jmDelete' data-dismiss='modal' data-jmnumber='"+data.jungmo_number+"'  data-smnumber='"+data.somoim_number+"' >삭제</button></div>"))
				}else{
					
				}
				
			},
			error:function(error){
				alert("fail")
				console.log(error);
			}
		})
	 
 })
 
 
 
console.log("내등급",${JsonMysomoimInfo})
console.log("회원",${JsonMemberList})
console.log("정모모임",${JsonJungmoRoom})
console.log("내참석리스트",${JsonAttendlist})
var paging_number = 1;
var JsonMemberList = ${JsonMemberList};
var mysomoimInfo = ${JsonMysomoimInfo}
var Attendlist = ${JsonAttendlist};
var boardlist = ${JsonBoardList};

for(let add = 0 ; add < ${JsonJungmoRoom}.length-Attendlist.length; add++){
	Attendlist.push({});
}


console.log("기본정보",${JsonBasicInfo})
console.log("채팅 : " , ${JsonchatData})
var recentChatData = 	${JsonchatData}
var somo_name = $(${JsonBasicInfo}.somoim_name);

$("#day1").append(somo_name);

var si = $('<img style="width:100%;height:200px;" src="../'+${JsonBasicInfo}.somoim_sys_mainpicture+'">');
$("#top").append(si);
//채팅에 넣기

	for(let v of recentChatData ){
		
		//c chatting
		let cSomoimNumber = v.somoim_number;
		let cId = v.chatting_name;
		let cCont = v.chatting_content;
		let cDate = getFormatDate(v.chatting_date);
		let cTime = getFormatOnlyTime(v.chatting_time)
		let cProfile =v.chatting_profile;
		
			if(${JsonMysomoimInfo}==null || ${JsonMysomoimInfo}.member_status==0){
				
			
			}else if(cId===${JsonMysomoimInfo}.member_name){ //내가 보낸 데이터일 경우
				
				let media = $("<div class='media border p-3 myCommnet' data-date='"+cDate+"'></div>");
				let mediabody = $("<div class='media-body'></div>");
						
				let bodyName = $("<h4><small><i> "+cTime+" </i></small></h4>");
				let bodyCont = $("<p>"+cCont+"</p>");
				
				mediabody.append(bodyCont);
				mediabody.append(bodyName);
						
				media.append(mediabody);
				
				$("#chattingRoom").append(media)
				
	 		}else{ //타인이 보낸 데이터 일경우
	 			let media = $("<div class='media border p-3 yourCommnet' data-date='"+cDate+"'></div>");
		 			
	 			let img = $("<img src='"+cProfile+"' alt='John Doe' class='mr-3 mt-3 rounded-circle' style='width:60px;'>")
		 		media.append(img);
		 		
	 			let mediabody = $("<div class='media-body'></div>");
		 		
	 			let bodyCont = $("<p>"+cCont+"</p>");
	 			let bodyName = $("<h4>"+cId+"<small><i>"+cTime+"</i></small></h4>");
		 		
		 		mediabody.append(bodyCont);
		 		mediabody.append(bodyName);
		 		
		 		media.append(mediabody);
		 		$("#chattingRoom").append(media)
	 		}
		
	}



$("#chattingRoom").scrollTop($("#chattingRoom")[0].scrollHeight);

// if(data.id === ${JsonMysomoimInfo}.member_name ){ //내가 보낸 데이터 일경우
// 	//chattingRoom	
	
// 	var media = $("<div class='media border p-3 myCommnet' data-date='"+getFormatDate(new Date())+"' ></div>");
// 	var mediabody = $("<div class='media-body'></div>");
	
// 	var bodyName = $("<h4><small><i> "+chatTime+" </i></small></h4>");
// 	var bodyCont = $("<p>"+data.msg+"</p>");
// 	mediabody.append(bodyName);
// 	mediabody.append(bodyCont);
	
// 	media.append(mediabody);
// 	$("#chattingRoom").append(media)
	
// 	//$("#chattingRoom").append($("<div class='myCommnet' >"+data.msg+"</div>"))
// }else{ // 내가 보낸 데이터가 아닐경우


// 	var media = $("<div class='media border p-3 yourCommnet'></div>");
	
// 	var img = $("<img src='"+data.profilePicture+"' alt='John Doe' class='mr-3 mt-3 rounded-circle' style='width:60px;'>")
// 	media.append(img);
	
// 	var mediabody = $("<div class='media-body'></div>");
	
// 	var bodyName = $("<h4>"+data.id+"<small><i>"+chatTime+"</i></small></h4>");
// 	var bodyCont = $("<p>"+data.msg+"</p>");
// 	mediabody.append(bodyName);
// 	mediabody.append(bodyCont);
	
// 	media.append(mediabody);
// 	$("#chattingRoom").append(media)


// }



	// 정모만들기 버튼
	var formData=()=>{
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

	console.log("x",formData.get("jungmo_xpoint"))
	console.log("y",formData.get("jungmo_ypoint"))
	
	formData.append('somoim_number',$("#makeSomoim")[0].dataset.somoimnum)
	
	
	console.log("실행되니");
	
	
	//소켓 보내기 위해 방장 외 회원 아이디 답는 거 
	let somoimAllMember =  new Array();
	
	
	for(let v of JsonMemberList){
		if(v.member_id!=${JsonBasicInfo}.somoim_maker){
		somoimAllMember.push(v.member_id);
		}
	}
	
let somoimnumber = String(${JsonBasicInfo}.somoim_number);
	
	let somoimAllMemberObj ={
			"type" : "jungmo",
			"somoimNumber" : somoimnumber,
			"members" : somoimAllMember
			
	};
	
	
	let resultMemberData = JSON.stringify(somoimAllMemberObj);
	//socketalarm.send(resultMemberData); 
	
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
			console.log("정모만든후 ",data)
			$("#jungmolist").empty(); // 리스트
			// 부르기
			// 기존 페이징 empty 게시글 empty
			$("#jungmo_name").val("");
			$("#jungmo_date").val("");
			$("#jungmo_time").val("");
			$("#jungmo_location").val("");
			$("#jungmo_money").val("");
			$("#mapp").hide();
			
			showJungmoList(data); // 정모리스트 메소드 
			
			//알람소켓
			//완료가 되면 소켓으로 완료 됬다고 쏘기!
			socketalarm.send(resultMemberData); 
			
		},
		error:function(error){
			alert("fail")
			console.log(error);
		}

	})

}
	
	//게시글 리플 부르기
	const showboardreple=(data)=>{
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
			var photoSection = $("<div class='photoSection'><img class='rounded-circle' width='90%' height='90%' src='"+v.member_profile_picture+"'></div>")
			var nameSection = $("<div><div>"+v.somoim_board_reple_name+"</div> <div>"+getFormatDate(v.somoim_board_reple_date)+resulttime+"</div></div>")
			profileFrame.append(photoSection);
			profileFrame.append(nameSection);
			
			if(v.somoim_board_reple_name === mysomoimInfo.member_name){
				var modiDeleBtn = $("<div> <button class='modiReple' data-num='"+v.somoim_board_reple_number+"' >수정</button>"+
									"<button style='display:none;' class='cancelModiReple' data-num='"+v.somoim_board_reple_number+"' >취소</button><button style='display:none;' class='okModiReple' data-num='"+v.somoim_board_reple_number+"' >확정</button><button class='deleteReple' data-num='"+v.somoim_board_reple_number+"' >삭제</button></div>")
				profileFrame.append(modiDeleBtn);
			}
			
			var contentFrame = $("<div class='contentFrame'></div>")
			let content=v.board_content
			
			var contentSection = $("<div id='repleframe"+v.somoim_board_reple_number+"' class='titleSection'></div>")
			
			var repleContent = $("<div id='reple"+v.somoim_board_reple_number+"'>"+v.somoim_board_reple_content+"</div>");
			var repleModiInput  = $("<input style='display:none;' id='modireple"+v.somoim_board_reple_number+"'>");
			
			contentSection.append(repleContent);
			contentSection.append(repleModiInput);
			
			
			contentFrame.append(contentSection);
			

			boardFrame.append(profileFrame);
			boardFrame.append(contentFrame);
			
			$("#replelist").append(boardFrame);
			
			}
	}
	
	
	
	// 정모만들기 버튼
	const modiData=()=>{
	console.log("수정하기수정하기")
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

	console.log("x",formData.get("jungmo_xpoint"))
	console.log("y",formData.get("jungmo_ypoint"))
	
	formData.append('somoim_number',jminfo.somoim_number)
	formData.append('jungmo_number',jminfo.jungmo_number)
	
	
	
	$.ajaxSetup({         
      beforeSend : function(xhr){
         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
      });//먼저 보냄
      
	$.ajax({
		url:'modifyjungmomoim',
		type:'post',
		data:formData,
		processData:false,
		contentType:false,  //제이슨 아니니깐 까보지마!!
	 	dataType:"json", //rest 컨트롤 이용	
		success:function(data){
			console.log("정모만든후 ",data)
			$("#jungmolist").empty(); // 리스트
			// 부르기
			// 기존 페이징 empty 게시글 empty
			$("#jungmo_name").val("");
			$("#jungmo_date").val("");
			$("#jungmo_time").val("");
			$("#jungmo_location").val("");
			$("#jungmo_money").val("");
			$("#mapp").hide();
			
			showJungmoList(data); // 정모리스트 메소드 
			
			
			
			
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
	showJungmoList(${JsonJungmoRoom})
	
// 	<div >

// 	<img data-somoimnum=${roomnum} data-toggle="modal"
// 		data-target="#myModal" id="makeSomoim" width="85px"
// 		height="85px" src="../resources/somoimimage/makemoim.PNG">&nbsp정모만들기

// 	</div>
	
	// 날짜 포맷 변환기  str -> date ->str
	function getFormatDate(strdate){
		var date = new Date(strdate);
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
	
	
	//온니 시간만 오후/오전 
	function getFormatOnlyTime(strdate){
		var date = new Date(strdate);
		
		var time = date.getHours();
		var min = date.getMinutes();
		var result ;
		if(time > 12){
			result = "오후 "+(time-12)+"시 "+min+"분"
		}else{
			result = "오전 "+time+"시 "+min+"분"
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
	
	//글쓰기 누를때 버튼 숨기기
	 $("#boardWriteBtn").on("click", function(){
		 $("#makeBoardBtn").show();
		 $("#modiBoardBtn").hide();
		 $(".deletepic").remove();
		 $(".modal-title").text("게시글 작성하기")
		 
		 $("#boardtitle").val("");
		 $("#boardCont").val("");
		 $(".boardCamera").attr('src','../resources/somoimimage/camera.PNG');
		 $("#mainboard").prop('checked',false);
		 
	 })

	 
	 //참석리스트 보기
	$(".showAttendList").on("click", function(e){
		console.log("gg")
		console.log("정모번호 : ", e.target.dataset.jungmonumattend);
		
		//$(".modal-title").text("");  // 작은 모달 초기화
		$(".infomodaljmb").empty(); // 작은 모달 초기화
		
		$(".infomodaljmh").text("참석 리스트");  // title 제목  ;;
		
		//ajax로 리스트 부르기
		var JungmoNumber = {"JungmoNumber" : e.target.dataset.jungmonumattend}
		
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
					var attendPic = $("<div class='attendPicFrame'> <img src='"+v.member_profile_picture+"' class='rounded-circle attendPic' alt='Cinque Terre'> </div>");
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
	//var JsonMemberList = ${JsonMemberList};
	console.log(JsonMemberList)
	showAllMemberList(JsonMemberList);
	
	
	
	//탈퇴
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
	  			alert("탈퇴에 성공했습니다.");
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
	
	
	
	
	
	
	
	
// 소모임가입
$("#joinsomoim").on("click",function(e){
	var somoim_number = e.target.dataset.somoimnum
	console.log(somoim_number);
	var data = {"somoim_number" : somoim_number }
	
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
	      
		$.ajax({
			url:'joinsomoim',
			type:'post',
			data:data,
		 	 //rest 컨트롤 이용	
			success:function(data){
				console.log("조인신청")
				console.log(data)
				
				$("#dropout").text("가입 취소하기");
				$("#dropout").show();
				$("#joinsomoim").hide();
				
			},
			error:function(error){
				alert("fail")
				console.log(error);
			}
		})
	
	
	
		
})//가입하기
	
	
	
	
	$(".boardCamera").on("click",function(e){
		console.log("...사진클릭")
		console.log(e.target.dataset.input)  // firstPic  secondPic  thirdPic
		 $("#"+e.target.dataset.input).click(); // #firstPic  secondPic  thirdPic
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

	
	//boardFrm 게시글 작성하기 버튼 누르면 발생
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
				//somoimBoardCont
				console.log(data.result)
				console.log(typeof data.result)
				
				var boardData = JSON.parse(data.result)  
				boardlist = boardData;  // 새로 업데이트
				console.log(boardData)
				console.dir(boardData)
				
				
				showAllList(boardData);
				
				
				
			},
			error:function(error){
				alert("fail")
				console.log(error);
			}
			
		})
	}
	
	
	//boardFrm 게시글 수정하기 버튼 누르면 발생
	const modiBoardData =()=>{
		console.log("boardData")
		
		
		var formdata = new FormData(document.getElementById("boardFrm"));
		//firstPic secondPic thirdPic
		console.log("testtestqwe : "+formdata.get('firstPic').lastModified)
		console.log("testtestqwez :" +formdata.get('firstPic').name)
		console.log("testtestqwe :" +formdata.get('firstPic'))
		console.log(formdata.get('firstPic').name !== boardinfo.board_first_pic)
		console.log(formdata.get('firstPic').name)
		console.log(boardinfo.board_first_pic)
		
 		console.log("첫번쨰 사진!!!!!!!!!!!!!!!")
		
 		if($("#imgfirstPic").attr('src') ==""+boardinfo.board_first_syspic && formdata.get('firstPic').name.length == 0){ //암것도 안할때
 			 console.log("그대로1")
 			 formdata.append("oripic1", boardinfo.board_first_pic)
 			 formdata.append("syspic1", boardinfo.board_first_syspic)
 		}else if(formdata.get('firstPic').name.length != 0){ //사진변경할때
 			 console.log("사진변경1");
 			 
 		}else if($("#imgfirstPic").attr('src') == "../resources/somoimimage/camera.PNG" ){ //기본사진으로 변경할때(사진x 버튼)
 			 console.log("기본사진변경1")
 		 
 		}

		
		 if($("#imgsecondPic").attr('src') ==""+boardinfo.board_first_syspic && formdata.get('secondPic').name.length == 0){ //암것도 안할때
			 console.log("그대로2")
			 formdata.append("oripic2", boardinfo.board_second_pic)
 			 formdata.append("syspic2", boardinfo.board_second_syspic)
		 }else if(formdata.get('secondPic').name.length != 0){ // 사진변경할때
			 console.log("사진변경2");
		 }else if($("#imgsecondPic").attr('src') == "../resources/somoimimage/camera.PNG" ){ //기본사진으로 변경할때(사진x 버튼)
			 console.log("기본사진변경2")
		 }
		
		
		if($("#imgthirdPic").attr('src') ==""+boardinfo.board_first_syspic && formdata.get('thirdPic').name.length == 0){ //암것도 안할때
			 console.log("그대로3")
			  formdata.append("oripic3", boardinfo.board_third_pic)
 			  formdata.append("syspic3", boardinfo.board_third_syspic)
		 }else if(formdata.get('thirdPic').name.length != 0){ // 사진변경할때
			 console.log("사진변경3");
		 }else if($("#imgthirdPic").attr('src') == "../resources/somoimimage/camera.PNG" ){ //기본사진으로 변경할때(사진x 버튼)
			 console.log("기본사진변경3")
		 }

		
		formdata.append("somoim_number", boardinfo.somoim_number)
		formdata.append("board_number", boardinfo.board_number)
		console.log("==")
		for(var k of formdata.keys()){
			console.log(k+ " : ",formdata.get(k))
		}
		
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		      });//먼저 보냄
		      
		$.ajax({
			url:'modifyboard',  //modifyboard
			type:'post',
			data:formdata,
			processData:false,
			contentType:false,  //제이슨 아니니깐 까보지마!!
		 	dataType:"json", //rest 컨트롤 이용	
			success:function(data){
				$("#somoimBoardCont").empty();
				//somoimBoardCont
				console.log(data.result)
				console.log(typeof data.result)
				
				var boardData = JSON.parse(data.result)  
				boardlist = boardData;
				console.log(boardData)
				console.dir(boardData)
				
				
				showAllList(boardData);
			},
			error:function(error){
				alert("fail")
				console.log(error);
			}
			
		})
	}
	
	
	// 엄청난 실수를 해버렸다.... 클릭시 업데이트 해오는 게 맞다. ajax 써야한다
	const showboardlist = ()=>{
		console.log("게시판 tab 클릭")
		$("#somoimBoardCont").empty();
		console.log(boardlist);
		console.log("???")
		
		var data = {"somoimNumber" : ${JsonBasicInfo}.somoim_number}
		
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");} 
		});
		
		$.ajax({
	  		url: "somoimboards",
	  		type: 'post',
	  		data : data,
	  		dataType: "json", //rest 컨트롤 이용	
	  		success:function(data){
	  			//alert("success");
	  			console.log(data)
	  			
				showAllList(data);
				
	  		},
	  		error:function(error){
	  			alert("fail")
	  			console.log(error);
	  		}
	  		
	  	}) //ajax end
		
		
		
	}
	
	
	const showNotiMember = ()=>{
		
		//JsonMemberList
		console.log("공지 tab 클릭")
		$("#MemberList").empty();
		showAllMemberList(JsonMemberList);
		
	}
	
	
	
	
	
	//해당 게시글 클릭할때 자세히 나오게 하기;
	var boardinfo ;
	const showBoard = (e)=>{
		 $("#makeBoardBtn").show();
		 $("#modiBoardBtn").hide();
		
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
	  			boardinfo = data;
	  			//alert("success");
	  			console.log(data);
	  			$("#boardlikebtnframe").empty()
	  			$("#countlike").empty()
	  			$(".showboardh").empty()
	  			$("#showBoardContent").empty()
	  			$("#showfirstPic").empty()
	  			$("#showsecondPic").empty()
	  			$("#showthirdPic").empty()
				$("#boardreplebtnframe").empty();
// 	  			<div id="showBoardTitle">제목</div>
				
// 				<div id="showBoardContent">내용</div>
				
// 				<div id="showfirstPic">사진1</div>
				
// 				<div id="showsecondPic">사진2</div>
				
// 				<div id="showthirdPic">사진3</div>
	  			
	  			$(".modal-title").text(data.board_title);
	  			$("#showBoardContent").text(data.board_content);
	  			
	  			if(data.board_writer == ${JsonMysomoimInfo}.member_name ){  //글쓴이와 접속아이디가 일치하면
	  				console.log("일치-> 수정, 삭제 버튼 추가")
	  				$(".showboardh").append($("<h4>"+data.board_title+"</h4><div><button  data-dismiss='modal' id='boardModify'  >수정</button><button id='boardDelete' data-dismiss='modal'>삭제</button></div>"))
					
	  				//$(".infomodaljmh").append($("<div><button  data-dismiss='modal' id='jmModify' data-jmnumber='"+data.jungmo_number+"' data-smnumber='"+data.somoim_number+"' >수정</button><button id='jmDelete' data-dismiss='modal' data-jmnumber='"+data.jungmo_number+"'  data-smnumber='"+data.somoim_number+"' >삭제</button></div>"))
					
	  			}
	  			
	  			
	  			
	  			if(data.board_first_syspic===""){
	  				
	  			}else{
	  				var img = $("<img width='100%' height='100%' src='"+data.board_first_syspic+"'>")
	  				$("#showfirstPic").append(img);
	  				$("#showfirstPic").append($("<hr>"));
	  			}
	  			
				if(data.board_second_syspic===""){
					
	  			}else{
	  				var img = $("<img width='100%' height='100%' src='"+data.board_second_syspic+"'>")
	  				$("#showsecondPic").append(img);
	  				$("#showsecondPic").append($("<hr>"));
	  			}
	  			
				if(data.board_third_syspic===""){
				
				}else{
					var img = $("<img width='100%' height='100%' src='"+data.board_third_syspic+"'>")
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
				
				
				//<input id="repleinput" style='width:85%;' type="text" >
				var repleinput = $("<input id='repleinput' style='width:85%;' type='text' >");
				var replebtn = $("<button id='boardreplebtn' class='btn btn-primary' data-snum='"+snum+"' data-bnum='"+bnum+"' onclick='reple(this)'>전송</button>");
				$("#boardreplebtnframe").append(repleinput);
				$("#boardreplebtnframe").append(replebtn);
				
				
				
				$("#countlike").text(data.total_like);
			
	  			
				$("#replelist").empty();
				
				
				showboardreple(data);
				
				
				
				//페이징 
				$("#replepaging").html(data.htmlPaging)
				
				
	  		},
	  		error:function(error){
	  			alert("fail")
	  			console.log(error);
	  		}
	  		
	  	}) //ajax end
		
	  	
	}
	
	
	
	//좋아요 체크하고 다시 셀렉트 
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
	
	
	
	
	//리플 입력하고 리플을 다시 부르기
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
  			console.log(data)
  			
  			
  			
  			
  			//input 지우기
  			$("#repleinput").val("")
  			//reple 지우기
  			$("#replelist").empty();
  			console.log("??",data.somoimreple)
  			console.log("??",data.somoimreple.somoim_board_reple_date)
  			
  			
  			
  			
  			//페이징 
  			showboardreple(data);
				
				
				
				//페이징 
			
			$("#replepaging").html(data.htmlPaging)
			
  		},
  		error:function(error){
  			alert("fail")
  			console.log(error);
  		}
  		
  	}) //ajax end
	
		
		
		
	}
	
	const showOriginMember= (data)=>{
		$("#originMember").empty();
		for( v of data['기존']){
			var attendListFrame = $("<div class='attendListFrame '> </div>");  // 여기에 채워넣어야함
			
			var attendPic = $("<div class='attendPicFrame fitem item1'> <img src='"+v.member_profile_picture+"' class='rounded-circle attendPic' alt='Cinque Terre'> </div>");
  			
			var attendCont =  $("<div class='attendCont fitem item2'> </div>");	
  			var attendTitle = $("<div class='attendTitle'>"+v.member_id+"</div>");	
  			var attendIntroduce = $("<div class='attendIntroduce '>"+v.member_profile_contents+"</div>");
  			
  			
  			
  			attendCont.append(attendTitle);
  			attendCont.append(attendIntroduce);
  			
  			attendListFrame.append(attendPic);
  			attendListFrame.append(attendCont);
  			
  			if(v.member_id !==  ${JsonBasicInfo}.somoim_maker){  //방장아닌 사람만 강퇴 버튼 추가
  				var kickOutBtn = $("<div class='attendBtn fitem item3'><button class='btn btn-warning' id='kickOut' data-id='"+v.member_id+"'>강퇴</button></div>")
  				attendListFrame.append(kickOutBtn);
  			}
  			
  			$("#originMember").append(attendListFrame);
		}
	}
	
	const showIngMember= (data)=>{
		$("#applicantMember").empty();
		
		for( v of data['대기']){
		var attendListFrame = $("<div class='attendListFrame'> </div>");
		var attendPic = $("<div class='attendPicFrame fitem item1'> <img style='width:200px;margin-right:10px;' src='"+v.member_profile_picture+"' class='attendPic' alt='Cinque Terre'> </div>");
			var attendCont =  $("<div class='attendCont fitem item2'> </div>");	
			var attendTitle = $("<div class='attendTitle '>"+v.member_id+"</div>");	
			var attendIntroduce = $("<div class='attendIntroduce '>"+v.member_profile_contents+"</div>");
			
			var permitCancelBtn = $("<div class='attendBtn fitem item3'><button class='btn btn-success' id='agreeSomoim' data-id='"+v.member_id+"'>승인</button><button class='btn btn-danger' id='rejectSomoim' data-id='"+v.member_id+"'>거절</button></div>")
			
			attendCont.append(attendTitle);
			attendCont.append(attendIntroduce);
			
			attendListFrame.append(attendPic);
			attendListFrame.append(attendCont);
			attendListFrame.append(permitCancelBtn);
			$("#applicantMember").append(attendListFrame);
	}
	}
	//아코디언 메뉴
	
	$(document).on("click",".deletepic", function(e){
		var picNum = e.target.dataset.pic;
		console.log(picNum)
		//$(this).remove();
		
		if(picNum==1){
			$("#imgfirstPic").attr("src","../resources/somoimimage/camera.PNG");
		}else if(picNum==2){
			$("#imgsecondPic").attr("src","../resources/somoimimage/camera.PNG");
		}else if(picNum==3){
			$("#imgthirdPic").attr("src","../resources/somoimimage/camera.PNG");
		}
		$(this).remove();
	})
</script>
</body>



</html>