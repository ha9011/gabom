function readURL(input) {
   	 if (input.files.length!=0 && input.files!=undefined) {
    	for(let i=0;i<input.files.length;i++){	
		let $coverBox=$("<div class='cover'>");
		let $imageBox=$('<img class="img-thumbnail img-responsive">');
		$imageBox.appendTo($coverBox);
    	var reader = new FileReader();
    	reader.onload = function (e) {
            $imageBox.attr('src', e.target.result);        //cover src로 붙여지고
        }
      reader.readAsDataURL(input.files[i]);
		$coverBox.appendTo($("#coverBox"));
    	}
   	 }
	}
$("#writeBox").on('change','#ex_file',function(){
    readURL(this);
});	