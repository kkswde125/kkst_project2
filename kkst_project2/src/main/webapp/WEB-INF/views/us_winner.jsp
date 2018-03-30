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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function choiceThis(cate, seq, mName) {
		location.href = "us_reslist.do?cate="+cate+"&seq="+seq+"&mName="+mName;
	}
</script>
<style type="text/css">
#all{
padding-top:1%;
width: 1300px;
height: 600px;
margin : 0 auto;
text-align: center;
}
.imgs{
border-radius: 50px;
}
</style>
<title>최종 결과!</title>
<% 
@SuppressWarnings("unchecked")
List<MenuzDto> lists1 = (List<MenuzDto>)request.getAttribute("lists1"); 
%>
</head>
<body>
<div id="all">
<h1>FOOD OLYMPIC WINNER!</h1>
<img class="imgs" alt="<%=lists1.get(0).getName()%>" src="resources/upload/<%=lists1.get(0).getChange()%>" style="width: 700px; height: 500px;">

<h1><%=lists1.get(0).getName() %></h1>

<button class="btn btn-default" onclick="location.href='us_usermain.do'" >메인으로</button>

<button class="btn btn-primary" onclick="choiceThis('<%=lists1.get(0).getCode().substring(0, 1) %>','<%=lists1.get(0).getSeq() %>','<%=lists1.get(0).getName() %>')" >해당 메뉴의 식당을 추천</button>
</div>
</body>
</html>