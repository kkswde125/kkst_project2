<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		var msg = '<%request.getParameter("msg");%>';
		if (msg!='') {
		alert(msg);
		}
		
	});

	function allChk(bool){
		$("input[name==chk]").prop("checked", bool);
	}
	
	function shopChk(seq){
		var x = $("input[value=="+seq+"]").parent("tr").children("input[name==x]");
		var y = $("input[value=="+seq+"]").parent("tr").children("input[name==y]");
		location.href="ad_restList_Chk.do&x="+x+"&y="+y+"&seq="+seq;
	}
	
	function Check(seq){
		var tr = $("input[value=="+seq+"]").parent("tr");
		$(tr).children("input[name==x]").attr("disable", none);
		$(tr).children("input[name==y]").attr("disable", none);
	}
	
</script>
</head>
<body>

<h1>식당 등록 관리</h1>
<form action="ad_restList_Del.do" method="POST">
<table border = "1" id="table">
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
		<td colspan="2">좌표입력란</td>
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
			<input type="checkbox" name="chk" value="${dto.seq }" onclick="Check(${dto.seq})"/>
		</td>
		<td>${dto.name }</td>
		<td>${dto.cate }</td>
		<td>${dto.call }</td>
		<td>${dto.addr }</td>
		<td>${dto.start }~${dto.end }</td>
		<td>${dto.rest_start }~${dto.rest_end }</td>
		<td>
			<input type="text" value="X 좌표" name="x" disabled="disabled">
		</td>
		<td>
			<input type="text" value="Y 좌표" name="y" disabled="disabled">
		</td>
		<td>
			<input type="button" value="검토완료" onclick="shopChk(${dto.seq})"/>
		</td>
	</tr>
	
	</c:forEach>
	</c:otherwise>
	</c:choose>
<tr><td colspan = "9">
<table id="page" border="1">
<tr>
	<td>
		<% 
		int count = (Integer)request.getAttribute("count");
		int START = (Integer)request.getAttribute("START");
		int END = (Integer)request.getAttribute("END");
		if(END>count){
			END = count;
		}
		
		if(START!=1){
		%>
		<a href="ad_restList.do?snum=<%=START*10-19 %>&cnum=<%=START*10-10 %>">이전</a>
		
		<%
		}
		for(int i=START-1; i < END; i++){
		%>          
	<a href='ad_restList.do?snum=<%=i<1?"1":i+"1"%>&cnum=<%=i<1?"10":(i+1)+"0"%>'>
	<%=i+1 %>
	 </a>
<%
	}
		if(END!=count){
			%>
		<a href="ad_restList.do?snum=<%=START+100 %>&cnum=<%=END+99 %>">다음</a>
			<%
		}
%>
	</td>
</tr>
</table>
</td>
<td>
		<input type="submit" value="삭제"/>
		<input type="button" value="돌아가기" onclick="location.href='ad_admin.do'"/>
	</td>
</tr>
</table>
</form>
</body>
</html>