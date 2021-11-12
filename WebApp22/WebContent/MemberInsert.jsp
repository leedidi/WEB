<%-- 
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
    request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
 --%>
<%-- <%
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
MemberList.jsp를 요청할 수 있도록 안내
<jsp:forward page="MemberList.jsp"></jsp:forward> --%>



<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
    request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
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