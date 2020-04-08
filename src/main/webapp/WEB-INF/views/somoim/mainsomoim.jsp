<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- 여기부터 추가된 css -->
<link href="../resources/css/owl.carousel.css" rel="stylesheet">
<link href="../resources/css/owl.theme.default.min.css" rel="stylesheet">
<link href="../resources/css/animate.css" rel="stylesheet">
<link href="../resources/css/style.css" rel="stylesheet">

<meta charset="UTF-8">
<title>소모임 메인</title>
</head>
<style>
.section-title{
    width: 1500px;
    margin-left: -200px;
}
:root {
    --accent: #3abade;;
    --border-width: 6px;
    --border-radius: 55px;
    --font-size: 30px;
}

.container {
    perspective: 800px;
}

.toggle {
    position: relative;
    border: solid var(--border-width) var(--accent);
    border-radius: var(--border-radius);
    transition: transform cubic-bezier(0, 0, 0.30, 2) .4s;
    transform-style: preserve-3d;
    perspective: 800px;
}

.toggle>input[type="radio"] {
    display: none;
}

.toggle>#somoimMenu:checked~#flap {
    transform: rotateY(-180deg);
}

.toggle>#somoimMenu:checked~#flap>.content {
    transform: rotateY(-180deg);
}

.toggle>#mySomoimMenu:checked~#flap {
    transform: rotateY(0deg);
}

.toggle>label {
    display: inline-block;
    min-width: 170px;
    padding: 30px;
    font-size: var(--font-size);
    text-align: center;
    color: var(--accent);
    cursor: pointer;
}

.toggle>label,
.toggle>#flap {
    font-weight: bold;
    text-transform: capitalize;
}

.toggle>#flap {
    position: absolute;
    top: calc( 0px - var(--border-width));
    left: 50%;
    height: calc(100% + var(--border-width) * 2);
    width: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: var(--font-size);
    background-color: #3abade;
    border-top-right-radius: var(--border-radius);
    border-bottom-right-radius: var(--border-radius);
    transform-style: preserve-3d;
    transform-origin: left;
    transition: transform cubic-bezier(0.4, 0, 0.2, 1) .5s;
}

.toggle>#flap>.content {
    color: #333;
    transition: transform 0s linear .25s;
    transform-style: preserve-3d;
}
/* 검색창 */
#searchinput {
	width: 200px;
	height: 50px;
	font-size: 20px;
}

#searchinput2 {
	width: 200px;
	height: 50px;
	font-size: 20px;
	margin-left: 20px;
}

#searchSomoimBtn {
	width: 200px;
	height: 50px;
	font-size: 20px;
	margin-left:20px;
	color:white;
}

.outform {
	margin: 0 15%;
}
#searchFrm{
display:flex;
}
.contentFrame{
display: flex;
}

/* 여기부터 기존에 있던 css */
#somoim {
   display: none;
}

#main {
   width: 90%;
   border: 1px solid gray;
   height: 1000px;
   margin: 20px;
}

#menunav {
   height: 40px;
   text-align: center;
}

.menu {
   width: 200px;
   margin: 100px 200px 0 200px;
}
.contentFrameInner{
   font-weight: bold;
}

.section {
   border: 1px solid gray;
   width: 30%;
   margin: 100px;
}

#content {
   flex-direction: row;
   justify-content: center;
   display: flex;
}

.title {
   margin: 20px;
}

.showlist {
   overflow: auto;
   padding: 5px;
   width: 100%;
   height: 500px;
   margin: 0 15px;
}

#showlistContent {
   height: 90%;
   width: 100%;
}
#showNotilistContent{
   height: 90%;
   width: 100%;

}
#makeSomoim {
   margin-top: 5px;
   width: 100%;
}

.makeSomoim {
   width: 100%;
}

.mymoimFrame {
   border-bottom: 1px solid lightgray;
   margin: 3px 0 3px 0;
   display: flex;
}

.contentFrame {
   width: 60%;
   height: 90%;
   margin: auto 10px;
}

.contentFrameInner {
   margin: 10px;
}
</style>
<body>

   <header>
      <jsp:include page="/WEB-INF/views/header/somoimheader.jsp" />
   </header>

