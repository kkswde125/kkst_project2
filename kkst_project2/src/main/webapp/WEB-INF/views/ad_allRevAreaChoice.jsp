<%@page import="com.pro.kkst.dtos.AddrDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%
	@SuppressWarnings("unchecked")
	List<AddrDto> lists = (List<AddrDto>)request.getAttribute("addrList");
%>
</head>
<body>
<script type="text/javascript">
	function movePage(area){
		location.href="ad_reviewAll.do?area="+area;
	}
</script>
		<%
			for (int i = 0; i < lists.size(); i++) {
		%>
		<input type="button"
			value="<%=lists.get(i).getSi()%> <%=lists.get(i).getGu()%>" onclick="movePage('<%=lists.get(i).getGu()%>')">
		<%
			if ((i + 1) % 5 == 0) {
		%>
		<br />
		<%
		}
	}
%>
</body>
</html>