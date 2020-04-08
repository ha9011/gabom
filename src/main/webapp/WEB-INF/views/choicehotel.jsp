<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>

.form-label-group{
display:inline-block;
margin-bottom: 15px;
}
#address{
width:300px;
float:right;
margin: 0 15px;
}
#checkin{
width:300px;
float:right;
margin: 0 15px;
}
#checkout{
width:300px;
float:right;
margin: 0 15px;
}

/* hotel */

#content{
display:flex;
}
.hc_usi {
box-shadow:5px 5px 3px lightgray;
width:200px;
margin:15px;
}
.hotelImg{
width:200px;
}
.hc_usi_photo img{
width:150px;
margin:20px;
}
.hotelTitle h3{
 font-size: 20px;
 margin: 0 20px;
}
.hotelTitle a{
color:black;
}
</style>

</head>
<body>

<header id="hea">
		<jsp:include page="/WEB-INF/views/header/househeader.jsp" />
</header>

 
 <div style="display:flex;background-color:#00b0f0;width:100%;height:400px;margin-top:10px;position:relative;padding: 3rem;">
 	<div id="form" style="background-color:white;width:40%;padding: 2rem;">
 		<div class="form-label-group">
           	<p style="font-weight: bold;color:black;">여행지</p>
          <div id="area"><input style="margin-left:30px;" id="address" type="text" class="form-control"  ></div>
         </div>
         <div class="form-label-group">
           	<p style="font-weight: bold;color:black;">체크인</p>
           	<input style="margin-left:30px;" id="checkin" type="date" class="form-control" >
         </div>
         <div class="form-label-group">
           	<p style="font-weight: bold;color:black;">체크아웃</p>
          	<input id="checkout" type="date" class="form-control"  >
         </div>
		<button id="searchHotel" class="btn btn-primary btn-block">검색</button>
 	</div>
 	
 	<div id="imgarea" style="padding: 4rem;">
 		<img style="width:30%;margin-top: 50px;" src="./resources/headerImage/hotel_rogo.jpg">
 		
 		<img src="./resources/css/gom.JPG" >
 	</div>
 </div>

<div id="content" >


</div>





<div>
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
</div> 

</body>
<script>
	$("#searchHotel").on("click",function(){
		var address = $("#address").val()
		var checkin = $("#checkin").val()
		var checkout = $("#checkout").val()
		
		if(address.length==0 || checkin.length==0 || checkout.length==0 ){
			console.log("다 입력해주세요")
		}else if(address.length!=0 && checkin.length!=0 && checkout.length!=0){
			console.log("진행")
			
			var checkinDate = new Date($("#checkin").val())
			var checkoutDate = new Date($("#checkout").val())
			
			var data = {
				"address" : address,
				"checkin" : getFormatDate(checkinDate),
				"checkout" : getFormatDate(checkoutDate),
			}
			
			console.log(data)
			
			$.ajaxSetup({         
	    	  beforeSend : function(xhr){
	          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      	});//먼저 보냄
  
  			$.ajax({	
     		 url:'hrest/hotelsearch',
     		 type:'post',
    		 data:data,
  		     dataType:"html", //rest 컨트롤 이용   
     		 success:function(data){
     		    
     		    console.log("호텔목록", data)
     		   $("#content").append(data);
     		    
     		   $(".hc_usi").eq(4).after($("<br>"));
     		   
         
   		   	},
     		 error:function(error){
       		 alert("저장에 실패했습니다.")
       		 console.log(error);
      		}
      
   		   })// end ajax
		}
	})

	
	
	
	
	
	

//날짜 포맷 변환기  str -> date ->str
function getFormatDate(strdate){
   var date = new Date(strdate);
   //console.log(date);
    var year = date.getFullYear();              //yyyy
 var month = (1 + date.getMonth());          //M
 month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
 var day = date.getDate();                   //d
 day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
 return  year + '-' + month + '-' + day;
}

</script>
</html>