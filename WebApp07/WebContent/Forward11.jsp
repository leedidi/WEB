<%@ page contentType="text/html; charset=UTF-8"%>
<% 
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
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward11.jsp</title>
</head>
<body>

<%-- 
// 내가 작성한 코드
<div>
	<jsp:forward page="Receive11.jsp"></jsp:forward>
</div>
 --%>
 
<jsp:forward page="Receive11.jsp"></jsp:forward>


</body>
</html>










