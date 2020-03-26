function makeFriendList(json) {
		location.href="#showImageBox";
		$("#more").css("display","none");
		$("#friendList").css("display","none");
		$("#myPostMore").css("display","none");
		$("#snsTimeLineMain").empty();
		let table=$("<table>").addClass("table table-hover friendList").css("margin-top","26px");
		let tbody=table.append("<tbody>");
		let make="";
		if(json.message=="친구가 없습니다."){
			$('.info').text(json.message).fadeIn(400).delay(1000).fadeOut(400);
		}else{
		for(let k in json){
			make+='<tr id="proFriendList'+json[k].member_id+'">';
			make+='<td onclick="moveThisNamePost(\''+json[k].member_id+'\')">';
			make+='<img src="'+json[k].member_profile_picture+'"';
			make+='class="img-thumbnail img-responsive" style="width: 70px;height: 70px;"/>';
			make+='</td>';
			make+='<td class="friendListContent" onclick="moveThisNamePost(\''+json[k].member_id+'\')">';
			make+='<div><a href="#;">'+json[k].member_id+'</a></div>';
			make+='</td>';
			make+='<td class="friendListContent">';
			make+='<div><button type="button" class="btn-default"';
			make+='onclick="friendListInCancel(\''+json[k].member_id+'\')">친구 해제</button></div>';
			make+='</tr>';
		}
		}
		tbody.append(make);
		tbody.append(table);
		table.appendTo($("#snsTimeLineMain"));
		$("#snsTimeLineMain").hide();
		$("#snsTimeLineMain").slideDown();
	}