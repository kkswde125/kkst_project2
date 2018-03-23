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
</head>
<% LoginDto ldto =(LoginDto)request.getSession().getAttribute("ldto");
if(ldto==null){
	pageContext.forward("ac_login.do");
}

	String isS=(String)request.getAttribute("hasTaste");
%>
<body>
<a href="ac_logout.do">Logout</a>
<a href="us_olympic.do">푸드올림픽</a>
<%
	if(isS.equals("yes")){
		%>
			<a href="us_recommend_menu.do?start=1&end=20">메뉴추천</a>
			<a href="us_show_taste.do">내입맛보기</a>
			<a href="us_regist_moreTaste.do">추가입맛설정</a>
			<a href="us_my_stats.do">내입맛통계</a>
		<%
	}else{
		%>
		<a href="us_regist_taste_watcha.do">초기입맛등록</a>
		<%
	}
%>
</body>
</html>

