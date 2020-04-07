<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<script
	src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div id="root">
		<header>
			<div class="header_box">
				<nav id="nav">
					<div class="navbar-right">
						<%@ include file="../include/nav.jsp"%>
					</div>
					<div id="index_logo_div">
						<a href="../index.do"><img id="index_logo_img"
							src="${pageContext.request.contextPath }/resources/images/project.png" /></a>
					</div>
					<div class="navbar-left">
						<c:choose>
							<c:when test="${not empty sessionScope.id }">
								<%@ include file="../include/users_aside.jsp"%>
							</c:when>
							<c:otherwise>
								<%@ include file="../include/unknown_aside.jsp"%>
							</c:otherwise>
						</c:choose>
					</div>
				</nav>

			</div>
		</header>
	</div>
	<div class="container">
		<ol class="breadcrumb">
			<li><a
				href="${pageContext.request.contextPath }/Users_Item/itemView_form.do?itemNum=${itemNum}&pageNum=1">목록</a></li>
			<li>새글 작성</li>
		</ol>
		<form action="insert.do" method="post">
			<input type="hidden" name="itemNum" value="${itemNum }" />
			<div class="form-group">
				<label for="writer">작성자</label> <input class="form-control"
					type="text" value="${id }" disabled />
			</div>
			<div class="form-group">
				<label for="title">제목</label> <input class="form-control"
					type="text" name="title" id="title" />
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" name="content" id="content" cols="30"
					rows="10"></textarea>
				<script type="text/javascript">
					$(function() {
						CKEDITOR
								.replace(
										'content',
										{
											filebrowserUploadUrl : '${pageContext.request.contextPath }/fileupload.do'
										});
					});
				</script>
			</div>
			<button class="btn btn-primary" type="submit"
				onclick="submitContents(this);">저장</button>
			<button class="btn btn-warning" type="reset">초기화</button>
			<button class="btn btn-danger" type="button" id="btn_back">뒤로가기</button>
			<script>
				$("#btn_back")
						.click(
								function() {
									location.href = "${pageContext.request.contextPath }/Users_Item/itemView_form.do?itemNum="
											+ ${itemNum}+"&pageNum=1"
									;
								})
			</script>
		</form>
	</div>

</body>
</html>