<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
		<form>지역 선택 
			<select id="select_areacode" name="areacode" title="지역선택">
				<option value="SEOUL">서울</option>
				<option value="INCHEON">인천</option>
				<option value="DAEJEON">대전</option>
				<option value="DAEGU">대구</option>
				<option value="GWANGJU">광주</option>
				<option value="BUSAN">부산</option>
				<option value="ULSAN">울산</option>
				<option value="SEJONG">세종특별자치시</option>
				<option value="GYEONGGI">경기도</option>
				<option value="KANGWON">강원도</option>
				<option value="CHUNGBUK">충청북도</option>
				<option value="CHUNGNAM">충청남도</option>
				<option value="GYUNGBUK">경상북도</option>
				<option value="GYUNGNAM">경상남도</option>
				<option value="JEONBUK">전라북도</option>
				<option value="JEONNAM">전라남도</option>
				<option value="JEJU">제주도</option>
			</select> 
<!-- 			<input type="button" id="apiup" data-toggle="modal" data-target="#area_modal"> -->
			<button type="button" class="btn btn-primary" id="apiup" data-toggle="modal" data-target="#area_modal">지역검색</button>
		</form>
	</div>
	
	<!-- Modal -->
<div class="modal fade" id="area_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="area_title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	

	<script>
		// 		$("#select_areacode").change(function() {
		// 			var areaCode = $(this).val();
		// 			console.log("areacode=", areaCode);

		$("#apiup").on("click", function() {
			//alert('지역 선택');
			console.log('버튼클릭');
			console.log(area);
			console.log($("#select_areacode").val());
			var area = $("#select_areacode").val();
			console.log("area=", area);
			var data = {"areaCode":area};
			console.log('data',data);
			$.ajaxSetup({         
	  			beforeSend : function(xhr){
	  		    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	  		    });
			console.log("지역검색 시작");
			$.ajax({
				url : 'apisearch',
				type : 'get',
				data : data,
				dataType : 'json',
				success : function(msg) {
 					console.log(msg);
 					response = JSON.parse(msg);
 					console.log("111", response);
 					console.log("112", response.response.body.items.item);
// 					         var myItem = msg.response.body.items.item;
// 					         console.log("111",myItem[2]);

// 					          for(var i=0; i<myItem.length; i++){
// 					              var output = '';
// 					              //console.log(myItem.length);
// 					              output += '<h3>'+ i + '번째 제ㅜ 축제 데이터' +'</h3>';
// 					              output += '<h4>'+myItem[i].addr1+'</h4>';
// 					              output += '<input type="text" value="'+myItem[i].addr1+'">';
// 					              output += '<h4>'+myItem[i].title+'</h4>';
// 					              output += '<input type="text" value="'+myItem[i].title+'">';
// 					              output += '<h4>'+myItem[i].tel+'</h4>';
// 					              output += '<input type="text" value="'+myItem[i].tel+'">';
// 					               document.body.innerHTML += output;
// 					          }
				},
				error : function(jqXHR, status, e) {
					console.log("지역검색 에러");
				}
			}); //ajax End
		}); //api 버튼 클릭 End
		// 		}); //select function End
	</script>
</body>
</html>