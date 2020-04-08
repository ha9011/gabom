<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가봄 맛집</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 검색창 부트스트랩 -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<style>
.form-control-borderless {
    border:none;
}

.form-control-borderless:hover, .form-control-borderless:active, .form-control-borderless:focus {
    border:1px solid lightgray;
    outline: none;
    box-shadow: none;
}
#food_list{
	width:95%;
	margin:0 10%;
}
.food{
	width:15%;
	display:inline-block;
	margin:20px;
	box-shadow:5px 5px 3px lightgray;
	text-align:center;
	cursor:pointer;
	
}
#img{
	width:100%;
	height:150px;
	margin:0;
}
#info{
	color:#848484;
}
h4{
margin:0;
}
#searchfood{
text-align:center;
margin:0 10px;
border:none;
}
.out{
width:100%;
border:1px solid lightgray;
margin-top:40px;
border-radius: 50px;
}
#searchbtn{
border-radius: 40px;
background-color:#3abade;
}
</style>

</head>
<body>
	<header id="hea">
		<jsp:include page="/WEB-INF/views/header/househeader.jsp" />
	</header>


	<form action="searchfood" method="get" > <!-- foodmain page에서 검색하는 것  -->
	<div class="container">
		<div class="row justify-content-center">
                        <div class="col-12 col-md-5 col-lg-12">
                                <div style="padding: 0.5rem;margin-left: 50px;" class="out card-body row no-gutters align-items-center">
                                    <div class="col-auto"> <!-- 돋보기 -->
                                        <i class="fas fa-search h4 text-body"></i>
                                    </div>
                                    <!--end of col-->
                                    <div class="col"><!-- 검색창 -->
                                        <input id="searchfood" name="food_address" class="form-control form-control-borderless" type="search" placeholder="지역을 입력해주세요">
                                    </div>
                                    <!--end of col-->
                                    <div class="col-auto"><!-- 검색버튼 -->
                                        <button id="searchbtn" class="btn btn-lg " type="submit">Search</button>
                                    </div>
                                    <!--end of col-->
                                </div>
                        </div>
                        <!--end of col-->
          </div>
	</div>
	</form>
	<div id="food_list">
	</div>
	
	
<div>
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
</div> 
	
</body>
<script>
var foodlist=${foodlist};
 	console.log(foodlist);
 	
 	var food_list = document.getElementById("food_list");

 	let index =0;
 		for(i of foodlist ){
 	 		 if(index%5==0){
 	 			console.log(index);
 	 			var br = $('<br><br>');
 	 			$("#food_list").append(br);
 	 		} 
 		
 		 var out = $('<div class="food" name ='+[i.food_number]+'></div>')
 		 var img = $('<div class="mainimg" name ='+[i.food_number]+'><img id="img" alt='+[i.food_sysname]+'name ='+[i.food_number]+' src="'+[i.food_sysname]+'"></div>')
 		 var title=$('<p style="font-weight:bold">'+[i.food_name]+'</p>');
 		 var info = $('<div id="info">'+"주소: "+[i.food_address]+'</div>')

 		$("#food_list").append(out);
 		out.append(img);
 		out.append(title);
 		out.append(info);
 index++;
 }
 		$(".mainimg").on('click', function() {
 			console.log($(this).attr("name"));
 		    location.href="fooddetail?food_number="+$(this).attr("name");
 			});
</script>
</html>