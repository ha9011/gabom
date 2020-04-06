<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
Address : <input id="address"><br>
CheckIn : <input type="date" id="checkin"><br>
CheckOut : <input type="date" id="checkout"><br>
<button id="searchHotel">검색</button>
<hr>
<div id="content" >

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
     		    
     		    console.log(data)
     		   $("#content").append(data);
         
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