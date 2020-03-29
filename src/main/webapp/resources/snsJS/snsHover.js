//호버시 아이콘 변환 스크립트
	$("#snsProfileNotice a").hover(function () {
		$("#snsProfileNotice a").html('<i class="fas fa-bell"></i>');
	},function(){
		$("#snsProfileNotice a").html('알람');
	});
	$("#snsProfileInfo a").hover(function () {
		$("#snsProfileInfo a").html('<i class="fas fa-cog fa-spin"></i>');
	},function(){
		$("#snsProfileInfo a").html('정보수정');
	});
	$("#snsFriendList a").hover(function () {
		$("#snsFriendList a").html('<i class="fas fa-user-friends faa-tada animated"></i>');
	},function(){
		$("#snsFriendList a")
		.html('내친구&nbsp;<i class="fas fa-star faa-tada animated" style="color:gold"></i>');
	});
	//어사이드 글작성부터
	$("#snsWirte a").hover(function () {
		$("#snsWirte a").html('<i class="fas fa-edit faa-wrench animated"></i>');
	},function(){
		$("#snsWirte a").html('글작성');
	});
	$("#timeLine a").hover(function () {
		$("#timeLine a").html('<i class="far fa-clock faa-tada animated"></i>');
	},function(){
		$("#timeLine a").html('타임라인');
	});
	$(".top a").hover(function () {
		$(".top a").html('<i class="fas fa-arrow-circle-up faa-float animated "></i>');
	},function(){
		$(".top a").html('TOP');
	});
	$("#search a").hover(function () {
		$("#search a").html('<i class="fa fa-search faa-wrench animated"></i>');
	},function(){
		$("#search a").html('검색');
	});
	/* $("#socialClub a").hover(function () {
		$("#socialClub a").html('<i class="fas fa-users"></i>');
	},function(){
		$("#socialClub a").html('소모임');
	}); */
	$("#travelPlan a").hover(function () {
		$("#travelPlan a").html('<i class="fas fa-map-marked-alt faa-wrench animated"></i>');
	},function(){
		$("#travelPlan a").html('여행계획');
	});