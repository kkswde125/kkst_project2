<%@ page language="java" contentType="text/html; charset=UTF-8"%><%request.setCharacterEncoding("utf-8"); %><%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>푸드올림픽</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#all{
padding-top: 10%;
width: 800px;
margin : 0 auto;
text-align: center;
}
p{
font-size: 16px;
text-align: center;
}
img{
margin-bottom: 30px;
}
button{
margin: 20px;
}
</style>
</head>
<body>
<div id="all">
<img alt="경고이미지" src="resources/images/warningz.jpg">
<p>푸드 올림픽은 입맛에 상관없이 랜덤한 메뉴들이 출전합니다.<br/>
선택 결과는 통계에 영향을 끼치지 않습니다.</p>
<button class="btn btn-default" onclick="location.href='us_usermain.do'">뒤로 가기</button>
<button class="btn btn-primary" onclick="location.href='us_olympic.do'">알겠습니다</button>
</div>
</body>
</html>