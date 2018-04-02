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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
	$(function(){
		$(".imgTr").hide();
	});
	
	function openImg(num){
		$("#img"+num).slideDown();
		$(".imgTr").not("#img"+num).slideUp();
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
		height: 400px;
		display: block;
		
	}
	#resImg{
		width: 700px;
		height: 500px;
		display: block;
	}
	
	#menu{
		width: 650px;
		text-align: center;
		margin : 0 auto;
	}
	
	th{
		text-align: center;
		vertical-align: middle;
		font : bold 13pt "나눔스퀘어라운드 BOLD";
	}
	
	.title{
		font : bold 25pt "나눔스퀘어 EXTRABOLD";
		padding : 15px;
	}
</style>
</head>

<body>
<div id="all">
<table class="ui table">
<tr>
	<th class="title">식당 대표 사진</th>
	
</tr>
	<tr>
		<td>
			<img src="resources/Resimg/<%=photo.getChange() %>" id="resImg">
		</td>
	</tr>
	<tr>
	<th class="title">등록된 메뉴</th>
	</tr><tr><td style="text-align: center;">메뉴 이름을 클릭<img src="resources/images/mouse.png" style="width: 25px; height: 25px; display: inline-block; margin-top:-10px;">하세요!</td></tr>
	
	<tr>
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
					<td>
						<a onclick="openImg(<%=i%>)"><%=list.get(i).getName()%></a>
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
				<tr>
					<td colspan ="6">
						<img src="resources/Resimg/<%=list.get(i).getChange() %>" class="imgTr" id="img<%=i%>">
					</td>
				</tr>
				<%} %>
			</table>
		</td>
	</tr>
	<tr>
		<td style="text-align: right;">
		<div class="ui button" onclick="location.href='ad_restList.do?snum=1&cnum=10'">
			돌아가기
		</div>
		</td>
	</tr>
</table>
</div>

</body>
</html>