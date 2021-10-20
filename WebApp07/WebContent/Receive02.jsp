<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%
// 내가 작성한 코드 -> 확인 완료! 돌아감 ^_^
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String scoreKorStr = request.getParameter("scoreKor");
	String scoreEngStr = request.getParameter("scoreEng");
	String scoreMatStr = request.getParameter("scoreMat");

	int scoreKor = Integer.parseInt(scoreKorStr);
	int scoreEng = Integer.parseInt(scoreEngStr);
	int scoreMat = Integer.parseInt(scoreMatStr);
	
	int scoreSum = scoreKor+scoreEng+scoreMat;
	double scoreAvg = (scoreKor+scoreEng+scoreMat)/3;
	
%> --%>

<% 
	// Send02.html 페이지로부터 데이터 수신
	request.setCharacterEncoding("UTF-8");

	String userName= request.getParameter("userName");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	int kor, eng, mat;
	kor=eng=mat=0;
	
	int tot=0;
	double avg = 0;
	
	// 요기 보충하기! -> 보충 완료
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
		
		tot = kor + eng + mat;
		avg = tot / 3.0;
		//@ 실수연산이니까 나누기 3.0!
		
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
<title>Receive02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {color: blue; font-weight: bold; font-size: 15pt;}
</style>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 02</h1>
	<hr>
</div>

<%-- <!-- 내가 작성한 코드 -->
<div>
	<h2>데이터 확인</h2>
	  <span style="color: purple;"><%=userName %></span>님, 성적 처리가 완료되었습니다.<br>
      회원님의 점수는 국어:<%=scoreKor %>점, 영어:<%=scoreEng %>점, 수학:<%=scoreMat %>점 입니다.<br>
      총점은 <%=scoreSum %>점, 평균은 <%=scoreAvg %> 입니다.
</div> --%>

<div>
	  <span><%=userName %></span>님, 성적 처리가 완료되었습니다.<br>
      회원님의 점수는 국어:<span><%=kor %></span>점, 영어:<span><%=eng %></span>점, 수학:<span><%=mat %></span>점 입니다.<br>
      총점은 <span><%=tot %></span>점, 평균은 <span><%=String.format("%.1f", avg) %></span> 입니다.
</div>

</body>
</html>