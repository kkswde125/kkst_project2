<%@page import="com.pro.kkst.dtos.ResDto"%>
<%@page import="com.pro.kkst.dtos.AttrJoinDto"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.kkst.dtos.menuDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<% 
	@SuppressWarnings("unchecked")
	List<menuDto> mDto=(List<menuDto>)request.getAttribute("mDto"); 
	@SuppressWarnings("unchecked")
	List<AttrJoinDto> Attr1 = (List<AttrJoinDto>) request.getAttribute("Attr1");
	@SuppressWarnings("unchecked")
	List<AttrJoinDto> Attr2 = (List<AttrJoinDto>) request.getAttribute("Attr2");
	@SuppressWarnings("unchecked")
	List<AttrJoinDto> Attr3 = (List<AttrJoinDto>) request.getAttribute("Attr3");
	@SuppressWarnings("unchecked")
	List<AttrJoinDto> Attr4 = (List<AttrJoinDto>) request.getAttribute("Attr4"); 
%>
<% String msg = (String)request.getAttribute("msg"); %>
<% ResDto rDto=(ResDto)request.getSession().getAttribute("rDto");%>
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
<table border="1" style="text-align: center; width: 800px; height: 300px;">
	<caption> 회원님의 식당은 <%=rDto.getCate()%> 입니다.</caption>
	<tr>
		<td>&nbsp;&nbsp;</td>
		<td>순위</td>
		<td>내용</td>
		<td>Code</td>
	</tr>
	
	<tr>
		<th>주재료</th>
		<td><%=Attr1.get(0).getRk() %></td>
		<td><%=Attr1.get(0).getAttr()%></td>
		<td><%=Attr1.get(0).getCode()%></td>
	</tr>
	
	<tr>
		<th>조리방식</th>
		<td><%=Attr2.get(0).getRk() %></td>
		<td><%=Attr2.get(0).getAttr()%></td>
		<td><%=Attr2.get(0).getCode()%></td>
	</tr>
	
		<tr>
		<th>매움정도</th>
		<td><%=Attr3.get(0).getRk() %></td>
		<td><%=Attr3.get(0).getAttr()%></td>
		<td><%=Attr3.get(0).getCode()%></td>
	</tr>
		<tr>
		<th>온도</th>
		<td><%=Attr4.get(0).getRk() %></td>
		<td><%=Attr4.get(0).getAttr()%></td>
		<td><%=Attr4.get(0).getCode()%></td>
	</tr>

</table>
<input type="button" value="이전"  onclick="location.href='ow_owner.do'" />

<%
}else if(mDto.size()>0){
	%>
	<h2><%=mDto.size()%>개의 추천 메뉴</h2>
	
	<div>
	<c:forEach items="${mDto}" var="mDto">
	<p>${mDto.name}</p>	
	</c:forEach>
	</div>
	
	<table border="1" style="text-align: center; width: 800px; height: 300px;">
	<caption> 회원님의 식당은 <%=rDto.getCate()%> 입니다.</caption>
	<tr>
		<td>&nbsp;&nbsp;</td>
		<td>순위</td>
		<td>내용</td>
		<td>Code</td>
	</tr>

	<tr>
		<th>주재료</th>
		<td><%=Attr1.get(0).getRk()%></td>
		<td><%=Attr1.get(0).getAttr()%></td>
		<td><%=Attr1.get(0).getCode()%></td>
	</tr>
	
	<tr>
		<th>조리방식</th>
		<td><%=Attr2.get(0).getRk() %></td>
		<td><%=Attr2.get(0).getAttr()%></td>
		<td><%=Attr2.get(0).getCode()%></td>
	</tr>
	
		<tr>
		<th>매움정도</th>
		<td><%=Attr3.get(0).getRk() %></td>
		<td><%=Attr3.get(0).getAttr()%></td>
		<td><%=Attr3.get(0).getCode()%></td>
	</tr>
		<tr>
		<th>온도</th>
		<td><%=Attr4.get(0).getRk() %></td>
		<td><%=Attr4.get(0).getAttr()%></td>
		<td><%=Attr4.get(0).getCode()%></td>
	</tr>

</table>
<input type="button" value="이전"  onclick="location.href='ow_owner.do'" />

	<%
}
%>



</body>
</html>