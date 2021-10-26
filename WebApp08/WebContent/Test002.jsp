<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 결과값 변수
	String str = "";

	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();

	// 쿼리문 준비 (select)
	String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
	
	// 작업 객체 생성 및 준비된 쿼리문 수행
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	// 결과 ResultSet 에 대한 처리 → 반복문 구성
	str += "<table class='table'>";
	str += "<tr>";
	str += "<th id='numTitle'>번호</th>";
	str += "<th id='nameTitle'>이름</th>";
	str += "<th id='telTitle'>전화번호</th>";
	str += "</tr>";
	
	while(rs.next())
	{
		str += "<tr>";
		str += "<td class='list'>" + rs.getString("SID") + "</td>";
		str += "<td class='list'>" + rs.getString("NAME") + "</td>";
		str += "<td class='list'>" + rs.getString("TEL") + "</td>";
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
<title>Test002.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	#numTitle {width: 50px;}
	#nameTitle {width: 100px;}
	#telTitle {width: 160px;}
	.list {text-align: center;}
	input {width: 200px;}
	button {width: 208px; height: 50px; font-weight: bold;}
	.errMsg {font-size: samll; color: red; display: none;}
</style>
</head>
<body>

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>
<!-- 
<script type="text/javascript">

	// 필수 입력 항목(이름)에 대한 기본적인 확인
	function formCheck()
	{
		// 확인
		//alert("함수 호출 확인");
		
		// 뭔가....뭔가가 잘못된거같은뎅 ㅠㅠ 확인해보기! 빨간글자 뜸
		var uName = document.getElementById("userName");
		var uMsg = document.getElementById("nameMsg");
		
		nMsg.style.display = "none";
		
		if (uName.value == "")
		{
			nMsg.style.display = "inline";
			return false;
		}
		
		return true;
	}
	
</script> -->

<script type="text/javascript">

   // 필수 입력 항목에 대한 기본적인 확인
   function formCheck()
   {
      var uName = document.getElementById("userName");
      var nMsg = document.getElementById("nameMsg");
      
      nMsg.style.display = "none";
      
      if(uName.value == "")
      {
         nMsg.style.display = "inline";
         return false;
      }
      
      return true;
   }
</script>


<div>
	<!-- 데이터 입력 -->
	<!--@ 데이터 입력받는 데선 폼 구성, 클라이언트쪽에서 서버로 데이터 전송
	      이안에서 입력은 이름, 전화번호....
	      폼에서 액션처리하려면 스크립트로하던 서브밋으로하던 입력데이터 넘김
	      그쪽 페이지에서는 아마도 이 이름,전화번호를 넘겨받았지만 클라이언트 만날 필요 없음!
	      그쪽 페이지 say...너는 테스트 002다시가봐봐! 그럼 너가 원하는거얻을수 있을거야!
	      이건 바로 리다이렉트!  -->	
	<form action="MemberInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호(*)</th>
				<td>
					<input type="text" id="userTel" name="userTel" class="txt">
				</td>
			</tr>	
			<tr>
				<th></th>
				<td>
					<button type="submit" id="btnAdd" class="btn">데이터 추가</button>
				</td>
			</tr>		
		</table>
	</form>
</div>
<br><br>


<div>
	<!-- 처리 결과 -->
	<%=str %>
</div>


</body>
</html>




