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
<title>MemberList.jsp</title>
</head>
<body>

<div>
	<h1>JSTL Core 문제</h1>
	<h2>회원 명단 출력</h2>
</div>

<div>
	<!-- 5명의 이름, 전화번호, 주소 출력 --> 
</div>


<c:forEach var="dto" items="${lists }">
<tr>
	<td style="text-align: center;">${dto.name }</td>
	<td style="text-align: center;">${dto.age }</td>
</tr>
</c:forEach>


<div>

	<table class="table">
		<tr>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
		
		<!-- 컬렉션 객체 접근용(출력용) 반복문 구성 -->
		『<c:forEach var="변수" items="컬렉션"></c:forEach>』
		
		<c:forEach var="dto" items="${lists }">
		<tr>
			<td>${dto.name }</td>
			<td>${dto.tel }</td>
			<td>${dto.add }</td>
		</tr>
		</c:forEach>
	
	</table>
</div>



</body>
</html> --%>
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
<title>MemberList.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">
</head>
<body>

<div>
   <h1>JSTL Core 문제</h1>
   <h2>회원 명단 출력</h2>
</div>

<div>
   <!-- 5명의 이름, 전화번호, 주소 출력 -->
   <table class="table">
      <tr>
         <th style="color: pink; background-color: ivory;">이　　름</th>
         <th style="color: pink; background-color: ivory;">전화번호</th>
         <th style="color: pink; background-color: ivory;">주　　소</th>
      </tr>
      
      <c:forEach var="dto" items="${lists }">
         <tr>
            <td style="text-align: center;">${dto.name }</td>
            <td style="text-align: center;">${dto.tel }</td>
            <td style="text-align: center;">${dto.addr }</td>
         </tr>
      </c:forEach>
   </table>
</div>

</body>
</html>