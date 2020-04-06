<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<h1>MyPage</h1>
	<div class="container_box">
		<div id="myShopMain" class="xans-element- xans-myshop xans-myshop-main ">
			<div class="order" onclick="location.href='../shop/orderList.do'">
				<img src="../resources/images/myshop_order.png" alt="주문조회" />
			</div>
			<div class="cart" onclick="location.href='../shop/cartList.do'">
				<img src="../resources/images/myshop_cart.png" alt="장바구니" />
			</div>
			<div class="wishlist" onclick="location.href='../shop/wishlist.do'">
				<img src="../resources/images/myshop_wish.png" alt="위시리스트" />			
			</div>
			<div class="myInfo" onclick="location.href='../Users/info.do'">
				<img src="../resources/images/myshop_myinfo.png" alt="회원정보 조회/수정" />			
			</div>
			<div class="myBoard" onclick="location.href='boardList.do'">
				<img src="../resources/images/myshop_myboard.png" alt="게시물 관리" />			
			</div>
		</div>
	</div>
</section>
</body>
</html>  