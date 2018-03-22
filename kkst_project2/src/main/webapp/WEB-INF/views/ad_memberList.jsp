<%@page import="com.pro.kkst.dtos.LoginDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function allChk(bool){
		$("input[name=chk]").prop("checked", bool);
	}
</script>

<body>

<%
	@SuppressWarnings("unchecked")
 	List<LoginDto> lists = (List<LoginDto>)request.getAttribute("lists");
%>
<h1>가입 회원 목록</h1>
<form action="ad_memDel.do" method="post">
<table border = "1">
	<thead>
		<tr>
			<td>
				<input type="checkbox" onclick="allChk(this.checked)"/>
			</td>
			<td>ID</td>
			<td>별명</td>
			<td>이름</td>
			<td>성별</td>
			<td>생년월일</td>
			<td>이메일</td>
			<td>탈퇴여부</td>
		</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${empty lists }">
			<tr>
				<td>
					<input type="checkbox" disabled="disabled"/>
				</td>
				<td colspan="7">===== 가입된 회원이 없습니다 =====</td>
			</tr>
		</c:when>
		<c:otherwise>
		<c:forEach items="${lists}" var="dto">
			<tr>
			<td>
				<input type="checkbox" name="chk" value="${dto.seq }"/>
			</td>
			<td>${dto.id }</td>
			<td>${dto.nickName }</td>
			<td>${dto.name }</td>
			<c:choose>
				<c:when test="${dto.sex=='F'}">
					<td>여성</td>
				</c:when>
				<c:otherwise>
					<td>남성</td>
				</c:otherwise>
				</c:choose>
			<td><fmt:formatDate value="${dto.birth }" pattern="yyyy년 MM월 dd일"/> </td>
			<td>${dto.email }</td>
			<c:choose>
				<c:when test="${dto.delFlag=='N'}">
					<td>활동 중</td>
				</c:when>
				<c:otherwise>
					<td>탈퇴</td>
				</c:otherwise>
				</c:choose>
		</tr>
		</c:forEach>
		</c:otherwise>
	</c:choose>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="2">
				<input type="button" value="돌아가기" onclick="location.href='admin.do'"/>
			</td>
			<td colspan="5">
			<% 
			int count = (Integer)request.getAttribute("count");
			int start = (Integer)request.getAttribute("start");
			int end = (Integer)request.getAttribute("end");
			if(end>count){
				end = count;
			}
			
			if(start!=1){
			%>
				<a href="ad_memberList.do?snum=<%=start*10-19 %>&cnum=<%=start*10-10 %>">이전</a>
			<%
			}
			
			for(int i = start-1; i <end ; i++){
			%>
				<a href="ad_memberList.do?snum=<%=i<1?"1":i+"1"%>&cnum=<%=i<1?"10":(i+1)+"0"%>">
				<%=i+1 %>
				</a>
				<%
			}
			if(end!=count){
				%>
			<a href="ad_memberList.do?snum=<%=start+100 %>&cnum=<%=end+99 %>">다음</a>
				<%
			}
				%>
			</td>
			<td>
				<input type="submit" value="강제탈퇴"/>
			</td>
		</tr>
	</tfoot>
</table>
</form>
</body>
</html>