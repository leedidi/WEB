<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	request.setAttribute("result", "이중호테스트");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test3.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>EL 관련 실습</h1>
	<hr>
</div>

<div>
	<form method="post">
		정수1 <input type="text" name="su1" class="txt"><br>
		정수2 <input type="text" name="su2" class="txt"><br>
		<button type="submit" class="btn">결과 확인</button>
	</form>
</div>

<div>
	<h2>폼 데이터 수신</h2>
	
	<!-- 폼의 데이터를 수신하는 방법 1 -->
	<h3><%=request.getParameter("su1") %></h3>
	
	<!-- 폼의 데이터를 수신하는 방법 2 -->
	<h3>${param.su2 }</h3>
</div>

<div>
	<h2>폼의 데이터를 받아 연산 수행</h2>
	
	<!-- 폼의 데이터를 받아 연산을 수행하는 방법 1 -->
	<%
		String s1 = request.getParameter("su1");
		String s2 = request.getParameter("su2");
		
		int s = 0;
		
		if(s1 != null && s2 != null)
			s = Integer.parseInt(s1) + Integer.parseInt(s2);
	%>
	<h3>합 : <%=s %></h3>
	
	<%-- ${} --%> <!-- @@@ <- 이걸 <!... 이주석 쓰면 서블릿컨테이너 눈에 보임! 근까 jsp주석 쓰기! --> 
	
	<!-- 폼의 데이터를 받아 연산을 수행하는 방법 2 -->
	<h3>합 : ${param.su1 + param.su2 }</h3>
	<!-- → 파라미터 수신도 알아서... -->
	<!-- → 필요한 캐스팅도 알아서 자동으로 수행 -->
	<!-- → null 을 대하는 방식 check~!!! -->
</div>
<br><br>

<div>
	<h2>setAttribute() 로 넘긴 데이터 수신</h2>
	
	<!-- setAttribute() 로 넘긴 데이터를 수신하는 방법 1-->
	<h3><%=request.getAttribute("result") %></h3>
	
	<!-- setAttribute() 로 넘긴 데이터를 수신하는 방법 1-->
	<h3>${result }</h3>
</div>


</body>
</html>









