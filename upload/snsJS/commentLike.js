	function commentLike(commentNumber) {
		var $likeCommentval="#commentLike"+commentNumber;
		var $hateCommentval="#commentHate"+commentNumber;
		
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader(header,token);}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/comment/like",
				data:{"commentNumber":commentNumber},
				dataType : "json"
		}).done((commentLikeTotalJson)=>{
			$($likeCommentval).text(commentLikeTotalJson.commentLikeTotal);
			$($hateCommentval).text(commentLikeTotalJson.commentHateTotal);
		});
	}