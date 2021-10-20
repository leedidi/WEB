<%@ page contentType="text/html; charset=UTF-8"%>
<%
//@ 보내는 페이지는 HTML이라도, 받는 페이지는 JSP....
//@ 보내는 페이지도 정적이 아니라, 뭔가를 받는 페이지로 구성하면 JSP여야함! 
//@ 그냥 정해진 메뉴면 HTML이어도 되지만,
//@ 월요일은 월요일, 화요일은 화요일... 메뉴판 달라야 하면 HTML이 아니라 JSP여야 한다는 것!
	
	// Send01.html 로부터의 데이터 수신(→ 스크립트 릿 영역)
	
	// 한글 수신을 위한 인코딩 방식 지정
	//@ Web의 기본 인코딩 구성이 UTF-8
	//-- 웹은 UTF- 을 기본 인코딩 방식으로 삼고 있음.
	//   그러므로 기본 설정을 UTF-8 로 구성하는 것이 좋음.
	//   (하지만, 데이터를 전송하는 페이지에서 EUC-KR 과 같이 다른 인코딩 방식으로
    //    처리하고 있는 상황이라면... 그에 다른 인코딩 방식이 지정되어야 한글 깨지지 않음
    //    또한, 지금 하고 있는 이 처리는... 데이터를 수신하는 처리보다
    //    먼저 수행되어야 한글이 깨지지 않은 상태로 수신할 수 있음.)
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 01</h1>
	<hr>
</div>

<div>
	<h2>가입 확인</h2>
	<span style="color: blue;"><%=userName %></span> 님,
	회원 가입이 완료되었습니다. <br>
	회원님께서 등록하신 전화번호는
	<span style="color: red;"><%=userTel %></span> 입니다.<br>
</div>

</body>
</html>














