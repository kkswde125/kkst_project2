<%@page import="com.pro.kkst.dtos.PhotoDto"%>
<%@page import="com.pro.kkst.dtos.menuDto"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.kkst.dtos.ResDto"%>
<%@page import="com.pro.kkst.dtos.Admin_OnwerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8");%>
<%ResDto rDto=(ResDto)request.getSession().getAttribute("rDto"); %>
<%List<menuDto> mDto=(List<menuDto>)request.getAttribute("mDto"); %>
<%List<PhotoDto> pDto=(List<PhotoDto>)request.getAttribute("pDto"); %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String [] cateCode= new String[mDto.size()];
String [] cookCode=new String[mDto.size()];
String [] spicyCode=new String[mDto.size()];
String [] tempCode=new String[mDto.size()];


for(int j=0; j < mDto.size(); j++){
	
	String[] code = new String[mDto.size()];
	code[j]=mDto.get(j).getCode();
	cateCode[j] = code[j].substring(1,2);
	cookCode[j]= code[j].substring(2,3);
	spicyCode[j]= code[j].substring(3,4);
	tempCode[j]= code[j].substring(4,5);
}

%>

<c:set var="cateCode" value="<%=cateCode%>"/>
<c:set var="cookCode" value="<%=cookCode%>"/>
<c:set var="spicyCode" value="<%=spicyCode%>"/>
<c:set var="tempCode" value="<%=tempCode%>"/>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카탈리스트 점주식당 등록페이지 입니다.</title>
<style type="text/css">
	*{
		margin : 0;
		padding : 0;
	}
	
	input[type=text]{
		width: 500px;
	}
	
	#all{
		width: 70%;
		margin : 0 auto;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
</head>
<body>

<div id="all">
<table id="shopDiv">
<!-- 사진 올라갈곳 -->
<tr>
<td>
<div>
<img style=" width: 700px; height: 500px;" class=" medium ui image" src="resources/Resimg/<%=pDto.get(0).getChange()%>"/>
</div>
</td>

<td>
<table border="1" class="ui celled table" style="width: 710px; text-align: center;">

	<tr>
		<td colspan="2" style="text-align: center;"><h1>식당 상세보기</h1></td>
	</tr>
<tr>
	<th>식당명</th>
	<td>
	<div class="ui input">
	<input type="text" name="name" value="<%=rDto.getName()%>" readonly="readonly" />
	</div>
	</td>
</tr>
<tr>
	<th>업종</th>
	<td>
	<div class="ui input">
	<input type="text" name="cate" value="<%=rDto.getCate()%>" readonly="readonly" />
	</div>
	</td>
</tr>
<tr>
	<th>주소</th>
	<td>
	<div class="ui input">
	<input type="text" name="addr" value="<%=rDto.getAddr()%>" readonly="readonly" />
	</div>
	</td>
</tr>

	<tr>
		<th>영업시간</th>
		<td>
		<div class="ui input">
			<input  style="width:70px;" type="text" value="<%=rDto.getStart()%>" readonly="readonly" />
		</div>
			~
		<div class="ui input">
			<input  style="width:70px;" type="text" value="<%=rDto.getEnd()%>" readonly="readonly" />
		</div>
		</td>
	</tr>
	<tr>
		<th>휴식시간</th>
		<td>
		<div class="ui input">
			<input  style="width:70px;" type="text" value="<%=rDto.getRest_start()%>" readonly="readonly" />
		</div>
			~
		<div class="ui input">
			<input  style="width:70px;" type="text" value="<%=rDto.getRest_end()%>" readonly="readonly" />
		</div>
		
		
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
	<td>
	<div class="ui input">
	<input type="text" value="<%=rDto.getCall() %>" name="call" readonly="readonly" style="text-align: center;"  />
	</div>
	</td>
	</tr>

	<tr>
		<th>주차가능여부</th>
		<td>
		<div class="ui input">
		<input type="text" value="<%=rDto.getParking().equals("Y")?"가능":"불가능"%>" readonly="readonly" style="text-align: center;"  />
		</div>
		</td>
	</tr>
	
	<tr>
		<th>식당 설명</th>
		<td>
		<textarea rows="10" cols="80" name="comment" readonly="readonly"><%=rDto.getComment()%></textarea>
		</td>
	</tr>
	
	<tr>
		<td colspan="8" style="text-align: center;">
		
			<div class="ui animated button" onclick="location.href='ow_owner.do'" tabindex="0" style="width: 75px;">
  			<div class="visible content">이전</div>
  			<div class="hidden content"> <i class="arrow left icon"></i></div>
			</div>
			
		</td>
	</tr>
	
</table>
</td>
</table>

<hr id="line"/>
<% for(int i=0; i< mDto.size(); i++){
	%>
<table id="menuAdd" class="ui celled table" >
<tr>
<td>

<div style="width: 630px; height: 350px;">
<img id="outputs<%=i%>" style="width: 600px; height: 300px;"  class=" medium ui image" src="resources/Resimg/<%=pDto.get(i+1).getChange()%>" >
</div>

</td>
<td>

<table border="1"  class="ui celled table" style="width: 620px; text-align: center;" >
	<tr>
		<th>메뉴이름</th>
		<td colspan="2">
		<div class="ui input">
		<input type="text" name="menu_name_d" readonly="readonly" value="<%=mDto.get(i).getName()%>" />
		</div>
		</td>
	</tr>
	<tr>
		<td rowspan="4">메뉴특성</td>
		<td>주재료</td> 
		<td>
		<select name="cateCode_d" class="ui dropdown">
		<c:forEach items="${lists2}" var="dto" >
			<option label="${dto.attr}" value="${dto.code}" ${dto.code eq cateCode[i]? 'selected':''} />
		</c:forEach>
		</select>
		
		</td>
	</tr>
	<tr>
		<td>조리방식</td>
		<td>
		<select name="cookCode_d" class="ui dropdown">
		<c:forEach items="${lists3}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" ${dto.code eq cookCode[i]? 'selected':''} />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>매움정도</td>
		<td>
		<select name="spicyCode_d" class="ui dropdown">
		<c:forEach items="${lists4}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" ${dto.code eq spicyCode[i]? 'selected':''} />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>온도</td>
		<td>
		<select name="tempCode_d" class="ui dropdown">
		<c:forEach items="${lists5}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" ${dto.code eq tempCode[i]? 'selected':''} />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
	<td>가격</td><td colspan="2">
	<div class="ui input">
	<input type="text" name="price_d" value="<%=mDto.get(i).getPrice() %>" readonly="readonly" class="price1"  />
	</div>
	</td>
	</tr>
</table>
</td>
</tr>
</table>

	<%	
} 
%>
<!-- 메뉴 입력 끝 -->

</div>

</body>
</html>