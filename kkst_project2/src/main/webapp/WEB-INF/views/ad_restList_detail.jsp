<%@page import="com.pro.kkst.dtos.ResInfoDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>식당 검토 > 상세보기</title>
</head>
<% List<ResInfoDto> list = (List<ResInfoDto>)request.getAttribute("list"); %>
<body>

<table>
	<tr>
		<td>img</td>
		<td>
			<table>
				<tr>
					<th>메뉴이름</th>
					<th>주재료</th>
					<th>조리방식</th>
					<th>매움정도</th>
					<th>온도</th>
					<th>가격</th>
				</tr>
				<%for(int i = 0; i < list.size() ; i++){ %>
				<tr>
					<td>
						<%=list.get(i).getName() %>
					</td>
					<td>
						<%=list.get(i).getBase() %>
					</td>
					<td>
						<%=list.get(i).getCook() %>
					</td>
					<td>
						<%=list.get(i).getSpicy() %>
					</td>
					<td>
						<%=list.get(i).getTemp() %>
					</td>
					<td>
						<%=list.get(i).getPrice() %>
					</td>
				</tr>
				<%} %>
			</table>
		</td>
		
	</tr>
</table>


</body>
</html>