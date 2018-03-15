<%@page import="com.pro.kkst.dtos.WatchaDto"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.kkst.dtos.LoginDto"%>
<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	LoginDto ldto =(LoginDto)request.getSession().getAttribute("ldto");
	if(ldto==null){
		pageContext.forward("ac_login.do");
	}
	@SuppressWarnings("unchecked")
	List<WatchaDto> list= (List<WatchaDto>)request.getAttribute("list");
	
%>
<body>
<form action="us_getstars.do" method="post">
<%
	for(int i = 0; i < list.size(); i++){
		%>
			<p><img alt="<%=list.get(i).getName()%>" src="resources/upload/<%=list.get(i).getChange()%>" style="width: 500px; height: 500px;"></p>
			<p><%=list.get(i).getName()%><p>
			<input type="range" min="1" max="100" name="stars"/><br/>
			<input type="hidden" name="codes" value="<%=list.get(i).getCode()%>"/>
			<hr/>
		<%
	}
%>
<button type="submit">ok</button>
</form>
</body>
</html>