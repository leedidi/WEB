<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%

	request.setCharacterEncoding("UTF-8");

	String su1Str = request.getParameter("su1");
	String su2Str = request.getParameter("su2");
	String giho = request.getParameter("giho");
	
	int su1 = Integer.parseInt(su1Str);
	int su2 = Integer.parseInt(su2Str);
	int result = 0;
	
	try
	{
		if (giho == "더하기")
			  result = su1+su2;
		if (giho == "빼기")
		  result = su1-su2;
		if (giho == "곱하기")
		  result = su1*su2;
		if (giho == "나누기")
		  result = su1/su2;
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
%> --%>

<%
	// 데이터 수신(num1 과 num2 는 형변환)
	//@ 한번에 하는건 편의상... str로 받아서 try~catch로 변환하는게 더 바람직한 코드!
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String op = request.getParameter("op");
	//@ value값 수신한다는거 주의!
	
	String result = "";
	if (op.equals("+"))
		result = String.valueOf(num1 + num2);
	else if(op.equals("-"))
		result = String.valueOf(num1 - num2);
	else if(op.equals("*"))
		result = String.valueOf(num1 * num2);
	else if(op.equals("/"))
	{
		//result = String.valueOf(num1 / num2);
		//result = String.valueOf(num1 / (double)num2);
		result = String.format("%.1f", num1/(double)num2);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {color: blue; font-weight: bold; font-size: 15pt;}
</style>
</head>
<body>

<%-- 
<div>
	<%=giho %>
	입력하신 <%=su1 %>와 <%=su2 %>의 연산 결과는 <%=result %> 입니다.
</div> 
--%>


<div>
	<h1>데이터 송수신 실습03</h1>
	<hr>
</div>

<div>
	입력하신 <span><%=num1 %></span>와 <span><%=num2 %></span>의 연산 결과는 <span><%=result %></span> 입니다.
</div>

</body>
</html>