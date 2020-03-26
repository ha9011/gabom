function serachPost(postNumber) {
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader(header,token);}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/search/post",
				data:{"postNumber":postNumber},
				dataType : "json"
		}).done((json)=>{
			for(let k in json){
			makeTimeLineProfile(json[k]["posts_writer"]);
			}
			makeTimeLine(json);
		});			
	}