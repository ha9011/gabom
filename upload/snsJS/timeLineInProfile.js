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
					make+='<i class="fas fa-star faa-tada animated" style="color:gold"></i>';
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
				make+='<button type="button" class="btn-default messageBox" onclick="window.open(\'snsdm\',\'DM\',\'width=600,height=700,toolbar=no,menubar=no,location=no,left=400,top=150\')">';
				make+='<i class="far fa-envelope fa-2x"></i></button>';
				make+='<button type="button" class="btn-default pull-right friendRequestBtn" onclick="friendReqCancel(\''+json.id+'\')">거절</button><span>';
				make+='<button type="button" class="btn-default pull-right friendRequestBtn" onclick="friendAccept(\''+json.id+'\')">수락</button></span>';
				make+='</div>';
			}
			else if(json.friendStatus==0&&userId!=json.id){
				make+='<div class="container friendRequestBtnBox">';
				make+='<button type="button" class="btn-default messageBox" onclick="window.open(\'snsdm\',\'DM\',\'width=600,height=700,toolbar=no,menubar=no,location=no,left=400,top=150\')">';
				make+='<i class="far fa-envelope fa-2x"></i></button>';
				make+='<button type="button" class="btn-default pull-right friendRequestBtn"';
				make+='onclick="friendRequest(\''+json.id+'\')">';
				make+='친구 신청&nbsp;<i class="fas fa-star faa-tada animated" style="color:gold"></i></button></div>';
			}
			else if(json.friendStatus==1&&userId!=json.id){
				make+='<div class="container friendRequestBtnBox messageBox">';
				make+='<button type="button" class="btn-default messageBox" onclick="window.open(\'snsdm\',\'DM\',\'width=600,height=700,toolbar=no,menubar=no,location=no,left=400,top=150\')">';
				make+='<i class="far fa-envelope fa-2x"></i></button>';
				make+='<button type="button" class="btn-default pull-right friendRequestBtn"';
				make+='onclick="friendRequestStatus(\''+json.id+'\')">';
				make+='요청중&nbsp;<i class="fa fa-spinner faa-spin animated"></i></button>';
				make+='</div>';
			}
			else if(json.friendStatus==2&&userId!=json.id){
				make+='<div class="container friendRequestBtnBox">';
				make+='<button type="button" class="btn-default messageBox" onclick="window.open(\'snsdm\',\'DM\',\'width=600,height=700,toolbar=no,menubar=no,location=no,left=400,top=150\')">';
				make+='<i class="far fa-envelope fa-2x"></i></button>';
				make+='<button type="button" class="btn-default pull-right friendRequestBtn"';
				make+='onclick="friendCancel(\''+json.id+'\')">';
				make+='친구 해제</button></div>';
			}
			$("#timeLineProfileBoxTot").html(make);
			$("#timeLineProfileBoxTot").hide();
			$("#timeLineProfileBoxTot").slideDown();
		}
	}