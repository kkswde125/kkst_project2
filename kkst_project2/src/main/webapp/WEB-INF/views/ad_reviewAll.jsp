<%@page import="com.pro.kkst.dtos.ReviewDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
<style type="text/css">
	#scroll{
		width : 1200px;
		overflow: auto;
	}
</style>
</head>
<%
	@SuppressWarnings("unchecked")
	List<ReviewDto> lists = (List<ReviewDto>)request.getAttribute("reviewList");
%>
<body>
<h1>전체 리뷰 목록</h1>
<div id="scroll">
<table border ="1">
	<thead>
		<tr>
		<td colspan="${reviewList.size()}">식당 이름 </td>
		</tr><tr>
			<%
			for(int i = 0; i < lists.size() ; i++){
		%>
				<td>
					<table border ="1">
						<tr>
							<td><%=lists.get(i).getRegdate() %></td>
							<td>
								<input type="checkbox" name="chk" value="<%=lists.get(i).getSeq()%>}"/>
							</td>
						</tr>
						<tr>
							<td colspan="2" >
								<textarea rows="10" cols="60" readonly="readonly"><%=lists.get(i).getContent() %></textarea>
							</td>
						</tr>
						<tr>
							<td>
								추천 수 : <%=lists.get(i).getLikey()==null?"0":(lists.get(i).getLikey().split(",").length) %>
								신고 수 : <%=lists.get(i).getReport()==null?"0":(lists.get(i).getReport().split(",").length) %>
							</td>
						</tr>
					</table>
				</td>
			<%
			}
			%>
		</tr>
	</thead>
</table>
</div>
</body>
</html>