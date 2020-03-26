function friendReqInCancel(reqId) {
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
			let tr="#proInReq"+reqId;
			let td=tr+" td";
			$(tr).remove();
			let friendReqCnt=$(".timeLineProfileBoxRequest").text().substr(5);
			let friendReqCntNumber=parseInt(friendReqCnt);
			$(".timeLineProfileBoxRequest").html("친구 요청<br/><br/>"+(friendReqCntNumber-1));
		});
	}