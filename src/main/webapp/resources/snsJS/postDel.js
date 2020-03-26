	function postDelete(e) {
		if(confirm("삭제 하시겠습니까?")){
		var postNumber=e.id.substr(7);
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader(header,token);}
		});//먼저 보냄
		$.ajax({
 			method:'post',
 			url:"sns/post/delete",
 			data:{"postNumber":postNumber},
 			dataType : "json"
		}).done((delJson)=>{
			makeTimeLine(delJson);
			location.href="#snsTimeLineMain";
		});
		}else{return false;}
	}//end