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

/* 프로필영역 */
#main{

width:100%;
margin-top:10%;
color:white;
}
#ct{
   width: 600px;
   height: 1200px;
   background-color: rgba(0, 46, 102, 0.8);
   margin-top:80px;
   text-align: center;
   }
#reauest{
background-color:white;
height:680px;
}
#mql{
width:100%;
display:none;

}  
#fql{
width:100%;
display:none;

}      

/* 버튼 */
#jbtn{
float:right;
margin:10px 200px;
font-size:15px;
}
#t_title{
cursor: pointer;
text-decoration:none;
}
#rqmbtn{
 width:100%;
 color:black;
}
#rqbtn{
width:100%;
color:black;
}


/* modal */
#f{
width:400px;
margin:10px;
display:flex;
}
#fbtn{
float:right;
border-radius: 10px;
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
            	<div id="reauest">
            		<div id="rqm">
            			<button id="rqmbtn" class=" btn-lg btn-primary" onclick="myreq()">여행 요청리스트</button>
            			<div id="mql"></div>
            		</div>
            		<div id="rql">
            			<button id="rqbtn" class=" btn-lg btn-primary" onclick="freq()">요청 상황</button>
            			<div id="fql"></div>
            		</div>
            	</div>
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
      <div id="trip_friend">
      
      </div>
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
 console.log(mylist.trip_area);
 
 
 
 
 
 
 
 
 var myinfo =${memberinfo};
 console.log(myinfo);
 var friend =${friendlist};
 console.log(friend);
 var friend =${friendlist};
 console.log(friend);
 
 var reql =${reqlist};
 console.log(reql);
 var reqmel =${myreqlist};
 console.log(reqmel);

 
 
 
 //console.log(sd, ed)
 //------------------------------------------------------------------데이터 영역
 
 var propic =$('<img style="width:300px;border-radius:70%;" src="'+myinfo[0].member_profile_picture+'">');
 $("#propic").append(propic);
 
 var n =$('<h1>'+myinfo[0].member_name+'님'+'</h1><h3>반갑습니다<br><br>어디로 떠나실 계획인가요?</h3>')
 $("#title").append(n);
 
  for(i of reqmel){//내가 받은 리스트 
	 var tr_id =$('<p>'+i.trip_id+'님이 '+i.trip_title+'에 '+i.share_id+'초대하셨습니다'+'</p>');
	 var sbtn=$('<button class="sbtn btn-success" data-trnum="'+i.trip_number+'">승인 </button>');
	 var cbtn=$('<button class="cbtn btn-danger" data-trnum="'+i.trip_number+'">거절  </button>');
	 $("#mql").append(tr_id);
	 $("#mql").append(sbtn);
	 $("#mql").append(cbtn);
 }
 
 for (i of reql){//내가 보낸 리스트
	 var sh_id = $('<p>'+i.share_id+'님을 '+i.trip_title+'에 초대하셨습니다'+'</p>');
	 
	 $("#fql").append(sh_id);
 } 
 
 
 
 
