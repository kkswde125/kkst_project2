<%@page import="com.pro.kkst.dtos.MenuzDto"%>
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
<%
	LoginDto ldto =(LoginDto)request.getSession().getAttribute("ldto");
	if(ldto==null){
		pageContext.forward("ac_login.do");
	}
		
	@SuppressWarnings("unchecked")
	List<MenuzDto> list=(List<MenuzDto>)request.getAttribute("list");
	
	String hateRs=request.getParameter("hateRs");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function choiceThis(cate,seq,mName) {
		location.href= "us_customize_taste.do?cate="+cate+"&seq="+seq+"&mName="+mName+"&hateRs="+hateRs;
	}
</script>
</head>
<body>
<%
	for(int i = 0; i < list.size(); i++){
		
	
%>
<table>
	<tr>
		<td>음식사진</td>
	</tr>
	<tr>
		<td><%=list.get(i).getName() %></td>
	</tr>
	<tr>
		<td>
			<button onclick="choiceThis('<%=(list.get(i).getCode()).substring(0, 1)%>','<%=list.get(i).getSeq()%>','<%=list.get(i).getName()%>')">결정!</button>
		</td>
	</tr>
</table>
	<%
	}
	%>
</body>
</html>