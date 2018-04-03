<%@page import="com.pro.kkst.dtos.LoginDto"%>
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
<style type="text/css">
	*{
		margin : 0;
		padding : 0;
		font-family: "나눔스퀘어라운드";
	}

	#box{
		width: 1000px;
		height : 300px;
		margin : 0 auto;
		padding-top: 5%;
		
	}#allTab{
		width: 1000px;
	}
	p{
		font : bold 30pt "나눔스퀘어라운드 BOLD";
	}
	#pageTab{
		width: 450px;
		margin : 0 auto;
		text-align: center;
		padding : 0;
	}
	#page{
		text-align: center;
		margin : 0 auto;
	}
	
</style>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

	$(function(){
		var msg = '<%=(String)request.getAttribute("msg")%>';
		if(msg!='null'){
			alert(msg);
		}
		});

	function allChk(bool){
		$("input[name=chk]").prop("checked", bool);
	}
	
	function memDelCancle(){
		document.forms[0].action = "ad_memDelCancle.do";
		document.forms[0].submit();

	}
</script>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>

<body>


<%
	@SuppressWarnings("unchecked")
 	List<LoginDto> lists = (List<LoginDto>)request.getAttribute("lists");
%>
<div id="line">
<div id="all">
<form action="ad_memDel.do" method="post" name="isForm">
<div id="box">
<p>가입 회원 목록</p>
<table border = "1" class="ui celled table" id="allTab">
	<thead>
		<tr>
			<th>
				<input type="checkbox" onclick="allChk(this.checked)"/>
			</th>
			<th>ID</th>
			<th>별명</th>
			<th>이름</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>이메일</th>
			<th>탈퇴여부</th>
		</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${empty lists }">
			<tr>
				<td>
					<input type="checkbox" disabled="disabled"/>
				</td>
				<td colspan="7">===== 가입된 회원이 없습니다 =====</td>
			</tr>
		</c:when>
		<c:otherwise>
		<c:forEach items="${lists}" var="dto">
			<tr>
			<td>
				<input type="checkbox" name="chk" value="${dto.seq }"/>
			</td>
			<td>${dto.id }</td>
			<td>${dto.nickName }</td>
			<td>${dto.name }</td>
			<c:choose>
				<c:when test="${dto.sex=='F'}">
					<td>여성</td>
				</c:when>
				<c:otherwise>
					<td>남성</td>
				</c:otherwise>
				</c:choose>
			<td><fmt:formatDate value="${dto.birth }" pattern="yyyy년 MM월 dd일"/> </td>
			<td>${dto.email }</td>
			<c:choose>
				<c:when test="${dto.delFlag=='N'}">
					<td>활동 중</td>
				</c:when>
				<c:otherwise>
					<td>탈퇴</td>
				</c:otherwise>
				</c:choose>
		</tr>
		</c:forEach>
		</c:otherwise>
	</c:choose>
	</tbody>
	<tfoot style="text-align: center;">
		<tr class="btnPaging">
			<td colspan="2">
				<input type="button" value="돌아가기" class="ui button" onclick="location.href='admin.do'"/>
			</td>
			<td colspan="5" id = "paging">
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
       	 	<a href="ad_memberList.do?snum=<%=start*10-19 %>&cnum=<%=start*10-10 %>" class="icon item">
          		<i class="left chevron icon"></i>
          	</a>
        <%
		}
		for(int i=start-1; i < end; i++){
		%>
			<a href='ad_memberList.do?snum=<%=i<1?"1":i+"1"%>&cnum=<%=i<1?"10":(i+1)+"0"%>' class="item">
				<%=i+1 %>
	 		</a>
	 
        <%
	}
		if(end!=count){
			%>
			<a href="ad_memberList.do?snum=<%=start+100 %>&cnum=<%=end+99 %>" class="icon item">
				<i class="right chevron icon"></i>
			</a>
			<%
		}
%>
      </div>	
      </td>
      </tr>
      </table></div>
			</td>
			<td><input type="submit" value="강제탈퇴" class="ui button"><input type="button" class="ui button" value="활동복구" onclick="memDelCancle()"></td>
			
		</tr>
	</tfoot>
</table>
</div>
</form>
</div>
</div>
</body>
</html>