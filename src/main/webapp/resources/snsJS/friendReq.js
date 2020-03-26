function friendRequest(id){
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader(header,token);}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/friend/request",
				data:{"friendId":id},
				dataType : "json"
		}).done((userJson)=>{
			$('.info').text(userJson.message).fadeIn(400).delay(1000).fadeOut(400);
			moveThisNamePost(id);
		});
	}	