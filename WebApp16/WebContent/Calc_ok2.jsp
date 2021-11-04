<%@page import="com.test.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	/*
	//@ Calc_ok1.jsp
	String strSu1 = request.getParameter("su1");
	String strSu2 = request.getParameter("su2");
	String op = request.getParameter("op");
	
	int su1, su2 = 0;
	su1 = su2 = 0;
	String str = "";
	
	if(strSu1 == null || strSu2 == null)
	{
		response.sendRedirect("Calc.jsp");
	}
	else
	{
		su1 = Integer.parseInt(strSu1);
		su2 = Integer.parseInt(strSu2);
		
		Calc ob = new Calc();

		ob.setSu1(su1);
		ob.setSu2(su2);
		ob.setOp(op);
		
		str = ob.result();
		
	}
	*/	
%>

<%
	/*
	String strSu1 = request.getParameter("su1");
	int su1 = Integer.parseInt(strSu1);
	*/
%>

<!-- Calc 클래스의 객체를 현재 페이지에서 사용할 수 있도록 지정 -->
<!--//@ 이 클래스를 찾아서, ob라는 객체를 생성해 줘... -->
<!--//@ 스코프 안에서 식별자인 얘가 고유해야 하기 때문에 ID로 만들어 놓은 것일 뿐... 
	    엄밀히 따지면 여기도 name 이어야 하긴 함! -->
<jsp:useBean id="ob" class="com.test.Calc"></jsp:useBean>
<!-- 이 구문은 스크립 릿 영역에서
     『com.test.Calc ob = new com.test.Calc();』
     을 작성하여 import 구문을 자동으로 처리한 것과
     마찬가지의 효과를 적용하게 된다.  -->
     
<!-- request.getParameter() 메소드를 통해 넘겨받은(전달받은) 데이터
     (『Calc』 클래스를 기반으로 만들어진 『ob』 객체에
     넘겨주기 위한 속성 지정 -->
<%-- <jsp:setProperty property="su1" name="ob" value="<%=su1 %>"/>    --%> 
<!-- 이 구문은 Calc_ok1.jsp 의 『ob.setSu1(su1);』 과 같은 구문 -->     
     
<!-- check~!!!  -->     
<!-- 속성 이름과 동일한 파라미터인 경우
	 getParameter() 메소드 없이 바로 받을 수 있다.  -->   
    
<jsp:setProperty property="su1" name="ob" />
<!--//@ ob라는 객체가 있을거야, 그안에 su1이라는 속성이 있을테니, 그걸 담아줘(set)! 따로 명시 없으면
이전 페이지로부터 넘어온 이름같은 아이를 너가 찾아봐! -->
<!-- ① request.getParameter() 처리 -->
<!-- ② Integer.parseInt() 처리 → 매개변수를 전달하기 위한 형 변환 처리 -->
<!-- ③ ob.su1 → ob.setSu1() 처리 -->
<!--  ==> 최종적으로 ob → Calc 기반의 ob 객체의 su1 속성에
          이전 페이지로부터 넘겨받은 데이터를 적절한 타입(형)으로 전달 -->
<!--//@ 형변환까지... 이거 다 해줌. 이게 다 들어있는 결과임 -->
    
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="op" name="ob"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok2.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>두 번째 방법 처리 결과</h1>
	<hr>
</div>

<div>
	<!-- 결과 -->
	<h2><%=ob.result() %></h2>
</div>





</body>
</html>









