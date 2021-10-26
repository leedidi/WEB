<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%
	// 결과값 변수
	String str = "";
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비 (select)
	String sql = ""

%> --%>
<%

	String str = "";
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비 (select)
	String sql = "SELECT SID, NAME, KOR, ENG, MAT"
	           + ", (KOR+ENG+MAT) AS TOT"
	           + ", (KOR+ENG+MAT)/3 AS AVG"
	           + " FROM TBL_SCORE ORDER BY SID";
	
	// 작업객체 생성 및 쿼리문 실행
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	// ResultSet 처리 → 반복문 구성
	str += "<table class='table'>";
	str += "<tr><th>번호</th>";
	str += "<th>이름</th>";
	str += "<th>국어점수</th>";
	str += "<th>영어점수</th>";
	str += "<th>수학점수</th>";
	str += "<th>총점</th>";
	str += "<th>평균</th></tr>";
	
	while(rs.next())
	{
		str += "<tr>";
		str += "<td>" + rs.getString("SID") + "</td>";
		str += "<td>" + rs.getString("NAME") + "</td>";		
		str += "<td class='txtNum'>" + rs.getString("KOR") + "</td>";		
		str += "<td class='txtNum'>" + rs.getString("ENG") + "</td>";		
		str += "<td class='txtNum'>" + rs.getString("MAT") + "</td>";		
		str += "<td class='txtNum'>" + rs.getString("TOT") + "</td>";		
		str += "<td class='txtNum'>" + String.format("%.1f", rs.getDouble("AVG")) + "</td>";		
		str += "</tr>";
	}
	
	str += "</table>";
	
	rs.close();
	stmt.close();
	DBConn.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.txtNum {text-align: right;}
	.errMsg {font-size: small; color: red; display: none;}
</style>
<script type="text/javascript">

/* 	function formCheck()
	{
		// 확인
		//alert("함수 호출 확인");
		
		var uName = document.getElementById("userName");
		var uKor = document.getElementById("scoreKor");
		var uEng = document.getElementById("scoreEng");
		var uMat = document.getElementById("scoreMat");
		
		var nameMsg = document.getElementById("nameMsg");
		var korMsg = document.getElementById("korMsg");
		var engMag = document.getElementById("engMsg");
		var matMag = document.getElementById("matMsg");
		
		nameMsg.style.display = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if (uName.value == "")
		{
			nameMsg.style.display = "inline";
			uName.focus();
			return false;
		}
		
		if (uKor.value == "" || isNaN(uKor.value) 
				|| Number(uKor.value)<0 || Number(uKor.value)>100 )
		{
			korMsg.style.display = "inline";
			uKor.focus();
			return false;
		}
		
		//@else if 아님! 독립적인 else로...
		if (uEng.value == "" || isNaN(uEng.value) 
				|| Number(u.value)<0 || Number(uEng.value)>100 )
		{
			engMsg.style.display = "inline";
			uEng.focus();
			return false;
		}
		
		//@else if 아님! 독립적인 else로...
		if (uMat.value == "" || isNaN(uMat.value) 
				|| Number(u.value)<0 || Number(uMat.value)>100 )
		{
			matMsg.style.display = "inline";
			uMat.focus();
			return false;
		}
		
		return true;
		// 0~100 아닌거 뜨면 안넘어가야할거같은데 넘어감.. 
		// 뭔가 false가 안넘어가는 거 같은데? 체크해보기
	} */
	
	
	function formCheck()
	   {
	      //alert("확인");
	      
	      var uName = document.getElementById("userName");
	      var uKor = document.getElementById("scoreKor");
	      var uEng = document.getElementById("scoreEng");
	      var uMat = document.getElementById("scoreMat");
	      
	      var nameMsg = document.getElementById("nameMsg");
	      var korMsg = document.getElementById("korMsg");
	      var engMsg = document.getElementById("engMsg");
	      var matMsg = document.getElementById("matMsg");
	      
	      nameMsg.style.display = "none";
	      korMsg.style.display = "none";
	      engMsg.style.display = "none";
	      matMsg.style.display = "none";
	      
	      if(uName.value=="")
	      {
	         nameMsg.style.display = "inline";
	         uName.focus();
	         return false;
	      }
	      
	      if( uKor.value=="" || isNaN(uKor.value) 
	            || Number(uKor.value)<0 || Number(uKor.value) >100 )
	      {
	         korMsg.style.display = "inline";
	         uKor.focus();
	         return false;
	      }

	      if( uEng.value=="" || isNaN(uEng.value) 
	            || Number(uEng.value)<0 || Number(uEng.value) >100 )
	      {
	         engMsg.style.display = "inline";
	         uEng.focus();
	         return false;
	      }
	      
	      if( uMat.value=="" || isNaN(uMat.value) 
	            || Number(uMat.value)<0 || Number(uMat.value) >100 )
	      {
	         matMsg.style.display = "inline";
	         uMat.focus();
	         return false;
	      }
	      
	         return true;
	   }
	
