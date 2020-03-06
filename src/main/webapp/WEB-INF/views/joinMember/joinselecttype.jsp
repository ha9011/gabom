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
.out{
min-width:40%;
}
#travelContent{
width:500px;
}
#serviceContent{
width:500px;
}
.card-img-top{
width:100%;
}
.container{
max-width:1500px;
height:800px;
display: flex;
margin:10% 20%
}
h1{
letter-spacing:10px;
}
</style>

</head>
<body>
<header style="background-color:#064D84" class="bg-primary text-center py-5 mb-4">
  <div >
    <h1 style="font" class="font-weight-bold text-white">Select Your Type</h1>
  </div>
</header>

<!-- Page Content -->
<section class="container" id="imgzone">
  
 
    <div class="out" id="out">
      <div class="card border-0 shadow" id="travelContent">
        <img id="gabom_house" style="width:500px;height:300px;cursor: pointer;" src="./resources/userprofileimage/traveltype.jpg" class="card-img-top" alt="...">
        <div class="card-body text-center">
          <h4 class="card-title mb-0">여행객</h4>
          <div class="card-text text-black-50">GABOM에서 제공하는 여행계획, 숙박예약,</div>
          <div class="card-text text-black-50">음식점예약, SNS 등 여러 서비스를 사용할 수 있습니다.</div>
        </div>
      </div>
    </div>
    
    <div class="out">
      <div class="card border-0 shadow" id="serviceContent">
        <img id="hotel" style="width:500px;height:300px;cursor: pointer;" src="./resources/userprofileimage/servicetypefood.jpg" class="card-img-top" alt="...">
        <div class="card-body text-center">
          <h4 class="card-title mb-0">서비스업체</h4>
          <div class="card-text text-black-50">GABOM의 여행자에게 서비스를 제공할 수 있습니다.</div>
          <div class="card-text text-black-50">&nbsp</div>
        </div>
      </div>
    </div>
    
</section>
<!-- /.container -->
</body>
<script>
$("#travelContent").on("click",function(){
	console.log("여행자")
	location.href="joinmember?member_type=1"
})

$("#serviceContent").on("click",function(){
	console.log("서비스업체")
	location.href="joinmember?member_type=2"
//	location.href=""
	
})
</script> 

</html>