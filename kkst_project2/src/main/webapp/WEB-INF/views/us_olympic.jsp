<%@page import="com.pro.kkst.dtos.menuDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<% 
@SuppressWarnings("unchecked")
List<menuDto> lists = (List<menuDto>)request.getAttribute("lists");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
   *{
      padding : 0;
      margin : 0;
   }
   img{
      width: 300px;
      height: 200px;
      }   
   #form{
      width: 600px;
      height: 240px;
   }
      
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

<%!
   int count=0;
%>

	



   function load() {
      
      for (var i = 2; i < 32; i++) {
         $("#tab"+i).hide();
    
      }
      
      
      
      
      
   }
   function restart(){
         
      for (var i = 0; i < 32; i++) {
         $(".td"+i).show();
      }
      for (var i = 2; i < 32; i++) {
         $("#tab"+i).hide();
      }
      }
   
   function clickings(i,seq) {
      
      //0 , 짝수 일때 i+2 or i+3
      // 홀수 일때 i+1 or i+2
         
      var lists1 ="<%=lists.size()-1%>";
      var lists2 ="<%=lists.size()-2%>";
      
      if (i==0||i%2==0) {
         $(".td"+i).hide();
         $(".td"+(i+1)).hide();
         $("#tab"+(i+2)).show();
         $("#tab"+(i+3)).show();
         
         $("<input type='hidden' name='choiceSeq' />").appendTo("#fo").prop("value",seq);

         if(<%=lists.size()==2%>){
        	 location.href="us_winner.do?seq="+seq;
         }
         
         if(lists1==i||lists2==i){
         	$("#fo").css("display", "block");
         }   
         
//          arrays(seq);
      }      
      else if(i==1||i%2==1){
         $(".td"+(i-1)).hide();
         $(".td"+i).hide();
         $("#tab"+(i+1)).show();
         $("#tab"+(i+2)).show();

         $("<input type='hidden' name='choiceSeq' />").appendTo("#fo").prop("value",seq);

         if(<%=lists.size()==2%>){
        	 location.href="us_winner.do?seq="+seq;
         }
         
         if(lists1==i||lists2==i){
          	$("#fo").css("display", "block");
          }  
//          arrays(seq);
      } 
      

	}
      
      
   
</script>
</head>

<body onload="load()">

<h1>푸드올림픽<%=lists.size()==2?"결승":lists.size()+"강"%></h1>
<div id="form">
<table>
<tr>

		

         <%
            for (int i = 0; i < lists.size(); i++) {
         %>
         <td class="td<%=i%>">
            <table id="tab<%=i%>">
               <tr>
                  <td onclick="clickings(<%=i%>,<%=lists.get(i).getSeq()%>)">
                     <div id="choice<%=i%>">
                        <img src="img/food1.jpg" />
                     </div>
                  </td>
               </tr>
               <tr>
                  <td>
                     <div id="name<%=i%>">
                        <%=lists.get(i).getName()%>
                     </div>
                  </td>
               </tr>
            </table> <%
      } // for

%>
         </td>

      </tr>
   
</table>
</div>

<form action="us_nextOlympic.do" id="fo" style="display: none;">



<input type="submit" value="<%=lists.size()==2?"결승":(lists.size()/2==2?"준결승":lists.size()/2+"강")%>으로 가기" />

</form>

<input type="button" value="다시하기" onclick="restart()">

</body>
</html>