</script>
</head>
<body>

<!-- 
	○ WebApp09
	
		- 여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
		  총점과 평균을 계산하여 출력해줄 수 있는 프로그램을 구현한다.
		- 리스트 출력 시 번호 오름차순 정렬하여 출력할 수 있도록 한다.
		- 데이터베이스 연동하여 처리한다.
		  (TBL_SCORE, SCORESEQ 활용)
		- 즉, 성적 처리 프로그램을 데이터베이스 연동하여
		  JSP 로 구성할 수 있도록 한다.
		  
	    데이터베이스 연결 및 데이터 처리
	    -------------------------------------------------------------------
	    성적 처리
	    
	    이름(*)  [ textbox ] → 이름 입력 확인
	    국어점수 [ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	    영어점수 [ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	    수학점수 [ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	    
	    < 성적 추가 > → button
	    
	    번호   이름   국어점수 영어점수 수학점수  총점  평균
	     1    이다영     90       80       70     xxx  xx.x
	     2    윤유동     80       70       60     xxx  xx.x
	     3    최수지     70       60       50     xxx  xx.x
	   
	 ○ WebApp09_scott.sql
	 	ScoreList.jsp
	    ScoreInsert.jsp
	    com.util.DBConn.java 
 -->

<!--@ 내가 코드짜기 어려우면.... 다른사람거 보는 연습이라도 하기,,,!!!! 
      안그러면 심리적으로 코드짜기 어려워 지이임 따흐흑 ㅠㅠ -->

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>

<!-- 
<div>
	<form>
		<table>
			<tr>
				<th>번호</th>
				<td>
			</tr>
		</table>
	</form>
</div>
       -->

<!--        
<div>
	<form>
		이름(*) <input type="text" id="userName" name="userName" class="txt"><br>
		국어점수 <input type="text" id="userName" name="userKor" class="txt"><br>
		영어점수 <input type="text" id="userName" name="userEng" class="txt"><br>
		수학점수 <input type="text" id="userName" name="userMat" class="txt">
		<br><br>
		
		<button type="submit" id="btnAdd" class="btn">성적 추가</button>
		<br><br>
	</form>
</div>
 -->

<div>
	<!-- 입력 폼 구성 -->
	<p>성적 입력</p>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="scoreKor" name="scoreKor" class="txt">
					<span class="errMsg" id="korMsg">0 에서 100 사이의 정수 입력</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="scoreEng" name="scoreEng" class="txt">
					<span class="errMsg" id="engMsg">0 에서 100 사이의 정수 입력</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="scoreMat" name="scoreMat" class="txt">
					<span class="errMsg" id="matMsg">0 에서 100 사이의 정수 입력</span>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left;">
					<input type="submit" value="성적 추가" class="btn"
					style="width: 50%; height: 50px; font-weight: bold;">
				</td>
			</tr>
		</table>
	</form>
</div>
<br><br>
 
 
<div>
	<!-- 리스트 구성 -->
	<p>성적 정보 리스트</p>
	<%=str %>
</div>
      
</body>
</html>