/*   $("#mql").hide();
 $("#fql").hide(); */ 
  function myreq() {//내가 받은 요청사항
	  var x = document.getElementById("mql");
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
	}
 
 
 function freq() {//내가 보낸 요청사항 
	  var y = document.getElementById("fql");
	  if (y.style.display === "none") {
		 y.style.display = "block";
	} else {
         y.style.display = "none";
	 }
	}
 
 //-------------------------------------------------------------------유저 정보 영역
 
  for(i of mylist) { //게시글
	  
	  console.log(i.trip_area);
 	  if(i.trip_area == 1){
		i.trip_area = "서울"		  
 	  }else if(i.trip_area == 2){
		i.trip_area = "인천"		  
 	  }else if(i.trip_area == 3){
		i.trip_area = "대전"		  
 	  }else if(i.trip_area == 4){
		i.trip_area = "대구"		  
 	  }else if(i.trip_area == 5){
		i.trip_area = "광주"		  
 	  }else if(i.trip_area == 6){
		i.trip_area = "부산"		  
 	  }else if(i.trip_area == 7){
		i.trip_area = "울산"		  
 	  }else if(i.trip_area == 8){
		i.trip_area = "세종특별자치시"		  
 	  }else if(i.trip_area == 31){
		i.trip_area = "경기도"		  
 	  }else if(i.trip_area == 32){
		i.trip_area = "강원도"		  
 	  }else if(i.trip_area == 33){
		i.trip_area = "충청북도"		  
 	  }else if(i.trip_area == 34){
		i.trip_area = "충청남도"		  
 	  }else if(i.trip_area == 35){
		i.trip_area = "경상북도"		  
 	  }else if(i.trip_area == 36){
		i.trip_area = "경상남도"		  
 	  }else if(i.trip_area == 37){
		i.trip_area = "전라북도"		  
 	  }else if(i.trip_area == 38){
		i.trip_area = "전라남도"		  
 	  }else if(i.trip_area == 39){
		i.trip_area = "제주도"		  
 	  }
	  
 	var sd = getFormatDate(i.trip_start_date);
 	var ed = getFormatDate(i.trip_end_date);	  
	  
    var tr = $('<tr></tr>'); 
    
    var title = $('<td class="t_title" ><a class="movePlan" data-name="'+i.trip_number+'">'+i.trip_title+'</a></td>');
   
    var area =$('<td>'+i.trip_area+'</td>');
    var date =$('<td>'+sd+' - '+ed+'</td>');
    var btn =$('<td><button id="jbtn" class="joinbtn btn" data-toggle="modal" data-target="#exampleModal"  data-tripnum ="'+i.trip_number+'">친구 초대</button></td>');
    
    
    $("#mylist").append(tr);
    $(tr).append(title);
    $(tr).append(area);
    $(tr).append(date);
    $(tr).append(btn);
    

    
 }
 
 
 
 
 
 
 
  $(".movePlan").on('click', function(e) {
  	console.log(e.target.dataset.name);
  	var number = e.target.dataset.name;
  location.href="detailplan?trip_number="+number;
  });
//------------------------------------------------------------------------------------------게시글 영역
$(".joinbtn").on('click', function(e) { // 친구 추가시 여행번호 
	var trip_number = e.target.dataset.tripnum
	console.log(trip_number);
	
	//flist
	
	$("#flist").empty();
	
	for(i of friend){
		
	var freind =$('<div id="f"><h4>'+i.friend_id+'님'+'</h4></div>');
	var fbtn =$('<button id="fbtn" class="fbtn btn" data-fid="'+i.friend_id+'" data-tnum="'+trip_number+'">추가하기</button>')
	$("#flist").append(freind);
	$(freind).append(fbtn);
	
	}
	
})
//----------------------------------------------------------------------------------------친구초대 버튼 

$(document).on('click',".fbtn", function(e) {
	var ftrip_number = e.target.dataset.tnum
	var friend_id = e.target.dataset.fid
	
	console.log(ftrip_number,friend_id);
	
	
	var data = {
            "trip_number" : ftrip_number,
            "share_id" : friend_id
            
         } 
   console.log(data);
   
   
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
   
   
   $.ajax({
      
        url: "tprest/togetherplan",
         type: 'post',
         data :data,
         dataType: "json", //rest 컨트롤 이용   
         success:function(data){
            alert("친구 초대완료.");
            console.log("요청리스트",data);
           
            $("#fql").empty();
            
             for(i of data.myreqlist){//내가 받은 리스트 
           	 var tr_id =$('<p>'+i.trip_id+'님이 '+i.trip_title+'에 '+i.share_id+'초대하셨습니다'+'</p>');
           	 var sbtn=$('<button class="sbtn btn-success" data-trnum="'+i.trip_number+'">승인 </button>');
           	 var cbtn=$('<button class="cbtn btn-danger" data-trnum="'+i.trip_number+'">거절  </button>');
           	 $("#mql").append(tr_id);
           	 $("#mql").append(sbtn);
           	 $("#mql").append(cbtn);
            }
            
            for (i of data.reqlist){//내가 보낸 리스트
           	 var sh_id = $('<p>'+i.share_id+'님을 '+i.trip_title+'에 초대하셨습니다'+'</p>');
           	 
           	 $("#fql").append(sh_id);
            }  
           
         },
         
         error:function(error){
            alert("친구초대 실패.");
               console.log(error);
            }
      
      
   });//ajax 끝

})// 클릭이벤트 종료 



