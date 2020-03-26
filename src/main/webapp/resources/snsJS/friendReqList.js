	function friendRequestTot(id) {
		if(id==userId){
			$.ajaxSetup({
				beforeSend : function(xhr){
		 		xhr.setRequestHeader(header,token);}
			});//먼저 보냄
			$.ajax({
					method:'post',
					url:"sns/friend/request/sum",
					data:{"id":userId},
					dataType : "json"
			}).done((json)=>{
				requestPrint(json);
			});			
		}else{
			$('.info').text("본인만 이용 가능합니다.").css("background-color","red").fadeIn(400).delay(600)
			.fadeOut(400,function(){
			$('.info').css("background-color","#337ab7");
			});
		}
	}