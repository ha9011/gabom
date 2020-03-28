	let commentRow=1;
	function comment(number) {
	$.ajaxSetup({
		beforeSend : function(xhr){
 		xhr.setRequestHeader(header,token);}
	});//먼저 보냄
	commentData={
			"commentRow":commentRow,
			"postNumber":number
	}
	$.ajax({
			method:'post',
			url:"sns/comment",
			data:commentData,
			dataType : "json"
	}).done((commentJson)=>{
		printComment(commentJson,number);
		if(commentJson.length==commentJson[0]["max"]||commentJson[0]["max"]==undefined){
			let commentM="#commentMore"+number;
			$(commentM).hide();
			commentRow=1;
		}
	});
}
	function commentMore(number){
		commentRow++
		comment(number);
	}