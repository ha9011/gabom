	function commentEdit(number,commentNumber) {
		var contentsVal="#commentContents"+commentNumber;
		var commentEditVal="#contentsVal"+commentNumber;
		let showComment=$(contentsVal).html();
		showComment=showComment.split("<br>").join("\r\n");
		var htmlString='<div id="commentEditTot">';
		htmlString+='<textarea class="form-control" aria-describedby="basic-addon1" rows="7" cols="70"'; 
		htmlString+='style="resize: none;" id="contentsVal'+commentNumber+'">'+showComment+'</textarea>';
		htmlString+='<div class="pull-right">';
		htmlString+='<button class="btn btn-default" type="button" id=commentEdit style="font-weight: bold;">수정</button>';
		htmlString+='<button class="btn btn-default" type="button" id=commentEditCancel style="font-weight: bold;">취소</button>';
		htmlString+='</div></div>';
		$(contentsVal).html(htmlString);
		$("#commentEdit").on("click",function(){
			let editcomment=$(commentEditVal).val();
				editcomment=editcomment.replace(/(?:\r\n|\r|\n)/g, '<br/>');
				commentEditAjax(editcomment);		
		});
		$("#commentEditCancel").on("click",function(){
			if(confirm("취소 하시겠습니까?")){
				let commentEd=$(commentEditVal).prop("defaultValue");
				console.log("hu",commentEd);
				commentEd=commentEd.split("<br/>").join("\r\n");
				$(contentsVal).html(commentEd);
				$("#commentEditTot").empty();
			}
		});
		function commentEditAjax(data) {
			$.ajaxSetup({
				beforeSend : function(xhr){
		 		xhr.setRequestHeader(header,token);}
			});//먼저 보냄
			let commentEditData={
					"data":data,
					"commentNumber":commentNumber
			}
			$.ajax({
					method:'post',
					url:"sns/comment/edit",
					data:commentEditData,
					dataType : "json"
			}).done((commentEditJson)=>{
				$(contentsVal).html(commentEditJson.content);
				$("#commentEditTot").empty();
			});
		} 
	}