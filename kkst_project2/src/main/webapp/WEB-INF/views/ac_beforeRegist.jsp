<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="semantic/dist/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
<style type="text/css">

	img{
		cursor: pointer;
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
<div id="line">
<div id="all">
<table>

	<tr>
	<td colspan="2"><img style="text-align:center;" src="img/Logo.jpg"></td>
	</tr>
	
	<tr>
	<td>
	<img onclick="location.href='ac_ownerRegistPage.do'" src="img/Before_Register01.jpg" />
	</td>
	<td>
	<img onclick="location.href='ac_registPage.do'" src="img/Before_Register02.jpg" />
	</td>
	</tr>
</table>
</div>
</div>
<hr/>
<jsp:include page="footer.jsp"/>
</body>
</html>