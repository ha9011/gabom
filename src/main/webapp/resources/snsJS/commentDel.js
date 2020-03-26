function commentDel(postNum,commentNum) {
			if(confirm("삭제 하시겠습니까?")){
				$.ajaxSetup({
					beforeSend : function(xhr){
			 		xhr.setRequestHeader(header,token);}
				});//먼저 보냄
				let commentDelData={
						"postNum":postNum,
						"commentNum":commentNum
				}
				$.ajax({
						method:'post',
						url:"sns/comment/delete",
						data:commentDelData,
						dataType : "json"
				}).done((commentDelJson)=>{
					let commentRowNum="#commentRowBox"+commentNum;
					$(commentRowNum).remove();
					let commentCnt="#snsComment"+postNum;
					let cnt=$(commentCnt).text();
					let cnt2=cnt.substr(6);
					let cnt3=cnt2.split(")")[0];
					let cnt4=parseInt(cnt3);
					$(commentCnt).text("댓글 보기("+(cnt4-1)+")");
				});
			}
		}	