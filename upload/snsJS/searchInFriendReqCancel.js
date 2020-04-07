function searchInFriendReqStatus(id) {
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
				$('.info').text(msgJson.message).fadeIn(400).delay(1000).fadeOut(400);
				let req="#friendReqStatusBox"+id;
				$(req).remove();
				let str="";
				str+='<div class="searchData">';
				str+='<button type="button" class="btn btn-primary" id="searchInfriendReq'+id+'"';
				str+='onclick=searchInfriendReq(\''+id+'\')>친구신청</button>';
				str+='</div>'
				let newReq="#friendBtn"+id;
				$(newReq).html(str);
			});		
		}
	}