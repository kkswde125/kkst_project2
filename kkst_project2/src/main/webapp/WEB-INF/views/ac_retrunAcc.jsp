<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID/PW찾기_점주</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
<script type="text/javascript">
function action() {
	$("form:first").submit();
	}
	
function action2() {
	$("form:last").submit();
	}
	
</script>
	

<style type="text/css">

	img{
		cursor: pointer;
	}

	*{
		margin : 0;
		padding : 0;
	}

	.insertTab{
		width: 300px;
		height: 300px;
		text-align: center;
	}

	#all{
		padding-top:1%;
		width: 600px;
		margin : 0 auto;
		text-align: center;
		font: bold 12pt "나눔스퀘어 BOLD";
	}
</style>

</head>
<body>

<div id="all">
<table>
	<tr>
		<td colspan="3">
			<img style="text-align:center; width: 550px;" onclick="location.href='index.jsp'" src="img/Logo.jpg">
		</td>
	</tr>
	<tr>
		<td>
		<form action="ac_idRetrun.do"  method="post">
			<table class="insertTab">
				<tr>
					<td colspan="2">ID 찾기</td>
				</tr>
				<tr>
					<td>이   름</td>
					<td>
					<div class="ui input">
						<input type="text" placeholder="이름을 입력해주세요" name="name_id" />
					</div>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
					<div class="ui input">
						<input type="text" placeholder="이메일을 입력해주세요" name="email_id" />
					</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<div style="height: 38px; width: 250px;"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="ui animated button" onclick="action()" tabindex="0">
					  	<div class="visible content">메일 전송</div>
					  	<div class="hidden content"><i class="large envelope outline icon"></i></div>
					  	</div>
					</td>
				</tr>
			</table>
		</form>
		</td>
		<td>
		<div style="width: 30px;">
			<hr style="height: 300px; width: 0.1px; background-color: gray;">
			</div>
		</td>
		<td>
		<form action="ac_pwRetrun.do" method="post" >
			<table class="insertTab">
				<tr>
					<td colspan="2">비밀번호 찾기</td>
				</tr>
				<tr>
					<td>이   름</td>
					<td>
					<div class="ui input">
						<input type="text" placeholder="이름을 입력해주세요" name="name_pw" />
					</div>
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>
					<div class="ui input">
						<input type="text" placeholder="아이디를 입력해주세요" name="id_pw" />
					</div>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
					<div class="ui input">
						<input type="text" placeholder="이메일을 입력해주세요" name="email_pw" />
					</div>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<div class="ui animated button" onclick="action2()" tabindex="0">
					  	<div class="visible content">메일 전송</div>
					  	<div class="hidden content"><i class="large envelope outline icon"></i></div>
					  	</div>
					</td>
				</tr>
			</table>
		</form>
		</td>
	</tr>
</table>
</div>
</body>
</html>