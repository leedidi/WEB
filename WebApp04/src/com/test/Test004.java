/*======================
     Test004.java
    - Servlet 실습
========================*/
/*
// 현재... 자바의 기본 클래스 Test004
// 이를 Servlet 으로 구성하는 방법

// GenericServlet 을 상속받는 클래스로 설계 → Servlet
//@@@ 여기 어딘가에 오타가 있었던 듯......!

package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

//public class Test004 implements Servlet

//@ GenericServlet은 추상... 추상클래스를 오버라이딩해줘야함
public class Test004 extends GenericServlet
{

	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html); charset=UTF-8");
		
		try
		{
			PrintWriter out = response.getWriter();
			
			out.print("<html>");
			out.print("<head>");
			out.print("<title>");
			out.print("Test004.java");
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
			out.print("GenericServelt 클래스를 이용한 서블릿 테스트");
			out.print("</h2>");
			out.print("</div>");
			out.print("</body>");
			out.print("</html>");
			//@ main class가 없음...!
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
}
*/

/*==========================
      Test004.java
      -Servlet 실습
==========================*/

// 현재 자바의 기본 클래스 Test004
// 이를 Servlet 으로 구성하는 방법 
// ▶ ① implements Servlet : implements → 처음부터 끝까지 구현해야함. 할 것이 많다.
// ▶ ② extends GenericServlet : service() 이용.
// ▶ ③ extends HttpServlet : 가장 쉽고 가장 많이 쓰인다.

// GenericServlet 을 상속받는 클래스로 설계 → Servlet
//@ cntl + m = 화면 커졌다가 켜졌다가 하게됨!
//@ end : 문장 맨 끝으로 가게 됨
//@ shift + end : 커서 뒷부분 블럭잡기
//@ shift + enter : 다음줄로 가기
package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Test004 extends GenericServlet 
{
   // ▶객체 직렬화 - 시리얼 넘버부여
   private static final long serialVersionUID = 1L;

   @Override
   public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException
   {
      response.setContentType("text/html; charset=UTF-8");
      
      try
      {
         PrintWriter out = response.getWriter();
         
         out.print("<html>");
         out.print("<head>");
         out.print("<title>");
         out.print("Test004.java");
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
         out.print("GenericServlet 클래스를 이용한 서블릿 테스트");
         out.print("</h2>");
         out.print("</div>");
         out.print("</body>");
         out.print("</html>");
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
      
   }

}














