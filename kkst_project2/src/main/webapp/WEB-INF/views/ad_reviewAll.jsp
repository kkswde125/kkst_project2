<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>전체 리뷰 목록</h1>
<table border ="1">
	<thead>
		<tr>
			<c:forEach items="review" var="dto">
				<td>
					<table border ="1">
						<tr>
							<td>식당이름</td>
							<td>
								<input type="checkbox" name="chk" value="${dto.seq }"/>
							</td>
						</tr>
						<tr>
							<td>
								<textarea rows="10" cols="60" readonly="readonly">${dto.content }</textarea>
							</td>
						</tr>
						<tr>
							<td>
								추천 수  : ${dto.likey } 신고 수 : ${dto.report }
							</td>
						</tr>
					</table>
				</td>
			</c:forEach>
		</tr>
	</thead>
	
</table>
</body>
</html>