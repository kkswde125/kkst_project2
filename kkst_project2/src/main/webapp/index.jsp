<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
<style type="text/css">

	*{
		margin: 0;
		padding: 0;
		font : bold 20pt "나눔스퀘어라운드 BOLD";
		
	}


   #all{
      width : 600px;
      height: 170px;
      margin : 0 auto;
      padding-right: 20px;
      padding-top : 5%;
   }
   
   button{
   		height:100px;
   		width: 300px;
   }

</style>
</head>
<body>
	<div id="all">
	<table style="text-align: center;">
	<tr>
	<td><img style="text-align:center;" src="img/Logo.jpg"></td>
	</tr>
	
	
	<tr>
	
	<td>
	<div class="ui buttons">
	 
	  <button class="ui button" onclick="location.href='ow_loginhome.do'">LOGIN점주  </button>
								
	<div class="or" data-text="OR"></div>
	
	<button  class="ui button" onclick="location.href='us_loginhome.do'">LOGIN 회원</button>
							
	</div>
	</td>
	</tr>
	<tr></tr>
	<tr>
	<td colspan="2"><button class="ui gray basic button" style="height:50px; width: 604px;" onclick="location.href='ac_beforeRegist.do'"> Join-Us </button></td>
	</tr>
	
	</table>
	</div>
	
	</body>
</html>