<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>House Choice</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src=https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.slim.min.js></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<style>
#out{
width:100%;
}
#sub{
width:1000px;
margin:0 15%;
}
.card-img-top{
width:100%;
}
section{
width:100%;
height:800px;
}
h1{
letter-spacing:10px;
}

</style>

</head>
<body>
<header>
	<jsp:include page="/WEB-INF/views/header/choicehouseheader.jsp" />
</header>


<!-- Page Content -->
<section class="container" id="imgzone" style="padding:4rem;height:100%">
  
 
    <div class="col-xl-3 col-md-6 mb-4" id="out">
      <div class="card border-0 shadow" id="sub">
        <img id="gabom_house" style="width:1000px;height:400px;cursor: pointer;" src="./resources/houseimg/gabomhouse.jpg" class="card-img-top" alt="...">
        <div class="card-body text-center">
          <h4 class="card-title mb-0">Gabom House</h4>
          <div class="card-text text-black-50">Join Gabom House</div>
        </div>
      </div>
    </div>
    
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-0 shadow" id="sub">
        <img id="hotel" style="width:1000px;height:400px;cursor: pointer;" src="./resources/houseimg/hotel.JPG" class="card-img-top" alt="...">
        <div class="card-body text-center">
          <h4 class="card-title mb-0">Hotel</h4>
          <div class="card-text text-black-50">Join Hotel</div>
        </div>
      </div>
    </div>
 
  <!-- /.row -->
</section>
<!-- /.container -->

 <div>
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
</div> 
</body>

<script>
	var hotel = document.getElementById("hotel");
	var gabom_house1 = document.getElementById("gabom_house");
	//var hotelcom = "https://www.hotelscombined.co.kr/";
	var gabom_house2 ="housemain"
	
	hotel.addEventListener('click', function(e) {
	console.log("호텔로 이동");
	$(location).attr('href',"choicehotel");
	});
	
	gabom_house.addEventListener('click', function(e) {
		console.log("가봄숙소로 이동");
		$(location).attr('href',gabom_house2);
	});
</script> 

</html>