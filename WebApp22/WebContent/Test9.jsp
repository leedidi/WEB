<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test9.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) import문 실습</h1>
	<hr>
	<!--@ import는 적극적으로 쓰이는 기능은 아니라.. 이런게 있다 정도만 알아두면 오케이!  -->
</div>

<div>
	<p>『c:import』 는 URL 처리에 관여하며,
	URL을 활용하여 다른 차원의 결과를 삽입할 때 사용한다.</p> 
</div>
<br>

<!-- 변수 지정 -->
<c:set var="url" value="Gugudan.jsp"></c:set>

<c:import url="${url }" var="impt">
	<c:param name="dan" value="7"></c:param>
</c:import>

<!-- 결과 화면 출력 -->
<c:out value="${impt }"></c:out>
<!-- → 결과 화면 출력 과정에서 HTML 코드를 그대로 출력하는 구문 -->
<!--    『escapeXml』 속성의 기본값(default)은 true 로 설정되어 있다. -->
<br>

<!-- 결과 화면 출력 -->
<c:out value="${impt }" escapeXml="false"></c:out>

</body>
</html>













