function friendAccept(id) {
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader(header,token);}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/friend/request/accept",
				data:{"id":id},
				dataType : "json"
		}).done((json)=>{
			moveThisNamePost(id);
			$('.info').text(json.message).fadeIn(400).delay(1000).fadeOut(400);
		});			
	}