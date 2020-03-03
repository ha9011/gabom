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
    border: none;
    outline: none;
    box-shadow: none;
}
#house_list{
	display:flex;
}
#house{
	border:2px solid black;
	margin:20px; 
}
</style>

</head>
<body>
	<form action="searchhouse" method="get" > <!-- housemain page에서 검색하는 것  -->
	<div class="container">
		<div class="row justify-content-center">
                        <div class="col-12 col-md-10 col-lg-8">
                                <div class="card-body row no-gutters align-items-center">
                                    <div class="col-auto"> <!-- 돋보기 -->
                                        <i class="fas fa-search h4 text-body"></i>
                                    </div>
                                    <!--end of col-->
                                    <div class="col"><!-- 검색창 -->
                                        <input id="searchhouse" name="house_address" class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search topics or keywords">
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
	</form>
	
	<div id="house_list">
		<c:forEach var="hlist" items="${houselist}">
			<div id="house">
				<div id="mainimg"><img class="img" name="${hlist.house_number}" style="width:200px;height:150px;" src="./resources/housemainImage/upload/${hlist.house_sysname}" alt="${hlist.house_sysname}"/></div>
				<div id="info">${hlist.house_name}<br>주소:${hlist.house_address}<br>가격:${hlist.house_price}</div>
			</div>
		</c:forEach>
	</div>
</body>
<script>
 //var houselist=${houselist};
 	//console.log(houselist);
 	 
 $(".img").on('click', function() {
	console.log("사진 클릭") 
	console.log($(this).attr("name"));
    location.href="housedetail?house_number="+$(this).attr("name");
})	 
</script>
<script>
	 
</script>
</html>