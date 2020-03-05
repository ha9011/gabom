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
<style>
#profileArea {
	border: 1px solid black;
}

#picArea {
	border: 1px solid black;
	margin: 50px;
	display: inline-block;
	text-align: center;
}

#etcArea {
	border: 1px solid black;
	margin: 10px;
	display: inline-block;
}

#mainContent {
	margin-top: 20px;
	border: 1px solid black;
	display: inline-block;
	width: 100%;
	height: 500px;
}

#mainsection {
	border: 1px solid black;
	
}

#Content {
	margin: 10px;
	border: 1px solid black;
	display: inline-block;
	width: 97%;
	height: 450px;
}

#introduce {
	margin: 30px;
	height: 100px;
}
</style>
</head>
<body>


	<!-- 용돈 충전 modal -->
	<div class="modal fade" id="exampleModalChargeMoney" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">충전하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="chargeMoney">
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">현재 금액
								: ${myinfodata.member_money} 원</label> <input type="text"
								class="form-control" id="inputChargeMoney"
								placeholder="충전할 금액을 입력하세요">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<input type="button" class="btn btn-primary" onclick="formData()"
						data-dismiss="modal" value="충전하기">
				</div>
			</div>
		</div>
	</div>


	<!-- 프로필 변경  -->
	<div class="modal fade" id="exampleModalChangeInfo" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>


	<div id=mainsection>

		<div id="profileArea">
			<div id="picArea" class="card" style="width: 400px">
				<img id="meddelanden" class="card-img-top" src="${myinfodata.member_profile_picture}"  alt="Card image"
					style="width: 100%">
				<input id="changeProfile" type="file" name="changeProfile">
				<div class="card-body">
					<h4 class="card-title">John Doe</h4>
					<p class="card-text">${myinfodata.member_profile_contents}</p>
					<a href="#" class="btn btn-primary">See Profile</a>
				</div>
			</div>
			
			
			<div id="etcArea">
			<div id="chargeMoney">
				현재 금액 : <span id="showMoney">${myinfodata.member_money} 원</span> <br>
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#exampleModalChargeMoney" data-whatever="@mdo">충전하기</button>

			</div>

			<div id="personInfo">
				이름 : <span>하동원</span> <br> 나이 : <span>30</span> <br> 게시글 :
				<span>10개</span> <br>
			</div>

			<div id="submenu">
				<ul>
					<il>게시글</il>
					<il>댓글</il>
					<il>찜목록</il>
					<il>좋아요</il>
					<il>예약목록</il>
					<il>여행계획</il>
					<il>쿠폰함</il>
				</ul>
			</div>


		</div>
		</div>


		
	</div>


	<div id="mainContent">
		<div id="Content"></div>
	</div>

	</div>


</body>
<script>
var elem = '<div  class="well"><a id="changePicBasic" href="#">기본이미지변경</a></div>'+
'<div  class="well"><a id="changePicWant" href="#">사진이미지변경</a></div>'+
'<button id="close-popover" data-toggle="popover" class="btn btn-small btn-primary pull-right" onclick="$(&quot;#meddelanden&quot;).popover(&quot;hide&quot;);">Close please!</button>';

$('#meddelanden').popover({animation:true, content:elem, html:true});



	var a = "${myinfodata.member_id}";
	console.log(a);
	
	
const formData= ()=>{
	console.log("????")
	
	
	//formDATA 사용목적
	//1.multipart/form-data 를 전송시 무조건 사용(파일업로드)
	//2.ajax를 이용한 restFul에서 사용함
	//3.formdata객체는 form의 일부데이터만 서버에 전송할때도 좋슴.
	
// 	var formData = new FormData(document.getElementById("frm"));
// 	console.log(formData.get("b_title"))
// 	console.log(formData.get("b_contents"))
// 	console.log(formData.get("files"));
	
	var formData = new FormData();
	console.log("ChargeMoney",$("#inputChargeMoney").val);
	formData.append('ChargeMoney',$("#inputChargeMoney").val())
	
	
	
// 	var files=$("#files")[0].files;
// 	for(let i = 0 ; i<files.length; i++){
// 		formData.append("files", files[i]);  //map과 달리 key가 같아도 중복 저장됨
// 	}
	
// 	console.log(formData.getAll("files"));
	
	$.ajaxSetup({         
      beforeSend : function(xhr){
         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
      });//먼저 보냄

      
	$.ajax({
		url:'myinfo/chargemoney',
		type:'post',
		data:formData,
		processData:false,
		contentType:false,  //제이슨 아니니깐 까보지마!!
	 	dataType:"json", //rest 컨트롤 이용	
		success:function(data){
			alert("success");
			
			console.log(data.member_money)
			$("#showMoney").text(data.member_money+"  원")
		},
		error:function(error){
			alert("fail")
			console.log(error);
		}
		
	})
}


$(document).on("click","#changePicWant",function(){
	console.log("원하는 사진 변경")
	//ajax실행하기	
	$("#changeProfile").trigger("click");
	$("#meddelanden").trigger("click");
})


$(document).on("click","#changePicBasic",function(){
	console.log("기본이미지")
	$("#meddelanden").trigger("click");
	
})

</script>
</html>