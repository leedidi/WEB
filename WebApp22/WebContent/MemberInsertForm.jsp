<%-- <%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertFrom.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSTL Core 문제</h1>
	<h2>회원 정보 입력</h2>
	<hr>
</div> --%>
<!-- 
<div>
	<form action="MemberInsert.jsp" method="post">
		이름, 전화번호, 주소 * 5명 분
		@ JSTL 이용
		submit 액션 처리
		회원 1 입력<br>
		이름 <input type="text" name="name1" class="txt"><br>
		전화번호 <input type="text" name="tel1" class="txt"><br>
		주소 <input type="text" name="add1" class="txt"><br><br>
		<hr>
		회원 2 입력<br>
		이름 <input type="text" name="name2" class="txt"><br>
		전화번호 <input type="text" name="tel2" class="txt"><br>
		주소 <input type="text" name="add2" class="txt"><br><br>
		<hr>
		회원 3 입력<br>
		이름 <input type="text" name="name3" class="txt"><br>
		전화번호 <input type="text" name="tel3" class="txt"><br>
		주소 <input type="text" name="add3" class="txt"><br><br>
		<hr>
		회원 4 입력<br>
		이름 <input type="text" name="name4" class="txt"><br>
		전화번호 <input type="text" name="tel4" class="txt"><br>
		주소 <input type="text" name="add4" class="txt"><br><br>
		<hr>
		회원 5 입력<br>
		이름 <input type="text" name="name5" class="txt"><br>
		전화번호 <input type="text" name="tel5" class="txt"><br>
		주소 <input type="text" name="add5" class="txt"><br><br>
		<hr>
		<button type="submit" class="btn">입력 완료</button>
	</form>
</div>
 -->
<!-- 
<div>
    <form action="MemberInsert.jsp" method="post">
 -->
      <!-- 이름, 전화번호, 주소 * 5명 분 -->
      <%-- <c:forEach var="count" begin="1" end="5" step="1">
	      <div>${count } 번째</div>
	      <div>
	         이름 : <input type="text" name="name${count }" class="txt">
	         전화번호 : <input type="text" name="tel${count }" class="txt">
	         주소 : <input type="text" name="add${count }" class="txt">
	      </div>
      </c:forEach> --%>
      <!-- submit 액션 수행 -->
<!--       <button type="submit" class="btn">입력 완료</button>
   </form>
</div>    

</body>
</html>
 -->
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
   <h1>회원 명단 출력</h1>
   <hr>
</div>

<div>

   <!-- 이름, 전화번호, 주소 * 5명 분 -->
   <!-- submit 액션 처리 -->

   <form action="MemberInsert.jsp" method="post">
      
      <c:forEach var="member" begin="1" end="5" step="1">
         이　　름 : <input type="text" class="txt" name="name"><br>
         전화번호 : <input type="text" class="txt" name="tel"><br>
         주　　소 : <input type="text" class="txt" name="addr"><br><br>
      </c:forEach> 
      
      <button type="submit" class="btn" style="width: 300px; background-color:ivory; color:pink; font-style:italic; font-size: 18pt;">입력</button>
   </form>
   
</div>

</body>
</html>