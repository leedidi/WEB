<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 5개 파일 만들기
	// 오라클에서 null 존재... truncate 하고 새로 입력해서 만들기
	// 에밋 가지고 해결해보기!
	// 같이 해결 안 하고 팀원끼리 해 볼 것...
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<script type="text/javascript">

	function formCheck()
	{
		//함수 확인
		alert("함수 호출 확인");
		
		// 빨간 글씨 관련은... 나중에 추가... 
		return true;
	}

</script>
</head>
<body>

<div>
	<h1>성적 입력 실습</h1>
</div>

<div>
	<p>성적 입력</p>
	<!-- <form action= "MemberInsert.jsp" method="post" onsubmit="return formCheck()"> -->
	<form action= "ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
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
					<input type="text" id="scoreKor" name="scroreKor" class="txt">
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

</body>
</html>