function resizeImg(osrc){
	 var img=new Image();
	  img.src=osrc;
	  var img_width=100;
	  var win_width=img.width+25;
	  var img_height=img.height;
	  var win=img.height+30;
	  var OpenWindow=window.open('','_blank', 'width='+1330+', height='+780+', menubars=no, scrollbars=auto');
	  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+osrc+"' width='"+1330+"' height='"+780+"' onclick='window.close()'>");
		}
	function closeImgBox() {
		$(".imgBox").fadeOut();
	}