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

	.ui.animated.fade.button{
		width: 180px;
		height: 50px;
		padding : 0;
		margin : 3px !important;
		display : table-cell;
		text-align: center;
		vertical-align: middle;
	}
	.ui.button{
		width: 180px;
		height: 50px;
	}
	.visible.content{
	margin-left : 15px;
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
	#tabDiv{
	width : 950px;
		margin : 0 auto;
	}

</style>
</head>


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
<div id="line">
<div id = "box">
<div id="top">
<img src="img/Logo.jpg" onclick="location.href='ad_admin.do'"/>
</div>
<div id="tabDiv">
<table>
<tr>
		<%
			for (int i = 0; i < lists.size(); i++) {
		%>
		<td>
<!-- 		<input type="button" class="ui button" -->
<%-- 			value="<%=lists.get(i).getSi()%> <%=lists.get(i).getGu()%>" onclick="movePage('<%=lists.get(i).getGu()%>')"> --%>

			<div class="ui animated fade button" tabindex="0" onclick="movePage('<%=lists.get(i).getGu()%>')">
			<div class="visible content"><%=lists.get(i).getSi()%> <%=lists.get(i).getGu()%></div>
			<div class="hidden content">바로가기</div>
		</div>
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
</div>
</div>
</body>
</html>