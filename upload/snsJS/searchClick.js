function enterSearch() {
		let searchData=$("#searchText").val();
		 if(searchData==""){
    		 $('.info').text("내용을 입력하세요").fadeIn(400).delay(1000).fadeOut(400);
    		 return false;
    	 }
		 search(searchData);
	}
	 $("#searchBtn").click(function() {
		 var searchData=$("#searchText").val();
		 if(searchData==""){
    		 $('.info').text("내용을 입력하세요").fadeIn(400).delay(1000).fadeOut(400);
    		 return false;
    	 }
		 search(searchData);
	});