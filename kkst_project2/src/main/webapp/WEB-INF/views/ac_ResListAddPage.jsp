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
<title>카탈리스트 점주식당 등록페이지 입니다.</title>
<style type="text/css">
	*{
		margin : 0;
		padding : 0;
	}
	
	input[type=text]{
		width: 500px;
	}
	
	#all{
		width: 70%;
		margin : 0 auto;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
<script type="text/javascript">


	window.onload=function(){
		$(".reset").on("click", function() {
			$(this).attr("value", "");
		});
		
		$("body").on("click",".price1",function() {
			$(this).attr("value", "");
		});
	}

	
	function action() {
		$("form:first").submit();
		}
	
	
		var countT=1;
		var countM=1;
		var countMenu=0;
	function AddMenu() {
		
		countMenu++;
		var copy = $("#menuAdd").clone().attr("id", "menuAdd"+countT++).css("display", "block");
		
		$("#line").append(copy).slideDown();
		
	}
	
	function loadfile(event) {
		var output = document.getElementById("output");
		var blobURL = URL.createObjectURL(event.target.files[0]);
		 $('#outputs').attr('src', blobURL);
         $('#outputs').slideDown(); //업로드한 이미지 미리보기 
         $(this).slideUp(); //파일 양식 감춤
	}
	
	function loadfile2(event) {
		var tableId=$(event.target).parents("table").eq(0).attr("id");
		var blobURL = URL.createObjectURL(event.target.files[0]);
		$("#"+tableId).find("img").attr('src', blobURL);
	 	$("#"+tableId).find("img").slideDown(); //업로드한 이미지 미리보기 
     	$(this).slideUp(); //파일 양식 감춤
}
	
	
	function chekMenu(seq) {
		
		if(countMenu==0){
			alert("하나이상의 메뉴를 등록하세요!");
			location.href="ac_ResListAddPage.do?res_seq="+seq;
			return false;
		}
		
	}
	
	$(function(){
		$("form").submit(function(){
			var bool=true;
			$("form input[name]").each(function(){
				if($(this).val()==""){
					alert("빈 공간 없이 입력해주세요");
					$(this).focus();
					bool=false;
					return false;
				}
			});
		
			return bool;
		})
	})	

	
	
// 	<label for="upload" style="display: block; background: gray; width: 80px;height: 25px;">파일선택</label>
// 	<label for="upload" style="display: block; background: gray; width: 80px;height: 25px;">파일선택</label>
</script>
</head>
<body>
<!-- 복제할 메뉴 폼 -->

<table id="menuAdd"  style="display: none;" class="ui celled table"  >
<tr>
<td>

<div style="width: 400px; height: 350px; padding: 40px;">
<div class="ui input" style="padding-bottom: 20px;">
<input type="file" accept="image/*" required="required"  name="uploadFile" id="upload" onchange="loadfile2(event)" class="ui basic button"/>
</div>
<img id="output" style=" width: 400px; height: 300px;" class=" medium ui image" src="img/image.png" />
</div>

</td>
<td>


<table border="1" class="ui celled table" style="width: 800px; text-align: center;" >
	<tr>
		<th>메뉴이름</th>
		<td colspan="2">
		<div class="ui input">
		<input type="text" name="menu_name" required="required"/>
		</div>
		</td>
	</tr>
	<tr>
		<td rowspan="4">메뉴특성</td>
		<td>주재료</td> 
		<td>
		<select name="cateCode" class="ui dropdown" >
		<c:forEach items="${lists2}" var="dto">
			<option label="${dto.attr}" value="${dto.code}"/>
		</c:forEach>
		</select>
		
		</td>
	</tr>
	<tr>
		<td>조리방식</td>
		<td>
		<select name="cookCode" class="ui dropdown">
		<c:forEach items="${lists3}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>매움정도</td>
		<td>
		<select name="spicyCode" class="ui dropdown">
		<c:forEach items="${lists4}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>온도</td>
		<td>
		<select name="tempCode" class="ui dropdown" >
		<c:forEach items="${lists5}" var="dto">
		<option label="${dto.attr}" value="${dto.code}" />
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
	<td>가격</td><td colspan="2">
	<div class="ui input">
	<input type="text" name="price" value="숫자만 입력해주세요" required="required" class="price1" style="text-align: center;" />
	</div>
	</td>
	</tr>
