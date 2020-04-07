//글쓰기칸 만드는 작업
	$("#snsWirte").click(function (){
		makewriteBox();
	$(".filebox label").hover(function () {
		$(".filebox label").html('<i class="fas fa-plus fa-2x"></i>');
	},function(){
		$(".filebox label").html('<i class="fas fa-image fa-2x"></i>');
	});
	});
	//글쓰기칸 만드는 함수
	function makewriteBox() {
		$("#writeBox").css("border","2px solid #BDBDBD");
		let photo="";
		photo+='<form name="writeBoxForm" method="post" enctype="multipart/form-data" id="writeBoxForm">';
		photo+='<div class="row" id="wirteBoxR">';
		photo+='<img src='+jsonPicture+' class="img-responsive col-xs-4 col-md-2 col-sm-4 myImage" id="writeProfileImage">';
		photo+='<div class="container col-xs-4 col-md-2 col-sm-4 pull-right security">';
		photo+='<select class="form-control" id="security" name="security">';
		photo+='<option>전체 공개</option>';
		photo+='<option>나만 보기</option>';
		photo+='<option>친구 공개</option>';
		photo+='</select>';
		photo+='</div>';
		photo+='</div>';
		photo+='<div class="input-group" id="writeContents">';
		photo+='<textarea class="form-control" aria-describedby="basic-addon1" rows="7" cols="185" placeholder="무슨 생각을 하고 계신가요?" id="sns_posts_content" name="sns_posts_content"></textarea>';
		photo+='</div>';
		photo+='<div class="row">';
		photo+='<div class="filebox col-xs-4 col-md-2 col-sm-4">';
		photo+='<label for="ex_file"><i class="fas fa-image fa-2x"></i></label>';
		photo+='<input type="file" id="ex_file" multiple="multiple" accept="image/jpeg, image/png, image/gif, image/jpg" name="snsWriteImage">';
		photo+='</div>';
		photo+='<div class="col-xs-8 col-md-10 col-sm-8" id="writeButtonBox" >';
		photo+='<button class="btn btn-Default pull-right" id="cancel">취소</button>';
		photo+='<button type="button" class="btn btn-info pull-right" id="writeButton">작성</button>';
		photo+='<i class="fas fa-smile fa-2x pull-right writeEmo" style="color:gold; background-color:black; border-radius:50%;" onclick="emogi(\'1\',\'write\')"></i>';
		photo+='</div>';
		photo+='</div>';
		photo+='<div id="writeBoxEmo">';
		photo+='</div>';
		photo+='<div id="coverBox">';
		photo+='</div>';
		photo+='</form>';
		$("#writeBox").html(photo);
		$("#writeBox").hide();
		$("#writeBox").slideDown();
	}