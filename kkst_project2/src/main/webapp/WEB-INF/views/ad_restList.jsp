<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
		margin : 0;
		padding : 0;
		font : normal 11pt "나눔스퀘어라운드";
	}
	
	#all{
		width: 1400px;
		margin : 0 auto;
		padding-top: 50px;
		
	}
	#page{
		margin : 0 auto;
		padding : 0 !important;
	}
	#pageTab{
		width: 450px;
		margin : 0 auto;
		text-align: center;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		var msg = '<%request.getParameter("msg");%>';
		if (msg!='') {
		alert(msg);
		}
		
	});

	function allChk(bool){
		$("input[name=chk]").prop("checked", bool);
	}
	
	function shopChk(seq){
		var parent = $("input[value="+seq+"]").parent("td").parent("tr");
		var x = parent.find("input[name=x]").val();
		var y = parent.find("input[name=y]").val();
		location.href="ad_restList_Chk.do?x="+x+"&y="+y+"&seq="+seq;
	}
	
	
</script>
</head>
<body>

<div id="all">
<h1>식당 등록 관리</h1><br/>
<form action="ad_restList_Del.do" method="POST">
<table border = "1" id="table" class="ui celled table" style="text-align: center;">
	<tr>
		<td>
			<input type="checkbox" name="chkAll" onclick="allChk(this.checked)"/>
		</td>
		<td>상호명</td>
		<td>업종형태</td>
		<td>전화번호</td>
		<td>주소지</td>
		<td>영업시간</td>
		<td>휴식시간</td>
		<td colspan="3">좌표입력란</td>
	</tr>
	
	<c:choose>
	<c:when test="${empty lists }">
	<tr>
		<td>
			<input type="checkbox" disabled="disabled"/>
		</td>
		<td colspan="9">=== 대기중인 식당이 없습니다 ===</td>
		</tr>
	</c:when>
	<c:otherwise>
	<c:forEach items="${lists}" var="dto">
	<tr>
		<td>
			<input type="checkbox" name="chk" value="${dto.seq }"/>
		</td>
		<td>${dto.name }</td>
		<td>${dto.cate }</td>
		<td>${dto.call }</td>
		<td>${dto.addr }</td>
		<td>${dto.start }~${dto.end }</td>
		<td>${dto.rest_start }~${dto.rest_end }</td>
		<td>
		<div class="ui input">
			<input type="text" placeholder="X 좌표" name="x">
		</div>
		</td>
		<td>
		<div class="ui input">
			<input type="text" placeholder="Y 좌표" name="y">
		</div>
		</td>
		<td>
			<input type="button" class="ui button" value="검토완료" onclick="shopChk(${dto.seq})"/>
		</td>
	</tr>
	
	</c:forEach>
	</c:otherwise>
	</c:choose>
<tr>
<td colspan="10" style="text-align: right;">
		<input type="submit" value="삭제" class="ui button"/>
		<input type="button" value="돌아가기" onclick="location.href='ad_admin.do'" class="ui button"/>
	</td>
</tr>
</table>
<div id="pageTab">
<table id="page">
<tr>
	<td>
<div class="ui right floated pagination menu">
<% 
		int count = (Integer)request.getAttribute("count");
		int start = (Integer)request.getAttribute("start");
		int end = (Integer)request.getAttribute("end");
		if(end>count){
			end = count;
		}
		
		if(start!=1){
		%>
        <a href="ad_restList.do?snum=<%=start*10-19 %>&cnum=<%=start*10-10 %>" class="icon item">
          <i class="left chevron icon"></i>
          </a>
        <%
		}
		for(int i=start-1; i < end; i++){
		%>
	<a href='ad_restList.do?snum=<%=i<1?"1":i+"1"%>&cnum=<%=i<1?"10":(i+1)+"0"%>' class="item">
	<%=i+1 %>
	 </a>
	 
        <%
	}
		if(end!=count){
			%>
		<a href="ad_restList.do?snum=<%=start+100 %>&cnum=<%=end+99 %>" class="icon item">
		<i class="right chevron icon"></i>
		</a>
			<%
		}
%>
      </div>
	</td>
</tr>
</table>
</div>
</form>
</div>



</body>
</html>