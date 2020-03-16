<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/review/updateform.jsp</title>
</head>
<body>
<div class="container">
	<form action="update.do" method="post">
		<input type="hidden" name="itemNum" value="${dto.itemNum }" />
		<input type="hidden" name="reviewNum" value="${dto.reviewNum }" />
		<input type="hidden" name="reviewWriter" value="${sessionScope.userDto.userId }" />
		<div class="container">
			<label for="reviewContent">상품 리뷰</label>
			<input type="text" name="reviewContent" id="reviewContent" value="${dto.reviewContent }" />
		</div>
		<div class="container">
			<label for="likeCount">별점</label>
			<input type="text" name="likeCount" id="likeCount" value="${dto.likeCount }"/>
		</div>
		<button type="submit" >수정확인</button>
		<button type="reset">취소</button>
		<button><a href="detail.do?reviewNum=${dto.reviewNum }&itemNum=${dto.itemNum}">돌아가기</a></button>
	</form>
</div>

</body>
</html>