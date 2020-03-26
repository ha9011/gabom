function friendCancel(friendId) {
		if(confirm("친구 상태를 해제 하시겠습니까?")){
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader(header,token);}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/friend/cancel",
				data:{"friendId":friendId},
				dataType : "json"
		}).done((msgJson)=>{
			$('.info').text(msgJson.message).fadeIn(400).delay(1000).fadeOut(400);
			moveThisNamePost(friendId);
		});
		}
	}