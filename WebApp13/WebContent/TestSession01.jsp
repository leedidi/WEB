<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// TestSession01_ok.jsp 페이지에서 되돌려 보내면서
	// session 의 userId 에 superman 을, userName 에 이찬호를
	// 담아서 보낸 상황
	String userId = (String)session.getAttribute("userId");			// "superman"
	String userName = (String)session.getAttribute("userName");		// "이찬호"
	//-- 『session.getAttribute("userId");』 는
	//   Object 타입을 반환하므로
	//   String 타입으로 변환하는 과정 필요.
	
	
	
	// 추가~!!!
	// 세션 시간 변경 ------------------------------------------
	
	// ※ 세션 기본(default) 시간은 1800초.
	
	//session.setMaxInactiveInterval(20);
	//@ 20초 후, 새로고침시 로그인 풀려있음
	//-- 세션이 유지되는 시간을 20초로 설정한 상태
	//	 이로 인해...
	//   로그인 후 20초 뒤에 새로고침을 수행하면 로그아웃 처리된 것을 확인.
	
	// ------------------------------------------ 세션 시간 변경

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<style type="text/css">
	a {text-decoration: none;}
	.btnMenu 
	{
		border: 1px solid gray; 
		border-radius: 3px; 
		font-size: 8pt; 
		width: 60px;
		height: 20px;	
	}
</style>
<script type="text/javascript">

	function sendIt()
	{	
		//@ *** 처음 해본 방식! 관찰해보기~!
		
		// 확인
		//alert("함수 호출 확인");
		
		//@ document 의 name...
		//@ f = form 객체
		var f = document.myForm;
		
		//@ userId = name
		//@ userId.value = name 의 value
		if(!f.userId.value)
		{
			alert("아이디를 입력해야 합니다~!!!");
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value)
		{
			alert("패스워드를 입력해야 합니다~!!!");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
		
		
	}

	</script>

</head>
<body>

<div>
	<h1>세션 처리 - 로그인</h1>
	<hr>
</div>

<div>
	<table>
		<tr>
			<td>
				<a href="">
					<button type="button" class="btnMenu btn01">게시판</button>
				</a> |
				
				<!--@ 처음엔 일정관리, 친구관리 회색....(null상태) superman, 123456 하면 
				세션에 얘네 넣어서 돌려보냄(null아님), 파란색 됨 -->
				<%
				if(userId==null)
				{
				%>
					<button type="button" class="btnMenu btn02"
					disabled="disabled">일정관리</button> |
				<%
				}
				else
				{
				%>
				<a href="Sce.jsp">
					<button type="button" class="btnMenu btn01">일정관리</button>
				</a> |
				<%
				}
				%>
				
				
				<%
				if(userId==null)
				{
				%>
					<button type="button" class="btnMenu btn02"
						disabled="disabled">친구관리</button> | 
				<%	
				}
				else
				{
				%>
				<a href="Fri.jsp">
					<button type="button" class="btnMenu btn01">친구관리</button>
				</a> | 
				<%
				}
				%>
				...
			
			</td>
		</tr>
	</table>
	<br><br>
	
	<table>
		<tr>
			<td>
			
			
				<%
				if(userId==null)
				{
				%>
				<form action="TestSession01_ok.jsp" method="post" name="myForm">
					<table>
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" name="userId"
								class="txt" style="width: 150px;">
							</td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td>
								<!-- <input type="password"> -->
								<input type="text" name="userPwd"
								class="txt" style="width: 150px;">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" class="btn"
								style="width: 100%;"
								onclick="sendIt()">로그인</button>
							</td>
						</tr>
					</table>
				</form>
				<%
				}
				else
				{
				%>
				
				<h2><%=userName %>(<%=userId %>)님 환영합니다.</h2>
				<h2>이제, 일정관리와 친구관리 서비스를 이용할 수 있습니다.</h2>
				<br>
				<p>
					<a href="Logout.jsp">
						<button type="button" class="btnMenu btn01">로그아웃</button>
					</a>
				</p>

				
				<%
				}
				%>
				
			</td>
		</tr>
	</table>
	
	
	
	
</div>

</body>
</html>















