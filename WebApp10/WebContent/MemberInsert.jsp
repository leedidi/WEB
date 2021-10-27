<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	
	// 이전 페이지로부터 데이터 수신
	//-- 데이터 입력 액션 처리 페이지
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	MemberDAO dao = null;
	
	try
	{
		dao = new MemberDAO();
		
		// MemberDTO 구성
		MemberDTO member = new MemberDTO();
		member.setName(userName);
		member.setTel(userTel);
		
		// dao 의 add() 메소드 호출
		//@ 와 기억 안나...ㅠ^ㅠ 복습하고가야할듯 여기...
		dao.add(member);
		
		// insert 액션의 정상 처리여부 확인 후 추가 코드 구성 가능~!!!
		
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







