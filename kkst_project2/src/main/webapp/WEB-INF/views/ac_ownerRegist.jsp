<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>regist.jsp</title>
<style type="text/css">
#wrap{
	text-align: center;
	margin-left: 30%;
	margin-right: 30%;
	margin-top: 5%;
}
th{
text-align: center;
}
</style>
<script type="text/javascript">
	
	function idChkF(id) {
		if (id==''||id.indexOf(' ')!=-1) {
			alert('id를 입력해주세요');
			document.getElementById('idChk').focus();
		}else{
			$.ajax({
				url:"IsChkAjax.do", //요청 주소
				data:"id="+id, //보내는 값
				type:"post", //전송방식
				datatype:"json", //서버에서 보내주는 데이터의 타입
				success:function(obj){ 
					var isChk=obj["isChk"];
					if (isChk) {
						$("#isChkAjax").text("이미 존재하는 아이디").css('color', 'red');
					}else{
						$("#isChkAjax").text("사용가능한 아이디").css('color','blue');
					}
				}
			});				
		}
	}
	
		
</script>
</head>
<body>
<div id="wrap">
<h1>점주 회원가입</h1>
<form action="ac_onwerRegist_after.do" method="post">
<table border="1" class="table table-striped">
	<tr>
		<th>아이디</th>
		<td>
			<div class="form-inline">
			<div class="form-group">
			<input class="form-control"  type="text" name="id" id="idChk" required="required"/>
			</div>
			<div class="form-group">
			<input class="btn btn-default" type="button" value="중복체크" onclick="idChkF(idChk.value)"/>
			</div>
			</div>
			<br/>
			<b><span id="isChkAjax"></span></b>
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input class="form-control" type="password" name="pw" required="required"/></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input class="form-control" type="text" name="name" required="required"/></td>
	</tr>
	<tr>
		<th>휴대폰 번호</th>
		<td><input class="form-control" type="text" name="phone" required="required"/></td>
	</tr>
	
	<tr>
		<th>이메일</th>
		<td><input class="form-control" type="text" name="email" required="required"/></td>
	</tr>
	

	<tr>
		<td colspan="2">
			<input class="btn btn-default" type="submit" value="확인" />
			<input class="btn btn-default" type="button" value="로그인화면으로" onclick="location.href='ow_loginhome.do'"/>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>