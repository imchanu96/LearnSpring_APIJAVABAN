<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>회원 목록</title>

<style type="text/css">
	tr td :hover {
		background-color: green; 
	}
	
	table {
		width : 700px;
		float : left;
	}
	
	img {
		margin-left : 200px;
		width : 500px;
		height : 500px;
	}
	
	#parentDiv{
		height : 500px;
	}
</style>

<script type="text/javascript">
	window.onload = function(){
		
		
	}
	function changeImg() {
		var imgObj = document.getElementById("imgList");
		
		imgObj.style.src = "/SpringHome/img/안지영1.PNG";
	
	}

</script>
</head>

<body>

	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	<h1>회원목록</h1>
	<p>
		<a href='./add.do'>신규 회원</a>
	</p>
	<div id="parentDiv">
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>이메일</th>
				<th>가입일</th>
				<th></th>
			</tr>
			
			<c:forEach var="memberDto" items="${memberList}">
				<tr>
					<td>
						${memberDto.no}
					</td>
					<td>
						<a href='./listOne.do?no=${memberDto.no}'>${memberDto.name}</a>
					</td>
					<td>
						${memberDto.email}
					</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${memberDto.createDate}"/>
					</td>
					<td>
						<a href='./delete.do?no=${memberDto.no}'>[삭제]</a><br>
					</td>
				</tr>
			</c:forEach>
			<tr>
			</tr>
		</table>
		<img id="imgList" alt="이미지들" onclick="changeImg();"
			 src="<c:url value='/img/안지영2.PNG'/>">
	</div>
	<jsp:include page="/WEB-INF/views/common/Paging.jsp">
			<jsp:param value="${pagingMap}" name="pagingMap"/>
	</jsp:include>
	
	<form action="./list.do" id="pagingForm" method="post">
      <input type="hidden" id="curPage" name="curPage"
         value="${pagingMap.memberPaging.curPage}">
    </form>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
</body>
</html>