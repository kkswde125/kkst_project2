<%@page import="com.pro.kkst.dtos.ResDto"%>
<%@page import="com.pro.kkst.dtos.Res_ReviewDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>Review -Detail Area</title>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}

	.scroll{
		width: 1200px;
		overflow: auto;
		margin : 0 auto;
	}
</style>

<%
@SuppressWarnings("unchecked")
List<Res_ReviewDto> ReviewList = (List<Res_ReviewDto>)request.getAttribute("reviewList");

@SuppressWarnings("unchecked")
List<ResDto> resList = (List<ResDto>)request.getAttribute("resList");
%>
</head>
<body>

<% for(int i = 0; i < ReviewList.size() ; i++){ 
/* 	if() */
%>
<div class="scroll">	<!-- Scroll을 넣기위한 Block -->
	<table border="1">	<!-- 지역 식당 별 구분 테이블 -->
		<thead>
			<tr><td colspan="<%=ReviewList.size()%>"><%=resList.get(i).getName() %></td></tr>
		</thead>
		<tbody>
		<tr>
		<% for(int j = 0; j < ReviewList.size() ; j++){ 
			if(resList.get(i).getSeq()==ReviewList.get(j).getRes_seq()){
		%>
		<td>				<!-- 리뷰 별 구분 테이블 들어가는 TD -->
			<table border="1">	<!-- 리뷰 별 구분 테이블 -->
				<tr>
					<td>
						<input type="checkbox" value="<%=ReviewList.get(j).getSeq()%>" name="chk"/>
					</td>
					<td><%=ReviewList.get(j).getStar() %></td>
					<td>
					<fmt:formatDate value="<%=ReviewList.get(j).getRegdate() %>" pattern="YYYY/MM/DD hh:mm:ss"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<textarea rows="10" cols="60"><%=ReviewList.get(j).getContent() %></textarea>
					</td>
				</tr>
				<tr>
					<td>공감 수 : <%=ReviewList.get(j).getLikey()==null?"0":(ReviewList.get(j).getLikey().split(",").length) %></td>
					<td>비공감 수 : <%=ReviewList.get(j).getDislikey()==null?"0":(ReviewList.get(j).getDislikey().split(",").length) %></td>
					<td>신고 수 : <%=ReviewList.get(j).getReport()==null?"0":(ReviewList.get(j).getReport().split(",").length) %></td>
				</tr>
			</table>			<!-- 리뷰 별 구분 테이블 -->
		</td>					<!-- 리뷰 별 구분 테이블 들어가는 TD -->
		<%
			}
		} 
		
		%>
		</tr>				
		</tbody>
	</table>					<!-- 지역 식당 별 구분 테이블 -->
</div>							<!-- Scroll을 넣기위한 Block -->
<%
	}
%>
</body>
</html>