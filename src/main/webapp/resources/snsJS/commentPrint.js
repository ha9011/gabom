function printComment(commentJson,number) {
	$("."+number).empty();
		let commentBox="";
		commentBox+='<div class="container-fluid" id=commentReal>';
		commentBox+='<table class="table table-hover table-responsive">';
		commentBox+='<tbody>';
	if(commentJson.comment=="댓글이 없습니다."){
		commentBox+='<tr>';
		commentBox+='<td>'+commentJson.comment+'</td>';
		commentBox+='</tr>';
	}else{
			for(let k in commentJson){
			commentBox+='<tr id="commentRowBox'+commentJson[k]["number"]+'">';
			commentBox+='<td style="width: 70px" class="commentTd" onclick="moveThisNamePost(\''+commentJson[k]["id"]+'\')"><img src="'+commentJson[k]["profilePic"]+'" class="img-thumbnail';
			commentBox+='img-responsive img-circle" id="commentImg"><a href="#showImageBox">'+commentJson[k]["id"]+'</a></td>';
			commentBox+='<td style="width: 500px" id="commentContents'+commentJson[k]["number"]+'">'+commentJson[k]["content"]+'</a></td>';
			commentBox+='<td style="background-color: white">';
			commentBox+='<button type="button" class="btn-default commentLike" onclick="commentLike(\''+commentJson[k]["number"]+'\')">';
			commentBox+='<i class="far fa-thumbs-up faa-pulse animated commentLike" id="commentLike'+commentJson[k]["number"]+'">'+commentJson[k]["like"]+'</i></button>';
			commentBox+='<button type="button" class="btn-default commentHate" onclick="commentHate(\''+commentJson[k]["number"]+'\')"><i class="far fa-thumbs-down faa-pulse animated commentHate"';
			commentBox+='id="commentHate'+commentJson[k]["number"]+'">'+commentJson[k]["hate"]+'</i></button>';
			commentBox+='</td>';
			commentBox+='<td style="background-color: white">'+commentJson[k]["date"]+'</td>';
			commentBox+='<td style="background-color: white; width: 150px">';
			
			if(userId==commentJson[k]["id"]){
				commentBox+='<a onclick=commentEdit("'+number+'","'+commentJson[k]["number"]+'")>';
				commentBox+='수정</a>/<a onclick=commentDel("'+number+'","'+commentJson[k]["number"]+'")>삭제</a>';	
			}else{
				commentBox+='<a>신고</a>';
			}
			commentBox+='</td>';
			commentBox+='</tr>';
				}
	}
		commentBox+='</tbody>';
		commentBox+='</table>';
		if(commentJson.comment!="댓글이 없습니다."){
		commentBox+='<div class="container">';
		commentBox+='<div class="pull-left commentMore" id="commentMore'+number+'"><a href="#;" onclick=commentMore(\''+number+'\')>댓글 더보기</a></div>';
		commentBox+='</div>';
		}
		commentBox+='<div class="input-group commentWriteBox" id="commentWriteBox'+number+'">';
		commentBox+='<input type="text" class="form-control" placeholder="댓글 입력">';
		commentBox+='<span class="input-group-btn">';
		commentBox+='<button type="button" class="btn btn-primary commentWrite" onclick="commentInsert('+number+')">확인</button>';
		commentBox+='</span>';
		commentBox+='</div>';
		commentBox+='<div class="commentCancelBtn" id="commentCancelBtn'+number+'">닫기</div>';
		commentBox+='</div>';	
		$("."+number).html(commentBox);
		$("."+number).hide();
		$("."+number).slideDown();
		var commentCancel="#commentCancelBtn"+number;
		$(commentCancel).on("click",function(){
			$("."+number).slideUp();
			$("."+number).empty();
		});
}//서비스 End