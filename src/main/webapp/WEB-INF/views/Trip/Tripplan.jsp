<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<link rel="icon" href="favicon.ico">
<title>Nantes - Onepage Business Template</title>
<!-- Bootstrap core CSS -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Custom styles for this template -->
<link href="./resources/css/owl.carousel.css" rel="stylesheet">
<link href="./resources/css/owl.theme.default.min.css"  rel="stylesheet">
<link href="./resources/css/animate.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">

<style>
#inbox{
width:700px;
height:400px;
background-color:black;
 background-color: rgba(0, 0, 0, 0.7);
font-size:25px;
}
.content{
margin: 40px;
}
#searchbox{
margin-top:20px;
display:flex;
}
.cont{
margin:20px 10px;
color: white;
float:left;
text-align:left;
}
.date{
color: black;
}

</style>


</head>

<body id="page-top">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header page-scroll">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<!--로고 자리 -->
					<a href=""><img style="width:200px;" src="./resources/headerImage/logo3.png" alt="logo"></a>
				</div>
				
				
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="hidden">
							<a href="#page-top"></a>
						</li>
						
						<li>
							<a class="page-scroll" href="/gabom/">Home</a>
						</li>
						<li>
							<a class="page-scroll" href="snsmain">SNS</a>
						</li>
						<li>
							<a class="page-scroll" href="#">내여행</a>
						</li>
						<li>
							<a class="page-scroll" href="housechoice">숙박</a>
						</li>
						<li>
							<a class="page-scroll" href="foodmain">맛집</a>
						</li>
						<li>
							<a class="page-scroll" href="#team">VIP</a>
						</li>
						<li>
							<a class="page-scroll" href="#contact">고객센터</a>
						</li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		<!--메뉴 자리 -->
		
		
		<!-- Header -->
		<header>
			<div class="container-fluid">
				<img style="width:100%;height:900px;" src="./resources/tripImage/planbg.JPG" class="img-responsive" alt="portfolio">
					<div id="outbox" class="intro-text">
						<div id="inbox">
								<br>
								<form class="content">
								<div class="content" id ="searchbox">
    								<input name="trip_area" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
    								<!-- <button style="margin:0 5px; " class="btn btn-success">Search</button> -->
    							</div>	
    							
    								<div class="cont">Trip Title
    									&nbsp;<input name="trip_title" style="width:480px" class="date" type="text">
    								</div>
    								<div class="cont" >Trip Date
    									<input name="trip_start_date" type="date" class="date" aria-label="Start Date" ><input name="trip_end_date" class="date" type="date" placeholder="End Date">
    								</div>
    								<button id="savebtn" class="btn btn-primary">저장 </button>
    								<button id="resetbtn" class="btn btn-primary">초기화</button>
    							</form>
						</div>
					</div>
			</div>
		</header>
		
		<div>
			<jsp:include page="/WEB-INF/views/footer.jsp"/>
		</div>
		
		

		<!-- Bootstrap core JavaScript
			================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
		<script src="./resources/js/bootstrap.min.js"></script>
		<script src="./resources/js/owl.carousel.min.js"></script>
		<script src="./resources/js/cbpAnimatedHeader.js"></script>
		<script src="./resources/js/jquery.appear.js"></script>
		<script src="./resources/js/SmoothScroll.min.js"></script>
		<script src="./resources/js/theme-scripts.js"></script>
</body>
<script>
$("#resetbtn").on('click', function() {
	$(".content")[0].reset();	
	
});


$("#savebtn").on('click', function() {//1차 여행플랜 생성 
	var formData = new FormData(document.getElementById("content")); 
	
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
  
  $.ajax({
      url:'savetripplan',
      type:'post',
      data:formData,
      processData:false,
      contentType:false,  //제이슨 아니니깐 까보지마!!
       dataType:"json", //rest 컨트롤 이용   
      success:function(data){
         alert("여행플랜이 저장되었습니다.");
         console.log(data)
         $("#reservation")[0].reset();
         
      },
      error:function(error){
         alert("저장에 실패했습니다.")
         console.log(error);
      }
      
   })
	
	
	
});// 클릭이벤트 끝






</script>

</html>