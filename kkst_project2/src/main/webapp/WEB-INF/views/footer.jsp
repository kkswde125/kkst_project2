<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>footer</title>
<style type="text/css">
	*{
		font-family: "나눔스퀘어라운드";
	}
	.mini{
		width: 30px;
	}
	#footerTabDiv{
		width : 500px;
		margin : 0 auto;
	}
	#footerTab{
		width: 500px;
	}
	#footerDiv{
		width: 100%;
	
	}
		#line{
		height: 800px;
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
<div id = "footerDiv">
	<div id="footerTabDiv">
	<table id="footerTab">
		<tr>
			<td>
				<table>
					<tr>
						<td><img src="img/ks.png" class="mini"></td>
						<td>김 경 수</td>
					</tr>
				</table>
			</td>


			<td>
				<table>
					<tr>
						<td><img src="img/sk.png" class="mini"></td>
						<td>강 석 근</td>
					</tr>
				</table>
			</td>


			<td>
				<table>
					<tr>
						<td><img src="img/ds.png" class="mini"></td>
						<td>서 다 솔</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</div>
</div>



</body>
</html>