<%@page import="com.pro.kkst.dtos.AttrJoinDto"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.kkst.dtos.menuDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<% menuDto mDto=(menuDto)request.getAttribute("mDto"); %>
<% List<AttrJoinDto> Attr1 = (List<AttrJoinDto>) request.getAttribute("Attr1"); %>
<% List<AttrJoinDto> Attr2 = (List<AttrJoinDto>) request.getAttribute("Attr2"); %>
<% List<AttrJoinDto> Attr3 = (List<AttrJoinDto>) request.getAttribute("Attr3"); %>
<% List<AttrJoinDto> Attr4 = (List<AttrJoinDto>) request.getAttribute("Attr4"); %>
<% String msg = (String)request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
if(mDto==null){
	%>

<h1><%=msg%></h1>
<table>
	<tr>
		<th>조리방식</th>
		<td></td>
	</tr>

</table>

<%
}
%>



</body>
</html>