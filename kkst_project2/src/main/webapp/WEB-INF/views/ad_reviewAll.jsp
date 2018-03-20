<%@page import="com.pro.kkst.dtos.Res_ReviewDto"%>
<%@page import="com.pro.kkst.dtos.ResDto"%>
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
	List<Res_ReviewDto> ReviewList = (List<Res_ReviewDto>)request.getAttribute("reviewList");

	@SuppressWarnings("unchecked")
	List<ResDto> resList = (List<ResDto>)request.getAttribute("resList");
%>
<body>
<h1>전체 리뷰 목록</h1>
	<%
		for(int i = 0; i < resList.size() ; i++){
	%>
<div id="scroll">
<table border ="1">
	<thead>
		<tr>
		<td colspan="${reviewList.size()}"><%=resList.get(i).getName() %> </td>
		</tr><tr>
			<%
			for(int j = 0; j < ReviewList.size() ; j++){
		%>
				<td>
					<table border ="1">
						<tr>
							<td><%=ReviewList.get(j).getRegdate() %></td>
							<td>
								<input type="checkbox" name="chk" value="<%=ReviewList.get(j).getSeq()%>}"/>
							</td>
						</tr>
						<tr>
							<td colspan="2" >
								<textarea rows="10" cols="60" readonly="readonly"><%=ReviewList.get(j).getContent() %></textarea>
							</td>
						</tr>
						<tr>
							<td>
								추천 수 : <%=ReviewList.get(j).getLikey()==null?"0":(ReviewList.get(j).getLikey().split(",").length) %>
								신고 수 : <%=ReviewList.get(j).getReport()==null?"0":(ReviewList.get(j).getReport().split(",").length) %>
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
<%
}
%>
</body>
</html>