<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My plan</title>
<link rel="icon" href="favicon.ico">
<!-- Bootstrap core CSS -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Custom styles for this template -->
<link href="./resources/css/owl.carousel.css" rel="stylesheet">
<link href="./resources/css/owl.theme.default.min.css"  rel="stylesheet">
<link href="./resources/css/animate.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">
<!-- nav영역  -->


<!-- Custom fonts for this template -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="./resources/css/coming-soon.min.css" rel="stylesheet">


<style>
body{overflow:hidden; }
#out{
   display: flex;
   
      
}
#trp{
   width: 100%;
   height: 1200px;
   background-color: rgba(255, 255, 255, 0.7);
   margin-top:80px;
   text-align: center;
}
#ct{
   width: 600px;
   height: 1200px;
   background-color: rgba(0, 46, 102, 0.8);
   margin-top:80px;
   text-align: center;
   }   
#mylist{
   font-size:20px;
   font-weight:bold;
   width:100%;
}

.bar{
     text-align:center;
     font-size:30px;
}
#table{
    margin:20px 10px; 
}
tr{
text-align:center;
margin:15px 0; 
}

#main{

width:100%;
margin-top:60%;
color:white;
}
#joinbtn{
float:right;
margin:10px 200px;
}
#t_title{
cursor: pointer;
text-decoration:none;
}

</style>

</head>
<body>

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
               <img style="width:200px;" src="./resources/headerImage/logo3.png" alt="logo">
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
                     <a class="page-scroll" href="myplan">내여행</a>
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
  
  
  

  <div class="overlay"></div>
  <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
    <source src="./resources/css/bg.mp4" type="video/mp4">
  </video>
 
 
    <div id="out">
     
     <div class="masthead" id="ct">
     		
            <div id="main">
            	<div id="propic"></div>
            	<div id="title"></div>
            </div>
         </div>
         
         
        <div class="masthead" id="trp">
           <div id="table">
           <table id="mylist">
              <tr>
                 <th class="bar">여행 제목</th>
                 <th class="bar">여행지</th>
                 <th class="bar">여행 날짜</th>
                 <th style="width:500px" class="bar">친구와 함께하기 </th>
              </tr>
           </table>
           </div>
         </div>
   </div>
   
   <%-- <div>
      <jsp:include page="/WEB-INF/views/footer.jsp"/>
   </div>  --%>
   
   
   
 

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div id="flist">
       
       </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-lg" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
   
   
<!-- Custom scripts for this template -->
<script src="./resources/js/coming-soon.min.js"></script>
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
 var mylist =${myplanlist};
 console.log("내 여행 목록",mylist);
 var myinfo =${memberinfo};
 console.log(myinfo);
 var friend =${friendlist};
 console.log(friend);
 
 var sd = getFormatDate(mylist[0].trip_start_date);
 var ed = getFormatDate(mylist[0].trip_start_date);
 
 console.log(sd, ed)
 //------------------------------------------------------------------데이터 영역
 
 var propic =$('<img style="width:300px;border-radius:70%;" src="'+myinfo[0].member_profile_picture+'">');
 $("#propic").append(propic);
 
 var n =$('<h1>'+myinfo[0].member_id+'님'+'</h1><h3>반갑습니다<br><br>어디로 떠나실 계획인가요?</h3>')
 $("#title").append(n);
 
 //-------------------------------------------------------------------유저 정보 영역
 
  for(i of mylist) {
    var tr = $('<tr></tr>'); 
    
    var title = $('<td id="t_title" name="'+i.trip_number+'"><a>'+i.trip_title+'</a></td>');
    var area =$('<td>'+i.trip_area+'</td>');
    var date =$('<td>'+sd+' - '+ed+'</td>');
    var btn =$('<td><button class="btn-info" data-toggle="modal" data-target="#exampleModal" id="joinbtn" data-tripnum ="'+i.trip_number+'">친구 초대</button></td>');
    
    $("#mylist").append(tr);
    $(tr).append(title);
    $(tr).append(area);
    $(tr).append(date);
    $(tr).append(btn);
    
    
 }
 
//------------------------------------------------------------------------------------------게시글 영역

$("#joinbtn").on('click', function(e) {
	var trip_number = e.target.dataset.tripnum
	console.log(trip_number);
})

$("#t_title").on('click', function() {
	console.log($(this).attr("name"));
    location.href="detailplan?trip_number="+$(this).attr("name");
	});





















//날짜 포맷 변환기  str -> date ->str
   function getFormatDate(strdate){
      var date = new Date(strdate);
      console.log(date);
       var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '년  ' + month + '월  ' + day+'일   ';
   }
</script>


</html>