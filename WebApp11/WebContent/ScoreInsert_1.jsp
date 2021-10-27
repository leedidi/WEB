<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	
	// 이전 페이지로부터 데이터 수신
	//-- 데이터 입력 액션 처리 페이지
	
	request.setCharacterEncoding("UTF-8");
	
	String uName = request.getParameter("userName");
	String uKor = request.getParameter("scoreKor");
	String uEng = request.getParameter("scoreEng");
	String uMat = request.getParameter("scoreMat");
	
	ScoreDAO_1 dao = null;
	
	try
	{
		dao = new ScoreDAO_1();
		
		ScoreDTO_1 score = new ScoreDTO_1();
		score.setName(userName);
		score.set(scoreEng);
		score.setTel(scoreMat);
		score.set
		
		dao.add(score);
		
		score.Insert("";)
	}
	
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	finally
	{
		try
		{
	dao.close();
		}
		catch(Exception e)
		{
	System.out.println(e.toString());
		}
	}
	
	// URL 주소가 기록되어 있는 쪽지를 사용자에게 전달
	// (여기를 찾아가렴~)
	response.sendRedirect("MemberList.jsp");
%>