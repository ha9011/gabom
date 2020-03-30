<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.searchinput{
	width : 33%;
	margin-right: 10px;
}
#somoim {
	display: none;
}

#main {
	width: 90%;
	border: 1px solid gray;
	height: 1000px;
	margin: 20px;
}

#menunav {
	height: 40px;
	text-align: center;
}

.menu {
	width: 200px;
	margin: 100px 200px 0 200px;
}

#myJoin {
	
}

#myNoti {
	
}

.contentFrameInner{
	font-weight: bold;
}

.section {
	border: 1px solid gray;
	width: 30%;
	margin: 100px;
}

#content {
	flex-direction: row;
	justify-content: center;
	display: flex;
}

.title {
	margin: 20px;
}

.showlist {
	overflow: auto;
	padding: 5px;
	border: 1px black solid;
	width: 100%;
	height: 500px;
}

#showlistContent {
	height: 90%;
	width: 100%;
}
#showNotilistContent{
	height: 90%;
	width: 100%;

}
#makeSomoim {
	margin-top: 5px;
	width: 100%;
}

.makeSomoim {
	width: 100%;
}

.mymoimFrame {
	border: 1px solid blue;
	margin: 3px 0 3px 0;
	display: flex;
}

.contentFrame {
	width: 60%;
	height: 90%;
	margin: auto 10px;
}

.contentFrameInner {
	margin: 10px;
}
</style>
<body>

	<header>
		<jsp:include page="/WEB-INF/views/header/somoimheader.jsp" />
	</header>


	<div id="menunav">
		<button id='somoimMenu' type="button"
			class="btn btn-primary btn-lg menu">소모임</button>
		<button id='mySomoimMenu' type="button"
			class="btn btn-primary btn-lg menu">내 모임</button>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<hr>
	<!-- 	mymoim	 -->
	<div id="mainMymoim">
		<div id="content">
			<div id="myJoin" class="section">
				<div class="title">my join</div>

				<div class="showlist">
					<div id="showlistContent"></div>

				</div>
				<div id="makeSomoim">
					<a href="./makesomoim"><button
							class="btn btn-primary makeSomoim">개설하기</button></a>
				</div>
			</div>

			<div id="myNoti" class="section">
				<div class="title">my Noti</div>

				<div class="showlist" id="showNotilistContent"></div>
			</div>
		</div>
	</div>


	<!-- 	somoim	 -->

	<div id="somoim">
		<div id="content">
			<div id="myJoin" class="section">
				<div class="title">추천 소모임</div>

				<div class="showlist">
					<div id="showRecommandListContent"></div>

				</div>

			</div>

			<div id="myNoti" class="section">
				<div class="title">
					<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
						<form class="form-inline" id="searchFrm">
							<input class="searchinput" type="text" name="address"
								placeholder="address">
							<input class="searchinput" type="text" name="hobby"
								placeholder="hobby">	
							<button class="btn btn-success" type="button" id="searchSomoimBtn">Search</button>
						</form>
					</nav>
				</div>

				<div class="showlist" id="searchList"></div>
			</div>
		</div>
	</div>



