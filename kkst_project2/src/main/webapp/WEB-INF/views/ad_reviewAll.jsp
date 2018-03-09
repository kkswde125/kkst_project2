<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
<style type="text/css">
	#scroll{
		width : 1200px;
		overflow: auto;
	}
</style>
</head>

<body>
<h1>전체 리뷰 목록</h1>
<div id="scroll">
<table border ="1">
	<thead>
		<tr>
		<td colspan="${reviewList.size()}">식당 이름 </td>
		</tr><tr>
			<c:forEach items="${reviewList}" var="reviewDto" >
				<td>
					<table border ="1">
						<tr>
							<td>${reviewDto.regdate }</td>
							<td>
								<input type="checkbox" name="chk" value="${reviewDto.seq}"/>
							</td>
						</tr>
						<tr>
							<td colspan="2" >
								<textarea rows="10" cols="60" readonly="readonly">${reviewDto.content }</textarea>
							</td>
						</tr>
						<tr>
							<td>
								추천 수  : ${reviewDto.likey } 신고 수 : ${reviewDto.report }
							</td>
						</tr>
					</table>
				</td>
			</c:forEach>
		</tr>
	</thead>
</table>
</div>
</body>
</html>