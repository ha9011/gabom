function commentHate(commentNumber) {
	var $likeCommentval="#commentLike"+commentNumber;
	var $hateCommentval="#commentHate"+commentNumber;
	$.ajaxSetup({
		beforeSend : function(xhr){
 		xhr.setRequestHeader(header,token);}
	});//먼저 보냄
	$.ajax({
			method:'post',
			url:"sns/comment/hate",
			data:{"commentNumber":commentNumber},
			dataType : "json"
	}).done((commentHateTotalJson)=>{
		$($likeCommentval).text(commentHateTotalJson.likeTotal);
		$($hateCommentval).text(commentHateTotalJson.hateTotal);
	});
}