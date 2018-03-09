<%@page import="com.pro.kkst.dtos.MenuzDto"%>
<%@page import="java.util.List"%>
<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
%>
<%@page import="com.pro.kkst.dtos.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>recommend_menu.jsp</title>
</head>
<%
	LoginDto ldto =(LoginDto)request.getSession().getAttribute("ldto");
	if(ldto==null){
		pageContext.forward("ac_login.do");
	}
	@SuppressWarnings("unchecked")

	List<MenuzDto> list=(List<MenuzDto>)request.getAttribute("list");
%>
<body>
<%
	for(int i = 0; i < list.size(); i++){
		%>
		<p><%=list.get(i).getName()%>(<%=Math.round(list.get(i).getStarz())%>)</p>
		<%
	}
%>
<button onclick="location.href='us_usermain.do'">뒤로</button>
</body>
</html>