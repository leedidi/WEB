/*=============
   Calc.java
==============*/

package com.test;

public class Calc
{
	// 주요 속성 구성
	private int su1;		//-- 피연산자1 (정수 형태)
	private String op;		//-- 연산자 (문자열 형태)
	private int su2;		//-- 피연산자2 (정수 형태)
	//@ 얘네 이름이 Calc.jsp의 name 과 같아야 함....
	//@ 실무팁) 얘네 이름에 앞에 두글자정도는 소문자로 꼭 넣어주기~!
	
	//@ 나중에 쿼리스트링으로 합쳐졌을때 한글자만 소문자, 혹은 소문자x 인 경우 알아서 setter 호출 못할수 있음
	//private String sName;
	//public void setSName()
	//@ 이렇게 되므로! SName 이 되어버림... -> strName => setStrName
	
	// 생성자 정의하지 않음(사용자 정의 생성자 없음)
	// → default 생성자 자동 삽입
	
	
	// getter / setter 구성
	public int getSu1()
	{
		return su1;
	}
	public void setSu1(int su1)
	{
		this.su1 = su1;
	}
	public String getOp()
	{
		return op;
	}
	public void setOp(String op)
	{
		this.op = op;
	}
	public int getSu2()
	{
		return su2;
	}
	public void setSu2(int su2)
	{
		this.su2 = su2;
	}
	
	// 메소드 추가
	public String result()
	{
		String result = "";
		
		int s=0;
		if(op != null)
		{
			if(op.equals("+"))
				s = su1 + su2;
			else if(op.equals("-"))
				s = su1 - su2;
			else if(op.equals("*"))
				s = su1 * su2;
			else if(op.equals("/"))
				s = su1 / su2;
			
			result = String.format("%d %s %d = %d", su1, op, su2, s);
		}
		
		return result;
	}
	
	
}
