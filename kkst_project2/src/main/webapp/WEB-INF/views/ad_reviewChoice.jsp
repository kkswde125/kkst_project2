<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
		margin : 0;
		padding : 0;
		font : bold 11pt "나눔스퀘어라운드 BOLD";
	}
	button
	#all{
		width : 500px;
		height: 170px;
		margin : 0 auto;
		padding-top : 10%;
	}
	img{
		width: 450px;
	}
	
</style>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
</head>
<body>

<div id="all">
<img src="img/Logo.jpg" onclick="location.href='ad_admin.do'"/>
<div class="ui large buttons">
  <button class="ui button" onclick="location.href='ad_allRevAreaChoice.do'">전체 리뷰 보기</button>
  <div class="or"></div>
  <button class="ui button" onclick="location.href='ad_reportRevAreaChoice.do'">신고된 리뷰 보기</button>
</div>
</div>



</body>
</html>