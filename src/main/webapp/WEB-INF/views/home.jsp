<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src=https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.slim.min.js></script>
	<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
	
<style>
section {
  position: relative;
  background-color: black;
  height: 75vh;
  min-height: 25rem;
  width: 100%;
  overflow: hidden;
}

section video {
  position: absolute;
  top: 50%;
  left: 50%;
  min-width: 100%;
  min-height: 100%;
  width: auto;
  height: auto;
  z-index: 0;
  -ms-transform: translateX(-50%) translateY(-50%);
  -moz-transform: translateX(-50%) translateY(-50%);
  -webkit-transform: translateX(-50%) translateY(-50%);
  transform: translateX(-50%) translateY(-50%);
}
.display-3{
	font-size:100px;
	letter-spacing:50px;
}
section .container {
  color:white;
  position: relative;
  margin-top:15%;
  margin-left:22%;
  z-index: 2;
}

section .overlay {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  S
  opacity: 0.5;
  z-index: 1;
}

@media (pointer: coarse) and (hover: none) {
  section {
    background: url('./resources/css/background.mp4') no-repeat center center scroll;
  }
  section video {
    display: none;
  }
}

</style>
</head>


<body>
<header>
<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
</header>







<%-- <div>
	<jsp:include page="/WEB-INF/views/homesearch.jsp" />
</div> --%>

<section>
<div class="overlay"></div>
  <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
    <source src="./resources/css/background.mp4" type="video/mp4">
  </video>
  <div class="container h-100">
    <div class="d-flex h-100 text-center align-items-center">
      <div class="w-100 text-white">
        <h1 class="display-3">GABOM</h1>
        <p class="lead mb-0"></p>
      </div>
    </div>
  </div>
</section>

 <div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</div> 
</body>
</html>
