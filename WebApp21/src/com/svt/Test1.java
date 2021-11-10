/*================
 	Test1.java
=================*/

package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test1 extends HttpServlet
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
		// ①
		/*
		String name = "홍길동";
		String age = "19";
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html>");
		pw.println("<body>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");
		pw.println("</body>");
		pw.println("</html>");
		*/
		
		//②
		
		// 『ServletConfig』
		//-- 컨테이너가 서블릿을 초기화할 때
		//   서블릿 당 하나씩 ServletConfig 을 생성하게 된다.
		ServletConfig config = getServletConfig();
		
		// 『web.xml』 에 『<init-param>』 추가 가능	
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		/*
		//@ 어디주석처리해야하는지 다시 확인하기... -> 확인 완료
		  @ 아래쪽에 다시 쓰기 위해서 주석 처리함!
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		*/
		
		// ③
		//@ ServletConfig: 환경값 설정, 전달 형태로 쓰고
		//@ ServletContext: 값들을 전달하는 건 ServletContext를 더 많이 씀!
		//-- ServletConfig 은 서블릿에 대한 환경을 설정하는 과정에서
		//   필요한 값들을 전달하는 형태로 주로 사용된다면
		//   ServletContext 는 서블릿에서 활용되는 컨텍스트를
		//   구성하는 형태로 활용된다.
		ServletContext context = getServletContext();
		
		// 『web.xml』 에 『<context-param>』 사용 가능
		String type = context.getInitParameter("type");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		
		pw.println("<html>");
		pw.println("<body>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");
		
		// 『web.xml』 에 『<context-param>』 사용 가능
		pw.println("<h1>type : " + type + "</h1>");
		
		pw.println("</body>");
		pw.println("</html>");
		
	
	}

}











