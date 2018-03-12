<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8");%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> ㅈ같은 다솔이가 만든! 식당등록페이지에요~</title>
</head>
<body>
<!-- 사진 올라갈곳 -->

<form action="picture">
<div style="border: 1px solid; width: 300px; height: 200px;">
<input type="submit" value="사진등록" />
</div>
</form>

<!-- 입력 부분 -->
<table border="1">

<tr>
	<th>식당명</th>
	<td><input type="text" name="name" required="required" /></td>
</tr>
<tr>
	<th>업종</th>
	<td>
	
	<select name="cate">
		<option value="한식">
		<option value="중식">
		<option value="일식">
		<option value="양식">
		<option value="횟집">
		<option value="분식">
		<option value="냉면집">
		<option value="인도,태국">
		<option value="치킨">
		<option value="식육(숯불구이)">
		<option value="보신용">
	</select>
	</td>
</tr>
<tr>
	<th>주소</th>
	<td><input type="text" name="addr" required="required" /></td>
</tr>

	<tr>
		<th>영업시간</th>
		<td>
		<!-- 영업시간 -->
			<select name="S_hour">
				<c:forEach begin="0" end="23" var="i">
				<option value="${i}">
				</c:forEach>
			</select> : 
			<select name="S_min">
				<c:forEach begin="0" end="59" var="i">
				<option value="${i}">
				</c:forEach>
			</select>
			~
			<select name="E_hour">
				<c:forEach begin="0" end="23" var="i">
				<option value="${i}">
				</c:forEach>
			</select> : 
			<select name="E_min">
				<c:forEach begin="0" end="59" var="i">
				<option value="${i}">
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th>휴식시간</th>
		<td>
				<!-- 휴식시간 -->	
			<select name="Rs_hour">
				<c:forEach begin="0" end="23" var="i">
				<option value="${i}">
				</c:forEach>
			</select> : 
			<select name="Rs_min">
				<c:forEach begin="0" end="59" var="i">
				<option value="${i}">
				</c:forEach>
			</select>
			~
			<select name="Re_hour">
				<c:forEach begin="0" end="23" var="i">
				<option value="${i}">
				</c:forEach>
			</select> : 
			<select name="Re_min">
				<c:forEach begin="0" end="59" var="i">
				<option value="${i}">
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
	<td>
	<input type="text" value="- 를 포함하여 입력해주세요" required="required" />
	</td>
	</tr>

	<tr>
		<th>주차가능여부</th>
		<td>
			<select name="parking">
				<option value="가능">
				<option value="불가능">
			</select>
		</td>
	</tr>


</table>


</body>
</html>