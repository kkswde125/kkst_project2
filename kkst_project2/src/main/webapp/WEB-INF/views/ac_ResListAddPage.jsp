<%@page import="com.pro.kkst.dtos.Admin_OnwerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8");%>
<% String res_seq = request.getParameter("res_seq"); %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> ㅈ같은 다솔이가 만든! 식당등록페이지에요~</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">


	window.onload=function(){
		$(".reset").on("click", function() {
			$(this).attr("value", "");
		});
		
		$("body").on("click",".price1",function() {
			$(this).attr("value", "");
		});
	}

	
		
	

		
		var countT=1;
		var countM=1;

	function AddMenu() {
		
		var count=1;
		var copy = $("#menuAdd").clone().attr("id", "menuAdd"+countT++).css("display", "block");
		
		$("#line").append(copy);
		
	}
	
	function loadfile(event) {
		var output = document.getElementById("output");
		var blobURL = URL.createObjectURL(event.target.files[0]);
		 $('#outputs').attr('src', blobURL);
         $('#outputs').slideDown(); //업로드한 이미지 미리보기 
         $(this).slideUp(); //파일 양식 감춤
	}
	
	function loadfile2(event) {
		var count=1;
		var blobURL = URL.createObjectURL(event.target.files[0]);
	 	$("#menuAdd"+countM++).find('img').attr('src', blobURL);
     	$("#menuAdd"+countM).find('img').slideDown(); //업로드한 이미지 미리보기 
     	$(this).slideUp(); //파일 양식 감춤
}

	
	
// 	<label for="upload" style="display: block; background: gray; width: 80px;height: 25px;">파일선택</label>
// 	<label for="upload" style="display: block; background: gray; width: 80px;height: 25px;">파일선택</label>
</script>
</head>
<body>
<!-- 복제할 메뉴 폼 -->

<table id="menuAdd"  style="display: none;"  >
<tr>
<td>

<div style="width: 350px; height: 350px; padding: 40px;">
<input type="file" accept="image/*"  name="uploadFile" id="upload" onchange="loadfile2(event)" />
<img id="output" style="width: 350px; height: 350px;" >
</div>

</td>
<td>


<table border="1" >
	<tr>
		<th>메뉴이름</th>
		<td colspan="2"><input type="text" name="menu_name"/></td>
	</tr>
	<tr>
		<td rowspan="4">메뉴특성</td>
		<td>주재료</td> 
		<td>
		<select name="cateCode">
		<c:forEach items="${lists2}" var="dto">
			<option label="${dto.attr}" value="${dto.code}"/>
		</c:forEach>
		</select>
		
		</td>
	</tr>
	<tr>
		<td>조리방식</td>
		<td>
		<select name="cookCode">
		<c:forEach items="${lists3}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>매움정도</td>
		<td>
		<select name="spicyCode">
		<c:forEach items="${lists4}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>온도</td>
		<td>
		<select name="tempCode">
		<c:forEach items="${lists5}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
	<td>가격</td><td colspan="2"><input type="text" name="price" value="숫자만 입력해주세요" required="required" class="price1" /></td>
	</tr>
</table>
</td>
</tr>
</table>





<form action="ac_ResListAdd.do" method="post" id="newMenu" enctype="multipart/form-data">
<input type="hidden" name="res_seq" value="<%=res_seq%>" />
<table>
<!-- 사진 올라갈곳 -->
<tr>
<td>
<div style="width: 350px; height: 350px; padding: 40px;">
<input type="file" accept="image/*" name="uploadFile" id="upload" onchange="loadfile(event)" />
<img id="outputs" style=" width: 350px; height: 350px;">
</div>
</td>
<!-- 입력 부분 -->
<td>
<table border="1">
<tr>
	<th>식당명</th>
	<td><input type="text" name="name" required="required" /></td>
</tr>
<tr>
	<th>업종</th>
	<td>
	
	<select name="cate">
		<option label="한식" value="한식">
		<option label="중식" value="중식">
		<option label="일식" value="일식">
		<option label="양식" value="양식">
		<option label="횟집" value="횟집">
		<option label="분식" value="분식">
		<option label="냉면집" value="냉면집">
		<option label="인도,태국" value="인도,태국">
		<option label="치킨" value="치킨">
		<option label="식육(숯불구이)" value="식육(숯불구이)">
		<option label="보신용" value="보신용">
	</select>
	</td>
</tr>
<tr>
	<th>주소</th>
	<td><input type="text" name="addr" required="required" /></td>
</tr>

	<tr>
		<th>영업시간</th>
		<td>
		<!-- 영업시간 -->
			<select name="S_hour">
				<c:forEach begin="0" end="23" var="i">
				<option label="${i}" value="${i}">
				</c:forEach>
			</select> : 
			<select name="S_min">
				<c:forEach begin="0" end="59" var="i">
				<option label="${i}" value="${i}">
				</c:forEach>
			</select>
			~
			<select name="E_hour">
				<c:forEach begin="0" end="23" var="i">
				<option label="${i}" value="${i}">
				</c:forEach>
			</select> : 
			<select name="E_min">
				<c:forEach begin="0" end="59" var="i">
				<option label="${i}" value="${i}">
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th>휴식시간</th>
		<td>
				<!-- 휴식시간 -->	
			<select name="Rs_hour">
				<c:forEach begin="0" end="23" var="i">
				<option label="${i}" value="${i}">
				</c:forEach>
			</select> : 
			<select name="Rs_min">
				<c:forEach begin="0" end="59" var="i">
				<option label="${i}" value="${i}">
				</c:forEach>
			</select>
			~
			<select name="Re_hour">
				<c:forEach begin="0" end="23" var="i">
				<option label="${i}" value="${i}">
				</c:forEach>
			</select> : 
			<select name="Re_min">
				<c:forEach begin="0" end="59" var="i">
				<option label="${i}" value="${i}">
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
	<td>
	<input type="text" value="- 를 포함하여 입력해주세요" name="call" required="required" class="reset" />
	</td>
	</tr>

	<tr>
		<th>주차가능여부</th>
		<td>
			<select name="parking">
				<option label="가능" value="Y">
				<option label="불가능" value="N">
			</select>
		</td>
	</tr>
	
	<tr>
		<th>식당 설명</th>
		<td>
		<textarea rows="10" cols="60" name="comment"></textarea>
		</td>
	</tr>
	
	
</table>
</td>
</table>
<hr id="line"/>



<input type="submit" value="식당 등록 완료!">
<input type="button" value="메뉴추가" onclick="AddMenu()" />
</form>



</body>
</html>