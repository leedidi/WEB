<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// Redirect12.jsp
	
	/*
	// 이전 페이지(Send11.html)로부터 데이터(num1, num2, calResult) 수신
	
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String calResult = request.getParameter("calResult");
	
	String result= "";
	if(calResult.equals("1"))		// 더하기
		result = String.format("%d + %d = %d", num1, num2, (num1+num2));
	else if(calResult.equals("2"))	// 빼기
		result = String.format("%d - %d = %d", num1, num2, (num1-num2));
	else if(calResult.equals("3"))	// 곱하기
		result = String.format("%d * %d = %d", num1, num2, (num1*num2));
	else if(calResult.equals("2"))	// 빼기
		result = String.format("%d / %d = %.1f", num1, num2, (num1/(double)num2));	
	
	request.setAttribute("resultStr", result);
	
	//@ <jsp:forward page="Receive11.jsp"></jsp:forward> 요고 대신 사용!
	// check~!!!
	//@ 11이랑 비교해서 이거 두줄 있는 것! 아래 JSP 다 없어도 됨~!(삭제해버림) 자바 코드만 사용하면 됨
	RequestDispatcher dispatcher = request.getRequestDispatcher("Receive11.jsp");
	dispatcher.forward(request, response);
	*/
	
%>

<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html> -->