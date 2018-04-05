<%@page import="com.pro.kkst.dtos.TasteDto"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.kkst.dtos.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%><%request.setCharacterEncoding("utf-8"); %><%response.setContentType("text/html; charset=utf-8"); %>
<%response.setHeader("Cache-Control","no-store"); response.setHeader("Pragma","no-cache"); response.setHeader("Expires","0");%>
<%String msg=(String)request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
<title>usermain.jsp</title>
<script type="text/javascript">
window.onload=function(){
    if(<%=msg!=null%>){
       alert('<%=msg%>');
    }
 }
</script>
<style type="text/css">
#all{
	padding-top:5%;
	width: 400px;
	margin : 0 auto;
	text-align: center;
}
.imgz:hover{
	cursor: pointer;
	opacity: 0.5;
}
.imgz{
	width: 200px;
	height: 200px;
}
#btnz{
display: inline-block;
margin: 10px auto;
}
#logos{
	width: 400px;
}

</style>
</head>
<% LoginDto ldto =(LoginDto)request.getSession().getAttribute("ldto");
if(ldto==null){
	pageContext.forward("ac_login.do");
}
String isS=(String)request.getAttribute("hasTaste");
%>
<body>
<div id="all">
<img src="img/Logo.jpg" id="logos"/>
<table>
<col width="202px"><col width="202px">
<%if(isS.equals("yes")){%>
	<tr>
		<td><img class="imgz" alt="내정보" src="resources/images/main_mypage.jpg" title="내정보" onclick="location.href='us_myinfoView.do'"></td>
		<td><img class="imgz" alt="메뉴추천" src="resources/images/main_menu.jpg" title="메뉴추천" onclick="location.href='us_recommend_menu.do?start=1&end=20'"></td>
	</tr>
	<tr>
		<td><img class="imgz" alt="푸드올림픽" src="resources/images/main_food.jpg" title="푸드올림픽" onclick="location.href='us_before_olympic.do'"></td>
		<td><img class="imgz" alt="내입맛통계" src="resources/images/main_graph.jpg" title="내입맛통계" onclick="location.href='us_my_stats4.do'"></td>
	</tr>
	
<%}else{%>
	<tr>
		<td><img class="imgz" alt="내정보" src="resources/images/main_mypage.jpg" title="내정보" onclick="location.href='us_myinfoView.do'"></td>
		<td><img class="imgz" alt="초기입맛등록" src="resources/images/firstRegist.jpg" title="초기입맛등록" onclick="location.href='us_regist_taste_watcha.do'"></td>
	</tr>
<%}%>
	<tr>
		<td colspan="2">
<!-- 			<span id="btnz"><button class="btn btn-default" onclick="location.href='ac_logout.do'">로그아웃</button></span> -->
			<div class="ui animated button" tabindex="0" style="width: 400px; height: 40px;"  class="logout" onclick="location.href='ac_logout.do'">
			 <div class="visible content">로그아웃</div>
			  <div class="hidden content">
			<i class="power off icon" style="margin-top : -10px;"></i>
			  </div>
			</div>
		</td>
	</tr>
</table>
</div>
</body>
</html>