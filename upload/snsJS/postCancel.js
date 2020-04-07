$("div").on("click","#cancel",function(){
		if(confirm("입력하신 내용을 잃습니다. 취소 하시겠습니까?")){
			$("#writeBox").css("border","0 solid white");
			$("#writeBox").slideUp();
			$("#writeBox").empty();
		}else{
			return false;
		}
	});