</body>
<script type="text/javascript">
	var notilist = ${jsonSbNotiList}
	console.log("notilist",notilist)

	//showNotilistContent id 여기다 가 추가
 	for( v of notilist){
 		var mymoimFrame = $("<div class='mymoimFrame' data-roomnumber='"+v.somoim_number +"'></div>");
		
		var imageFrame = $("<div class='imageFrame mymoimcont'><div><img width='100px' height='100px' src='."+v.somoim_sys_mainpicture+"' >  </div> </div>");
		
		var contentFrame =  $("<div class='contentFrame mymoimcont'>  </div>");
		
		var contentUp ;
		var type = v.board_type == 'noti' ? '공지' : '정모';
		contentUp = $("<div class='contentFrameInner'> <div><span>새로운 ["+type+"]가 게시되었습니다.</span> </div>  </div>")
		
		
		var contentdown = $("<div class='contentFrameInner'>"+v.somoim_name +"</div>")
		
		contentFrame.append(contentUp)
		contentFrame.append(contentdown)
		
		mymoimFrame.append(imageFrame)
		mymoimFrame.append(contentFrame)
		
		$("#showNotilistContent").append(mymoimFrame)
 	}
	
	
	$("#searchSomoimBtn").on("click",function(){
		
		var formData = new FormData(document.getElementById("searchFrm"));
		console.log(formData.get("address"))
		console.log(formData.get("hobby"))
		console.log("길이")
		console.log(formData.get("address").length ===0);

		console.log(formData.get("hobby").length===0);
		console.log(formData.get("address").length == 0 && formData.get("hobby") == 0)
		
		if((formData.get("address").length == 0) && (formData.get("hobby") == 0)){
			console.log("검색결과없음")
			
		}else{
			$.ajaxSetup({         
			      beforeSend : function(xhr){
			         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
			      });//먼저 보냄
			      
				$.ajax({
					url:'searchSomoim',
					type:'post',
					data:formData,
					processData:false,
					contentType:false,  //제이슨 아니니깐 까보지마!!
				 	dataType:"json", //rest 컨트롤 이용	
					success:function(data){
						alert("success");
						console.log(data)
						$("#searchList").empty();
						for( v of data ){
							console.log(v);
							var mymoimFrame = $("<div class='mymoimFrame' data-roomnumber='"+v.somoim_number +"'></div>");
							
							var imageFrame = $("<div class='imageFrame mymoimcont'><div><img width='100px' height='100px' src='."+v.somoim_sys_mainpicture+"' >  </div> </div>");
							
							var contentFrame =  $("<div class='contentFrame mymoimcont'>  </div>");
							
							var contentUp ;
							
							contentUp = $("<div class='contentFrameInner'> <div><span>&nbsp&nbsp&nbsp&nbsp"+v.somoim_location+"</span> </div>  </div>")
							
							
							var contentdown = $("<div class='contentFrameInner'>"+v.somoim_name +"</div>")
							
							contentFrame.append(contentUp)
							contentFrame.append(contentdown)
							
							mymoimFrame.append(imageFrame)
							mymoimFrame.append(contentFrame)
							
							$("#searchList").append(mymoimFrame)
							
						}
						
					},
					error:function(error){
						alert("fail")
						console.log(error);
					}
				})
		}
		
	
		
		
		
		
		
		
		
	})
	
	$("#somoimMenu").on('click',function(){
		$("#somoim").show();
		$("#mainMymoim").hide();
	})
	
	$("#mySomoimMenu").on('click',function(){
		$("#somoim").hide();
		$("#mainMymoim").show();
	})
	
	

	
	var joinmoim = ${joinMoim}
	console.log(joinmoim)
	
	var recommandSmList = ${jsonRecommandSmList};
	console.log(recommandSmList)
	
	//showlistContent
	for( v of joinmoim ){
		console.log(v);
		var mymoimFrame = $("<div class='mymoimFrame' data-roomnumber='"+v.SOMOIM_NUMBER +"'></div>");
		
		var imageFrame = $("<div class='imageFrame mymoimcont'><div><img width='100px' height='100px' src='."+v.SOMOIM_SYS_MAINPICTURE+"' >  </div> </div>");
		
		var contentFrame =  $("<div class='contentFrame mymoimcont'>  </div>");
		
		var contentUp ;
		if(v.MEMBER_GRADE === 0){  //일반회원
			contentUp = $("<div class='contentFrameInner'> <div><img width='22px' height='22px' src='../resources/somoimimage/seed.PNG' art='미정'/> <span>&nbsp&nbsp&nbsp&nbsp"+v.SOMOIM_LOCATION+"</span> </div>  </div>")
		}else if(v.MEMBER_GRADE === 1){ // 매니저
			contentUp = $("<div class='contentFrameInner'> <div><img width='22px' height='22px' src='../resources/somoimimage/flower.PNG' art='미정'/> <span>&nbsp&nbsp&nbsp&nbsp"+v.SOMOIM_LOCATION+"</span> </div>  </div>")
		}else if(v.MEMBER_GRADE === 2){ // 방장
			contentUp = $("<div class='contentFrameInner'> <div><img width='22px' height='22px' src='../resources/somoimimage/crown.PNG' art='미정'/> <span>&nbsp&nbsp&nbsp&nbsp"+v.SOMOIM_LOCATION+"</span> </div>  </div>")
		}
		
		var contentdown = $("<div class='contentFrameInner'>"+v.SOMOIM_NAME +"</div>")
		
		contentFrame.append(contentUp)
		contentFrame.append(contentdown)
		
		mymoimFrame.append(imageFrame)
		mymoimFrame.append(contentFrame)
		
		$("#showlistContent").append(mymoimFrame)
		
	}
	
	for( v of recommandSmList ){
		console.log(v);
		var mymoimFrame = $("<div class='mymoimFrame' data-roomnumber='"+v.somoim_number +"'></div>");
		
		var imageFrame = $("<div class='imageFrame mymoimcont'><div><img width='100px' height='100px' src='."+v.somoim_sys_mainpicture+"' >  </div> </div>");
		
		var contentFrame =  $("<div class='contentFrame mymoimcont'>  </div>");
		
		var contentUp ;
		
		contentUp = $("<div class='contentFrameInner'> <div><span>&nbsp&nbsp&nbsp&nbsp"+v.somoim_location+"</span> </div>  </div>")
		
		
		var contentdown = $("<div class='contentFrameInner'>"+v.somoim_name +"</div>")
		
		contentFrame.append(contentUp)
		contentFrame.append(contentdown)
		
		mymoimFrame.append(imageFrame)
		mymoimFrame.append(contentFrame)
		
		$("#showRecommandListContent").append(mymoimFrame)
		
	}
	
	
	//검색했을때
	$(document).on("click",".mymoimFrame",function(e){
		
		console.log($(this))
		console.log($(this)[0].dataset.roomnumber)
		var room = $(this)[0].dataset.roomnumber;
		var url = "./somoimroom?roomnumber="+room;  
        //window.open(url, "new_window",'location=yes, directories=yes, width=#, height=#'); 
        location.href = url;
	})
	

	
</script>
</html>