<header>
		<div class="container-fluid">
			<div class="item">
				<div class="owl-slider-item">
					<img style="height:670px;width:100%;" src="../resources/css/somobg.jpg"
						class="img-responsive" alt="portfolio">
					<div class="intro-text">
						<div class="intro-lead-in"></div>
						<div class="intro-heading">당신에게 맞는 소모임을 <br>찾아보세요!</div>
						<div class="intro-heading">
							<form  id="searchFrm">
								<div style="width:900px;" class="outform">
									<div style="display: flex;width:100%">
										<input type="text" id="searchinput"
											class="searchinput form-control" name="address"
											placeholder="address"> <input id="searchinput2"
											type="text" class="searchinput form-control" name="hobby"
											placeholder="hobby">
											<button style="background-color:#3abade;" type="button" id="searchSomoimBtn"
											class="btn btn-block btn-lg">Search</button>
									</div>
								</div>
							</form>
						</div>
						<div class="container">

        <form class="toggle" style="width:500px;margin-left:200px;">

            <input type="radio" id="somoimMenu" name="choice" value="creative">
            <label for="somoimMenu">소모임</label>

            <input type="radio" id="mySomoimMenu" name="choice" value="productive">
            <label for="mySomoimMenu">내모임</label>

            <div id="flap"><span class="content">productive</span></div>

        </form>

    </div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- 소모임 검색결과 보여주는거   평소에는 숨겨두고 버튼 이벤트-->
	<section id="srcre" class="light-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h2>검색결과</h2>
						<div id="searchList"></div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 추천 소모임 보여주는거  -->
	<section id="ccsomo" class="light-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h2>추천 소모임</h2>
						<div id="showRecommandListContent"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- mymoim  -->
	<section id="mainMymoim" class="light-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h2>내모임</h2>
						<div id="content">
							<div id="showlistContent"></div>
						 	<div class="showlist" id="showNotilistContent"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
