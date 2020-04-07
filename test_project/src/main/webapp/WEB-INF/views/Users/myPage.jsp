<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<header id="header">
	<div id="header_box">
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
		<%@ include file="../include/users_aside.jsp" %>
	</aside>	
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
			<div class="myInfo" onclick="location.href='info.do'">
				<img src="../resources/images/myshop_myinfo.png" alt="회원정보 조회/수정" />			
			</div>
			<div class="myBoard" onclick="location.href='boardList.do'">
				<img src="../resources/images/myshop_myboard.png" alt="게시물 관리" />			
			</div>
			<div class="my" onclick="location.href='delete.do'">
				<img src="../resources/images/myshop_myboard.png" alt="회원 탈퇴" />			
			</div>
		</div>
	</div>
	
</section>
</body>
</html>  