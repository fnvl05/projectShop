<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/notice/insertform.jsp</title>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<jsp:include page="../include/resource.jsp"></jsp:include>

<style>
	/* tetarea 의 크기가 SmartEditor 의 크기가 된다. */
	#content{
		width: 100%;
		height: 400px;
	}
</style>

</head>
<body>
<div class="container">
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath }/notice/list.do">목록</a></li>
		<li>새글 작성</li>
	</ol>
	<form action="insert.do" method="post">
		<div class="form-group">
			<label for="writer">작성자</label>
			<input class="form-control" type="text" name="writer" value="${id }" disabled/>
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" name="title" id="title" />
		</div>
		<div class="form-group">
			<label for="noticeNum">중요글</label>
			<input type="radio" name="noticeNum" value=0 checked="checked"/> OFF
			<input type="radio" name="noticeNum" value=1 /> ON
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
		<button class="btn btn-danger" type="button" id="back-btn">뒤로가기</button>
		<script>
			$("#back-btn").click(function () {
				location.href="list.do";
			})	
		</script>
	</form>
</div>
</body>
</html>