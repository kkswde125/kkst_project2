<%@page import="com.pro.kkst.dtos.menuDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>최종 결과!</title>
<% @SuppressWarnings("unchecked")
List<menuDto> lists1 = (List<menuDto>)request.getAttribute("lists1"); 
%>
</head>
<body>

<h1>따란 이거나 쳐먹어라ㅗ</h1>
<img src="img/food0.jpg">

<h1><%=lists1.get(0).getName() %></h1>

<button onclick="location.href='us_user.do'" >메인으로</button>

<button onclick="location.href='us_user.do'" >해당 메뉴의 식당을 추천</button>
</body>
</html>