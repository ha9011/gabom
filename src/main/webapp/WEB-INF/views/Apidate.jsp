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
	<style>
/* 	.modal-dialog modal-dialog-centered{ */
/* 		width: 90%; */
/* 		height: 90%; */
/*  		margin: 0; */ 
/* 		padding: 0; */ 
	
/* 	} */
/* 	.modal-content{ */
/* 		height: auto; */
/* 		min-height: 90%; */
/* 		border-radius: 0; */
/* 	} */
	
	
	
	</style>
</head>
<body>
	<div>
		<form>
			지역 선택 <select id="select_sigunguCode" name="areacode" title="지역선택">
				<option value="1">서울</option>
				<option value="2">인천</option>
				<option value="3">대전</option>
				<option value="4">대구</option>
				<option value="5">광주</option>
				<option value="6">부산</option>
				<option value="7">울산</option>
				<option value="8">세종특별자치시</option>
				<option value="31">경기도</option>
				<option value="32">강원도</option>
				<option value="33">충청북도</option>
				<option value="34">충청남도</option>
				<option value="35">경상북도</option>
				<option value="36">경상남도</option>
				<option value="37">전라북도</option>
				<option value="38">전라남도</option>
				<option value="39">제주도</option>
			</select>
			<!-- 			<input type="button" id="apiup" data-toggle="modal" data-target="#area_modal"> -->
			<button type="button" class="btn btn-primary" id="apiup"
				data-toggle="modal" data-target="#area_modal">일정추가</button>
		</form>
	</div>

	<!-- ---------------------------------areaCode기준 검색 모달--------------------------------- -->
	
	<div class="modal fade" id="area_modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="area_title">여행 계획</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="api_search_body">
				<table id="testtable"></table>
				
				
				
				</div>
				<div class="pageNavi"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
<!-- 					<button type="button" class="btn btn-primary">Save changes</button> -->
				</div>
			</div>
		</div>
	</div>

<!-- ---------------------------------areaCode기준 검색 새창--------------------------------- -->

















	<script>
		// 		$("#select_areacode").change(function() {
		// 			var areaCode = $(this).val();
		// 			console.log("areacode=", areaCode);

		$("#apiup").on("click",function() {
					//alert('지역 선택');
					console.log('버튼클릭');
					console.log(area);
					console.log($("#select_areacode").val());
					var area = $("#select_areacode").val();
					console.log("area=", area);
					var data = {"areaCode" : area};
					console.log('data', data);
					$.ajaxSetup({
						beforeSend : function(xhr) {
							xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
						}
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
							// 					console.log("111", response);
							console.log("112",response.response.body.items.item);
							var myItem = response.response.body.items.item;
							console.log("111", myItem);
							
							$("#testtable").empty();
							
							let index = 1;
							let tr = $("<tr></tr>")
							for(let i of myItem){
							
								var td = $('<td></td>');
							   
								var img = $("<img width='150px' height='150px' src='"+i.firstimage+"'>");
								
								var a = $("<a href='apitest?contentid="+i.contentid+"', target='_blank'></a>");
			                               
								
								
								a.append(img);
								td.append(a);
			                   tr.append(td);
			                   
			                   
			               
			                   
			              if(index%3===0){
			          			$("#testtable").append(tr);
			          			
			            	   tr = $("<tr></tr>")
			               }
			                   
			               index++;                
			                }
		                    
							
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