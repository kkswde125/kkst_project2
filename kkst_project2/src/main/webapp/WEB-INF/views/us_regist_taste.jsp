<%@page import="com.pro.kkst.dtos.WatchaDto"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.kkst.dtos.LoginDto"%>
<%response.setHeader("Cache-Control","no-store");	response.setHeader("Pragma","no-cache");response.setHeader("Expires","0");%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%><%request.setCharacterEncoding("utf-8"); %><%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('input[name=stars0]').each(function() {$(this).one('change', function() {$(this).parents('table').css('border','2px solid blue');});});
		$('input[name=stars1]').each(function() {$(this).one('change', function() {$(this).parents('table').css('border','2px solid blue');});});
		$('input[name=stars2]').each(function() {$(this).one('change', function() {$(this).parents('table').css('border','2px solid blue');});});
		$('input[name=stars3]').each(function() {$(this).one('change', function() {$(this).parents('table').css('border','2px solid blue');});});
		$('input[name=stars4]').each(function() {$(this).one('change', function() {$(this).parents('table').css('border','2px solid blue');});});
		$('input[name=stars5]').each(function() {$(this).one('change', function() {$(this).parents('table').css('border','2px solid blue');});});
		$('input[name=stars6]').each(function() {$(this).one('change', function() {$(this).parents('table').css('border','2px solid blue');});});
		$('input[name=stars7]').each(function() {$(this).one('change', function() {$(this).parents('table').css('border','2px solid blue');});});
		$('input[name=stars8]').each(function() {$(this).one('change', function() {$(this).parents('table').css('border','2px solid blue');});});
		$('input[name=stars9]').each(function() {$(this).one('change', function() {$(this).parents('table').css('border','2px solid blue');});});
		$('input[name=stars10]').each(function() {$(this).one('change', function() {$(this).parents('table').css('border','2px solid blue');});});
		var submit = false;
		$('form').submit(function(e) {
			$('#loadingImg').css('display','block');
			$('#all').css('display','none');
			var count = 0;
			var chk = true;
			setTimeout(function() {
				$('input[name=stars0]').each(function() { if ($(this).prop('checked')) {return false;}else{count++;} if (count==5) {chk=false;}});
				if (chk==false) {alert('체크하지 않은 항목이 있습니다.'); $('#loadingImg').css('display','none'); $('#all').css('display','block'); return false;}else{count=0;}
				$('input[name=stars1]').each(function() { if ($(this).prop('checked')) {return false;}else{count++;} if (count==5) {chk=false;}});
				if (chk==false) {alert('체크하지 않은 항목이 있습니다.'); $('#loadingImg').css('display','none'); $('#all').css('display','block'); return false;}else{count=0;}
				$('input[name=stars2]').each(function() { if ($(this).prop('checked')) {return false;}else{count++;} if (count==5) {chk=false;}});
				if (chk==false) {alert('체크하지 않은 항목이 있습니다.'); $('#loadingImg').css('display','none'); $('#all').css('display','block'); return false;}else{count=0;}
				$('input[name=stars3]').each(function() { if ($(this).prop('checked')) {return false;}else{count++;} if (count==5) {chk=false;}});
				if (chk==false) {alert('체크하지 않은 항목이 있습니다.'); $('#loadingImg').css('display','none'); $('#all').css('display','block'); return false;}else{count=0;}
				$('input[name=stars4]').each(function() { if ($(this).prop('checked')) {return false;}else{count++;} if (count==5) {chk=false;}});
				if (chk==false) {alert('체크하지 않은 항목이 있습니다.'); $('#loadingImg').css('display','none'); $('#all').css('display','block'); return false;}else{count=0;}
				$('input[name=stars5]').each(function() { if ($(this).prop('checked')) {return false;}else{count++;} if (count==5) {chk=false;}});
				if (chk==false) {alert('체크하지 않은 항목이 있습니다.'); $('#loadingImg').css('display','none'); $('#all').css('display','block'); return false;}else{count=0;}
				$('input[name=stars6]').each(function() { if ($(this).prop('checked')) {return false;}else{count++;} if (count==5) {chk=false;}});
				if (chk==false) {alert('체크하지 않은 항목이 있습니다.'); $('#loadingImg').css('display','none'); $('#all').css('display','block'); return false;}else{count=0;}
				$('input[name=stars7]').each(function() { if ($(this).prop('checked')) {return false;}else{count++;} if (count==5) {chk=false;}});
				if (chk==false) {alert('체크하지 않은 항목이 있습니다.'); $('#loadingImg').css('display','none'); $('#all').css('display','block'); return false;}else{count=0;}
				$('input[name=stars8]').each(function() { if ($(this).prop('checked')) {return false;}else{count++;} if (count==5) {chk=false;}});
				if (chk==false) {alert('체크하지 않은 항목이 있습니다.'); $('#loadingImg').css('display','none'); $('#all').css('display','block'); return false;}else{count=0;}
				$('input[name=stars9]').each(function() { if ($(this).prop('checked')) {return false;}else{count++;} if (count==5) {chk=false;}});
				if (chk==false) {alert('체크하지 않은 항목이 있습니다.'); $('#loadingImg').css('display','none'); $('#all').css('display','block'); return false;}else{count=0;}
				$('input[name=stars10]').each(function() { if ($(this).prop('checked')) {return false;}else{count++;} if (count==5) {chk=false;}});
				if (chk==false) {alert('체크하지 않은 항목이 있습니다.'); $('#loadingImg').css('display','none'); $('#all').css('display','block'); return false;}else{count=0;}
				submit = true;
				$('form').submit();
			}, 4000);
			if(!submit){
				e.preventDefault();
			}
		});
	});
