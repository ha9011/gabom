function friendRequestStatus(id) {
		if(confirm("취소 하시겠습니까?")){
			$.ajaxSetup({
				beforeSend : function(xhr){
		 		xhr.setRequestHeader(header,token);}
			});//먼저 보냄
			$.ajax({
					method:'post',
					url:"sns/friend/request/cancel",
					data:{"friendId":id},
					dataType : "json"
			}).done((msgJson)=>{
				moveThisNamePost(id);
				$('.info').text(msgJson.message).fadeIn(400).delay(1000).fadeOut(400);
			});		
		}
	}	