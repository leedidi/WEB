<%@ page contentType="text/html; charset=UTF-8"%>
<%
	/*
	// 내가 작성한 코드
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("userId");
	String password = request.getParameter("userPwd");
	String name = request.getParameter("userName");
	String tel = request.getParameter("userTel");
	
	String gender = request.getParameter("userGender");
	String city = request.getParameter("userCity");
	
	String[] subjectArr = request.getParameterValues("userSubject");
	
	String subject = "";
	
	if(subjectArr != null)
	{
		for(String item : subjectArr)
			subject += " [ " + item + " ]";
	}
	*/
	
	// 데이터 수신 (Send04.html → Receive04.jsp)
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	String userGender = request.getParameter("userGender");
	String userCity = request.getParameter("userCity");
	
	// check~!!!
	String[] userSubject = request.getParameterValues("userSubject");
	
	String subjectStr = "";
	
	if (userSubject != null)
	{
		for (int i=0; i<userSubject.length; i++)
		{
			subjectStr += " [" + userSubject[i].toString() + "]";
		}
	}
	
	// ※ 추후에는 수신된 데이터를... 쿼리문을 통해 DB 에 입력하는
	//    처리 과정 등이 포함될 것임을 염두하며 작업을 진행할 수 있도록 하자.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습04</h1>
	<hr>
</div>

<%-- <div>
	// 내가 작성한 코드
	아이디 : <%=id %><br>
	패스워드 : <%=password %><br>
	이름 : <%=name %><br> 
	전화번호 : <%=tel %><br>
	성별 : <%=gender %><br>
	지역 : <%=city %><br>
	수강과목 : <%=subject %>
</div> --%>

<div>
	<h2>가입 승인 내역</h2>
	
	<!-- <p>아이디 : superman</p> -->
	<p>아이디 : <%=userId %></p>
	
	<!-- <p>패스워드 : 1234</p> -->
	패스워드 : <%=userPwd %>
	
	<!-- <p>이름 : 윤유동</p> -->
	<p>이름 : <%=userName %></p>
	
	<!-- <p>전화번호 : 010-1111-1111</p> -->
	<p>전화번호 : <%=userTel %></p>
	
	<!-- <p>성별 : 여성</p> -->
	<p>성별 : <%=userGender %></p>
	
	<!-- <p>지역 : 서울</p> -->
	<p>지역 : <%=userCity %></p>
	
	<!-- <p>수강과목 : [자바기초] [오라클중급]</p> -->
	<p>수강과목 : <%=subjectStr %></p>
</div>

</body>
</html>




















