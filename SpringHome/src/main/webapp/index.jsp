<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript">
		function loginMoveFnc() {
			var formObj = document.getElementById('simpleForm');
			
			formObj.submit();
		}
	</script>

</head>
<body>
	<h1>Hello Spring Projects..</h1>
	
	
	<form action="auto/login.do" id="simpleForm" method="get">
		<input type="button" value="�α��� ȭ������ �̵�" onclick="loginMoveFnc();">
	</form>
</body>
</html>