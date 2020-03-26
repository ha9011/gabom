function setTimeLine() {
		$.ajaxSetup({
			beforeSend : function(xhr){
 			xhr.setRequestHeader(header,token);}
		});//먼저 보냄
			$.ajax({
			method:'get',
			url:"sns/timeline",
			data:{"low":low},
			dataType : "json"
			}).done((timeLineJson)=>{
			makeTimeLine(timeLineJson);
			});
	}