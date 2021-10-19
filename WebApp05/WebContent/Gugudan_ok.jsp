<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
/*
	// 스크립트 릿 영역
	// 내가 작성한 코드
	
	// 이전 페이지로부터 넘어온 데이터(dan) 수신
	String str1 = request.getParameter("dan");

	int n = Integer.parseInt(str1);
	
	for(int i=0; i<=9; i++)
	{
	   System.out.println(n + " * " + i + " = " i*n);
	}
*/

	// 스크립트 릿 영역 → 이전 페이지(Gugudan.jsp)로부터 데이터 수신
	
	// 데이터 수신
	String danStr = request.getParameter("dan"); 
		
	int n = 0;	
	//String str = "";
	//@ 이렇게 str에 넣어서 한번에 보여줘도 상관없음!
	
	try
	{
		n = Integer.parseInt(danStr);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan_ok.jsp</title>
<link rel="stylesheet" type="text/css" gref="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습02</h1>
	<hr>
	<p>Gugudan.jsp ○ → Gugudan_ok.jsp ●</p>
</div>


<%
	for(int i=1; i<=9; i++)
	{
		out.print(n + " * " + i + " = " + (n*i) + "<br>");
	}
%>


</body>
</html>






