<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>식당 등록 관리</h1>
<form action="shopChk.do" method="GET">
<table border = "1">
	<tr>
		<td>
			<input type="checkbox" name="chkAll" onclick="allChk(this.checked)"/>
		</td>
		<td>상호명</td>
		<td>업종형태</td>
		<td>전화번호</td>
		<td>주소지</td>
		<td>영업시간</td>
		<td>휴식시간</td>
		<td colspan="2">좌표입력란</td>
	</tr>
	
	<c:choose>
	<c:when test="${empty lists }">
	<tr>
		<td>
			<input type="checkbox" disabled="disabled"/>
		</td>
		<td colspan="8">=== 대기중인 식당이 없습니다 ===</td>
		</tr>
	</c:when>
	<c:otherwise>
	<c:forEach items="${lists}" var="dto">
	<tr>
		<td>
			<input type="checkbox" name="chk" value="${dto.seq }"/>
		</td>
		<td>${dto.name }</td>
		<td>${dto.cate }</td>
		<td>${dto.call }</td>
		<td>${dto.addr }</td>
		<td>${dto.start }~${dto.end }</td>
		<td>${dto.rest_start }~${dto.rest_end }</td>
		<td>
			<input type="text" value="X 좌표" name="x">
		</td>
		<td>
			<input type="text" value="Y 좌표" name="y">
		</td>
	</tr>
	
	</c:forEach>
	</c:otherwise>
	</c:choose>
<tr><td colspan = "9">
<table id="page" border="1">
<tr>
	<td>

		<% 
		int count = (Integer)request.getAttribute("count");
		
		for(int i=0; i < count; i++){
		%>          
	<a href='ad_restList.do?snum=<%=i<1?"1":i+"1"%>&cnum=<%=i<1?"10":(i+1)+"0"%>'>
	<%=%>
	 </a>
<%
	}
%>
	</td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</body>
</html>