<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//@ 로그인 안할 시 이 페이지 들어올 수 없게...
	//@ userId 식별된 사람들만 페이지 이용 가능하게 함
	String userId = (String)session.getAttribute("userId");

	if(userId==null)
		response.sendRedirect("TestSession01.jsp");

	// 세션 아이디 (get)
	String sid = session.getId();
	int t = session.getMaxInactiveInterval();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sce.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>세션 처리 내용 확인</h1>
	<hr>
</div>

<div>
	<h2>여기는 일정관리 페이지</h2>
	<h3>로그인한 사용자의 일정이 보이는 페이지</h3>
	<h3>내부적으로 처리되는 세션아이디 : <%=sid %></h3>
	<h3>현재 세션이 유지되는 시간으로 설정된 값 : <%=t %></h3>
</div>



</body>
</html>








