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

<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>

<title>점주 회원가입</title>
<style type="text/css">
	#all{
		padding-top:3%;
		width: 600px;
		margin : 0 auto;
		text-align: center;
		font: bold 12pt "나눔스퀘어 BOLD";
	}
th{
text-align: center;
}
.ui.input.phone{
	height: 25px;
}

.ui.animated.button{

	width: 200px;
}

	img{
		cursor: pointer;
	}

td{
	width: 350px;
}

#tabDiv{
	width: 500px;
	margin : 0 auto;	
}
</style>


<script type="text/javascript">
	
	
		
	function action() {
			$("form:first").submit();
	}
	
	function idChkF(id) {
		if (id==''||id.indexOf(' ')!=-1) {
			alert('id를 입력해주세요');
			document.getElementById('idChk').focus();
		}else{
			$.ajax({
				url:"ow_IsChkAjax.do", //요청 주소
				data:"id="+id, //보내는 값
				type:"post", //전송방식
				dataType:"json", //서버에서 보내주는 데이터의 타입
				success:function(obj){ 
					var isChk=obj["isChk"];
					if (isChk) {
						$("#isChkAjax").text("사용가능한 아이디").css('color','blue');
					}else{
						$("#isChkAjax").text("이미 존재하는 아이디").css('color', 'red');
					}
				}
			});				
		}
	}
	
		
</script>
</head>
<body>
<div id="all">
<img style="text-align:center; width: 600px;" onclick="location.href='index.jsp'" src="img/Logo.jpg">
<h2>점주 회원가입</h2>
<form action="ac_onwerRegist_after.do" method="post" >
<div id="tabDiv">
<table border="1" class="ui grey table" style="width: 500px;">
	<tr>
		<th>아이디</th>
		<td>
			<div class="ui input">
			<input type="text" name="id" id="idChk" required="required"/>&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="ui button" type="button" value="중복체크" onclick="idChkF(idChk.value)"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<br>
			<b><span id="isChkAjax"></span></b>
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
		<div class="ui input">
		<input type="password" name="pw" required="required"/>
		</div>
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>
		<div class="ui input">
		<input class="ui input" type="text" name="name" required="required"/>
		</div>
		</td>
	</tr>
	<tr>
		<th>휴대폰 번호</th>
		<td>
		<div class="ui small input">
		<input class="ui input phone" type="text" name="phone1" required="required" style="width: 100px;" maxlength="3"/> 
		&nbsp;&nbsp;<b>-</b>&nbsp;&nbsp;
		<input class="ui input phone" type="text" name="phone2" required="required" style="width: 100px;" maxlength="4"/>
		&nbsp;&nbsp;<b>-</b>&nbsp;&nbsp;
		<input class="ui input phone" type="text" name="phone3" required="required" style="width: 100px;" maxlength="4"/>
		</div>
		</td>
	</tr>
	
	<tr>
		<th>이메일</th>
		<td>
		<div class="ui input">	
		<input class="ui mini icon input" style="width: 330px;" type="email" name="email" required="required"/>
		</div>
		</td>
	</tr>
	

	<tr>
		<td colspan="2" style="text-align: center;" >
			<div class="ui animated button" onclick="action()" tabindex="0">
  			<div class="visible content">확인</div>
  			<div class="hidden content">식당 등록 페이지로 이동합니다.</div>
			</div>
			
			<div class="ui animated button"  tabindex="0" onclick="location.href='ac_beforeRegist.do'">
  			<div class="visible content">이전</div>
  			<div class="hidden content">이전 페이지로 돌아갑니다.</div>
			</div>
		</td>
	</tr>
</table>
</div>
</form>


</div>
</body>
</html>