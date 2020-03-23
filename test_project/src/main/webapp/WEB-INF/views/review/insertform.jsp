<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/review/insertform.jsp</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-theme.min.css">
</head>
<body>
<div id="root">
	<header id="heder_box">
		<div>
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp" %>
		</div>
	</nav>
	
		<div class="container">
			<form action="insert.do" method="post">
				<input type="hidden" name="itemNum" value="${itemNum }" />
				<input type="hidden" name="reviewWriter" value="${sessionScope.userDto.userId}" />
				<div class="container">
					<label for="reviewContent">상품 리뷰</label>
					<textarea name="reviewContent" id="reviewContent"></textarea>
					<script type="text/javascript">
						$(function(){
							CKEDITOR.replace('reviewContent',{
								filebrowserUploadUrl: '${pageContext.request.contextPath }/fileupload.do'
							});
						});
					</script>
				</div>
				<div class="container">
					<label for="likeCount">평가</label>
					<input type="text" name="likeCount" id="likeCount" /> 
				</div>
				<button type="submit" >등록</button>
				<button type="reset">취소</button>
				<button type="button" id="back_btn">돌아가기</button>
				<script type="text/javascript">
				$("#back_btn").click(function () {
				location.href="itemList_review.do?itemNum=" + ${itemNum};
				})
				</script>
			</form>
		</div>
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>
	</footer>
</div>

</body>
</html>