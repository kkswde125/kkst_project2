<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검토완료 창</title>
<style type="text/css">
	*{
		margin: 0 ;
		padding : 0;
		font : normal 11pt "나눔스퀘어라운드";
	}
	
	#all{
		width: 480px;
		height: 300px;
		margin : 0 auto;
		text-align: center;
		padding-top: 10%;
	}
	
	#tab{
		text-align: center;
	}
	#title{
		background-color : #e0e1e2;
		width: 480px;
		height: 50px;
		display: table-cell;
		vertical-align: middle;
		margin : 0 auto;
	}
</style>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
</head>
<body>
<div id="all">
<div id="title">
<h1>검토 완료!</h1>
</div>

<form action="sendEmail.do" method="POST">
<input type="hidden" name="seq" value="${dto.seq }"/>
<table class="ui striped table" id="tab">
	<tr>
		<td>검토 결과를 통보할 이메일 : </td>
		<td>
			<div class="ui input">
			<input type="text" value="${dto.email }" name="email" readonly="readonly"/>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea rows="10" cols="60" name="content" >내용을 입력해주세요.</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" >
			<input type="button" class="ui button" value="돌아가기" onclick="location.href='ad_restList.do?snum=1&cnum=10'">
			<input type="submit" class="ui button" value="메일 전송">
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>