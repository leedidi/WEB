<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역 → 이전 페이지로(RadioSelect.jsp)부터 전송된 데이터 수신
	
	/*
	// 내가 작성한 코드
	String name = request.getParameter("name");
	String sGender = request.getParameter("gender");
	String gender = "";
	String major;
	String hobby;
	*/
	
	request.setCharacterEncoding("UTF-8");				// check~!!! //@ 넘어오는 값에 한글 포함되면 인코딩하기!
	
	String nameStr = request.getParameter("name");			//-- 텍스트박스... 단일값 수신
	String genderStr = request.getParameter("gender");		//-- 라디오버튼... 단일값 수신
	String majorStr = request.getParameter("major");		//-- 선택상자... 단일값 수신
	String[] hobbyArr = request.getParameterValues("hobby");	
	//-- 다중 선택이 가능한 선택상자일 경우... 『getParameterValues()』 로 수신 → 배열 반환
	
	String gender = "";
    if(genderStr.equals("M"))
    	gender = "남자";
    else if(genderStr.equals("F"))
    	gender = "여자";
    else
    	gender = "확인불가";
    
    String hobby = "";
    
    //@ 배열 컨트롤 할때는, null인지 아닌지를 살펴봐야 안정적으로 가능!
    if (hobbyArr != null)
    {
    	for (String item : hobbyArr)
    	{
    		hobby += " [" + item + "]";
    	}
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습03</h1>
	<hr>
	<p>RadioSelect.jsp ○ → RadioSelect_ok.jsp ●</p>
</div>

<%--@ 완전히 구성하란 의미가 아니고, 과정 거쳐보기... 해보자! --%>
<div>
	<%--@@@ 테스트: <%=name %> --%>
	<h2>radio, select 데이터 수신 결과 확인</h2>
	
	<div>
		<!-- <p>이름 : 이윤서</p> -->
		<p>이름 : <%=nameStr %></p>
		
		<!-- <p>성별 : F(여자)</p> -->
		<p>성별 : <%=genderStr %>(<%=gender %>)</p>
		
		<!-- <p>전공 : 국문학</p> -->
		<p>전공 : <%=majorStr %></p>
		
		<!-- <p>취미 : [영화감상] [음악감상]</p> -->
		<p>취미 :<%=hobby %></p>
		<!--@ 앞에 이미 공백한칸 넣었기때문에! 그냥 붙였음 여긴! -->
	</div>

</div>


</body>
</html>