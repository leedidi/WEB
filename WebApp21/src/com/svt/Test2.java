/*=================
    Test2.java
==================*/

package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test2 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		String str = "이름은 " + name + "이며, 나이는 " + age + "세 입니다.";
		
		//@ 요기 다 쓴 거 맞나? 확인하기 -> 맞는 듯!
		// str 넘기기
		request.setAttribute("result", str);
		//-- 포워딩하는 페이지에 값을 넘기기 위한 준비(설정)
		//   즉, str 값을 result 라는 이름으로 Test2_result.jsp 로 넘길 준비
		
		// 포워딩~!!!
		RequestDispatcher rd = request.getRequestDispatcher("/Test2_result.jsp");
		rd.forward(request, response);
	}
}










