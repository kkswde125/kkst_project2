<%@page import="com.pro.kkst.dtos.MenuzDto"%>
<%@page import="java.util.List"%>
<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
%>
<%@page import="com.pro.kkst.dtos.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>recommend_menu.jsp</title>
<script type="text/javascript">
	var menuIndex=0;
	var keepMenuNames = [];
	var hateMenuCodes = [];
	
	function choiceThis(cate) {
		location.href= "us_reslist.do?cate="+cate;
	}
		
	function keepThis(name) {
		keepMenuNames.push(name);
		menuIndex++;
		$('table').hide();
		$('#tables'+menuIndex).show();
// 		alert(keepMenuNames.toString());
		
	}
	
	function hateThis(code) {
		hateMenuCodes.push(code);
		menuIndex++;
		$('table').hide();
		$('#tables'+menuIndex).show();
// 		alert(hateMenuCodes.toString());
	}
	
	$(function() {
		$('table').hide();
		$('#tables'+menuIndex).show();
	});
</script>
</head>
<%
	LoginDto ldto =(LoginDto)request.getSession().getAttribute("ldto");
	if(ldto==null){
		pageContext.forward("ac_login.do");
	}
	@SuppressWarnings("unchecked")
	List<MenuzDto> list=(List<MenuzDto>)request.getAttribute("list");
%>
<body>
<%
	for(int i = 0; i < list.size(); i++){
		
	
%>
<table id="tables<%=i%>">
	<tr>
		<td>음식사진</td>
	</tr>
	<tr>
		<td><%=list.get(i).getName() %></td>
	</tr>
	<tr>
		<td>
			<button onclick="choiceThis('<%=(list.get(i).getCode()).substring(0, 1)%>')">결정!</button>
			<button onclick="keepThis('<%=list.get(i).getName()%>')">보류하고 다음메뉴보기</button>
			<button onclick="hateThis('<%=list.get(i).getCode()%>')">이건 싫음</button>
		</td>
	</tr>
</table>
	<%
	}
	%>
	
<%
	for(int i = 0; i < list.size(); i++){
		%>
			<p>
				<span>
					<a href="us_reslist.do?cate=<%=(list.get(i).getCode()).substring(0, 1)%>">
						<%=list.get(i).getName()%>(<%=Math.round(list.get(i).getStarz())%>)
					</a>
				</span>
				<input type="button" value="안선택"/>
			</p>
		<%
	}
%>
<button onclick="location.href='us_usermain.do'">뒤로</button>
</body>
</html>