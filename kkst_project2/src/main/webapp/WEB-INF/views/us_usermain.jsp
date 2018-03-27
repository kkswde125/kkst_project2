<%@page import="com.pro.kkst.dtos.TasteDto"%>
<%@page import="java.util.List"%>
<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
%>
<%String msg=(String)request.getAttribute("msg"); %>
<%@page import="com.pro.kkst.dtos.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		padding-top:10%;
		width: 600px;
		margin : 0 auto;
	}
	img:hover{
		cursor: pointer;
		opacity: 0.5;
	}
	img{
		width: 200px;
		height: 200px;
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
<a href="ac_logout.do">Logout</a>
<table>
<col width="202px"><col width="202px">
<%
	if(isS.equals("yes")){
		%>
	<tr>
		<td><img alt="내정보" src="resources/images/main_mypage.jpg" title="내정보" onclick="location.href='us_show_taste.do'"></td>
		<td><img alt="메뉴추천" src="resources/images/main_menu.jpg" title="메뉴추천" onclick="location.href='us_recommend_menu.do?start=1&end=20'"></td>
	</tr>
	<tr>
		<td><img alt="푸드올림픽" src="resources/images/main_food.jpg" title="푸드올림픽" onclick="location.href='us_olympic.do'"></td>
		<td><img alt="내입맛통계" src="resources/images/main_graph.jpg" title="내입맛통계" onclick="location.href='us_my_stats.do'"></td>
	</tr>
	<tr>
		<td><span>임시공간</span>
			<a href="us_show_taste.do">내입맛보기</a>
			<a href="us_regist_moreTaste.do">추가입맛설정</a>
			<a href="us_bubble.do">버블</a>
		</td>
	</tr>
		<%
	}else{
		%>
	<tr>
		<td><img alt="내정보" src="resources/images/main_mypage.jpg" title="내정보" onclick="location.href='us_show_taste.do'"></td>
		<td><img alt="초기입맛등록" src="resources/images/main_menu.jpg" title="초기입맛등록" onclick="location.href='us_regist_taste_watcha.do'"></td>
	</tr>
		<%
	}
%>
</table>
</div>
</body>
</html>

