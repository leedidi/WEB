<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 5개 파일 만들기
	// 오라클에서 null 존재... truncate 하고 새로 입력해서 만들기
	// 에밋 가지고 해결해보기!
	// 같이 해결 안 하고 팀원끼리 해 볼 것...
	
	StringBuffer str = new StringBuffer();
	ScoreDAO dao = null;
	
	String scoreCount = "<span id='scoreCount'>전체 인원 수 : ";
	
	try
	{
		dao = new ScoreDAO();
		
		scoreCount += dao.count() + "명</span>";
		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th>"
				+"<th>합계</th><th>평균</th></tr>");
		
		// dao 객체의lists() 호출
		for(ScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td class='record'>" + score.getSid() + "</td>");
			str.append("<td class='record'>" + score.getName() + "</td>");
			str.append("<td class='record'>" + score.getScoreKor() + "</td>");
			str.append("<td class='record'>" + score.getScoreEng() + "</td>");
			str.append("<td class='record'>" + score.getScoreMat() + "</td>");
			str.append("<td class='record'>" + score.getScoreTot() + "</td>");
			str.append("<td class='record'>" + String.format("%.2f",score.getScoreAvg()) + "</td>");
			str.append("</tr>");			
		}
		
		str.append("</table>");
		
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

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.errMsg {color: red; font-size: small; display: none;}
	.table {display: table;}
	.tr {display: table-row;}
	.tdsub {display: table-cell;}
	.tdcontent {display: table-cell;}
</style>
<script type="text/javascript">

	function formCheck()
	{
		//함수 확인
		//alert("함수 호출 확인");
		
		// 빨간 글씨 관련 코드
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
		
		if (uName.value=="")
		{
			nameMsg.style.display = "inline";
			uName.focus();
			return false;
		}
		
		if (uKor.value=="" || isNaN(uKor.value) || Number(uKor.value)<0 || Number(uKor.value)>100)
		{
			korMsg.style.display = "inline";
			uKor.focus();
			return false;
		}
		
		if (uEng.value=="" || isNaN(uEng.value) || Number(uEng.value)<0 || Number(uEng.value)>100)
		{
			engMsg.style.display = "inline";
			uEng.focus();
			return false;
		}
		
		if (uMat.value=="" || isNaN(uMat.value) || Number(uMat.value)<0 || Number(uMat.value)>100)
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

<div>
	<h1>성적 입력 실습</h1>
</div>



<!-- <div>
	<p>성적 입력</p>
	<form action= "MemberInsert.jsp" method="post" onsubmit="return formCheck()">
	<form action= "ScoreInsert_1.jsp" method="post" onsubmit="return formCheck()">
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
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="scoreEng" name="scoreEng" class="txt">
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="scoreMat" name="scoreMat" class="txt">
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left;">
					<input type="submit" value="성척 추가" class="btn">
			</tr>
		</table>
	</form>
</div>
 -->
 
 <div>
	<p>성적입력
		<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">			
		<table class="table">
				<tr>
					<th>이름(*)</th>
					<td>
						<input type="text" id="userName" name="userName" class="txt" >
						<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
					</td>
				</tr>
				<tr>
					<th>국어점수</th>
					<td>
						<input type="text" id="scoreKor" name="scoreKor" class="txt" >
						<span class="errMsg" id="korMsg">0 ~ 100 사이의 점수를 입력</span>
					</td>
				</tr>
				<tr>
					<th>영어점수</th>
					<td>
						<input type="text" id="scoreEng" name="scoreEng" class="txt" >
						<span class="errMsg" id="engMsg">0 ~ 100 사이의 점수를 입력</span>
					</td>
				</tr>
				<tr>
					<th>수학점수</th>
					<td>
						<input type="text" id="scoreMat" name="scoreMat" class="txt" >
						<span class="errMsg" id="matMsg">0 ~ 100 사이의 점수를 입력</span>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" value="성적추가" class="btn"
							style="width: 200px; height=50px; font-style: bold;">
					</td>
				</tr>
			</table>
		</form>
	</p>
</div>

<div>
	<p>성적 정보 리스트</p>
	<%=scoreCount %>
	<%=str.toString() %>
</div>

</body>
</html>