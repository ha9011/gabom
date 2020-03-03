<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스업체 등록 심사</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 제이쿼리 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 부트스트랩 -->

<style>
#admin_div {
	border: 1px solid black;
	width: 99%;
	height: 99%;
}

#admin_list {
	/* 	float: right; */
	
}

#housemain_judge {
	/* 	border: 1px solid black; */
	width: 70%;
}

#house_judge {
	height: auto;
	width: 100%;
	display: block;
	border: 1px solid black;
	width: 100%;
	display: block;
	overflow: auto;
}

#foodmain_judge {
	border: 1px solid black;
	width: 70%;
}

#food_judge {
	/* 	height: auto; */
	display: block;
	border: 1px solid black;
	width: 100%;
	display: block;
	overflow: auto;
}

#list_left {
	float: left;
	height: 100%;
	width: 20%;
	display: block;
	padding: 6px;
	height: 100%;
}

#list_right_sec {
	float: left;
	width: 78%;
	height: 230px;
}

#list_right {
	height: 70%;
	display: block;
	padding: 6px;
}

#list_button {
	float: right;
}

ul {
	list-style: none;
}

li {
	float: left;
}
</style>

</head>
<body>
	<h3>adminmenu.jsp</h3>
	<div id="admin_page">
		<header id="header"> </header>
		<div id="admin_nav">
			<nav class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="home">HOME</a>
				</div>
				<ul class="nav navbar-nav" id="menu_parent">
					<li><a href="#">서비스업체 등록심사</a></li>
					<li><a href='#'>서비스업체 신고관리</a></li>
					<li><a href="#"> 여행객계획 등록심사</a></li>
					<li><a href="#"> 여행객 신고관리</a></li>
					<li><a href="#"> 전체회원 공지사항</a></li>
					<li><a href="#"> QnA</a></li>
				</ul>
			</nav>
		</div>
		<div>
			<div id="service_main">
				<div id="housemain_judge"><h3>House심사대기 List</h3></div>

				<div id="foodmain_judge"><h3>Food심사대기 List</h3></div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">서비스업 등록 심사</h4>
					</div>
					<form id="sFrm">
						<div class="modal-body" id="judge_modal">내용</div>
						<div class="modal-footer">
							<button id="approved" value="승인" class="btn btn-primary judge"
								data-dismiss="modal">승인</button>
							<button id="refuse" value="거절" class="btn btn-primary judge"
								data-dismiss="modal">거절</button>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
	<div>
		<jsp:include page="/WEB-INF/views/footer.jsp" />
	</div>

	<script>
	//house 리스트 출력
	const house = ${housejudge};
	const food = ${foodjudge};
	console.log("house=",house);
	console.log("food=",food);
	console.log("house",house.length);
	console.log("food",food.length);
