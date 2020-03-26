// 페이지 로딩시 해당 회원에 정보를 가져온다.
	function getProflie(){
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader(header,token);}
		});//먼저 보냄
		$.ajax({
 			method:'get',
 			url:"sns/profile",
 			dataType : "json"
		}).done((json)=>{
			setProfile(json);
		});
	}
	userId=undefined;
//페이지 프로필파일과 이름을 출력 해주는 함수
function setProfile(json) {
	$("#snsProfileImg img").attr("src",json.member_profile_picture);
	$("#snsProfileName").html("<a href='#timeLineProfileBoxTot'>"+json.member_id+"</a>님");
	userId=json.member_id;
	jsonPicture=json.member_profile_picture;	
}