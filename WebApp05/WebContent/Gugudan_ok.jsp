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

<!-- html 주석문 -->
<%-- jsp 주석문... 이거는 이걸그린 친구가 이거 못보니까! 이거 html상에서 보이지 않음 
확장자 jsp인 친구만 가능. 그래서 확장자 jsp인경우에는 html주석문이 아니라 jsp주석문을 써야함! --%>

<%--
<%
	for(int i=1; i<=9; i++)
	{
		out.print(n + " * " + i + " = " + (n*i) + "<br>");
	}
%>
--%>


<%--@ 시각적으로 좀더 복잡하지만 좀더 확실히 구분해서 쓰려면 이 방법도 가능! --%>
<%
   for(int i=1; i<=9; i++) 
   {
%>
	<%=n %> * <%=i %> = <%=(n*i) %> <br>
<%
   } 
%>




</body>
</html>


























