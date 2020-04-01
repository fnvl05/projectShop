<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
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
						<%@ include file="../include/header.jsp"%>
					</div>
					<div class="navbar-left">
						<%@ include file="../include/master_aside.jsp"%>
					</div>
				</nav>
			</div>
		</header>
		<section id="container">
			<form role="form" autocomplete="off" enctype="multipart/form-data">
				<input type="hidden" name="itemNum" value="${dto.itemNum }" />
				<div class="inputArea">
					<label>1차 분류</label> <span class="category1"></span> <label>2차
						분류</label> <span class="category2">${dto.cateCode}</span>
				</div>
				<div class="inputArea">
					<label for="itmeName">상품명</label> <span>${dto.itemName }</span>
				</div>
				<div class="inputArea">
					<label for="itmePrice">상품가격</label> <span>${dto.itemPrice }</span>
				</div>
				<div class="inputArea">
					<label for="itemCount">상품수량</label> <span>${dto.itemCount }</span>
				</div>
				<div class="inputArea">
					<label for="itemDes">상품설명</label> <span>${dto.itemDes }</span>
				</div>
				<div class="inputArea">
					<label for="img">이미지</label>
					<p>원본 이미지</p>
					<img alt="이미지" src="../resources${dto.itemImg}" class="oriImg" />
				</div>

				<div class="inputArea">
					<button type="button" id="modify_btn" class="btn btn-warning">수정</button>
					<button type="button" id="delete_btn" class="btn btn-danger">삭제</button>
				</div>
				<script>
					var formObj = $("form[role='form']");
					console.log(formObj);
					$("#modify_btn").click(function() {
						formObj.attr("action", "item_modifyForm.do");
						formObj.attr("method", "post")
						formObj.submit();
					});
					$("#delete_btn").click(function() {
						var con = confirm("정말로 삭제하시겠습니까?");
						if (con) {
							formObj.attr("action", "delete.do");
							formObj.submit();
						}
					});
				</script>
			</form>

			<a href="../qna/itemList_qna.do?itemNum=${dto.itemNum }">QnA</a><br />


			<a href="../review/itemList_review.do?itemNum=${dto.itemNum} ">해당
				상품의 리뷰보기</a>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
	</div>
</body>
</html>