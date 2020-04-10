$("#writeBox").on("click","#writeButton",function(){
		let str = $("#sns_posts_content").val();
		if(str==""){
			alert("내용을 입력 해주세요.");
			return false;
		}
		$("#writeBox").slideUp(function() {
			str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			$("#sns_posts_content").val(str);
		});
		let form=$("#writeBoxForm")[0];	
		var writeData= new FormData();
		writeData.append("low",low);
		for(var i=0;i<imgCon.length;i++){
			writeData.append("snsWriteImage",imgCon[i]);
		}
		writeData.append("sns_posts_content",$("#sns_posts_content").val());
		writeData.append("security",$("#security option:selected").val());
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
			imgCon=[];
			makeTimeLine(json);
			$("#writeBox").css("border","0 solid white");
			$("#writeBox").empty();
		});
		
	});