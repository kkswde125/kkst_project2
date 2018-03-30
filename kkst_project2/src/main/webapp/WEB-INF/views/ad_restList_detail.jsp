<%@page import="com.pro.kkst.dtos.PhotoDto"%>
<%@page import="com.pro.kkst.dtos.ResInfoDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<% 
	List<ResInfoDto> list = (List<ResInfoDto>)request.getAttribute("list"); 
	PhotoDto photo = (PhotoDto)request.getAttribute("photo");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js">
	
	$(function(){
		for (var i = 0; i < <%=list.size()%>; i++) {
			$("#imgBlock"+i).hide();
		}
		
	})
	
	function open(i){
		$("#imgBlock"+i).slideToggle();
		
	}
	
</script>
<title>식당 검토 > 상세보기</title>
<style type="text/css">
	*{
		margin : 0;
		padding : 0;
	}
	
	#all{
		width: 600px;
		margin : 0 auto;	
	}
	
	img{
		width: 600px;
	}
	
	#menu{
		width: 550px;
		text-align: center;
		margin : 0 auto;
	}
	
	th{
		text-align: center;
		vertical-align: middle;
		font : bold 15pt "나눔스퀘어라운드 BOLD";
	}
</style>
</head>

<body>
<div id="all">
<table class="ui table">
<tr>
	<th>식당 대표 사진</th>
	
</tr>
	<tr>
		<td>
			<img src="resources/Resimg/<%=photo.getChange() %>">
		</td>
	</tr>
	<tr>
	<th>등록된 메뉴</th>
	</tr><tr>
		<td>
			<table id="menu">
				<tr>
					<th>메뉴이름</th>
					<th>주재료</th>
					<th>조리방식</th>
					<th>매움정도</th>
					<th>온도</th>
					<th>가격</th>
				</tr>
				<%for(int i = 0; i < list.size() ; i++){ %>
				<tr>
					<td onclick="open(<%=i%>)">
						<%=list.get(i).getName() %>
					</td>
					<td>
						<%=list.get(i).getBase() %>
					</td>
					<td>
						<%=list.get(i).getCook() %>
					</td>
					<td>
						<%=list.get(i).getSpicy() %>
					</td>
					<td>
						<%=list.get(i).getTemp() %>
					</td>
					<td>
						<%=list.get(i).getPrice() %>
					</td>
				</tr>
				<tr id="imgBlock<%=i %>">
					<td colspan ="6">
						<img src="resources/upload/<%=list.get(i).getChange() %>">
					</td>
				</tr>
				<%} %>
			</table>
		</td>
	</tr>
</table>
</div>

</body>
</html>