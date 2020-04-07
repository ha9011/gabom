function hateSend(postNumber,writer) {
		var snsLikeId="#snsLike"+postNumber;
		var snsHateId="#snsHate"+postNumber;
	 	$.ajaxSetup({
			beforeSend : function(xhr){
			xhr.setRequestHeader(header,token);}
		});//먼저 보냄
		$.ajax({
			method:'post',
			url:"sns/timeline/hate",
			data:{"postNumber":postNumber},
			dataType : "json"
		}).done((totalJson)=>{
			$(snsLikeId).text(totalJson.likeTotal);
			$(snsHateId).text(totalJson.hateTotal);
		});
	}