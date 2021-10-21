<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	// 자기 자신 페이지로부터 데이터 수신 후 처리하는 부분
	//-> 여기는... 왼쪽 오른쪽 버튼(◀▶ 값을 수신해야 하나?)
			
	// Calender 객체 생성
	Calendar cal = Calendar.getInstance();
	
	// 현재 연, 월, 일 확인

	
	
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 08
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 단독 페이지로 구성한다.
	   
	   ◀ 2021년 10월 ▶
       
       ---------------------------
       ---------------------------
       
       - 『◀』 이나 『▶』 클릭 시
         해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
         //@ 2021년 12월에서 ▶ 누르면 2022년 1월로 가게...!
         //@ 2021년 1월에서  ◀ 누르면 2020년 12월로 가게...!
         //@ ◀▶ 그냥 링크로 잡기. a 태그로 잡으면 클릭 된다고 함
         
       - 사용자 최초 요청 주소는
         http://localhost:8090/WebApp07/SendAndReceive08.jsp 로 한다.
		
		//@ 이거 다 한다면 2021년 10월을 텍스트 박스로도 바꿀수 있을 듯...
		//@ 이거 나중에 같이 안 풀고 파이널 팀원들 내에서 풀 것임!
 -->


<div>
	<h1>데이터 송수신 실습 08</h1>
	<hr>
</div>
<br>

<div>
	<form action="" method="post">
	<a>◀</a>
	2021년 10월
	<a>▶</a>
	</form>
</div>
<br>

<div>
	<!-- 달력을 그리게 될 지점 -->
</div>

</body>
</html>





