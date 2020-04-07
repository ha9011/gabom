function friendReqCancel(reqId) {
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader(header,token);}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/friend/request/refusal",
				data:{"reqId":reqId},
				dataType : "json"
		}).done((json)=>{
			$('.info').text(json.message).fadeIn(400).delay(1000).fadeOut(400);
			makeTimeLineProfile(reqId);
		});
	}