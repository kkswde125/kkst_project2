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
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">





	
	function allChk(bool, i){
			$(".chks"+i).prop("checked", bool);
	}
	
</script>

<title>Review -Detail Area</title>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	.scroll{
		width: 1200px;
		overflow: auto;
	}
	#shopName{
		font : bold 20pt "나눔스퀘어 BOLD";
		padding : 3px;
	}
	#all{
		width: 1300px;
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
<div id="line">
<div id="all">
<% for(int i = 0; i < resList.size() ; i++){ 
/* 	if() */
%>
<form action="ad_reviewDel.do" method="POST">
<table>
<tr><td>
	<div class="scroll">	<!-- Scroll을 넣기위한 Block -->
	<table>	<!-- 지역 식당 별 구분 테이블 -->
		<thead>
			<tr><td colspan="<%=ReviewList.size()%>" id="shopName"><%=resList.get(i).getName() %>
				<div class="ui checkbox"><input type="checkbox" onclick="allChk(this.checked, <%=i%>)"/></div>
			</td></tr>
		</thead>
		<tbody>
		<tr>
		<% for(int j = 0; j < ReviewList.size() ; j++){ 
			if(resList.get(i).getSeq()==ReviewList.get(j).getRes_seq()&&
					ReviewList.get(j).getDelflag().equals("N")){
		%>
		<td>				<!-- 리뷰 별 구분 테이블 들어가는 TD -->
			<table class="table table-bordered">	<!-- 리뷰 별 구분 테이블 -->
				<tr>
					<td>
						<div class="ui checkbox"><input type="checkbox" value="<%=ReviewList.get(j).getSeq()%>" name="chk" class="chks<%=i%>"/></div>
					</td>
					<td>평점 : <%=ReviewList.get(j).getStar() %></td>
					<td>
					<fmt:formatDate value="<%=ReviewList.get(j).getRegdate() %>" pattern="YYYY/MM/dd HH:mm:ss"/>
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
		<td></td>
		</tr>				
		</tbody>
	</table>					<!-- 지역 식당 별 구분 테이블 -->
</div>							<!-- Scroll을 넣기위한 Block -->
</td>
<td><input type="submit" class="ui button" value="삭제" style="height: 350px;"/></td>
</tr>
</table>

<br/>
<br/>
</form>
<%
	}
%>
<input type="button" value="돌아가기" onclick="location.href='ad_allRevAreaChoice.do'"/>
</div>
</div>
<hr/>
<jsp:include page="footer.jsp"/>
</body>
</html>