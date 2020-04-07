function commentInsert(number) {
	var commentWriteContents="#commentWriteBox"+number+" input";
	var commentData={
			postNumber:number,
			commentContent:$(commentWriteContents).val()
	}
		$.ajaxSetup({
			beforeSend : function(xhr){
 			xhr.setRequestHeader(header,token);}
		});//먼저 보냄
		$.ajax({
			method:'post',
			url:"sns/comment/insert",
			data:commentData,
			dataType : "json"
		}).done((commentJson)=>{
			commentUnitMake(commentJson,number);
			$(commentWriteContents).val("");
		});
	}