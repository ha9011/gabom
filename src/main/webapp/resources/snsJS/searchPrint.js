function makeSearchList(json,data) {
		$("#timeLineProfileBoxTot").empty();
		$("#snsTimeLineMain").empty();
		$("#more").css("display","none");
		$("#friendMore").css("display","none");
		$("#myPostMore").css("display","none");
		let $tot=$("<div>").addClass("container searchTot");
		let $friend=$("<div>").addClass("container")
		.html("<div style='display:flex;margin-bottom:20px;'><div class=searchD>\""+data+"\"</div>에 관련된 친구 검색 결과</div>");
		let str="";
		str+='<table class="table table-hover table-responsive">';
		str+='<tbody>';
		if(json["friendList"].length==0){
		str+='<tr>';
		str+='<td style="width: 600px;">검색 결과가 없습니다.</td>';
		str+='</tr>';
		}else{
		for(let k in json["friendList"]){
		str+='<tr>';
		str+='<td>';
		str+='<img src="'+json["friendList"][k]["pic"]+'" class="img-thumbnail img-responsive img-circle"';
		str+='style="width: 66px;height: 60px;" onclick="moveThisNamePost(\''+json["friendList"][k]["id"]+'\')">';
		str+='</td>';
		str+='<td>';
		str+='<div class="searchData">';
		str+='<a href="#;" onclick="moveThisNamePost(\''+json["friendList"][k]["id"]+'\')">'+json["friendList"][k]["id"]+'</a></div></td>';
		str+='<td id="friendBtn'+json["friendList"][k]["id"]+'">';
		if(json["friendList"][k]["id"]==userId){
			str+='<div class="searchData">';
			str+='<button type="button" class="btn btn-primary" onclick="moveThisNamePost(\''+userId+'\')">내 글</button>';
			str+='</div>';		
		}
		if(json["friendList"][k]["status"]==0&&json["friendList"][k]["id"]!=userId){
			str+='<div class="searchData" id="friendReqBox'+json["friendList"][k]["id"]+'">';
			str+='<button type="button" class="btn btn-primary" id="searchInfriendReq'+json["friendList"][k]["id"]+'"';
			str+='onclick=searchInfriendReq(\''+json["friendList"][k]["id"]+'\')>친구신청</button>';
			str+='</div>';
		}
		if(json["friendList"][k]["status"]==1){
			str+='<div class="searchData" id="friendReqStatusBox'+json["friendList"][k]["id"]+'">';
			str+='<button type="button" class="btn btn-primary" id="friendReqStatus'+json["friendList"][k]["id"]+'"';
			str+='onclick="searchInFriendReqStatus(\''+json["friendList"][k]["id"]+'\')">요청중</button>';	
			str+='</div>';
		}
		if(json["friendList"][k]["status"]==2&&json["friendList"][k]["id"]!=userId){
			str+='<div class="searchData" id="searchInFriendCancelBox'+json["friendList"][k]["id"]+'">';
			str+='<button type="button" class="btn btn-primary"';
			str+='onclick=searchInFriendCancel(\''+json["friendList"][k]["id"]+'\')>친구 해제</button>';
			str+='</div>';
		}
		if(json["friendList"][k]["status"]==3){
			str+='<div class="searchData">';
			str+='<button type="button" class="btn btn-primary">차단 해제</button>';
			str+='</div>';
		}
		str+='</td>';
		str+='</tr>';
		}
		}
		str+='</tbody>';
		str+='</table>';
		str+='<div class="pull-right"><a href="#;" id="friendMoreBtn" onclick="friendMoreBtn(\''+data+'\')">친구 더보기</a></div>';
		str+='<hr/><br/><br/>';
		str+='<div style="display:flex; margin-bottom:20px;"><div class=searchD>\"'+data+'\"</div>에 관련된 게시글 검색 결과</div>';
		str+='<table class="table table-hover table-responsive">';
		str+='<tbody>';
		if(json["publicPost"].length==0){
			str+='<tr>';
			str+='<td style="width: 600px;">검색 결과가 없습니다.</td>';
			str+='</tr>';
			}else{
		for(let k in json["publicPost"]){
		str+='<tr onclick="serachPost(\''+json["publicPost"][k]["postNumber"]+'\')">';
		str+='<input type="hidden" value="'+json["publicPost"][k]["postNumber"]+'">';
		str+='<td><a href="#;">'+json["publicPost"][k]["contents"]+'</a></td>';
		str+='<td>'+json["publicPost"][k]["date"]+'</td>';
		str+='</tr>';
		}
			}
		str+='</tbody>';
		str+='</table>';
		str+='<div class="pull-right"><a href="#;" id="postMoreBtn" onclick="postMoreBtn(\''+data+'\')">게시글 더보기</a></div>';
		$friend.append(str);
		$friend.appendTo($tot);
		$("#snsTimeLineMain").html($tot);
		$("#snsTimeLineMain").hide();
		$("#snsTimeLineMain").fadeIn();
	}//