<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>

body {margin: 10px}
#btnbox{
float:right;
}

.where {
  display: block;
  margin: 25px 15px;
  font-size: 11px;
  color: #000;
  text-decoration: none;
  font-family: verdana;
  font-style: italic;
} 

.filebox input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

.filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #0080FF;
    cursor: pointer;
    border: 1px solid #0080FF;
    border-bottom-color: #0080FF;
    border-radius: .25em;
    margin-top:10px;
}

/* named upload */
.filebox .upload-name {
  display: inline-block;
  padding: .5em .75em;
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  border: 1px solid #0080FF;
  border-bottom-color: #0080FF;
  border-radius: .25em;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}

.filebox.bs3-primary label {
  color: #fff;
    background-color: #0080FF;
    border-color: #0080FF;
}
#upload_btn{
   display: inline-block;
    padding: .5em .75em;
    color: white;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #0080FF;
    cursor: pointer;
    border: 1px solid #0080FF;
    border-bottom-color: #0080FF;
    border-radius: .25em;
    margin-top:2px;
}
#title{
text-align: center;
margin:30px 0;
margin-bottom:100px;
}
#imgarea{
display:inline-flex;
} 
</style>
			<div id="title">
			 	<div>
				 <h1 class="font-weight-light text-lg ">소모임 이름 Gallery</h1>			
				</div>
               <form  id="uploadimg" name="uploadimg" method="post" enctype="multipart/form-data"> 
                     <div id="btnbox" class="filebox bs3-primary">
                            <input class="upload-name" value="파일선택" disabled="disabled">
                            <label for="ex_filename">사진선택</label>
                          <input name="somoimimg" type="file" id="ex_filename" class="upload-hidden" multiple>
                          <button id="upload_btn">사진 등록</button>
                        </div>
               </form>
			</div>
			<!-- title, button end -->
			
               <div id="imgarea"></div>
   			<!-- 이미지 들어감. -->


<!-- Modal -->
<div class="modal fade" id="imgmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				
				<div id="modalimg"></div>
				
				
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>


<!-- modal end -->
   			
   			
<script>
$(".upload-name").hide();
   $("#ex_filename").on('click', function() {
      $(".upload-name").show();
   })
   

    var somoim = ${JsonBasicInfo};
   console.log("소모임 번호 보여줘",somoim.somoim_number);
   // 클릭시 발생
   $("#upload_btn").on('click', function(e) {
      e.preventDefault();
       console.log("사진저장하러감.");
       
       var formData = new FormData(document.getElementById("uploadimg"));//폼에 담음.
          formData.append("somo_number",somoim.somoim_number);
       
        $.ajaxSetup({         
            beforeSend : function(xhr){
               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
            });//먼저 보냄
            
           $.ajax({
              url:'somoimalbum',
             type:'post',
             data:formData,
             processData:false,
             contentType:false,  //제이슨 아니니깐 까보지마!!
              dataType:"json", //rest 컨트롤 이용   
             success:function(data){
                alert("사진 업로드 완료");
                console.log(data)
              
                for(i of data ){
                   var img = $('<div><img src="../'+[i.photo_sysfile]+'"></div>');
                   $("#imgarea").append(img);
                }
                
             },
             error:function(error){
                alert("사진 업로드 실패")
                console.log(error);
             }
           })//ajax 끝
       
   }) //클릭 이벤트 끝 

//사진
   $(document).ready(function(){
        var fileTarget = $('.filebox .upload-hidden');

          fileTarget.on('change', function(){
              if(window.FileReader){
                  var filename = $(this)[0].files[0].name;
              } else {
                  var filename = $(this).val().split('/').pop().split('\\').pop();
              }

              $(this).siblings('.upload-name').val(filename);
          });
      }); 
   
   
   
   
   // 엘범 누르면 사진이 나옴
const showalbumlist = ()=>{
   
   console.log("기본정보",${JsonBasicInfo})
   
   var basicInfo =   ${JsonBasicInfo};
   
   var data = {
      "somoim_number" : basicInfo.somoim_number
   }
   
   $.ajaxSetup({         
         beforeSend : function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");} 
   });
   
   $.ajax({
      url: "showsomoimalbum",
      type: 'post',
      data : data,
      dataType: "json", //rest 컨트롤 이용   
      success:function(data){
         
         console.log(data);
         
         let index =0;
         for(let i of data){
        	 if(index%3==0){
     			
     			var br = $('<br><br>');
     			$("#imgarea").append(br);
     		} 
        	 
        	 var out=$('<div class=" col-md-4"></div>');
        	 //var name=$('<a href="#imgmodal" name='+[i.photo_number]+'  data-toggle="modal" class="d-block mb-4 "></a>'); // 클리릭하면 해당 이미지 확대되서 모달창으로 뜸.
        	 var img=$('<img name='+[i.photo_number]+' id="pic" class="img-fluid img-thumbnail" src=".'+[i.photo_sysfile]+'">');
        	 
        	 //name.append(img);
        	 out.append(img);
        	 $("#imgarea").append(out);
        	 
        	 index++;
         }
    
         
      },
      error:function(error){
         alert("fail")
         console.log(error);
      }
      
   }) //ajax end
   
$(document).on('click',"#pic", function() {
	
	console.log("클릭한 사진번호"+$(this).attr("name"));
	
	//$("#modalimg").empty();
	
	var imgnum= $(this).attr("name");
		console.log(imgnum);
	//$("#modalimg").append(imgname);
	
	$.ajax({
		  url: "showimginfo",
	      type: 'post',
	      data : {"num":imgnum},
	      dataType: "json", //rest 컨트롤 이용   
	      success:function(data){
	      
	    	 console.dir(data);
	    	 
	    	 
	    	 
	      },
	      error:function(error){
	         alert("fail")
	         console.log(error);
	      }
		
	})//ajax end
});

}


</script>      
   