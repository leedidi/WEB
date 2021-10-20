<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 내가 작성한 코드 -> 문제풀이 완료!^0^
	/*
	request.setCharacterEncoding("UTF-8");

	String nameStr = request.getParameter("name");
	String memoStr = request.getParameter("memo");
	String[] checkGroupArr = request.getParameterValues("checkGroup");
	
	String checkGroup = "";
	if (checkGroupArr != null)
	{
		for (String item : checkGroupArr)
		{
			checkGroup += " [" + item + "]";
		}
	}
	*/
	request.setCharacterEncoding("UTF-8");
	//@ 이거 맨앞에 있어야 함!
	
	// 이름 데이터 수신
	String name = request.getParameter("name");
	
	// 메모 데이터 수신
	String memo = request.getParameter("memo");
	//@ 이렇게만 하면 개행처리가 제대로 안 됨!
	memo = memo.replaceAll("\n", "<br>");
	//-- JDK 1.5 이후 『replaceAll()』 사용 가능.
	//   『replaceAll()』을 통해 처리한 결과물을 다시 memo 변수에 대입
	//   "안녕하세요\n반갑습니다\n홍길동입니다." → "안녕하세요<br>반갑습니다<br>홍길동입니다."
	
	// 이상형 데이터 수신
	//String checkGroup = request.getParameter("checkGroup");		// (Ⅹ)
	
	// ※ 같은 name 속성의 값을 가진 데이터를 여러개 받는 경우(다중 데이터로 수신하는 경우)
	//    이를 배열로 처리해야 한다. → 『getParameterValues()』
	
	String[] checkGroup = request.getParameterValues("checkGroup");
	
	//※ 배열 데이터를 수신하여 처리할 경우....
	//   수신된 데이터가 전혀 없는 경우는
	//   배열의 값 자체가 null 이 되어버리기 때문에
	//   null 에 대한 확인(검사) 과정이 필요하다.   check~!!!
	
	String str = "";
	
	if (checkGroup != null)
	{
		for (String item : checkGroup)
		{
			str += " [" + item + "]";
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBox_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습04</h1>
	<hr>
	<p>CheckBox.jsp ○ → CheckBox_ok.jsp ●</p>
</div>

<%--  내가 작성한 코드!
<div>
	<h2>결과 확인</h2>
	<div>
		<p> 이름 : <%=nameStr %></p>
		<p> 메모 : <%=memoStr%></p>
		<p> 이상형 : <%=checkGroup %></p>
	</div>
</div>
--%>

<div>
	<h2>수신 데이터 확인</h2>
	
	<!-- <h3>이름 : 장진하</h3> -->
	<h3>이름 : <%=name %></h3>
	
	<h3>메모</h3>
	<!-- <p>나는<br> 오타없이<br> 점점 타이핑이 빨라지고 있다.</p> -->
	<p><%=memo %></p>
	
	<!-- <h3>이상형 : [강동원] [옥택연]</h3> -->
	<h3>이상형 : <%=str %></h3>
	
	
</div>

</body>
</html>














