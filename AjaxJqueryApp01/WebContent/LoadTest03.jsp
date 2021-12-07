<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoadTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">
	.txtNum
	{
		width: 100px;
		text-align: right;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	/*
	$(function()
	{
		$("#sendButton").click(function()
		{
			// 테스트
			//alert("클릭");
			var su1 = $("#su1").val();
			var su2 = $("#su2").val();
			var oper = $("#oper").val();
			
			//alert(su1);
			//alert(su2);
			
			var url = "LoadTest03_ok.jsp?su1=" + su1 + "&su2=" + su2 + "&oper=" + oper;
			
			//alert(url);
			
			$('#result').load(url);
			
		});
	});
	*/
	
	//$(document).ready();
	$(function()
	{
		$("#sendButton").click(function()
		{
			var su1 = $("#su1").val();
			var su2 = $("#su2").val();
			var oper = $("#oper").val();
			
			var url = "LoadTest03_ok.jsp?su1=" + su1 + "&su2=" + su2 + "&oper=" + oper;
			
			$("#result").load(url);		// responseText
			//@ load는 url 넘기는 것만 할 수 있음!
			//@ 이 상황에서는 get 방식으로 url 넘기는 거밖에 할 수 없음!
			//@ ok에서 쓰인 result 아님!
		});
	});
	

</script>

</head>
<body>


<div>
	<input type="text" id="su1" class="txt txtNum">
	
	<select id="oper">
		<option value="add">덧셈</option>
		<option value="sub">뺄셈</option>
		<option value="mul">곱셈</option>
		<option value="div">나눗셈</option>
	</select>
	
	<input type="text" id="su2" class="txt txtNum">
	
	<input type="button" value=" = " id="sendButton" class="btn">
</div>
<br>

<div id="result">
</div>
<br>

<div>
	<input type="radio" name="rdo">rd1
	<input type="radio" name="rdo">rd2
</div>
<br>

<div>
	<input type="text">
</div>


</body>
</html>