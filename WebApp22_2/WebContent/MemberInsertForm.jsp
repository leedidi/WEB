<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">
</head>
<body>
<div>
   <h1>회원 명단 입력</h1>
   <hr>
</div>

<div>
   <!-- 이름, 전화번호, 주소 * 5명 분 -->
   <!-- submit 액션 처리 -->
   
	<form action="MemberInsert.jsp" method="post">
	
		<b>1-5번 회원 입력</b><hr>
		<%--  @ 처음에 했던 부분
		<c:forEach var="array" begin="1" end="5" step="1">
	   		이름 <input type="text" name="name" class="txt">
	   		전화번호 <input type="text" name="tel" class="txt">
	   		주소 <input type="text" name="addr" class="txt">
	   		<hr>
   		</c:forEach>
   		--%>
		 		
	  <%--@ 방법 1 --%> 
	  <%-- <c:forEach var="member" begin="1" end="5" step="1">
         이　　름 : <input type="text" class="txt" name="name"><br>
         전화번호 : <input type="text" class="txt" name="tel"><br>
         주　　소 : <input type="text" class="txt" name="addr"><br><br>
               
      <button type="submit" class="btn">회원 정보 입력</button>
		 
      </c:forEach>  --%>
		    		
   		<%-- @ 방법 2 --%>		  
		<c:forEach var="count" begin="1" end="5" step="1">
   		<b>${count }번째</b>
   			이름 <input type="text" name="name${count }" class="txt">
	   		전화번호 <input type="text" name="tel${count }" class="txt">
	   		주소 <input type="text" name="addr${count }" class="txt">
	   		<hr>
   		</c:forEach>
   		<button type="submit" class="btn">회원 정보 입력</button>
		 



	</form>
</div>

</body>
</html>