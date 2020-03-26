	function commentUnitMake(commentJson,number){
		let classNum="."+number+" tbody";
		let firstTr=classNum+" tr:first td";
		let text=$(firstTr).text();
		if(text=="댓글이 없습니다."){
			$(firstTr).remove();
		}
		let commentBox="";
		commentBox+='<tr id="commentRowBox'+commentJson["number"]+'">';
		commentBox+='<td style="width: 70px;" class="commentTd" onclick="moveThisNamePost(\''+commentJson["id"]+'\')"><img src="'+commentJson["profilePic"]+'" class="img-thumbnail img-responsive img-circle"';
		commentBox+='id="commentImg"><a href="#showImageBox">'+commentJson["id"]+'</a></td>';
		commentBox+='<td style="width: 500px;" id="commentContents'+commentJson["number"]+'">'+commentJson["content"]+'</td>';
		commentBox+='<td style="background-color: white">';
		commentBox+='<button type="button" class="btn-default commentLike" onclick="commentLike(\''+commentJson["number"]+'\')">';
		commentBox+='<i class="far fa-thumbs-up commentLike" id="commentLike'+commentJson["number"]+'">'+commentJson["like"]+'</i></button>';
		commentBox+='<button type="button" class="btn-default commentHate" onclick="commentHate(\''+commentJson["number"]+'\')"><i class="far fa-thumbs-down commentHate" id="commentHate'+commentJson["number"]+'">'+commentJson["hate"]+'</i></button>';
		commentBox+='</td>';
		commentBox+='<td style="background-color: white">'+commentJson["date"]+'</td>';
		commentBox+='<td style="background-color: white; width: 150px">';
		if(userId==commentJson["id"]){
			commentBox+='<a onclick=commentEdit("'+number+'","'+commentJson["number"]+'")>';
			commentBox+='수정</a>/<a onclick=commentDel("'+number+'","'+commentJson["number"]+'")>삭제</a>';	
		}else{
			commentBox+='<a>신고</a>';
		}
		commentBox+='</td>';
		commentBox+='</tr>';
		$(classNum).append(commentBox);
		let commentCnt="#snsComment"+number;
		let cnt=$(commentCnt).text();
		let cnt2=cnt.substr(6);
		let cnt3=cnt2.split(")")[0];
		let cnt4=parseInt(cnt3);
		$(commentCnt).text("댓글 보기("+(cnt4+1)+")");
	}