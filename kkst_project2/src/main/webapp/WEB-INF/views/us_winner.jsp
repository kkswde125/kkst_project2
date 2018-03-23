<%@page import="com.pro.kkst.dtos.MenuzDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function choiceThis(cate, seq, mName) {
		location.href = "us_reslist.do?cate="+cate+"&seq="+seq+"&mName="+mName;
	}
</script>
<title>최종 결과!</title>
<% @SuppressWarnings("unchecked")
List<MenuzDto> lists1 = (List<MenuzDto>)request.getAttribute("lists1"); 
%>
</head>
<body>

<h1>따란 이거나 쳐먹어라ㅗ</h1>
<img alt="<%=lists1.get(0).getName()%>" src="resources/upload/<%=lists1.get(0).getChange()%>" style="width: 500px; height: 500px;">

<h1><%=lists1.get(0).getName() %></h1>

<button onclick="location.href='us_user.do'" >메인으로</button>

<button onclick="choiceThis('<%=lists1.get(0).getCode().substring(0, 1) %>','<%=lists1.get(0).getSeq() %>','<%=lists1.get(0).getName() %>')" >해당 메뉴의 식당을 추천</button>
</body>
</html>