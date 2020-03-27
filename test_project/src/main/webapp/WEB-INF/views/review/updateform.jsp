<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>/review/updateform.jsp</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
</head>
<style>
#star_grade a {
	text-decoration: none;
	color: gray;
}

#star_grade a.on {
	color: red;
}

.star_rating a:first-child {
	margin-left: 0;
}

.star_rating a.on {
	color: #777;
}
</style>
<body>

	<div id="root">
		<header>
			<div class="header_box">
				<nav id="nav">
					<div class="navbar-right">
						<%@ include file="../include/nav.jsp" %>
					</div>
					<div id="index_logo_div">
						<a href="../index.do"><img id="index_logo_img" src="${pageContext.request.contextPath }/resources/images/project.png"/></a>
					</div>
					<div class="navbar-left">
						<c:choose>
							<c:when test="${not empty sessionScope.id }">
									<%@ include file="../include/users_aside.jsp" %>						
							</c:when>
							<c:otherwise>
									<%@ include file="../include/unknown_aside.jsp" %>			
							</c:otherwise>
						</c:choose>
					</div>
				</nav>
			</div>
		</header>
	</div>

		<div class="container">
			<form action="update.do" method="post">
				<input type="hidden" name="itemNum" value="${dto.itemNum }" /> <input
					type="hidden" name="reviewNum" value="${dto.reviewNum }" /> <input
					type="hidden" name="reviewWriter"
					value="${sessionScope.userDto.userId }" /> <input type="hidden"
					id="likeCount" name="likeCount" value=2 />
				<div class="container">
					<label for="reviewContent">상품 리뷰</label>
					<textarea rows="10" cols="50" name="reviewContent"
						id="reviewContent">${dto.reviewContent }</textarea>
					<script type="text/javascript">
						$(function() {
							CKEDITOR
									.replace(
											'reviewContent',
											{
												filebrowserUploadUrl : '${pageContext.request.contextPath }/fileupload.do'
											});
						});
					</script>
				</div>
				<div class="container">
					<label for="likeCount">별점</label>
					<div class="container">
						<p id="star_grade">
							<a href="#">★</a> <a href="#">★</a> <a href="#">★</a> <a href="#">★</a>
							<a href="#">★</a>
						</p>
					</div>
					<script>
						$('#star_grade a')
								.click(
										function() {
											$(this).parent().children("a")
													.removeClass("on"); /* 별점의 on 클래스 전부 제거 */
											$(this).addClass("on").prevAll("a")
													.addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
											var likeCount = document
													.querySelectorAll(".on").length * 2;
											$("#likeCount").val(likeCount);
											return false;
										});
					</script>
				</div>
				<button type="submit">수정확인</button>
				<button type="reset">취소</button>
				<script>
					$("#back_btn")
							.click(
									function() {
										location.href = "detail.do?reviewNum=${dto.reviewNum }&itemNum=${dto.itemNum}";
									})
				</script>
			</form>
			<footer id="footer">
				<div id="footer_box">
					<%@ include file="../include/footer.jsp"%>
				</div>
			</footer>
		</div>
	
	<script>
		$("#back_btn").click(function() {
			location.href = "itemView_form.do?itemNum=" + $
			{
				dto.itemNum
			}
			;
		})
	</script>
	<script>
		$('#star_grade a').click(function() {
			$(this).parent().children("a").removeClass("on"); /* 별점의 on 클래스 전부 제거 */
			$(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
			var likeCount = document.querySelectorAll(".on").length * 2;
			$("#likeCount").val(likeCount);
			return false;
		});
	</script>

	

</body>
</html>