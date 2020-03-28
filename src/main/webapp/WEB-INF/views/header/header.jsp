<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet"/>
<link rel="stylesheet" href="resources/fontCss/fontAni.css">
<style>
body {
   /* background-image: url(images/tree-247122_1280.jpg);
   background-size: cover; */
}

#headerContainer {
   margin-top: 10px;
   border-radius: 20px;
   background-color: white;
}

img {
   float: none;
   margin: 0 auto;
   display: flex;
   align-items: center;
   width: 250px;
   height: 75px;
   margin-bottom: 40px;
}

li {
   font-size: 16px;
   font-weight: 700;
   font-family: 'Jua' ;
}
#logout{
border: 0;
outline: 0;
background-color: white;
color: #337ab7;
font-family: 'Jua' ;
width: 85px;
height: 50px;
}
#logout:hover{
background-color: #E6E6E6
}
.nav-tabs{

         /* background-color: #16AEF6;  */
         background-color : white; 
         border: 0;
         border-radius: 10px;
         padding-left: 30px;
         
      }
      .nav-tabs li a{
         /*color: #2E2E2E;*/
         color: black;
         font-size: 19px;
         margin-left: 20px;
         
      }
</style>
</head>
<body>
   <div class="container" id="headerContainer">
   <div class="col-md-12 col-sm-12 col-xs-12">
      <ul class="nav navbar-nav navbar-right">
         <sec:authorize access="isAnonymous()">
            <li><a href="login" >로그인</a></li>
            <li><a href="joinselecttype">회원가입</a></li>
         </sec:authorize>
         <sec:authorize access="isAuthenticated()">
            <li><a href="myinfo" target="_blank">나의 정보</a></li>
            <li>
               <form method="post" action="/gabom/logout">
                  <input type="submit" value="로그아웃" id="logout"> <input type="hidden"
                     name="${_csrf.parameterName}" value="${_csrf.token}" />
               </form>
            </li>
         </sec:authorize>
      </ul>
      </div>
      <div class="col-md-12 col-sm-12 col-xs-12"><a href="/gabom/">
         <img src="resources/headerImage/logo3.png">
         </a>
      </div>
      </div>
      <div class="container-fluid" id="navContainer">
         <ul class="nav nav-tabs nav-justified">
            <li><a href="trip" id="travel">여행</a></li>
            <li><a href="snsmain" id="sns" >SNS</a></li>
            <li><a href="housechoice" id="room" >숙박</a></li>
            <li><a href="foodmain" id="popularRestaurant">맛집</a></li>
            <li><a href="somoim/mainsomoim" id="somoim">소모임</a></li>
            <li><a href="#" id="service">고객센터</a></li>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
            <li><a href="adminmenu" id="admin">관리자</a></li>
			</sec:authorize>
            <!-- <li><a href="dumi">더미</a></li> -->
         </ul>
      </div>
      <script type="text/javascript">
      //호버시 아이콘 변환 스크립트
         $("#travel").hover(function () {
            $("#travel").html('<i class="fas fa-plane-departure faa-float animated"></i>');
         },function(){
            $("#travel").html('여행');   
         });
         
         $("#sns").hover(function () {
            $("#sns").html('<i class="far fa-comments faa-tada animated"></i>');
         },function(){
            $("#sns").html('SNS');
         });
         
         $("#room").hover(function () {
            $("#room").html('<i class="fas fa-hotel faa-pulse animated"></i>');
         },function(){
            $("#room").html('숙박');
         });
         
         $("#popularRestaurant").hover(function () {
            $('#popularRestaurant').html('<i class="fas fa-utensils faa-wrench animated"></i>');
         },function(){
            $('#popularRestaurant').html('맛집');
         });
         
         $("#somoim").hover(function () {
            $('#somoim').html('<i class="fas fa-users faa-pulse animated"></i>');
         },function(){
            $('#somoim').html('소모임');
         });
         
         $("#service").hover(function () {
            $('#service').html('<i class="fas fa-headset faa-wrench animated"></i>');
         },function(){
            $('#service').html('고객센터');
         });
         $("#admin").hover(function () {
             $('#admin').html('<i class="far fa-sun fa-spin"></i>');
          },function(){
             $('#admin').html('관리자');
          });
      </script>
      <script type="text/javascript">
      $(function() {
          $("body").css("display", "none");
          $("body").fadeIn(500);
          $("#sns").click(function(event){
              $("body").fadeOut(500);
          });
      });
      
      </script>
</body>
</html>