</script>
<style type="text/css">
#all{
padding-top:3%;
width: 1210px;
margin : 0 auto;
text-align: center;
}
.tablezz{
width: 1200px;
height: 600px;
border-collapse: collapse;
}
#loadingImg{
	padding-top: 1%;
		width: 800px;
		margin : 0 auto;
		text-align: center;
		display: none;
}
#loadingText{
	font-size: 20px;
    font-weight: bold;
    text-align: center;
}
.imgs{
	border-radius: 100px;
}
</style>
</head>
<% LoginDto ldto =(LoginDto)request.getSession().getAttribute("ldto");if(ldto==null){pageContext.forward("ac_login.do");}
	@SuppressWarnings("unchecked")
	List<WatchaDto> list= (List<WatchaDto>)request.getAttribute("list");
%>
<body>
<div id="all">
<h1>당신의 입맛을 알려주세요!</h1>
<hr/>
<form action="us_getstars.do" method="post">
<%
	for(int i = 0; i < list.size(); i++){
		%>
			<input type="hidden" name="codes" value="<%=list.get(i).getCode()%>"/>
			<table class="tablezz">
			<tr>
				<td>
					<img class="imgs" alt="<%=list.get(i).getName()%>" src="resources/Resimg/<%=list.get(i).getChange()%>" style="width: 500px; height: 500px;">			
				</td>
				<td rowspan="1">
					<img alt="1점이미지" src="resources/images/1.jpg">
					<br/>
					<input type="radio" name="stars<%=i%>" value="10">
				</td>
				<td rowspan="1">
					<img alt="2점이미지" src="resources/images/2.jpg">
					<br/>
					<input type="radio" name="stars<%=i%>" value="25">
				</td>
				<td rowspan="1">
					<img alt="3점이미지" src="resources/images/3.jpg">
					<br/>
					<input type="radio" name="stars<%=i%>" value="50">
				</td>
				<td rowspan="1">
					<img alt="4점이미지" src="resources/images/4.jpg">
					<br/>
					<input type="radio" name="stars<%=i%>" value="75">
				</td>
				<td rowspan="1">
					<img alt="5점이미지" src="resources/images/5.jpg">
					<br/>
					<input type="radio" name="stars<%=i%>" value="90">
				</td>
			</tr>
			<tr>
				<td><p><%=list.get(i).getName()%><p></td><td></td><td></td><td></td><td></td><td></td>
			</tr>
			</table>
<!-- 			<input type="range" min="1" max="100" name="stars"/><br/> -->
			<hr/>
		<%
	}
%>
<button type="submit" class="btn btn-primary">완료</button>
<br/>&nbsp;<br/>&nbsp;<br/>&nbsp;<br/>
</form>
</div>
<div id="loadingImg">
<img alt="로딩이미지" src="resources/images/loading.gif"><br/>
<p id="loadingText">입맛 분석중 . . .</p>
</div>
</body>
</html>