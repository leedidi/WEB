<%@page import="java.util.List"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%--@ 방법 1  --%>
<%-- 
<%

	String name[] = request.getParameterValues("name");
	String tel[] = request.getParameterValues("tel");
	String addr[] = request.getParameterValues("addr");
	
	List<MemberDTO> lists = new ArrayList<MemberDTO>();
	
	MemberDTO dto = null;
	
	for(int i=0; i<name.length; i++)
	{
	 	dto = new MemberDTO(name[i], tel[i], addr[i]);
		lists.add(dto); 
		/* dto = new MemberDTO(
        request.getParameter("name"+i)
       ,request.getParameter("tel"+i)
       ,request.getParameter("addr"+i)
       ); */
	}
	
	request.setAttribute("lists", lists);
%>
<jsp:forward page="MemberList.jsp"></jsp:forward>
--%>
<%-- 
<%
   // MemberInsert.jsp
   
   // 5명분 데이터 수신 → 객체 구성 → 자료구조 구성 → setAttribute()
   //                  MemberDTO
   
   List<MemberDTO> lists = new ArrayList<MemberDTO>();

   for (int i=1; i<=5; i++)
   {
      String name = request.getParameter("name"+i);
      String tel = request.getParameter("tel"+i);
      String addr = request.getParameter("addr"+i);
      
      MemberDTO dto = new MemberDTO(name, tel, addr);
      lists.add(dto);
   }
   
   request.setAttribute("lists", lists);
%>
<jsp:forward page="MemberList.jsp"></jsp:forward> --%>


<%--@ 방법 2...이렇게하면 안 나왔음 -> setAttribute를 빼먹었기 때문!^^  --%>
 <%

	// MemberInsert.jsp
	
	// 5명분 데이터 수신 → 객체 구성 → 자료구조 구성 → setAttribute()
	//                       MemberDTO
	
	
	List<MemberDTO> lists = new ArrayList<MemberDTO>();

	for(int i=1; i<=5; i++)
	{
		String name = request.getParameter("name"+i);
		String tel = request.getParameter("tel"+i);
		String addr = request.getParameter("addr"+i);
		
		// MemberDTO에 name, tel, addr 넣어줌
		MemberDTO dto = new MemberDTO(name, tel, addr);
		// list 에 dto 넣어줌 
		lists.add(dto);
	}
	
	request.setAttribute("lists", lists);
	//@ 아 여길 빼먹었었음................................아.........ㅠ^ㅠ이러니까 안나왔지........
	//@ 아 나온다 진짜 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
	
%> 
<%-- MemberList.jsp를 요청할 수 있도록 안내 --%>
<jsp:forward page="MemberList.jsp"></jsp:forward>

