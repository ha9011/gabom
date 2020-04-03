<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
<style type="text/css">
.msgBox {
	font-size: 17px;
	font-weight: bold;
	font-family: 'Jua';
	cursor: default;
}

table img {
	width: 130px;
}

.content {
	font-size: 14px;
	font-family: 'Jua';
	font-weight: 200;
	color: gray;
}

.userImg {
	width: 130px;
}

.contentBox {
	display: flex;
}

.contentCnt {
	margin-left:auto;
	background-color: red;
	border-radius: 50%;
	width: 24px;
	color: white;
	text-align: center;
}

.headBox {
	display: flex;
}

.contentDate {
	margin-left: auto;
	font-size: 13px;
}
.oneRow:hover {
	background-color: #E6E6E6;
}
.oneRow td{
	padding: 10px;
}
</style>
<script type="text/javascript">
	$(function(){
		dmLoad();
	});
</script>
</head>
<body>
	<div class="msgBox">
		<table class="table table-hover">

		</table>
	</div>
	<script type="text/javascript">
	function makeDM(json) {
		console.log(json);
		let make="";
		for(let k in json){
				make+='<tr class="oneRow" onclick="clickRow(this)">';
				make+='<td class="col-xs-2 col-sm-2 col-md-1 col-lg-1 userImg">';
				make+='<img src="'+json[k][0]["memberPic"]+'" class="img-thumbnail';
				make+=' img-responsive">';
				make+='</td>';
				make+='<td class="col-xs-10 col-sm-10 col-md-11 col-lg-11">';
				make+='<div class="headBox">';
				make+='<div class="userId">'+json[k][0]["sendMember"]+'</div>';
				make+='<div class="contentDate">'+json[k][0]["dmDateRsult"];
				make+='</div>';
				make+='</div>';
				make+='<br/>';
				make+='<div class="contentBox">';
				make+='<div class="content">'+json[k][0]["contents"]+'</div>';
				if(json[k][0]["checkNum"]==0){
					
				}else{
				make+='<div class="contentCnt">'+json[k][0]["checkNum"]+'</div>';
				}
				make+='</div>';
				make+='</td>';
				make+='</tr>';
		}
		$(".msgBox table").html(make);
	}
	</script>
	<script type="text/javascript">
	var header = $("meta[name='_csrf_header']").attr("content");
	var token = $("meta[name='_csrf']").attr("content");
		function dmLoad() {
			$.ajaxSetup({
				beforeSend : function(xhr){
	 			xhr.setRequestHeader(header,token);
	 			}
			});//먼저 보냄
			$.ajax({
					method:'post',
					url:"sns/dm",
					dataType : "json"
			}).done((dmJson)=>{
				makeDM(dmJson);
			}).fail((error)=>{
				console.log("err",error);
			});			
		}
	</script>
	<script>
	function clickRow(e){
		console.dir(e);
		$(".oneRow").css("background-color","white");
		e.style.backgroundColor="#E6E6E6";
	}
	</script>
</body>
</html>