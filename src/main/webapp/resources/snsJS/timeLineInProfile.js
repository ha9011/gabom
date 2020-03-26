function makeTimeLineProfile(id) {
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader(header,token);}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/timeline/profile",
				data:{"id":id},
				dataType : "json"
		}).done((profileJson)=>{
				make(profileJson);
		});
		function make(json) {
			let make="";
			make+='<div class="container" id="timeLineProfileBox">';
			make+='<img src="'+json.pic+'" class="img-thumbnail img-responsive" onclick=resizeImg(this.src)>';
			make+='<div class="container timeLineProfileBoxId">아이디';
				if(json.friendStatus==2&&userId!=json.id){
					make+='<i class="fas fa-star" style="color:gold"></i>';
				}
			make+='<br/><br/>'+json.id+'</div>';
			make+='<div class="container timeLineProfileBoxName">이름<br/><br/>'+json.name+'</div>';
			make+='<div class="container timeLineProfileBoxPost">게시글<br/><br/>'+json.post+'</div>';
			make+='<div class="container timeLineProfileBoxFriend" onclick="friendList(\''+json.id+'\')">친구<br/><br/>'+json.friend+'</div>';
			make+='<div class="container timeLineProfileBoxRequest" onclick=friendRequestTot(\''+json.id+'\')>';
			make+='친구 요청<br/><br/>'+json.friendRequset+'</div>';
			make+='</div>';
			if(json.reverse==1){
				make+='<div class="container friendRequestBtnBox">';
				make+='<button type="button" class="btn-default pull-right friendRequestBtn" onclick="friendReqCancel(\''+json.id+'\')">거절</button><span>';
				make+='<button type="button" class="btn-default pull-right friendRequestBtn" onclick="friendAccept(\''+json.id+'\')">수락</button></span>';
				make+='</div>';
			}
			else if(json.friendStatus==0&&userId!=json.id){
				make+='<div class="container friendRequestBtnBox">';
				make+='<button type="button" class="btn-default pull-right friendRequestBtn"';
				make+='onclick="friendRequest(\''+json.id+'\')">';
				make+='친구 신청</button></div>';
			}
			else if(json.friendStatus==1&&userId!=json.id){
				make+='<div class="container friendRequestBtnBox">';
				make+='<button type="button" class="btn-default pull-right friendRequestBtn"';
				make+='onclick="friendRequestStatus(\''+json.id+'\')">';
				make+='요청중</button>';
				make+='</div>';
			}
			else if(json.friendStatus==2&&userId!=json.id){
				make+='<div class="container friendRequestBtnBox">';
				make+='<button type="button" class="btn-default pull-right friendRequestBtn"';
				make+='onclick="friendCancel(\''+json.id+'\')">';
				make+='친구 해제</button></div>';
			}
			$("#timeLineProfileBoxTot").html(make);
			$("#timeLineProfileBoxTot").hide();
			$("#timeLineProfileBoxTot").slideDown();
		}
	}