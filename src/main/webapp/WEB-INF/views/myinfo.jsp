<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	<div id=mainsection>
		
		<div id="profileArea">
			<div id="picArea">
				<img src="./resources/loginimage/a.png" /><br>
				<button id="profileChangeBtn">프로필변경</button>
			</div>
			
			<div id="etcArea">
				<div id="chargeMoney">
				현재 금액 : <span></span> <button>충전하기</button>
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
</html>