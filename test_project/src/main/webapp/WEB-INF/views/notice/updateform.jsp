<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
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
			<label for="noticeNum">중요글</label>
			<input type="radio" name="noticeNum" value=0 checked="checked"/> OFF
			<input type="radio" name="noticeNum" value=1 /> ON
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content" cols="30" rows="10">${content }</textarea>
			<script type="text/javascript">
					$(function(){
						CKEDITOR.replace('content',{
							filebrowserUploadUrl: '${pageContext.request.contextPath }/fileupload.do'
						});
					});
			</script>
		</div>
		<input type="hidden" name="pageNum" value="${pageNum }" />
		<button class="btn btn-primary" type="submit" id="updateBtn">수정</button>
		<button class="btn btn-warning" type="reset">초기화</button>
		<!--  <a class="btn btn-warning" href="${pageContext.request.contextPath }/notice/list.do">취소</a> -->
	</form>
	<script>
		$("#updateBtn").on("click",function(){
			//제출 전 제목을 변수에 저장
			var title=$("#title").val();
			if(title==""){
				alert("제목을 입력하세요.",function(){
					//제목에 포커스 on
					$("#title").focus();
				},"warning");
				return false;
			}
			
			//제출 전 에디터 내용을 변수에 저장
			var content=CKEDITOR.instances.content.getData();
			//제출 전 에디터 내용 길이를 변수에 저장
			var content_len=CKEDITOR.instances.content.getData().length;
			//내용이 없는 경우
			if(content==""){
				alert("내용을 입력하세요.",function(){
					//에디터 내용에 포커스 on
					CKEDITOR.instances.content.focus();
				},"warning");
				return false;
			}
			//내용이 30글자 미만인 경우
			//기본적으로 8글자를 가짐 빈문자열+<p></p> =8글자
			if(content_len<18){
				alert("내용을  30자 이상 입력하세요.",function(){
					//에디터 내용에 초기화
					CKEDITOR.instances.content.setData("");
					//에디터 내용에 포커스 on
					CKEDITOR.instances.content.focus();
				},"warning");
				return false;
			}
		});
	</script>
</div>
</body>
</html>