//	console.log("housemodal",${housemodal});
	let strh=" ";
	
 	for(var i=0;i<house.length;i++){
 		if(i>=2){
 			console.log("house break");
 			break;
 		}
 		strh+='<div style="border: 1px solid black; margin-top: 5px; id="house_judge">';
		strh+='<div id="house_judge">';
		strh+='<div id="list_left"><img style="height:250px; width:250px;" src="'+house[i].house_sysname+'"></div>';
		strh+='<div id="list_right_sec">';
		strh+='<div id="list_right">상 호 명 : '+house[i].house_name+'<br>';
		if(house[i].house_type == 1){
			strh+='집 유 형 : 아파트 <br>';
		}else if(house[i].house_type == 2){
			strh+='집 유 형 : 빌라 <br>';
		}else if(house[i].house_type == 3){
			strh+='집 유 형 : 주택 <br>';
		}
		//strh+='<input type="hidden" value="house" name="type">';
		//strh+='집 유형 : '+house[i].house_type+'<br>';
		strh+='집 주 소 : '+house[i].house_address+'</div>';
		strh+='<div id="list_button" class="house"><button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" data-number="'+house[i].house_number+'">승인/거절</button></div>';
		strh+='</div>';
		strh+='</div>';
		strh+='</div>';
 	}
 	$("#housemain_judge").append(strh); //house 리스트 End
 	
	//food 리스트 출력
 	let strf= " ";
 	for(var i=0;i<2;i++){
 		if(i>=2){
 			console.log("food break");
 			break;
 		}
 		strf+='<div style="border: 1px solid black; margin-top: 5px; id="food_judge">';
		strf+='<div id="food_judge">';
		strf+='<div id="list_left"><img style="height:250px; width:250px;" src="'+food[i].food_sysname+'"></div>';
		strf+='<div id="list_right_sec">';
		strf+='<div id="list_right">상 호 명 : '+food[i].food_name+'<br>';
		if(food[i].food_type == 1){
			strf+='집 유 형 : 레스토랑 <br>';
		}else if(food[i].food_type == 2){
			strf+='집 유 형 : 카페 <br>';
		}else if(food[i].food_type == 3){
			strf+='집 유 형 : 호프 <br>';
		}
		strf+='음식점 주소 : '+food[i].food_address+'</div>';
		strf+='<div id="list_button" class="food"><button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" data-number="'+food[i].food_number+'">승인/거절</button></div>';
		strf+='</div>';
		strf+='</div>';
		strf+='</div>';
 	}
 	$("#foodmain_judge").append(strf); //food 리스트 End
	
 	//하우스 모달 ajax 시작
 	$('.house').on('click',function(e){ 
 		console.log(e.target.dataset.number);
 		var params = e.target.dataset.number;
 		//시큐리티 ajax Setup
 		$.ajaxSetup({         
 		      beforeSend : function(xhr){
 		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
 		      });//먼저 보냄
            	console.log("house ajax시작");
            	console.log(params);
            $.ajax({
                url : "housemodal",
                type : "get",
                data : {"num":params}, 
                success : function(response) {
                	
 					$("#judge_modal").empty();
 					response = JSON.parse(response);
 					console.log("11123",response);
 					
                	
 
                    let strj = " ";
                	
                	for ( var i=0;i<1;i++){
                    strj += '<div class="modal-body">';
                    strj += '등록번호 : '+response[i].house_number+'<br>';
                    strj += '<input type="hidden" name="number" value="'+response[i].house_number+'">';
                    strj += '아이디 : '+response[i].house_hostid+'<br>';
                    strj += '집이름 : '+response[i].house_name+'<br>';
                    strj += '주소 : '+response[i].house_address+'<br>';
                    strj += '집유형 : '+response[i].house_type+'<br>';
                    strj += '<input type="hidden" name="type" value="house">';
                    strj += '수용인원 : '+response[i].house_person+'<br>';
                    strj += '주차공간 : '+response[i].house_parkable+'<br>';
                    strj += '방갯수 : '+response[i].house_rooms+'<br>';
                    strj += '침대수 : '+response[i].house_beds+'<br>';
                    strj += '욕실 : '+response[i].house_bathrooms+'<br>';
                    strj += '체크인 : '+response[i].house_mindate+'<br>';
                    strj += '체크아웃 : '+response[i].house_maxdate+'<br>';
                    strj += '1박가격 : '+response[i].house_price+'<br>';
                    strj += '</div>';
                    strj += '<div>';
                    for(var j=0;j<response.length;j++){
                        console.log("123__",response); 
                        console.log("111",response[j].house_sysname);
                    strj += '<img style="height:100px; width:200px;"src='+response[j].house_sysname+'">';
                    	} //사진for문 종료
                    strj += '</div>';
                	}//for문 종료
                	
                    
                    $("#judge_modal").append(strj);
                    
                }, error : function(jqXHR, status, e) {
                    //console.error(status + " :asdasd " + e);
                }
            });	 
 	}); //house모달 End
 	
 	//음식점 모달 ajax 시작
 	 $('.food').on('click',function(e){ 
 		console.log(e.target.dataset.number);
 		var params = e.target.dataset.number;

 		//시큐리티 ajax Setup
 		$.ajaxSetup({         //상세모달 ajax
 		      beforeSend : function(xhr){
 		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
 		      });//먼저 보냄

            	console.log("food ajax시작");
            	console.log(params);
            $.ajax({
                url : "foodmodal",
                type : "get",
                data : {"num":params}, 
                success : function(response) {
                	
 					$("#judge_modal").empty();
 					response = JSON.parse(response);
 					console.log("11123",response);
 					
                    let strj = " ";
                	
                	for ( var i=0;i<1;i++){
                    strj += '<div class="modal-body">';
                    strj += '등록번호 : '+response[i].food_number+'<br>';
                    strj += '<input type="hidden" name="number" value="'+response[i].food_number+'">';
                    strj += '아이디 : '+response[i].food_hostid+'<br>';
                    strj += '상호명 : '+response[i].food_name+'<br>';
                    strj += '주소 : '+response[i].food_address+'<br>';
                    strj += '가게유형 : '+response[i].food_type+'<br>';
                    strj += '<input type="hidden" name="type" value="food">';
                    strj += '수용인원 : '+response[i].food_person+'<br>';
                    strj += '주차공간 : '+response[i].food_parkable+'<br>';
                    strj += '오픈시간 : '+response[i].food_mintime+'<br>';
                    strj += '마감시간 : '+response[i].food_maxtime+'<br>';
                    strj += '</div>';
                    strj += '<div>';
                    for(var j=0;j<response.length;j++){
                    strj += '<img style="height:100px; width:200px;"src='+response[j].food_sysname+'">';
                    	} 
                    strj += '</div>';
                	}//for문 종료
                    
                    $("#judge_modal").append(strj);
                    
                }, error : function(jqXHR, status, e) {
                    //console.error(status + " :asdasd " + e);
                }
            });	 
 		
 	}); //food모달 End
 	
	//승인거절 ajax
	$('.judge').on('click',function(e){
		console.log(e.target.value);
		var formData = new FormData(document.getElementById("sFrm"));
		
		  console.log(formData.get("number")[0]);
	      console.log(formData.getAll("type"));
	      var urlRest;
	      var params = {
	    		  "number" : formData.get("number"),
	    		  "type" : formData.get("type"),
	      }
	      
	      if(e.target.value == "승인"){
	    	  urlRest = "approved"
	      }else if(e.target.value == "거절"){
	    	  urlRest = "refuse"
	      }
	      console.log(urlRest);
	     
	      $.ajax({
	            url:urlRest,
	            type:'Post',
	            data:params,
	            //까보지 말라는 뜻
	            //processData:false,//application/x-www-form-urlencoded(쿼리스트링)
	            //contentType:true,//multipart의 경우 contentType을 false로
	            //contentType:'application/json;charset=UTF-8'
	            dataType:'json',
	            success:function(data){
	               
	               alert('성공');
	               console.log("data",data);
	              	location.href="adminmenu";
	               
/* 	               $("#housemain_judge").empty();
	               let strh=" ";
	            	for(var i=0;i<data.length;i++){
	            		if(i>=2){
	            			console.log("housemodal break");
	            			break;
	            		}
	            	strh+='<div style="border: 1px solid black; margin-top: 5px; id="house_judge">';
	           		strh+='<div id="house_judge">';
	           		strh+='<div id="list_left"><img style="height:250px; width:250px;" src="'+data[i].house_sysname+'"></div>';
	           		strh+='<div id="list_right_sec">';
	           		strh+='<div id="list_right">상 호 명 : '+data[i].house_name+'<br>';
	           		if(data[i].house_type == 1){
	           			strh+='집 유 형 : 아파트 <br>';
	           		}else if(data[i].house_type == 2){
	           			strh+='집 유 형 : 빌라 <br>';
	           		}else if(data[i].house_type == 3){
	           			strh+='집 유 형 : 주택 <br>';
	           		}
	           		strh+='집 주 소 : '+data[i].house_address+'</div>';
	           		strh+='<div id="list_button" class="house"><button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" data-number="'+data[i].house_number+'">승인/거절</button></div>';
	           		strh+='</div>';
	           		strh+='</div>';
	           		strh+='</div>';
	            	}
	            	$("#housemain_judge").append(strh); */
	            },
	            error:function(err){
	            	console.log("승인거절 에러");
	               console.log(err);
	            }
	         });//승인거절 ajax End
	})//on click함수 End
	
	
 	
</script>
</body>

</html>