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
		font : normal 20pt "배달의민족 도현";
		padding : 3px;
	}
	#all{
		width: 1300px;
		padding-top : 5%;
		margin : 0 auto;
	}
	
	.ui.button{
		font : bold 10pt "나눔스퀘어라운드 BOLD";
	}
	
	#allTab{
		margin-top: 20px;
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
<div id="all">

<button class="ui labeled icon button" onclick="location.href='ad_allRevAreaChoice.do'">
  <i class="left arrow icon"></i>
  돌아가기
</button>


<% for(int i = 0; i < resList.size() ; i++){ 

%>

<form action="ad_reviewDel.do" method="POST">
<table id="allTab">
<tr>
<td id="shopName" style="color : gray;">&nbsp;&nbsp;&nbsp;	<%=resList.get(i).getName() %></td>
<td style="text-align: center;">

<div class="ui checkbox">
  <input type="checkbox" onclick="allChk(this.checked, <%=i%>)">
  <label></label>
</div>

</td>
</tr><tr>
<td>
	<div class="scroll">	<!-- Scroll을 넣기위한 Block -->
	<table>	<!-- 지역 식당 별 구분 테이블 -->
		<tbody>
		<tr>
		<% for(int j = 0; j < ReviewList.size() ; j++){ 
			if(resList.get(i).getSeq()==ReviewList.get(j).getRes_seq()&&
					ReviewList.get(j).getDelflag().equals("N")){
		%>
		<td>				<!-- 리뷰 별 구분 테이블 들어가는 TD -->
			<table class="ui striped grey table">	<!-- 리뷰 별 구분 테이블 -->
				<tr>
					<td>
						<div class="ui checkbox">
						  <input type="checkbox" value="<%=ReviewList.get(j).getSeq()%>" name="chk" class="chks<%=i%>"/>
						  <label></label>
						</div>
					</td>
					<td>평점 : <%=ReviewList.get(j).getStar() %></td>
					<td>
					<fmt:formatDate value="<%=ReviewList.get(j).getRegdate() %>" pattern="YYYY/MM/dd HH:mm:ss"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<textarea rows="10" cols="60" class="ui input" readonly="readonly"><%=ReviewList.get(j).getContent() %></textarea>
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
</td>
<td>
<button class="ui icon button" style="height: 290px; width: 50px;">
  <i class="large trash alternate outline icon"></i>
</button>
</td>
</tr>
</table>


</form>
<%
	}
%>


  
</div>
<br/><br/>
</body>
</html>