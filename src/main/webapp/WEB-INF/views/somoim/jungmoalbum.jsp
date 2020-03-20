<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
.repleTitleFrame{
	display : flex;
	justify-content: space-between;
}
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

} 
#repleinsrt{
display:flex;
margin:10px; 
}
#reple_content{
margin:0 10px;
width:70%;
}
#likearea{
display:flex;
height:20%;
}
#reple{
margin: 30px 0;
 
}
button{
margin: 0 5px;
}


</style>
         <div id="title">
             <div>
             <h1 class="font-weight-light text-lg " id="name">소모임 이름 Gallery</h1>         
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
         
               <table id="imgarea"></table>
            <!-- 이미지 들어감. -->


<!-- Modal -->

<div class="modal fade" id="imgmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <div class="modal-title" id="exampleModalLongTitle"></div>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body2">
            
            <div id="modalimg"></div>
            <div id="likearea">
            
               <img id="piclikebtn" width='5%' height='5%' src="">&nbsp;&nbsp;&nbsp;<span id="likecnt"></span> 명이 이 글을 좋아합니다
            
            </div>
            <div id="repleinsrt">
            </div>
            <div id="pic_replelist">
               <div id="reple">
               </div>
            </div>
            
            
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
         </div>
      </div>
   </div>
</div>


<!-- modal end -->
            
            
<script>
//댓글 리스트 보여주는 메소드
const repleShowList = (data) =>{
	   
	   for( i of data){
        var reple_id = $('<div class="repleTitleFrame"><a href="#">'+i.reply_id+'님의 댓글</a></div>');
        var reply_content =$('<div id="replecontent'+i.reply_number+'" class="picreply_content">'+i.reply_content+'</div>')
        var reply_modiInput =$('<input id="repleinput'+i.reply_number+'" style="display:none;" class="picreply_modiInput">') // type="hidden" 
        var reple_date =$('<div>'+i.reply_date+'</div>');
        
        $("#reple").append(reple_id);//아이디 
        $("#reple").append(reply_content);//컨텐츠
        $("#reple").append(reply_modiInput);//컨텐츠
        $("#reple").append(reple_date);//입력날짜
        
        
        
        if(i.reply_id == myinfo.member_name){
           //$(".picreply_content").empty();
           //$(".picreply_content").append('<input style="width:80% ;height:100%" id="picreply_content" value="'+i.reply_content+'">');
           var modibtn = $("<div style='display:inline-block'></div>")
           $("<button data-replenum ='"+ i.reply_number+"' data-photonum ='"+i.photo_number+"'></button").attr("class","btn btn-warning btnDelete")
                 .text("삭제").appendTo(modibtn);
           $("<button data-replenum ='"+ i.reply_number+"' data-photonum ='"+i.photo_number+"' data-replenum ='"+ i.reply_number+"'></button").attr("class","btn btn-info btnModify")
                 .text("수정").appendTo(modibtn);
           $("<button style='display:none' data-replenum ='"+ i.reply_number+"' data-photonum ='"+i.photo_number+"' data-replenum ='"+ i.reply_number+"'></button").attr("class","btn btn-info btnModiCancel")
           .text("취소").appendTo(modibtn);
           $("<button style='display:none' data-replenum ='"+ i.reply_number+"' data-photonum ='"+i.photo_number+"' data-replenum ='"+ i.reply_number+"'></button").attr("class","btn btn-info btnModiConfirm")
           .text("확정").appendTo(modibtn);
           
           reple_id.append(modibtn)
         
        } 
     }
}








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
              
                $("#imgarea").empty();
                
                
                let index = 1;
                let tr = $("<tr></tr>")
                for(let i of data ){
                   
                    
                	
                	
                	var img
            		if(mysomoimInfo==null){
            			img = $('<td><a class="pic" name="'+i.photo_number+'"  data-toggle="modal" > <img   class="img-fluid img-thumbnail" src=".'+i.photo_sysfile+'"></a></td>');
            		}else if(mysomoimInfo.member_status == 1){  // 0 - 대기, 1 - 승인, 2 - 탈퇴회면
            			img = $('<td><a class="pic" name="'+i.photo_number+'"  href="#imgmodal"  data-toggle="modal" > <img   class="img-fluid img-thumbnail" src=".'+i.photo_sysfile+'"></a></td>');
            		}else{
            			img = $('<td><a class="pic" name="'+i.photo_number+'"  data-toggle="modal" > <img   class="img-fluid img-thumbnail" src=".'+i.photo_sysfile+'"></a></td>');
            		}
                	
                	
                	
                	
                	
                	tr.append(img);
                	console.log("index : "+index);
                   $("#imgarea").append(tr);
                   
               if(index%3===0){
                  tr = $("<tr></tr>")
               }
                   
               index++;                
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
   
   
//--------------------------------------------------------------------------------------------------------------사진 불러오기  끝  
   
   // 엘범 누르면 사진이 나옴
var myinfo=${JsonMysomoimInfo};

const showalbumlist = ()=>{
   
   console.log("기본정보",${JsonBasicInfo})
   
   //var myinfo=${JsonMemberList};
   console.log("회원",myinfo)
   
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
         $("#imgarea").empty();
         console.log(data);
         
         
         let index = 1;
         let tr = $("<tr></tr>")
         
         for(let i of data ){
            
        		var img
        		if(mysomoimInfo==null){
        			img = $('<td><a class="pic" name="'+i.photo_number+'"  data-toggle="modal" > <img   class="img-fluid img-thumbnail" src=".'+i.photo_sysfile+'"></a></td>');
        		}else if(mysomoimInfo.member_status == 1){  // 0 - 대기, 1 - 승인, 2 - 탈퇴회면
        			img = $('<td><a class="pic" name="'+i.photo_number+'"  href="#imgmodal"  data-toggle="modal" > <img   class="img-fluid img-thumbnail" src=".'+i.photo_sysfile+'"></a></td>');
        		}else{
        			img = $('<td><a class="pic" name="'+i.photo_number+'"  data-toggle="modal" > <img   class="img-fluid img-thumbnail" src=".'+i.photo_sysfile+'"></a></td>');
        		}
        	 
        	 
        	 tr.append(img);
         	console.log("index : "+index);
            $("#imgarea").append(tr);
            
            if(index % 3===0){
               tr = $("<tr></tr>")
            }
            
            index++;                

         }
      },
      error:function(error){
         alert("fail")
         console.log(error);
      }
      
   }) //ajax end
}
//---------------------------------------------------------------------------------------------------------------------------------------사진첩에서 처음 불러올때    
 //사진 클릭시 모달 생성  
 
 
