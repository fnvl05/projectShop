<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<title>/review/insertform.jsp</title>
</head>
<body>
<div class="container">
	<form action="insert.do" method="post">
		<input type="hidden" name="itemNum" value="${itemNum }" />
		<input type="hidden" name="reviewWriter" value="${sessionScope.userDto.userId}" />
		<div class="container">
			<label for="reviewContent">상품 리뷰</label>
			<input type="text" name="reviewContent" id="reviewContent" />
		</div>
		<div class="container">
			<label for="likeCount">별점</label>
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


</body>
</html>