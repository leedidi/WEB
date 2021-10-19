/*=======================
	 Test005.java
	- Servlet 실습
========================*/

// 현재... 자바의 기본 클래스 Test005
// 이를 Servlet 으로 구성하는 방법

// HttpServlet 을 상속받는 클래스로 설계 → Servlet

//@@@ WEB-INF에 만들지 말고, WEB을 WEP으로 만드는 경우 다수니 주의주의!!!

package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test005 extends HttpServlet
{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// get 방식의 요청에 대해 호출되어 실행되는 메소드
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// post 방식의 요청에 대해 호출되어 실행되는 메소드
		doGetPost(request, response);
	}
	
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// get 방식이든 post 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		// request → 요청 객체 → 클라이언트로부터 서버로...
		// request 객체에 대한 세팅 → 인코딩 방식 → 한글 깨짐 방지 처리
		//@ 한글이면 이거 반드시 해줘야 함! 나중에 필터 사용할 때까지...
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		
		// response → 응답 객체 → 서버로부터 클라이언트로...
		response.setContentType("text/html; charset=UTF-8");
		
		String str = "아이디 : " + id + ", 패스워드 : " + pwd;
		
		// 응답을 출력 스트림으로 구성하기 위한 준비
		PrintWriter out = response.getWriter();
		//@ 응답하기위해.. 얻어낼거야. 쓰는 걸...(출력스트림)
		//@ printWriter 타입 반환
		
		// 출력 스트림을 활용해서 페이지 렌더링
		/*
		 * 앞으로 이렇게는 하지 않을 거! 그냥 과정이해위해 해본것... 다만 출력스트림개념은 알아야함
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.print("<head>");
		out.print("<meta charset=\"UTF-8\">");
		out.print("<title>");
		out.print("Test005.java");
		out.print("</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<div>");
		out.print("<h1>");
		out.print("서블릿 관련 실습");
		out.print("</h1>");
		out.print("<hr>");
		out.print("</div>");
		out.print("<div>");
		out.print("<h2>");
		out.print("HttpServlet 클래스를 활용한 서블릿 테스트");
		out.print("</h2>");
		out.print("<p>" + str + "</p>");
		out.print("</div>");
		out.print("</body>");
		out.print("</html>");
		*/
		
		//@ 새 파일 만들어서 html에 만든 후, cntl+shift+a 눌러서 전체 붙여넣기
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.print("<head>");
		out.print("<meta charset=\"UTF-8\">");
		out.print("<title>Test005.java</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("");
		out.print("<div>");
		out.print("	<h1>서블릿 관련 실습</h1>");
		out.print("	<hr>");
		out.print("</div>");
		out.print("");
		out.print("<div>");
		out.print("	<h2>HttpServlet 클래스를 활용한 서블릿 테스트</h2>");
		out.print(" <p> " + str + "</p>");
		out.print("</div>");
		out.print("");
		out.print("</body>");
		out.print("</html>");

		
		
		
		
	}


}








