<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-theme.min.css">
</head>
<body>
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
	<section id="container">
		<aside>
			<%@ include file="../include/unknown_aside.jsp" %>
		</aside>
	<div id="container_box">
		<form role="form" action="register.do" method="post" autocomplete="off" enctype="multipart/form-data">
		<input type="hidden" name="itemNum" value="${dto.itemNum }"/>
			<div class="inputArea">
				 <label>1차 분류</label>
				 <span class="category1"></span>
				 
				 <label>2차 분류</label>
				 <span class="category2">${dto.cateCode}</span>
			</div>
			<div class="inputArea">
				<label for="itmeName">상품명</label>
				<span>${dto.itemName }</span>
			</div>
			<div class="inputArea">
				<label for="itmePrice">상품가격</label>
				<span>${dto.itemPrice }</span>
			</div>
			<div class="inputArea">
				<label for="itemCount">상품수량</label>		
				<span>${dto.itemCount }</span>
			</div>
			<div class="inputArea">
				<label for="itemDes">상품설명</label>
				<span>${dto.itemDes }</span>
			</div>
			<div class="inputArea">
				<label for="img">이미지</label>
				<p>원본 이미지</p>
				<img alt="이미지" src="../resources${dto.itemImg}" class="oriImg"/>
			</div>
			
			<div class="inputArea">
				<button type="button" id="shop_btn" class="btn btn-warning">장바구니</button>
				<button type="button" id="back_btn" class="btn btn-warning">뒤로가기</button>
				<script type="text/javascript">
					$("#back_btn").click(function () {
						location.href="itemList.do";
					})
				</script>
			</div>
			<script>
				var formObj = $("form[role='form']");
				console.log(formObj);
				$("#shop_btn").click(function() {
					var con = confirm("로그인이 필요합니다. 로그인을 하시겠습니까?");
					if(con){
						formObj.attr("action","../Users/login_form.do");
						formObj.submit();							
					}
				});
			</script>
		</form>
	</div>
	</section>
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>
	</footer>
</body>
</html>