	function editPost(e) {
		var editPostNumber=e.id.substr(12);
		var editPostBoxId="#editBox"+editPostNumber;
		const preContents="#postContents"+editPostNumber;
		//첫값
		$editTotalBox=$("<div>").addClass("container editBtnBox");
		$editBox=$("<div>").addClass("collapse navbar-collapse")
		.append("<ul>").addClass("nav navbar-nav navbar-right");
		$editButton=$("<li>").append($("<button>").addClass("editButton").text("수정"));
		$cancelButton=$("<li>").append($("<button>").addClass("editCancelButton").text("취소"));
		$editBox.append($editButton);
		$editBox.append($cancelButton);
		$editBox.appendTo($editTotalBox);
		$(editPostBoxId).html($editTotalBox);
		//바뀐값
		var editContents=e.value;

		editContents = editContents.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		
	$("li").on("click",".editCancelButton",function(){
		console.log($(preContents));
		if(confirm("수정을 취소 하시겠습니까?")){
			$(preContents)[0].value=$(preContents)[0].defaultValue;
			$(editPostBoxId).empty();
		}
	});
	$("li").on("click",".editButton",function(){
		$.ajaxSetup({
			beforeSend : function(xhr){
	 		xhr.setRequestHeader(header,token);}
		});//먼저 보냄
		var editData={
				"editContents":editContents,
				"postNumber": editPostNumber
			}
		$.ajax({
				method:'post',
				url:"sns/post/edit",
				data:editData,
				dataType : "json"
			}).done((editTimeLineJson)=>{
				let edC=editTimeLineJson.editContent;
				let tot=edC.split("<br/>").join("\r\n");
				$(preContents)[0].defaultValue=tot;
				$(editPostBoxId).empty();
				$('.info').text(editTimeLineJson.message)
   	         	.fadeIn(400).delay(1000).fadeOut(400);
				makeEdit(editTimeLineJson.editContent,preContents);
			}).fail((s)=>{
				console.log("실패");
			});
		});
	}
	function makeEdit(val,boxId) {
		let valE=val.split("<br/>").join("\r\n");
		$(boxId).val(valE);
	}