<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/updateform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<!-- 3. 글 수정 폼을 응답한다. -->
<div class="container">
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath }/notice/list.do">목록</a></li>
		<li>글 수정 양식</li>
	</ol>	
	<form action="update.do" method="post">
		<div class="form-group">
				<label for="num">글번호</label>
				<input class="form-control" type="text" id="num" value="${num }" disabled/>
		</div>
		<input type="hidden" name="num" value="${num }" />
		<div class="form-group">
			<label for="writer">작성자</label>
			<input class="form-control" type="text" name="writer" id="writer"
			 	value="${writer }" disabled/>
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" name="title" id="title"
				value="${title }"/>
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content" cols="30" rows="10">
			${content } <!-- 텍스트 에어리어에 뿌리는 코드를 갖다놓고 스마트 에디터를 아래에 붙여놓으면 적용된다.-->
			</textarea>
		</div>
		<input type="hidden" name="pageNum" value="${pageNum }" />
		<button class="btn btn-primary" type="submit" onclick="submitContents(this);">수정확인</button>
		<a class="btn btn-warning" href="${pageContext.request.contextPath }/notice/list.do">취소</a>
	</form>
</div>
	
</body>
</html>