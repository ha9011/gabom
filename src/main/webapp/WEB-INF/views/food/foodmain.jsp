<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가봄 숙소</title>
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
	width:100%;
}
#food{
	width:15%;
	display:inline-block;
	margin:20px;
	box-shadow:5px 5px 3px lightgray;
	text-align:center;
}
img{
	width:100%;
	height:200px;
	margin:5px 0;
}
#info{
	color:#848484;
}
h4{
margin:0;
}
</style>

</head>
<body>
	<form action="searchfood" method="get" > <!-- foodmain page에서 검색하는 것  -->
	<div class="container">
		<div class="row justify-content-center">
                        <div class="col-12 col-md-10 col-lg-8">
                                <div class="card-body row no-gutters align-items-center">
                                    <div class="col-auto"> <!-- 돋보기 -->
                                        <i class="fas fa-search h4 text-body"></i>
                                    </div>
                                    <!--end of col-->
                                    <div class="col"><!-- 검색창 -->
                                        <input id="searchfood" name="food_address" class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search topics or keywords">
                                    </div>
                                    <!--end of col-->
                                    <div class="col-auto"><!-- 검색버튼 -->
                                        <button id="searchbtn" style="background-color:#064D84" class="btn btn-lg btn-success" type="submit">Search</button>
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
 		
 		 var out = $('<div id="food" name ='+[i.food_number]+'></div>')
 		 var img = $('<div id="mainimg" name ='+[i.food_number]+'><img alt='+[i.food_sysname]+'name ='+[i.food_number]+' src="'+[i.food_sysname]+'"></div>')
 		 var title=$('<h4>'+[i.food_name]+'</h4>');
 		 var info = $('<div id="info">'+"주소: "+[i.food_address]+'</div>')

 		$("#food_list").append(out);
 		out.append(img);
 		out.append(title);
 		out.append(info);
 	 	
 $("#mainimg").on('click', function() {
	console.log($(this).attr("name"));
    location.href="fooddetail?food_number="+$(this).attr("name");
	});
 index++;
 }
</script>
</html>