$(document).on('click',".pic", function() {
    
   console.log("클릭한 사진번호"+$(this).attr("name"));
   
   var imgnum= $(this).attr("name");
    console.log(imgnum);
   
   
   $.ajax({
        url: "showimginfo",
         type: 'post',
         data : {"num":imgnum},
         dataType: "json", //rest 컨트롤 이용   
         success:function(data){
         console.dir(data);
           
           $("#exampleModalLongTitle").empty();
           $("#modalimg").empty();//이미지 지움
           $("#likecnt").empty();//좋아요 수 지움
           $("#repleinsrt").empty();//댓글 입력란 지움
           $("#reple").empty();//댓글 지움
           $("#user_id").empty();//유저이름 지움
           
          //내가 좋아요 하냐 안하냐에 따라 변경 
          if(data.mylike == 1){  // 좋아요
        	  $("#piclikebtn").attr('src','../resources/somoimboard/like.PNG');
        	  $("#piclikebtn")[0].dataset.like='1';
        	  $("#piclikebtn")[0].dataset.photonum=data.photo_number;
          }else{ //싫어요
        	  $("#piclikebtn").attr('src','../resources/somoimboard/unlike.PNG');
        	  $("#piclikebtn")[0].dataset.like='0';
        	  $("#piclikebtn")[0].dataset.photonum=data.photo_number;
          }
           
          //console.log(data.photo_sysfile);
          var pic_name= $('<h1>'+data.photo_orifile+'</h1>'); 
          $("#exampleModalLongTitle").append(pic_name);//사진 이름
           
          var img = $("<img width='100%' height='100%' src='."+data.photo_sysfile+"'>")
          $("#modalimg").append(img);//사진 먼저 넣고
          
          var likecnt = $('<h5>'+data.splike+'</h5>');
          $("#likecnt").append(likecnt);//좋아요 수 넣고
          
          var user_id =$('<div id="user_id"><h5>'+myinfo.member_name+'</h5></div>');
          var insertreple = $('<input id="reple_content" name="reple_content" type="text">');
          var insertreplebtn = $('<button id="repleinsert_btn"  class="btn btn-primary" data-somonum ="'+somoim.somoim_number+'"  data-reply_id ="'+myinfo.member_name+'" data-photonum ="'+data.photo_number+'">등록</button>');
          
          console.log(myinfo.member_name);
          console.log(data.photo_number);
          
          $("#repleinsrt").append(user_id);//유저이름
          $("#repleinsrt").append(insertreple);//댓글 입력창
          $("#repleinsrt").append(insertreplebtn);//댓글 등록버튼
          
          
          //댓글 리스트 출력
          
         
          
          console.log("사진 클릭시 ======== " +myinfo.member_name )
          console.log(myinfo)
          console.log(data.reply_id)
          console.log(data)
          
          repleShowList(data.spreple);
          
           
         },
         error:function(error){
            alert("fail")
            console.log(error);
         }
      
   })//ajax end -----------------------------------------------------------------------------------------------------------------------
})  

   $(document).on('click',"#btnDelete", function(e) {
      var reply_number = e.target.dataset.replenum
      var photo_number = e.target.dataset.photonum
      
      console.log(reply_number,photo_number);
      var data = {
               "reply_number" : reply_number,
               "photo_number" : photo_number
               
            } 
      console.log(data);
      console.log(e.target.dataset.replenum);

      $.ajaxSetup({         
            beforeSend : function(xhr){
               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
            });
      
      $.ajax({
         
           url: "deletereple",
            type: 'post',
            data :data,
            dataType: "json", //rest 컨트롤 이용   
            success:function(data){
               alert("댓글이 삭제되었습니다.");
               
               $("#reple").empty();//댓글 지움
               console.log(data);
               //댓글 리스트 출력
               repleShowList(data);
               
            },
            
            error:function(error){
               alert("댓글이 삭제를 실패했습니다.");
                  console.log(error);
               }
         
         
      });//ajax 끝
   })//삭제 끝--------------------------------------------------------------------------------------------------------------------------


//댓글 넣기
   $(document).on('click',"#repleinsert_btn", function(e) {
      var reply_id = e.target.dataset.reply_id
      var photo_number = e.target.dataset.photonum
      var reply_content=$("#reple_content").val();
      var somoim_number = e.target.dataset.somonum
      console.log(reply_id,photo_number,reple_content,somoim_number);
      
      var data = {
               "reply_id" : reply_id,
               "photo_number" : photo_number,
               "reply_content" : reply_content,
               "somoim_number" : somoim_number
            } 
      
      console.log("댓글 저장할 데이터  : ",data);
      //console.log(e.target.dataset.replenum);
      
	$.ajaxSetup({         
      beforeSend : function(xhr){
         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
      });
      
      $.ajax({
         
           url: "insertpicreple",
            type: 'post',
            data :data,
            dataType: "json", //rest 컨트롤 이용   
            success:function(data){
               $("#reple_content").val("");
               $("#reple").empty();//댓글 지움
               console.log(data);
               
               //댓글 리스트 출력
               repleShowList(data);
               
            },
            
            error:function(error){
               alert("댓글이 입력을 실패했습니다.");
                  console.log(error);
               }
         
         
      });//ajax 끝
   })//댓글 입력 끝--------------------------------------------------------------------------------------------------------------------------------------------
   
   //좋아요 구현 
   
   
   //$(document).on('click','#piclikebtn', function () {
   //})
   
   
   
   
   
   //좋아요 버튼 누를 때
   $('#piclikebtn').on('click', function(e){
	   var likestatus = e.target.dataset.like;
	   var photonum = e.target.dataset.photonum;

	   console.log(likestatus)
	   var status 
	   if(likestatus==0){  // 없는 상태니깐 
		   $("#piclikebtn").attr('src','../resources/somoimboard/like.PNG');
	     	  $("#piclikebtn")[0].dataset.like='1';
	     	  status = 1;
	   }else{
		   $("#piclikebtn").attr('src','../resources/somoimboard/unlike.PNG');
	     	  $("#piclikebtn")[0].dataset.like='0';
	     	 status = 0;
	   }
	   
	   
	   var data = {
			   "status" : status,
			   "photonum" : photonum,
			   "somoimNum" : ${JsonBasicInfo}.somoim_number
	   }
	   
	   console.log("좋아요 버튼 :",data)
	   $.ajaxSetup({         
	         beforeSend : function(xhr){
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	         });
	   
    $.ajax({
       
         url: "photolike",
          type: 'post',
          data :data,
          dataType: "json", //rest 컨트롤 이용   
          success:function(data){
             //alert("like 성공")
             console.log(data);
             console.dir($("#likecnt")[0].children[0])
             $($("#likecnt")[0].children[0]).text(data.splike);
            // console.log(data.splike);
          },
          
          error:function(error){
             alert("댓글이 수정을 실패했습니다.");
                console.log(error);
          }
       
       
    });//ajax 끝
	   
	   
   })
   
   
   //수정 버튼 누를 때
   $(document).on('click', '.btnModify', function(e){
	  console.log("수정 버튼")
	  console.dir(e.currentTarget.parentElement.parentElement.nextSibling.textContent)  //내용임..
	  var repleNumber = e.target.dataset.replenum
	  var originContent = $("#replecontent"+repleNumber).text();//e.currentTarget.parentElement.parentElement.nextSibling.textContent;
	   console.log("댓글 번호 : " + repleNumber);
	   console.log("원래 내용 : " + originContent);
	   
	   $(e.currentTarget).hide();
	   $(e.currentTarget.parentNode.children[2]).show();
	   $(e.currentTarget.parentNode.children[3]).show();
	   
	   
	   $("#repleinput"+repleNumber).show();
	   $("#repleinput"+repleNumber).val(originContent);
	   $("#replecontent"+repleNumber).hide();
   })
   
   //수정 버튼 누를 때
   $(document).on('click', '.btnModiCancel', function(e){
	  console.log("수정 취소 버튼")
	  var repleNumber = e.target.dataset.replenum
	  var originContent = $("#replecontent"+repleNumber).text();//e.currentTarget.parentElement.parentElement.nextSibling.textContent;
	   
	  $(e.currentTarget.parentNode.children[1]).show();
	   $(e.currentTarget.parentNode.children[2]).hide();
	   $(e.currentTarget.parentNode.children[3]).hide();
	   
	   
	   $("#repleinput"+repleNumber).hide();
	   $("#repleinput"+repleNumber).val("");
	   $("#replecontent"+repleNumber).show();
   })
   
   //수정 확정 누를 때
   $(document).on('click', '.btnModiConfirm', function(e){
	  console.log("수정 확정 버튼")
	  
	  var repleNumber = e.target.dataset.replenum
	  var newContent = $("#repleinput"+repleNumber).val();
	  console.log("=====확정===")
	  console.log(repleNumber)
	   console.log(newContent)
	   
	   $(e.currentTarget.parentNode.children[1]).show();
	   $(e.currentTarget.parentNode.children[2]).hide();
	   $(e.currentTarget.parentNode.children[3]).hide();
	   
	   
	   $("#repleinput"+repleNumber).hide();
	   $("#repleinput"+repleNumber).val("");
	   $("#replecontent"+repleNumber).text(newContent);
	   $("#replecontent"+repleNumber).show();
	   
	   
	   var data = {
               "reply_content" : newContent,
               "reply_number" : repleNumber,          
  	 	} 
	   
      console.log(data);

	   $.ajaxSetup({         
	         beforeSend : function(xhr){
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	         });
	   
      $.ajax({
         
           url: "modifypicreple",
            type: 'post',
            data :data,
            dataType: "json", //rest 컨트롤 이용   
            success:function(data){
               //$("#reple_content").val("");
               //$("#reple").empty();//댓글 지움
               //console.log(data);
               alert("댓글이 수정되었습니다.");
               //댓글 리스트 출력
               //repleShowList(data);  
            },
            
            error:function(error){
               alert("댓글이 수정을 실패했습니다.");
                  console.log(error);
               }
         
         
      });//ajax 끝
   })
   
   
   
   
  
   
   
   
   
   
   
   
   
   
   
   
   
   
   
 // 모달 클릭이벤트 
   
 // 처음 사진
  </script>