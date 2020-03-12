<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>
<body>

<div class="dropdown show">
  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    유저아이디
  </a>

  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
    <a id="add_friend" class="dropdown-item" href="#">친구추가</a><br><!-- a태그 클릭시에도 발생 -->
    <a class="dropdown-item"  data-toggle="modal" data-target="#exampleModal" href="#">유저정보</a><br>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">유저정보</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	유저정보
			아이디
			이메일정도  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

</body>
<script>
$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').trigger('focus')
	})
	
	$("#add_friend").on('click',function(){
			
		$("#dropdownMenuLink").val("유저 아이디");
		var uesr_name=$("#dropdownMenuLink")
		
		
		 $.ajaxSetup({         
    	      beforeSend : function(xhr){
    	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
    	      });//먼저 보냄
        
		   $.ajax({
	            url:'add_friend',
	            type:'post',
	            data:uesr_name,
	            processData:false,
	            contentType:false,  //제이슨 아니니깐 까보지마!!
	             dataType:"json", //rest 컨트롤 이용   
	            success:function(data){
	               alert("친구신청 완료");
	               console.log(data)
	              
	               
	            },
	            error:function(error){
	               alert("친구신청 실패")
	               console.log(error);
	            }
	            
	         })
	});//친구 추가 클릭이벤트 function end
	
	

</script>
</html>