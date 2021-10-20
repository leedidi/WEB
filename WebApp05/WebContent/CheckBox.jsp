<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBox.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습04</h1>
	<hr>
	<p>CheckBox.jsp ● → CheckBox_ok.jsp ○</p>
</div>

	<form action="CheckBox_ok.jsp" method="post">
		이름 <input type="text" name="name" class="txt">
		<br>
		
		메모 <br>
		<textarea rows="5" cols="30" name="memo"></textarea>
		<br><br>
		
		이상형<br>
		<label><input type="checkbox" name="checkGroup" value="강동원">강동원</label>
		<label><input type="checkbox" name="checkGroup" value="한소희">한소희</label>
		<label><input type="checkbox" name="checkGroup" value="옥택연">옥택연</label>
		<label><input type="checkbox" name="checkGroup" value="이혜리">이혜리</label>
		<br>
		<label><input type="checkbox" name="checkGroup" value="송중기">송중기</label>
		<label><input type="checkbox" name="checkGroup" value="서강준">서강준</label>
		<label><input type="checkbox" name="checkGroup" value="양조위">양조위</label>
		<label><input type="checkbox" name="checkGroup" value="에일리">에일리</label>
		<br><br>
		
		<input type="submit" value="전송하기" class="btn" style="width: 200px;">
	</form>
	
	
<!--@  A                 B
     checked           수신  
   한 옵션에 checked나 selected 속성을 부여했더라도 null 확인을 거치는 게 좋음!
   조인성 강하늘 서강준 박보검
   -->

</body>
</html>