</table>
</td>
</tr>
</table>



<div id="all">

<form action="ac_ResListAdd.do" method="post" id="newMenu" enctype="multipart/form-data" onsubmit="return chekMenu('<%=res_seq%>')">
<input type="hidden" name="res_seq" value="<%=res_seq%>" />
<table id="shopDiv">
<!-- 사진 올라갈곳 -->
<tr>
<td>
<div>
<div class="ui input"  style="padding-bottom: 20px;">
<input type="file" accept="image/*" required="required" name="uploadFile" id="upload" onchange="loadfile(event)" class="ui basic button" />
</div>
<img id="outputs" style=" width: 700px; height: 500px;" class=" medium ui image" src="img/image.png"/>
</div>
</td>
<!-- 입력 부분 -->
<td>
<table border="1" class="ui celled table" style="width: 710px; text-align: center;">

	<tr>
		<td colspan="2" style="text-align: center;"><h1>식당 등록 하기</h1></td>
	</tr>
<tr>
	<th>식당명</th>
	<td>
	<div class="ui input">
	<input type="text" name="name" required="required" />
	</div>
	</td>
</tr>
<tr>
	<th>업종</th>
	<td>
	
	<select name="cate" class="ui dropdown">
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
	<td>
	<div class="ui input">
	<input type="text" name="addr" required="required" />
	</div>
	</td>
</tr>

	<tr>
		<th>영업시간</th>
		<td>
		<!-- 영업시간 -->
			<select name="S_hour" class="ui dropdown">
				<c:forEach begin="0" end="23" var="i">
				<option label="${i}" value="${i}">
				</c:forEach>
			</select> : 
			<select name="S_min" class="ui dropdown">
				<c:forEach begin="0" end="59" var="i">
				<option label="${i}" value="${i}">
				</c:forEach>
			</select>
			~
			<select name="E_hour" class="ui dropdown">
				<c:forEach begin="0" end="23" var="i">
				<option label="${i}" value="${i}">
				</c:forEach>
			</select> : 
			<select name="E_min" class="ui dropdown">
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
			<select name="Rs_hour" class="ui dropdown">
				<c:forEach begin="0" end="23" var="i">
				<option label="${i}" value="${i}">
				</c:forEach>
			</select> : 
			<select name="Rs_min" class="ui dropdown">
				<c:forEach begin="0" end="59" var="i">
				<option label="${i}" value="${i}">
				</c:forEach>
			</select>
			~
			<select name="Re_hour" class="ui dropdown">
				<c:forEach begin="0" end="23" var="i">
				<option label="${i}" value="${i}">
				</c:forEach>
			</select> : 
			<select name="Re_min" class="ui dropdown">
				<c:forEach begin="0" end="59" var="i">
				<option label="${i}" value="${i}">
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
	<td>
	<div class="ui input">
	<input type="text" value="- 를 포함하여 입력해주세요" name="call" required="required" class="reset" style="text-align: center;"  />
	</div>
	</td>
	</tr>

	<tr>
		<th>주차가능여부</th>
		<td>
			<select name="parking" class="ui dropdown">
				<option label="가능" value="Y">
				<option label="불가능" value="N">
			</select>
		</td>
	</tr>
	
	<tr>
		<th>식당 설명</th>
		<td>
		
		<textarea rows="10" cols="80" name="comment" required="required"></textarea>
		</td>
	</tr>
	
	<tr>
		<td colspan="8" style="text-align: right;">
			
			<div class="ui animated button" onclick="AddMenu()" tabindex="0" style="width: 300px;">
  			<div class="visible content">메뉴 추가</div>
  			<div class="hidden content"> 하단에 메뉴 등록창이 추가됩니다.</div>
			</div>
			
			
			<div class="ui animated button" onclick="action()" tabindex="0" style="width: 300px;">
  			<div class="visible content">식당 등록 완료!</div>
  			<div class="hidden content">로그인 페이지로 이동합니다.</div>
			</div>
		</td>
	</tr>
	
</table>
</td>
</table>

<hr id="line"/>

</form>

</div>

</body>
</html>