//--------------------------------------------------------------------------------------------초대 이벤트 영역


$(".sbtn").on('click', function(e) {//승인 버튼 
	var trip_number = e.target.dataset.trnum
	console.log(trip_number);
	var data = {
            "trip_number" : trip_number,
         } 
   console.log(data);
   
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
   
   
   $.ajax({
      
        url: "tprest/accepttrip",
         type: 'post',
         data :data,
         dataType: "json", //rest 컨트롤 이용   
         success:function(data){
            alert("여행 참여 완료.");
           
            $("#mql").empty();
            $("#fql").empty();
            
            for(i of reqmel){//내가 받은 리스트 
           	 var tr_id =$('<p>'+i.trip_id+'님이 '+i.trip_title+'에 '+i.share_id+'초대하셨습니다'+'</p>');
           	 var sbtn=$('<button class="sbtn btn-success" data-trnum="'+i.trip_number+'">승인 </button>');
           	 var cbtn=$('<button class="cbtn btn-danger" data-trnum="'+i.trip_number+'">거절  </button>');
           	 $("#mql").append(tr_id);
           	 $("#mql").append(sbtn);
           	 $("#mql").append(cbtn);
            }
            
            for (i of reql){//내가 보낸 리스트
           	 var sh_id = $('<p>'+i.share_id+'님을 '+i.trip_title+'에 초대하셨습니다'+'</p>');
           	 
           	 $("#fql").append(sh_id);
            } 
            
             
         },
         
         error:function(error){
            alert("여행 참여 실패.");
               console.log(error);
            }
      
      
   });//ajax 끝

})// 클릭이벤트 종료 



 $(".cbtn").on('click', function(e) {//거절 버튼 
	var trip_number = e.target.dataset.trnum
	console.log(trip_number);
	var data = {
            "trip_number" : trip_number,
         } 
   console.log(data);
   
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄
   
   
   $.ajax({
      
        url: "tprest/rejecttrip",
         type: 'post',
         data :data,
         dataType: "json", //rest 컨트롤 이용   
         success:function(data){
            alert("여행 거절 완료.");
           
            $("#mql").empty();
            $("#fql").empty();
            
            for(i of reqmel){//내가 받은 리스트 
           	 var tr_id =$('<p>'+i.trip_id+'님이 '+i.trip_title+'에 '+i.share_id+'초대하셨습니다'+'</p>');
           	 var sbtn=$('<button class="sbtn btn-success" data-trnum="'+i.trip_number+'">승인 </button>');
           	 var cbtn=$('<button class="cbtn btn-danger" data-trnum="'+i.trip_number+'">거절  </button>');
           	 $("#mql").append(tr_id);
           	 $("#mql").append(sbtn);
           	 $("#mql").append(cbtn);
            }
            
            for (i of reql){//내가 보낸 리스트
           	 var sh_id = $('<p>'+i.share_id+'님을 '+i.trip_title+'에 초대하셨습니다'+'</p>');
           	 
           	 $("#fql").append(sh_id);
            } 
            
             
         },
         
         error:function(error){
            alert("여행 거절 실패.");
               console.log(error);
            }
      
      
   });//ajax 끝

})// 클릭이벤트 종료 
 



//--------------------------------------------------------------------------------------------- 승인 거절이벤트 

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