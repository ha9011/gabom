$("#writeBox").on("click","#writeButton",function(){
		let str = $("#sns_posts_content").val();

		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');

		$("#sns_posts_content").val(str);
		if(str==""){
			alert("내용을 입력 해주세요.");
			return false;
		}
		let form=$("#writeBoxForm")[0];	
		
		var writeData= new FormData(form);
		writeData.append("low",low);
		
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader(header,token);}
		});//먼저 보냄
		$.ajax({
 			method:'post',
 			url:"sns/write/insert",
 			data:writeData,
 			dataType : "json",
 			processData: false,
            contentType: false,
		}).done((json)=>{
			makeTimeLine(json);
			$("#writeBox").css("border","0 solid white");
			$("#writeBox").slideUp();
			$("#writeBox").empty();
		});
		
	});