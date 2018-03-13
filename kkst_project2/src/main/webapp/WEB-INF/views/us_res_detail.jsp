<%@page import="com.pro.kkst.dtos.ResDto"%>
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
		
	ResDto dto = (ResDto)request.getAttribute("dto");
	String cate= (String)request.getAttribute("cate");
	String mName= (String)request.getAttribute("mName");
	String seq= (String)request.getAttribute("seq");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function goBack() {
		location.href="us_reslist.do?cate="+"<%=cate%>"+"&mName"+"<%=mName%>"+"&seq="+"<%=seq%>";
	}
</script>
</head>
<body>
<table>
<tr>
	<th>식당명</th>
	<td><%=dto.getName() %></td>
</tr>
<tr>
	<th>카테고리</th>
	<td><%=dto.getCate() %></td>
</tr>
<tr>
	<th>주소</th>
	<td><%=dto.getAddr() %></td>
</tr>
<tr>
	<th>전화번호</th>
	<td><%=dto.getCall() %></td>
</tr>
<tr>
	<th>영업시작</th>
	<td><%=dto.getStart() %></td>
</tr>
<tr>
	<th>영업종료</th>
	<td><%=dto.getEnd() %></td>
</tr>
<tr>
	<th>휴식시작</th>
	<td><%=dto.getRest_start() %></td>
</tr>
<tr>
	<th>휴식종료</th>
	<td><%=dto.getRest_end() %></td>
</tr>
<tr>
	<th>주차여부</th>
	<td><%=dto.getParking().equals("Y")?"가능":(dto.getParking().equals("U")?"정보없음":"불가") %></td>
</tr>
<tr>
	<th>영업상태</th>
	<td><%=dto.getOpen().equals("Y")?"영업중":"휴업중" %></td>
</tr>
<tr>
	<th>한줄설명</th>
	<td><%=dto.getComment() %></td>
</tr>
</table>
<button onclick="goBack()">돌아가기</button>
</body>
</html>