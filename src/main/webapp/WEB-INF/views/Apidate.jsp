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


<form  method="get">  <!-- action="PublicData.do" -->
<!-- <input type="button" value="데이터보기" > -->
</form>
<button id="apiup">빈 버튼</button>


<script>
$("#apiup").on("click",function(){	
	alert('버튼클릭');
	console.log('버튼클릭');	

$.ajax({          
    url: 'apiuptest',
    type: 'get',
    dataType: 'json',
    success: function(msg){
    	console.log(msg);
    	response = JSON.parse(msg);
        console.log("111",response);
        console.log("123123",response.item);
        //console.log("112",response.response.body.items.item);
//         var myItem = msg.response.body.items.item;
//         console.log("111",myItem[2]);
        
//          for(var i=0; i<myItem.length; i++){
//              var output = '';
//              //console.log(myItem.length);
//              output += '<h3>'+ i + '번째 제ㅜ 축제 데이터' +'</h3>';
//              output += '<h4>'+myItem[i].addr1+'</h4>';
//              output += '<input type="text" value="'+myItem[i].addr1+'">';
//              output += '<h4>'+myItem[i].title+'</h4>';
//              output += '<input type="text" value="'+myItem[i].title+'">';
//              output += '<h4>'+myItem[i].tel+'</h4>';
//              output += '<input type="text" value="'+myItem[i].tel+'">';
//               document.body.innerHTML += output;
//          }
    }
});    
}) //api 버튼 클릭 End

</script>
</body>
</html>