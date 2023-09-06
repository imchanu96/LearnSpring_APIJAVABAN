<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 수정</title>
	<script type="text/javascript"
	 src="/SpringHome/resource/js/jquery-3.7.1.js">
	</script>

	<script type="text/javascript">
		function pageMoveListFnc() {
			location.href = "./list.do";
		}
		
		function pageMoveDeleteFnc(no) {
			var url = './delete.do?no=' + no;
			location.href = url;
		}
		
		// document onload 같은 것
		   $(document).ready(function(){
		         //^정규표현식: id가 delete로 시작하는 전체 찾기 => 95행 삭제버튼   .on: eventlistener
		      $("a[id^='delete']").on("click", function(e){
		         e.preventDefault();
		         deleteFile($(this));   // $(this) : 아까 정규표현식 통해 선택한 a태그 
		      });
		   });
		   
		   //pageMoveDeleteFnc
		   function deleteFile(obj){
		      // parent() = div
		      obj.parent().remove(); // 첨부파일 삭제됨
		   }
		   
		   function addFileFnc(){
		      var obj = $('#fileContent');
		      var htmlStr = "";
		      
		      htmlStr += '<div>';
		      htmlStr += '<input type="hidden" id="fileIdx" name="fileIdx" value="">';
		      htmlStr += '<input type="file" id="file0" name="file0" value="">';
		      htmlStr += '<a href="#this" id="delete0" onclick="addFileFnc();">삭제</a><br>';
		      htmlStr += '</div>';
		      
		      obj.html(htmlStr);
		      
		      $('a[id^="delete"]').on('click', function(e){
		      e.preventDefault();
		      deleteFile($(this));
		      });
		   }
	</script>
</head>
<body>
	
	
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<h1>회원정보 수정</h1>
	<form action='./updateCtr.do' method='post' enctype="multipart/form-data">
		<input type='hidden' name='no' value='${memberDto.no}'>
		이름: <input type='text' name='name' value='${memberDto.name}'><br>
		이메일: <input type='text' name='email' value='${memberDto.email}'><br>
		비밀번호: <input type='password' name='password' value=""
			requeired="requeired"><br>
		
		첨부파일:
		<div id='fileContent'>
			<div>
				<c:choose>
					<c:when test="${empty fileList}">
						<input type="hidden" id="fileIdx" name="fileIdx" value="">
						<input type="file" id="file0" name="file0" value="">
						<a href="#this" id="delete0" onclick="addFileFnc();"> 삭제</a><br>
					</c:when>
					<c:otherwise>
						<c:forEach var="row" items="${fileList}" varStatus="obj">
							<input type="hidden" id="fileidx_${obj.index}" name="fileIdx"
								value="${row.IDX}">
							<img alt="image not found" 
								src="<c:url value='/img/${row.STORED_FILE_NAME}'/>"><br>
								${row.ORIGINAL_FILE_NAME}
								<input type="file" id="file_${obj.index}"
									name="file_${obj.index}">
									(${row.FILE_SIZE}kb)
								<a href="#this" id="delete_${obj.index}">삭제</a>
							<br>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
		
		가입일: <fmt:formatDate pattern="yyyy-MM-dd hh:mm"
			value="${requestScope.memberDto.createDate}" /><br>
			
		<input type='button' value='파일추가' onclick='addFileFnc();'>	
		<input type='submit' value='저장하기'>
		<input type='button' value='삭제하기' 
			onclick='pageMoveDeleteFnc(${memberDto.no});'>
		<input type='button' value='뒤로가기 구현해보자'>	
		<input type='button' value='회원목록으로' onclick='pageMoveListFnc();'>
	</form>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
</body>
</html>
