<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
nav>ul {
	list-style-type: none;
	padding: 0;
	overflow: hidden;
	background-color: #333333;
	/*     width: 1000px; */ /* ���̸� �ָ� ����  */
	display: table; /* table�� �ָ�  ����� ���뿡 �°� �ڵ����� ũ�� */
	margin-left: auto;
	margin-right: auto;
}

nav>ul>li {
	float: left;
}

nav>ul>li>a {
	display: block;
	color: white;
	text-align: center;
	padding: 16px;
	text-decoration: none;
}

/* ���콺�� �ö󰥽� ������ */
nav>ul>li>a:hover { 
	color: #FFD9EC;
	background-color: #5D5D5D;
	font-weight: bold;
}
</style>
</head>
<body>

	<nav>
		<ul>
			<li><a href="#"><span>��</span></a></li>

			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>

			<li><a href="#"><span>��</span></a></li>
		</ul>
	</nav>
</body>
</html>