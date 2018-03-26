<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="semantic/dist/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
<style type="text/css">
button {
	width: 270px;
	height: 270px;
	font : bold 30pt "나눔스퀘어라운드 EXTRABOLD" !important;
}

p {
	font : bold 15pt "나눔스퀘어라운드 BOLD" !important;
	padding-left: -20px !important;
}

#secter1{
	
	margin:0;
	padding: 0;
	
	padding-top:10px;
	padding-left:23px;
	height:350px;
	width:320px;
	border: 1px solid gray;

}

#secter2{
	
	margin:0;
	padding: 0;
	
	padding-top:10px;
	padding-left:23px;
	height:350px;
	width:320px;
	border: 1px solid gray;

}

   #all{
      width : 600px;
      height: 170px;
      margin : 0 auto;
      padding-right: 20px;
      padding-top : 5%;
   }

</style>
</head>
<body>

<div id="all">
<table>

	<tr>
	<td colspan="2"><img style="text-align:center;" src="img/Logo.jpg"></td>
	</tr>
	
	<tr>
	<td>
	<div id="secter1">
	<button class="ui secondary button" style="border-radius: 50%;" onclick="location.href='ac_ownerRegistPage.do'">회원가입 <br>점주</button>
	<br>
	<br>
	<p style="text-align: center;">당신의 식당을 등록하세요!</p>
	</div>
	</td>
	<td>
	<div id="secter2">
	<button class="ui secondary button" style="border-radius: 50%;" onclick="location.href='ac_registPage.do'">회원가입<br> 유저</button>
	<br>
	<br><p style="text-align: center;">맞춤형 메뉴 추천을 받아보세요 </p>
	</div>
	</td>
	</tr>
</table>
</div>
</body>
</html>