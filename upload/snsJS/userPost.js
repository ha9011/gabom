	var userPostRow=1;
	function moveThisNamePost(id) {
		if(id==userId){
			asideRead();
			return;
		}
		thisId=id;
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader(header,token);}
		});//먼저 보냄
		let userPostData={
				"id":id,
				"row":userPostRow
		}
		$.ajax({
				method:'post',
				url:"sns/user/posts",
				data:userPostData,
				dataType : "json"
		}).done((userJson)=>{
			makeTimeLine(userJson);
			makeTimeLineProfile(id);
			$("#more").css("display","none");
			$("#myPostMore").css("display", "none");
			$("#friendMore").css("display", "block");
			for(let k in userJson){
				if(userJson[k]["max"]==userJson[k]["rowNum"]){
					userPostRow=1;
					$("#friendMore").css("display", "none");
					}
				}
			});
	}	
		$("#friendMore").click(function () {
		userPostRow++;
		moveThisNamePost(thisId);
		});