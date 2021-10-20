<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신
	String s1 = request.getParameter("su1");
	String s2 = request.getParameter("su2");
	
	// 수신된 데이터 형 변환
	int n1 = Integer.parseInt(s1);
	int n2 = Integer.parseInt(s2);
	
	// 테이블 안에서 1씩 증가시켜 나갈 변수 선언 및 초기화
	int n=0;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습05</h1>
	<hr>
	<p>Table.jsp ○ → Table_ok.jsp ●</p>
</div>

<div>
	<table border="1"> 
		<!--@ 일케 스크립릿 영역 만들면 자바코드 사용 가능  -->
		<%
		for (int i=0; i<n2; i++)
		{
		%>
			<tr>
			<%
			for (int j=0; j<n1; j++)
			{
			%>
				<!--@ %=는 표현식 -->
				<td style="width: 40px; text-align: right;"><%=++n %></td>
			<%
			}
			%>
			</tr>
		<%
		}
		%>	
	</table>
	
</div>





</body>
</html>

















