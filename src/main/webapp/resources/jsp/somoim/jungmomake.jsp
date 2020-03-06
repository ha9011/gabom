<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link type="text/css" href="css/bootstrap.min.css" />
<link type="text/css" href="css/bootstrap-timepicker.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<style type="text/css">
#JMDateTimeImg {
	padding-bottom: 10px;
	width: 20%;
	margin-right: 5%;
}

#JMDateTimeInput {
	width: 100%;
}

#JMDateTime {
	display: flex;
}
</style>
</head>

<body>

	<div>

		<div id="JMmain">
			<form id="JMform" action="jungmomoim" method="post">

				<!--title -->
				<div class="input-group mb-3 input-group-lg">
					<div class="input-group-prepend">
						<span class="input-group-text"><img width="20px"
							height="20px" src="../resources/somoimimage/moim.PNG"></span>
					</div>
					<input type="text" class="form-control" id="jungmo_name" name="jungmo_name"
						placeholder="정모이름을 정해주세요">
				</div>


				<!--date & time -->
				<div id="JMDateTime">
					<div id="JMDateTimeImg">
						<img width="100%" height="95%"
							src="../resources/somoimimage/makemoim.PNG">
					</div>

					<div id="JMDateTimeInput">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text"><img width="20px"
									height="20px" src="../resources/somoimimage/calendar.PNG">
								</span>
							</div>
							<input type="date" id="jungmo_date" name="jungmo_date" class="form-control">
						</div>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text"><img width="20px"
									height="20px" src="../resources/somoimimage/time.PNG"></span>
							</div>
							<input type="time" id="jungmo_time" name="jungmo_time" class="form-control">
						</div>
					</div>


				</div>

				<!--MAP -->
				<div class="input-group mb-3 input-group-lg">

					<div class="input-group-prepend">
						<span class="input-group-text"><img width="20px"
							height="20px" src="../resources/somoimimage/location.PNG"></span>
					</div>


					<input type="text" class="form-control" id="jungmo_location"
						 
						name="jungmo_location" placeholder="우편번호"> 
						
						<input
						type="button" onclick="sample4_execDaumPostcode()"  value="우편번호 찾기">

					<button id="house_address_btn" type="button">지도확인</button>
					<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
					<div id="map" style="width: 100%; height: 200px; margin-top: 10px;"></div>

					<!-- 주소 좌표 hide로 숨김. -->
					<input type="hidden" name="house_ypoint" id="y" /> <input
						type="hidden" name="house_xpoint" id="x" />
				</div>

				<!--회비 -->
				<div class="input-group mb-3 input-group-lg">
					<div class="input-group-prepend">
						<span class="input-group-text"><img width="20px"
							height="20px" src="../resources/somoimimage/coin.PNG"></span>
					</div>
					<input type="text" class="form-control" id="jungmo_money" name="jungmo_money"
						placeholder="식사비 15000원">
				</div>
				
				
					<input type="button"
					class="btn btn-primary" onclick="formData()" value="만들기"
					data-dismiss="modal">


			</form>
		</div>
	</div>
</body>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById("JMLocation").value = data.roadAddr;
						document.getElementById("JMLocation").value = data.jibunAddress;

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.

						if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
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

	$("#house_address_btn")
			.on(
					"click",
					function() {
						$("#map").show();
						var $searchAddr = $("#JMLocation").val();

						console.log("검색 주소 : " + $searchAddr)

						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(33.450701,
									126.570667), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};

						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption);

						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();

						// 주소로 좌표를 검색합니다
						geocoder
								.addressSearch(
										$searchAddr,
										function(result, status) {

											console.log("result : ", result)
											console.log("status : " + status)

											// 정상적으로 검색이 완료됐으면 
											if (status === kakao.maps.services.Status.OK) {

												x = result[0].x;
												y = result[0].y;

												$("#x").val(x);
												$("#y").val(y);

												var coords = new kakao.maps.LatLng(
														result[0].y,
														result[0].x);

												console.dir(x);
												console.dir(y);

												// 결과값으로 받은 위치를 마커로 표시합니다
												var marker = new kakao.maps.Marker(
														{
															map : map,
															position : coords
														});

												// 인포윈도우로 장소에 대한 설명을 표시합니다
												var infowindow = new kakao.maps.InfoWindow(
														{
															content : '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
														});
												infowindow.open(map, marker);

												// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
												map.setCenter(coords);
											}
										});

					})
	
		//전송
		

	
	
	
</script>
</html>