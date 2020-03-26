function friendListInCancel(id) {
			if(confirm("친구상태를 해제 하시겠습니까?")){
			$.ajaxSetup({
				beforeSend : function(xhr){
		 		xhr.setRequestHeader(header,token);}
			});//먼저 보냄
			$.ajax({
					method:'post',
					url:"sns/friend/cancel",
					data:{"friendId":id},
					dataType : "json"
			}).done((json)=>{
				$('.info').text(json.message).fadeIn(400).delay(1000).fadeOut(400);
				let tr="#proFriendList"+id;
				let td=tr+" td";
				$(tr).remove();
				let friendCnt=$(".timeLineProfileBoxFriend").text().substr(2);
				let friendCntNumber=parseInt(friendCnt);
				$(".timeLineProfileBoxFriend").html('친구<br/><br/>'+(friendCntNumber-1));
			});			
			}
		}	