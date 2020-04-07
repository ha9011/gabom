var asideRow=1;
	$("#snsProfileName").on("click",function(){
		asideRead();
	});
		function asideRead() {
			$.ajaxSetup({
				beforeSend : function(xhr){
		 		xhr.setRequestHeader(header,token);}
			});//먼저 보냄
			$.ajax({
					method:'post',
					url:"sns/mypost",
					data:{"row":asideRow},
					dataType : "json"
			}).done((myPostJson)=>{
				makeTimeLineProfile(userId);
				makeTimeLine(myPostJson);
				$("#more").css("display","none");
				$("#friendMore").css("display", "none");
				$("#myPostMore").css("display", "block");
				for(let k in myPostJson){
					if(myPostJson[k]["max"]==myPostJson[k]["rowNum"]){
						$("#myPostMore").css("display", "none");
						asideRow=1;
					}
				}
			});
		}
		$("#myPostMore").click(function() {
			asideRow++;
			asideRead();
		});