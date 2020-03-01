<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#profileArea{
	border: 1px solid black;
}

#picArea{
	border: 1px solid black;
	margin: 10px;
	display: inline-block;
	text-align: center;
	
}

#etcArea{
	border: 1px solid black;
	margin: 10px;
	display: inline-block;		
}

#mainContent{
	margin-top : 20px;
	border: 1px solid black;
	display: inline-block;
	width : 100%;
	height: 500px;
}

#mainsection{
	border: 1px solid black;
	display: inline-block;
	
}
#Content{
	margin : 10px;
	border: 1px solid black;
	display: inline-block;
	width : 97%;
	height: 450px;
}
</style>
</head>
<body>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">현재 금액 :</label>
            <input type="text" class="form-control" id="recipient-name" placeholder="충전할 금액을 입력하세요">
          </div>
          
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">충천하기</button>
      </div>
    </div>
  </div>
</div>



	<div id=mainsection>
		
		<div id="profileArea">
			<div id="picArea">
				<img src="./resources/loginimage/a.png" /><br>
				<button id="profileChangeBtn">프로필변경</button>
			</div>
			
			<div id="etcArea">
				<div id="chargeMoney">
				현재 금액 : <span></span> <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">충전하기</button>

				</div>
				
				<div id="personInfo">
				이름 : <span>하동원</span> <br>
				나이 : <span>30</span> <br>
				게시글 : <span>10개</span> <br>
				</div>
				
				<div id="submenu">
					<ul>
						<il>게시글</il>
						<il>댓글</il>
						<il>찜목록</il>
						<il>좋아요</il>
						<il>예약목록</il>
						<il>여행계획</il>
						<il>쿠폰함</il>
					</ul>
				</div>	
			
				
			</div>
		</div>	
	
	
		<div id="mainContent">
			<div id="Content">
				
			</div>
		</div>
	
	</div>

</body>
<script>
	$('.btn btn-primary').on('shown.bs.modal', function () {
	  //ajax로 긁어 오기... 내용돈을, 
	  
	  
	})
</script>
</html>