<script type="text/javascript">
   var notilist = ${jsonSbNotiList}
   console.log("notilist",notilist)

   //showNotilistContent id 여기다 가 추가
    for( v of notilist){
       var mymoimFrame = $("<div class='mymoimFrame' data-roomnumber='"+v.somoim_number +"'></div>");
      
      var imageFrame = $("<div class='imageFrame mymoimcont'><div><img width='100px' height='100px' src='"+v.somoim_sys_mainpicture+"' >  </div> </div>");
      
      var contentFrame =  $("<div class='contentFrame mymoimcont'></div>");
      
      var contentUp ;
      var type = v.board_type == 'noti' ? '공지' : '정모';
      contentUp = $("<div class='contentFrameInner'> <div><span>새로운 ["+type+"]가 게시되었습니다.</span> </div>  </div>")
      
      
      var contentdown = $("<div class='contentFrameInner'>"+v.somoim_name +"</div>")
      
      contentFrame.append(contentUp)
      contentFrame.append(contentdown)
      
      mymoimFrame.append(imageFrame)
      mymoimFrame.append(contentFrame)
      
      $("#showNotilistContent").append(mymoimFrame)
    }
   
   $("#srcre").hide();
   $("#searchSomoimBtn").on("click",function(){
	   $("#srcre").show();
      var formData = new FormData(document.getElementById("searchFrm"));
      console.log(formData.get("address"))
      console.log(formData.get("hobby"))
      console.log("길이")
      console.log(formData.get("address").length ===0);

      console.log(formData.get("hobby").length===0);
      console.log(formData.get("address").length == 0 && formData.get("hobby") == 0)
      
      if((formData.get("address").length == 0) && (formData.get("hobby") == 0)){
         console.log("검색결과없음")
         
      }else{
         $.ajaxSetup({         
               beforeSend : function(xhr){
                  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
               });//먼저 보냄
               
            $.ajax({
               url:'searchSomoim',
               type:'post',
               data:formData,
               processData:false,
               contentType:false,  //제이슨 아니니깐 까보지마!!
                dataType:"json", //rest 컨트롤 이용   
               success:function(data){
                  console.log(data)
                  $("#searchList").empty();
                  for( v of data ){
                     console.log(v);
                     var mymoimFrame = $("<div class='mymoimFrame' data-roomnumber='"+v.somoim_number +"'></div>");
                     
                     var imageFrame = $("<div class='imageFrame mymoimcont'><div><img width='100px' height='100px' src='"+v.somoim_sys_mainpicture+"' >  </div> </div>");
                     
                     var contentFrame =  $("<div class='contentFrame mymoimcont'>  </div>");
                     
                     var contentUp ;
                     
                     contentUp = $("<div class='contentFrameInner'> <div><span>&nbsp&nbsp&nbsp&nbsp"+v.somoim_location+"</span> </div>  </div>")
                     
                     
                     var contentdown = $("<div class='contentFrameInner'>"+v.somoim_name +"</div>")
                     
                     contentFrame.append(contentUp)
                     contentFrame.append(contentdown)
                     
                     mymoimFrame.append(imageFrame)
                     mymoimFrame.append(contentFrame)
                     
                     $("#searchList").append(mymoimFrame)
                     
                  }
                  
               },
               error:function(error){
                  alert("fail")
                  console.log(error);
               }
            })
      }
      
   
      
      
      
      
      
      
      
   })
   
   $("#somoimMenu").on('click',function(){
      $("#somoim").show();
      $("#mainMymoim").hide();
   })
   
   $("#mySomoimMenu").on('click',function(){
      $("#somoim").hide();
      $("#mainMymoim").show();
   })
   
   

   
   var joinmoim = ${joinMoim}
   console.log(joinmoim)
   
   var recommandSmList = ${jsonRecommandSmList};
   console.log(recommandSmList)
   
   //showlistContent
   for( v of joinmoim ){
      console.log(v);
      var mymoimFrame = $("<div class='mymoimFrame' data-roomnumber='"+v.SOMOIM_NUMBER +"'></div>");
      
      var imageFrame = $("<div class='imageFrame mymoimcont'><div><img width='100px' height='100px' src='"+v.SOMOIM_SYS_MAINPICTURE+"' >  </div> </div>");
      
      var contentFrame =  $("<div class='contentFrame mymoimcont'>  </div>");
      
      var contentUp ;
      if(v.MEMBER_GRADE === 0){  //일반회원
         contentUp = $("<div class='contentFrameInner'> <div><img width='22px' height='22px' src='../resources/somoimimage/seed.PNG' art='미정'/> <span>&nbsp&nbsp&nbsp&nbsp"+v.SOMOIM_LOCATION+"</span> </div>  </div>")
      }else if(v.MEMBER_GRADE === 1){ // 매니저
         contentUp = $("<div class='contentFrameInner'> <div><img width='22px' height='22px' src='../resources/somoimimage/flower.PNG' art='미정'/> <span>&nbsp&nbsp&nbsp&nbsp"+v.SOMOIM_LOCATION+"</span> </div>  </div>")
      }else if(v.MEMBER_GRADE === 2){ // 방장
         contentUp = $("<div class='contentFrameInner'> <div><img width='22px' height='22px' src='../resources/somoimimage/crown.PNG' art='미정'/> <span>&nbsp&nbsp&nbsp&nbsp"+v.SOMOIM_LOCATION+"</span> </div>  </div>")
      }
      
      var contentdown = $("<div class='contentFrameInner'>"+v.SOMOIM_NAME +"</div>")
      
      contentFrame.append(contentUp)
      contentFrame.append(contentdown)
      
      mymoimFrame.append(imageFrame)
      mymoimFrame.append(contentFrame)
      
      $("#showlistContent").append(mymoimFrame)
      
   }
   
   for( v of recommandSmList ){
      console.log(v);
      var mymoimFrame = $("<div class='mymoimFrame' data-roomnumber='"+v.somoim_number +"'></div>");
      
      var imageFrame = $("<div class='imageFrame mymoimcont'><div><img width='100px' height='100px' src='"+v.somoim_sys_mainpicture+"' >  </div> </div>");
      
      var contentFrame =  $("<div class='contentFrame mymoimcont'>  </div>");
      
      var contentUp ;
      
      contentUp = $("<div class='contentFrameInner'> <div><span>&nbsp&nbsp&nbsp&nbsp"+v.somoim_location+"</span> </div>  </div>")
      
      
      var contentdown = $("<div class='contentFrameInner'>"+v.somoim_name +"</div>")
      
      contentFrame.append(contentUp)
      contentFrame.append(contentdown)
      
      mymoimFrame.append(imageFrame)
      mymoimFrame.append(contentFrame)
      
      $("#showRecommandListContent").append(mymoimFrame)
      
   }
   
   
   //검색했을때
   $(document).on("click",".mymoimFrame",function(e){
      
      console.log($(this))
      console.log($(this)[0].dataset.roomnumber)
      var room = $(this)[0].dataset.roomnumber;
      var url = "./somoimroom?roomnumber="+room;  
        //window.open(url, "new_window",'location=yes, directories=yes, width=#, height=#'); 
        location.href = url;
   })
   
//---------------------------------------------------------------------------- 버튼 효과
const st = {};

st.flap = document.querySelector('#flap');
st.toggle = document.querySelector('.toggle');

st.somoimMenu = document.querySelector('#somoimMenu');
st.mySomoimMenu = document.querySelector('#mySomoimMenu');

st.flap.addEventListener('transitionend', () => {

    if (st.somoimMenu.checked) {
        st.toggle.style.transform = 'rotateY(-15deg)';
        setTimeout(() => st.toggle.style.transform = '', 400);
    } else {
        st.toggle.style.transform = 'rotateY(15deg)';
        setTimeout(() => st.toggle.style.transform = '', 400);
    }

})

st.clickHandler = (e) => {

    if (e.target.tagName === 'LABEL') {
        setTimeout(() => {
            st.flap.children[0].textContent = e.target.textContent;
        }, 250);
    }
}

document.addEventListener('DOMContentLoaded', () => {
    st.flap.children[0].textContent = st.mySomoimMenu.nextElementSibling.textContent;
});

document.addEventListener('click', (e) => st.clickHandler(e));
   
</script>
</html>