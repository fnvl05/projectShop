<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/resource.jsp"></jsp:include>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<div class="container">
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath }/qna/list.do">목록</a></li>
		<li>새글 작성</li>
	</ol>
	<form action="insert.do" method="post">
		<div class="form-group">
			<label for="writer">작성자</label>
			<input class="form-control" type="text" value="${id }" disabled/>
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" 
				name="title" id="title"/>
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content" cols="30" rows="10"></textarea>
			<script type="text/javascript">
					$(function(){
						CKEDITOR.replace('content',{
							filebrowserUploadUrl: '${pageContext.request.contextPath }/fileupload.do'
						});
					});
			</script>
		</div>
		<button class="btn btn-primary" type="submit" onclick="submitContents(this);">저장</button>
		<button class="btn btn-warning" type="reset">초기화</button>
		<button class="btn btn-danger" type="button" id = "btn_back" >뒤로가기</button>
		<script>
			$("#btn_back").click(function(){
				location.href="list.do";
			})
		</script>
	</form>
</div>

</body>
</html>