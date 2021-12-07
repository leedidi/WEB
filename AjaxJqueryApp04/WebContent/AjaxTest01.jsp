<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); String cp = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
   $(function ()
   {
      $("#sendBtn").click(function()
      {
         //alert("확인");
         
		 
         // data 구성         
         var params = "name=" + $.trim($("#name").val())
         	 + "&content=" + $.trim($("#content").val());
         
         // check~!!!
         // jQuery 의 ajax() 함수 사용(호출)
         $.ajax(
         {
        	 type : "POST"
        	 , url : "AjaxTest01_ok.jsp"
        	 , data : params						// Ajax01_ok.jsp 에서 수신하게 되는 데이터
        	 , success : function(args)
			{
				$("#resultDiv").html(args);
				
				$("#name").val("");
				$("#content").val("");
				$("#name").focus();
				
			}
        	 , beforeSend : showRequest // true / false
        	 //@ () 괄호 안 넣음
        	 , error : function (e)
			{
				alert(e.responseText);
			}
        	 //@ 콜백, 내가 터트리는게 아니라 뒤에 붙여놓은 시계가 터트림(ex. 시한폭탄)
             //@ 제이슨 형태로 바인딩해서 데이터 넘길 때는 순서 상관 없음!
         });
      
      });
   });
   
   
   function showRequest()
   {
	   if(!$.trim($("#name").val()))
	   {
		   alert("이름을 입력해야 합니다.");
		   $("#name").focus();
		   
	   		return false;
	   }
	   
	   if(!$.trim($("#content").val()))
	   {
		   alert("내용을 입력해야 합니다.");
		   $("#content").focus();
	  
		   return false;
	   }
		return true;
   }
   
   
</script>

</head>
<body>

<div>
	<h1>jQuery의 ajax() 활용 실습</h1>
	<hr />
</div>

<div>
	이름 : <input type="text" id="name" class="txt"><br>
	내용
	<textarea rows="3" cols="50" id="content"></textarea><br><br>
	
	<input type="button" value="등록하기" id="sendBtn">
</div>
<br><br>

<div id="resultDiv">
</div>

</body>
</html>