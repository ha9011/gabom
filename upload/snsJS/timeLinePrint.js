//타임 라인 생성 함수
	function makeTimeLine(timeLineJson){
		$("#snsTimeLineMain").empty();
		 for(let j in timeLineJson){
			let postsContents = timeLineJson[j]["content"];
	 		let RePostsContents=postsContents.split("<br/>").join("\r\n");
		let $timeLine = "";
		if(userId==timeLineJson[j]["posts_writer"]){
		$timeLine += '<div class="jumbotron post'+timeLineJson[j]["posts_number"]+'" id="posts" style="border: 5px solid #337ab7">';
		}else{
		$timeLine += '<div class="jumbotron" id="posts">';
		}
		$timeLine += '<div class="row" onclick="moveThisNamePost(\''+timeLineJson[j]["posts_writer"]+'\')">';
		$timeLine += '<a href="#;"><img src='+timeLineJson[j]["profilePicture"]+' class="img-responsive col-xs-4 col-md-2 col-sm-4 myImage" id="timeLineProfile"></a>';
		$timeLine += '<div id="snsMember_id"><a href="#;">'+timeLineJson[j]["posts_writer"]+'</a> 님의 글<i class="fas fa-fan faa-spin animated" style="color: #337ab7;"></i></div>';
		$timeLine += '<input type="hidden" value='+timeLineJson[j]["posts_number"]+' id="posts_number">';
		$timeLine += '</div>';
		$timeLine += '<div class="nav-tabs" id="postHead">';
		if(userId==timeLineJson[j]["posts_writer"]){
		$timeLine += '<a href="#;" id="postdel'+timeLineJson[j]["posts_number"]+'" onclick="postDelete(this)">삭제</a>';
		}else{
		$timeLine += '<a href="#;" onclick="reportPost(\''+timeLineJson[j]["posts_number"]+'\')">신고</a>';
		}
		if(userId==timeLineJson[j]["posts_writer"]){
		$timeLine += '<div class="container col-xs-5 col-md-3 col-sm-5 pull-right">';
		$timeLine += '<select class="form-control" onchange="infoSecurity(this)" id="infoSecurity'+timeLineJson[j]["posts_number"]+'">';
		if(timeLineJson[j]["posts_authority"]==0){
		$timeLine += '<option>전체 공개</option>';
		$timeLine += '<option>나만 보기</option>';
		$timeLine += '<option>친구 공개</option>';
		}else if(timeLineJson[j]["posts_authority"]==1){
			$timeLine += '<option>친구 공개</option>';
			$timeLine += '<option>나만 보기</option>';
			$timeLine += '<option>전체 공개</option>';
		}else if(timeLineJson[j]["posts_authority"]==2){
			$timeLine += '<option>나만 보기</option>';
			$timeLine += '<option>친구 공개</option>';
			$timeLine += '<option>전체 공개</option>';
		}
		$timeLine += '</select>';
		$timeLine += '</div>';
		}
		$timeLine += '</div>';
		$timeLine += '<div class="container" id="postsContentsBox">';
		if(timeLineJson[j]["posts_writer"]==userId){
		$timeLine += '<textarea class="container emo" cols="93" rows="8" id="postContents'+timeLineJson[j]["posts_number"]+'" onkeyup="editPost(this)">'+RePostsContents+'</textarea>';	
		}else{
		$timeLine += '<textarea class="container emo" cols="93" rows="8" readonly id=postContents"'+timeLineJson[j]["posts_number"]+'" onkeyup="editPost(this)" >'+RePostsContents+'</textarea>';
		}
		$timeLine += '<div class="container" id="editBox'+timeLineJson[j]["posts_number"]+'"></div>';
		$timeLine += '<div class="container" id="postsPhotoBox">';
		$timeLine += '</div>';
		$timeLine += '<div id="postsOptionBox" class="navbar-default navbar-right">';
		$timeLine += '<div id="snsOption">';
		/* $timeLine += '<button type="button"><i class="fas fa-share snsOptionSelector"></i> </button>'; */
		$timeLine += '<button type="button"><i class="far fa-thumbs-up faa-pulse animated snsOptionSelector like" id="snsLike'+timeLineJson[j]["posts_number"]+'" onclick="likeSend(\''+timeLineJson[j]["posts_number"]+'\',\''+timeLineJson[j]["posts_writer"]+'\')">'+timeLineJson[j]["like"]+'</i></button>';
		$timeLine += '<button type="button"><i class="far fa-thumbs-down faa-pulse animated snsOptionSelector hate" id="snsHate'+timeLineJson[j]["posts_number"]+'" onclick="hateSend(\''+timeLineJson[j]["posts_number"]+'\',\''+timeLineJson[j]["posts_writer"]+'\')">'+timeLineJson[j]["hate"]+'</i></button></div>';
		$timeLine += '</div>';
		$timeLine += '</div>';
		$timeLine += '<div class="container snsImageContainer" id="'+j+'" >';
		$timeLine += '</div>';
		$timeLine += '<div class="container">';
		$timeLine += '<div class="navbar-default" id="snsCommentBox"><a href="#;" class="snsComment" id="snsComment'+timeLineJson[j]["posts_number"]+'" onclick="comment(\''+timeLineJson[j]["posts_number"]+'\')">댓글 보기('+timeLineJson[j]["commentCount"]+')</a></div>';
		$timeLine += '<div class="'+timeLineJson[j]["posts_number"]+'" id="commentReal"></div>';
		$timeLine += '</div>';
		$timeLine += '</div>';
		$('#snsTimeLineMain').append($timeLine);
		 for(var k=0;k<timeLineJson[j]["photoList"].length;k++){
		let $snsPostsImageBox=$("<div class='cover' id='gallery'>");
		let $postsimageBox=$('<img class="img-thumbnail img-responsive" onclick="resizeImg(this.src)">');
		$postsimageBox.attr("src","resources/snsPostsImage/"+timeLineJson[j]["photoList"][k]["sns_photo_origin_name"]);
		$postsimageBox.appendTo($snsPostsImageBox);
		$snsPostsImageBox.appendTo($("#"+j));
		}
		 }
	}