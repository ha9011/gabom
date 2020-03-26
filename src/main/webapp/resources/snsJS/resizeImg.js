function resizeImg(osrc){
				let make="";
				make+='<div><img src="'+osrc+'" onclick="closeImgBox()"/></div>';
				$(".imgBox").html(make);
				$(".imgBox").fadeIn();
		}
	function closeImgBox() {
		$(".imgBox").fadeOut();
	}