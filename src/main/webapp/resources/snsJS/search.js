let searchPostRow=1;
	let searchFriendRow=1;
	function search(searchData) {
	$.ajaxSetup({
		beforeSend : function(xhr){
 		xhr.setRequestHeader(header,token);}
	});//먼저 보냄
	let searchTotData={
			"searchData":searchData,
			"postRow":searchPostRow,
			"friendRow":searchFriendRow
	}
	$.ajax({
			method:'post',
			url:"sns/search",
			data:searchTotData,
			dataType : "json"
	}).done((searchJson)=>{
		$("#searchText").val("");
		makeSearchList(searchJson,searchData);
		for(let k in searchJson["publicPost"]){
			if(searchJson["publicPost"][k]["max"]==searchJson["publicPost"][k]["row"]){
				$("#postMoreBtn").css("display","none");
				searchPostRow=1;
			}
		}
		for(let k in searchJson["friendList"]){
			if(searchJson["friendList"][k]["max"]==searchJson["friendList"][k]["row"]){
				$("#friendMoreBtn").css("display","none");
				searchFriendRow=1;
			}
		}
		
	});
	}
	function friendMoreBtn(data){
		searchFriendRow++;
		search(data);
	}
	function postMoreBtn(data) {
		searchPostRow++;
		search(data);
	}