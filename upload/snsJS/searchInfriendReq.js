function searchInfriendReq(reqId) {
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader(header,token);
	 		}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/friend/request",
				data:{"friendId":reqId},
				dataType : "json"
		}).done((userJson)=>{
			$('.info').text(userJson.message).fadeIn(400).delay(1000).fadeOut(400);
			let req="#friendReqBox"+reqId;
			$(req).remove();
			let str="";
			str+='<div class="searchData">';
			str+='<button type="button" class="btn btn-primary" id="friendReqStatus'+reqId+'"';
			str+='onclick="searchInFriendReqStatus(\''+reqId+'\')">요청중</button>';
			str+='</div>';
			let newReq="#friendBtn"+reqId;
			$(newReq).html(str);
		});
	}