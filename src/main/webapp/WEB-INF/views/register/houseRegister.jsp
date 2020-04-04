<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src=https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.slim.min.js></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7e29fa39462f45fc2138a8307dbe830&libraries=services"></script>


<style>
:root {
  --input-padding-x: 1.5rem;
  --input-padding-y: 0.75rem;
}

.login,
.image {
  min-height: 100vh;
}

.bg-image {
  background-image: url('./resources/houseimg/housefrm.jpg');
  background-size: cover;
  background-position: center;
}

.login-heading {
  font-weight: 300;
}

.btn-login {
  font-size: 0.9rem;
  letter-spacing: 0.05rem;
  padding: 0.75rem 1rem;
  border-radius: 2rem;
}

.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

.form-label-group>input,
.form-label-group>label {
  padding: var(--input-padding-y) var(--input-padding-x);
  height: auto;
  border-radius: 2rem;
  margin-bottom:20px;
}

.form-label-group>label {
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  margin-bottom: 0;
  /* Override default `<label>` margin */
  line-height: 1.5;
  color: #495057;
  cursor: text;
  /* Match the input under the label */
  border: 1px solid transparent;
  border-radius: .25rem;
  transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

.form-label-group input:-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-moz-placeholder {
  color: transparent;
}

.form-label-group input::placeholder {
  color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
  padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
  padding-bottom: calc(var(--input-padding-y) / 3);
}

.form-label-group input:not(:placeholder-shown)~label {
  padding-top: calc(var(--input-padding-y) / 3);
  padding-bottom: calc(var(--input-padding-y) / 3);
  font-size: 12px;
  color: #777;
}

/* Fallback for Edge
-------------------------------------------------- */

@supports (-ms-ime-align: auto) {
  .form-label-group>label {
    display: none;
  }
  .form-label-group input::-ms-input-placeholder {
    color: #777;
  }
}

/* Fallback for IE
-------------------------------------------------- */

@media all and (-ms-high-contrast: none),
(-ms-high-contrast: active) {
  .form-label-group>label {
    display: none;
  }
  .form-label-group input:-ms-input-placeholder {
    color: #777;
  }
}


</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/header/somoimheader.jsp" />
	</header>

<div class="container-fluid">
  <div class="row no-gutter">
    <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
              <h3 class="login-heading mb-4">House Register</h3>
              
              <!-- 전송 폼 -->
              <form action="houseregisterupload?${_csrf.parameterName}=${_csrf.token}" method="post"
					enctype="multipart/form-data">
                 
                 <div class="form-label-group">
                  House Name
                  <input name="house_name"  type="text" class="form-control" >
                </div>
                
                 <div class="form-label-group">
                  House Address
                  <input name="house_address"  id="sample4_postcode" type="text"  class="form-control" placeholder="우편번호" >
                  <button onclick="sample4_execDaumPostcode()"class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2">find address</button>
                <span id="guide" style="color:#999;display:none"></span>
               	<button id="house_address_btn"class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2">Map</button>
				<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
				<div id="map" style="width: 100%; height: 300px; "></div>
				
				<!-- 주소 좌표 hide로 숨김. -->
				<input type="text" name="house_ypoint"  id="y" />
				<input type="text" name="house_xpoint"  id="x" /> 
                </div>
                
                 <div class="form-label-group">
                  House price
                  <input name="house_price" type="text" class="form-control"  >
                </div>
                
              <div class="custom-control custom-checkbox mb-3">
                Parkable
               	<label style="margin:0 15px;" ><input type="radio" name="house_parkable" value="1">주차가능</label> 
				<label style="margin:0 15px;" ><input type="radio" name="house_parkable" value="2">주차 불가능</label>
                </div>
                
               <div class="custom-control custom-checkbox mb-3">
                House Type
               	<label style="margin:0 15px;" ><input type="radio" name="house_type" value="1">아파트</label> 
				<label style="margin:0 15px;" ><input type="radio" name="house_type" value="2">주택</label>
				<label style="margin:0 15px;" ><input type="radio" name="house_type" value="3">빌라</label> 
                </div>
                
                 <div class="form-label-group">
                 Person
                  <input name="house_person" name="house_rooms" type="text" class="form-control"  required>
                </div>
                
                 <div class="form-label-group">
                 Rooms
                  <input name="house_rooms" name="house_rooms" type="text" class="form-control" required>
                </div>
                
                 <div class="form-label-group">
                 Bathrooms
                  <input name="house_bathrooms" type="text" class="form-control"  required>
                </div>
                
                 <div class="form-label-group">
                 Beds
                  <input  name="house_beds" type="text" class="form-control"required>
                </div>
                
                 <div class="form-label-group">
                 Reservation Start Date
                  <input name='house_mindate' type="date" class="form-control"required>
                </div>
                <div class="form-label-group">
                 Reservation End Date
                  <input name='house_maxdate' type="date" class="form-control" required>
                </div>
                
                 <div class="form-label-group">
                 Main Image
                  <input  id="house_mainImage" name="house_mainImage" type="file" class="form-control" >
                  <br> <img id="image_section" width="70%" src="" alt="메인이미지" />
                </div>
                
                <div class="form-label-group">
                Detail Image
                  <input id="house_detailImage" name="house_detailImage" type="file" class="form-control" multiple>
                	<div id="detail">
						<span id="left"> << </span>
						<ul id="detailImage_sections"></ul>
						<span id="right"> >> </span>
					</div>
                </div>

                <button class="btn btn-lg btn-primary btn-block text-uppercase font-weight-bold mb-2" type="submit">Upload Now</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
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


	$("#house_address_btn").on("click",function(){
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
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">HOUSE</div>'
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
$("#detail").hide(); //디테일 사진 영역 숨김
$("#image_section").hide();
	//메인사진(1개)만 미리보기
	$("#house_mainImage").change(function(e){
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
         $("#image_section").show();
	})
	
	
	//여러사진 한번에 보여주기
	$("#house_detailImage").change(function(e){
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
	         $("#detail").show();
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