<%@page import="com.pro.kkst.dtos.TasteDto"%>
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
<title>usermain.jsp</title>
</head>
<% LoginDto ldto =(LoginDto)request.getSession().getAttribute("ldto");
if(ldto==null){
	pageContext.forward("ac_login.do");
}

@SuppressWarnings("unchecked")
List<TasteDto> list=(List<TasteDto>)request.getAttribute("list");	
%>
<body>
<table>
	<tr>
		<th>타입</th><th>속성</th><th>평점평균</th>
	</tr>
	<%
		if(list==null){
			
		}
		for(int i = 0; i < list.size(); i++){
			%>
				<tr>
				<td><%=list.get(i).getType() %></td>
				<td><%=list.get(i).getAttr() %></td>
				<td><%=list.get(i).getStar() %></td>
				</tr>
			<%
		}
	%>
</table>
</body>
</html>

