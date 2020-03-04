<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>foodshopRegister</title>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7e29fa39462f45fc2138a8307dbe830&libraries=services"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<style>
body {
	overflow: scroll;
}

#food_form {
	margin-top : 10%;
	margin-left: 40%;
}
</style>

</head>
<body>
	<div id="food_form">
		<form action="foodRegisterUpload?${_csrf.parameterName}=${_csrf.token}"method="post"
			enctype="multipart/form-data">
			<div>
				<h3>상호명 입력해주세요.</h3>
				<input type="text" name="food_name">
			</div>
			<div>
				<h3>메인사진을 등록해주세요.</h3>
				<input id="food_mainImage" type="file" name="food_mainImage"required><br> 
				<img id="image_section" width="80%"
					src="" alt="메인이미지" />
			</div>
			<div>
				<h3>전체 지번주소를 입력해주세요</h3>
				<input type="text" id="sample4_postcode" name="food_address" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
				<span id="guide" style="color:#999;display:none"></span>
				<button id="food_address_btn" type="button">주소확인</button>
				<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
				<div id="map" style="width: 80%; height: 300px; "></div>
				
				<!-- 주소 좌표 hide로 숨김. -->
				<input type="text" name="food_ypoint"  id="y" />
				<input type="text" name="food_xpoint"  id="x" /> 

				<h3>인원수 입력해주세요.</h3>
				<input id="food_person" type="text" name="food_person">
				
				
				
			</div>
			<div>
				<h3>음식점유형을 선택해주세요.</h3>
				<label><input type="radio" name="food_type" value="1">
					레스토랑</label> <label><input type="radio" name="food_type" value="2">
					카페</label> <label><input type="radio" name="food_type" value="3">
					호프</label>
			</div>
			<div>
				<h3>음식점 메뉴사진/상세사진을 4개이상 등록해주세요.</h3>
				<input id="food_menuImages" type="file" name="food_menuImages" multiple>
				<div>
					<span id="left"></span>
					<ul id="detailImage_sections"></ul>
					<span id="right"> >> </span>
				</div>
				<br>
				</div>
			<div>
				<h3>주차</h3>
				<label><input type="radio" name="food_parkable" value="1">주차
					가능</label> <label><input type="radio" name="food_parkable"
					value="2">주차 불가능</label>
			</div>

			<div>
				<h3>예약 가능 날짜를 선택해주세요.</h3>
				<input type='date' name='food_mindate' /> <input type='date' name='food_maxdate' /> 
				<input type="time" name='food_mintime' /> <input type="time" name='food_maxtime' />
			</div>

			<div>
				<button type="submit" id="sign"name="sign">작성완료</button>
			</div>
			</form>
		</div>	
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("sample4_postcode").value = roadAddr;
            document.getElementById("sample4_postcode").value = data.jibunAddress;
            

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            
         	 if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>

<script>
$("#map").hide();
$("#x").hide();
$("#y").hide();


	$("#food_address_btn").on("click",function(){
		$("#map").show();
		
		var $searchAddr = $("#sample4_postcode").val();
		console.log("검색 주소 : " + $searchAddr)
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch($searchAddr, function(result, status) {

		console.log("result : ", result)
		console.log("status : " + status)
		
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	    	
	    	 x=result[0].x;
			 y=result[0].y;
			 
			 $("#x").val(x);
	    	 $("#y").val(y);
	    	 
	    	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        
			console.dir(x);
	    	console.dir(y);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	        });
	        infowindow.open(map, marker);
	        
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    

	
	
	})
//지도 표시 영역




</script>
<script>
$("#detail").hide();
	//메인사진(1개)만 미리보기
	$("#food_mainImage").change(function(e){
		$('#image_section').attr('src', ""); // 변할 때마다 리셋
		var files = e.target.files;
		
		console.log(files[0]); // 파일 어떤 내용들었는지 보기 1개니깐 [0]
		
		if(!files[0]["type"].match("image.*")){
			alert("확장자는 이미지 확장자만 가능함")
			return 
		}
		
		 var reader = new FileReader();
         reader.onload = function(e) {
             $('#image_section').attr('src', e.target.result);
         }
         reader.readAsDataURL(files[0]);
	})
	
	
	//여러사진 한번에 보여주기
	$("#food_menuImages").change(function(e){
		$("#detailImage_sections").empty();  // 변할 때마다 리셋
		
		
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		console.log(filesArr); // 파일 어떤 내용들었는지 보기 1개니깐 [0]
		
		filesArr.forEach(function(f,i){
			console.log(f)
			console.log(i)
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능함")
				return 	
			}
			
			
			 var reader = new FileReader();
	         reader.onload = function(e) {
	         	var $li = $("<li></li>").attr("class","detailPictures");
	         	var $tt = $li.append($('<img/>').attr('src', e.target.result).css("width", "100px").css("heigh","100px"));
	         	$("#detailImage_sections").append($tt);
	         }
	         reader.readAsDataURL(f);
		});//end forEach
	})
	
	//클릭이벤트 (left)-이미지 이동
	$("#left").on("click",function(){
		console.log("왼쪽버튼")
		console.log($(".detailPictures")[0])
		var $li = $(".detailPictures")[0];
		$("#detailImage_sections").append($li);
	})
	
	//클릭이벤트 (right)-이미지 이동
	$("#right").on("click",function(){
		console.log("오른쪽버튼")
		console.log($(".detailPictures"))
		console.log($(".detailPictures").length)
		var $lastNumber = $(".detailPictures").length-1
		var $li = $(".detailPictures")[$lastNumber];
		$("#detailImage_sections").prepend($li);
	})
	
	
</script>
</html>