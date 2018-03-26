<%@page import="com.pro.kkst.dtos.AddrDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<%
	@SuppressWarnings("unchecked")
	List<AddrDto> lists = (List<AddrDto>)request.getAttribute("addrList");
%>

<title>Insert title here</title>

<style type="text/css">
	*{
		margin : 0;
		padding : 0;
	}
	.ui{
		width: 200px;
		height: 50px;
		margin : 3px !important;
	}
	#box{
		width: 1100px;
		height: 300px;
		margin : 0 auto;
		padding-top: 5%;
	}
	th{
		text-align : center;
		font : bold 30pt "나눔스퀘어라운드 BOLD";
	}
	img{
	margin : 0 auto;
		width : 450px;
	}
	#top{
		width : 450px;
		margin: 0 auto;
	}

</style>
</head>

<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
<body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		var msg = '<%=(String)request.getAttribute("msg")%>';
		if(msg=='null'){
			return false;
		}else{
			alert(msg);
		}
		})

	function movePage(area){
		location.href="ad_reviewDetail.do?area="+area;
	}
</script>
<div id = "box">
<div id="top">
<img src="img/Logo.jpg" onclick="location.href='ad_admin.do'"/>
</div>
<table>
<tr>
		<%
			for (int i = 0; i < lists.size(); i++) {
		%>
		<td>
		<input type="button" class="ui button"
			value="<%=lists.get(i).getSi()%> <%=lists.get(i).getGu()%>" onclick="movePage('<%=lists.get(i).getGu()%>')">
			</td>
		<%
			if ((i + 1) % 5 == 0) {
		%>
		</tr><tr>
		<%
		}
	}
%>
</tr>
<tr>
	<td colspan="4"></td>
	<td><input type="button" class="ui button" value="돌아가기" onclick="location.href='ad_reviewChoice.do'"/></td>
</tr>
</table>

</div>
</body>
</html>