<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		<button><a href="itemList_review.do?itemNum=${itemNum }">돌아가기</a></button>
	</form>
</div>


</body>
</html>