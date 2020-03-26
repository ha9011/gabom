function friendReqInAccept(id) {
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
		$('.info').text(json.message).fadeIn(400).delay(1000).fadeOut(400);
		let tr="#proInReq"+id;
		let td=tr+" td";
		$(tr).remove();
		let friendCnt=$(".timeLineProfileBoxFriend").text().substr(2);
		let friendCntNumber=parseInt(friendCnt);
		$(".timeLineProfileBoxFriend").html('친구<br/><br/>'+(friendCntNumber+1));
		let friendReqCnt=$(".timeLineProfileBoxRequest").text().substr(5);
		let friendReqCntNumber=parseInt(friendReqCnt);
		$(".timeLineProfileBoxRequest").html("친구 요청<br/><br/>"+(friendReqCntNumber-1));
	});			
	}