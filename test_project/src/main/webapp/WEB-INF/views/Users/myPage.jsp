<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="https://www.66girls.co.kr/ind-script/optimizer.php?filename=tZTRbsMgDEXfk732O7ytUv8HHC9BNRhhM7V_P5SpUqu-dBl5xOIemytzYZFI8PFZIBeZi4tQSKUWJEBV-CqSDFBilPTWCgd45T7hoMLVgqTBy2WjsJptbcruSmWb1JxnupMSjlWpKETHfDpBrp4DjotFBp1onEjDnEDPIR3foTWWauCdBlwbPFn3T95voR-vPb0daKihP9NE2ELuD16Id6C2BZkq7uBtdnNIzmgHh53vD336eL24D0nQzwHewdh2DTdT12BhuiiH6SGG_o6JbSWZbnOipO8mbzGV1-l-AA&type=css&k=b414c2e697d93f2f255a5c1822c4ce1f15ac242b&t=1582009750" />-->
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
<div class="container">

	<h1>MyPage</h1>
	<br /><br /><br />
<div class="container_box">

<div class="xans-element- xans-myshop xans-myshop-main mypage_btn_wrap ">
<div class="mypage_btn">
		<div class="item">
			<a href="/myshop/order/list.html">
			<div class="mytitle">
<i class="xi-credit-card"></i> ORDER</div>
			<div class="mytitle_kr">주문내역 조회</div>

			<div class="desc">
고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.
			</div>
			</a>
		</div>
<div class="item">
			<a href="/myshop/wish_list.html">
			<div class="mytitle">
<i class="xi-heart-o"></i> WISHLIST</div>
			<div class="mytitle_kr">관심 상품</div>

			<div class="desc">
관심상품으로 등록하신 상품의 목록을 보여드립니다.
			</div>
			</a>
		</div>


		<div class="item">
			<a href="/myshop/mileage/historyList.html">
			<div class="mytitle">
<i class="xi-piggy-bank"></i> MILEAGE</div>
			<div class="mytitle_kr">적립금 조회</div>

			<div class="desc">
적립금은 상품 구매 시 사용하실 수 있습니다.
			</div>

			</a>
		</div>


		<div class="item">
			<a href="/myshop/board_list.html">
			<div class="mytitle">
<i class="xi-paper-o"></i> BOARD</div>
			<div class="mytitle_kr">내가 쓴 글 보기</div>

			<div class="desc">
고객님께서 작성하신 글을 한눈에 관리하실 수 있습니다.

			</div>
			</a>
		</div>

		<div class="item">
			<a href="/myshop/addr/list.html">
			<div class="mytitle">
<i class="xi-truck"></i> ADDRESS</div>
			<div class="mytitle_kr">배송 주소록 관리</div>

			<div class="desc">
자주 사용하는 배송지를 등록하고 관리하실 수 있습니다.
			</div>
			</a>
		</div>

		<div class="item">
			<a href="/member/modify.html">
			<div class="mytitle">
<i class="xi-profile-o"></i> PROFILE</div>
			<div class="mytitle_kr">회원 정보</div>

			<div class="desc">
회원이신 고객님의 개인정보를 관리하는 공간입니다.<br><!-- 최신 정보로 유지하시면 보다 간편히 쇼핑을 즐기실 수 있습니다. -->
</div>
			</a>
		</div>


	</div>
</div>




	<div id="myShopMain" class="xans-element- xans-myshop xans-myshop-main ">
			<table class="table_center">
				<thead>
				 	<tr>
				 		<th>
				 			<div class="order" onclick="location.href='../shop/orderList.do'">
							<img src="../resources/images/myshop_order.png" alt="주문조회" />
							</div>
				 		</th>
				 		<th>
				 			<div class="cart" onclick="location.href='../shop/cartList.do'">
							<img src="../resources/images/myshop_cart.png" alt="장바구니" />
							</div>
				 		</th>
				 		<th>
				 			<div class="wishlist" onclick="location.href='../shop/wishlist.do'">
							<img src="../resources/images/myshop_wish.png" alt="위시리스트" />			
							</div>
				 		</th>
				 	</tr>
				 	<tr>
				 		<th>
				 			<div class="myInfo" onclick="location.href='info.do'">
							<img src="../resources/images/myshop_myinfo.png" alt="회원정보 조회/수정" />			
							</div>
				 		</th>
				 		<th>
				 			<div class="myBoard" onclick="location.href='boardList.do'">
							<img src="../resources/images/myshop_myboard.png" alt="게시물 관리" />			
							</div>
				 		</th>
				 	</tr>
				</thead>					
			</table>				

		</div>
	</div>
</div>
<footer id="footer">
	<div id="footer_box">
		<%@ include file="../include/footer.jsp"%>
	</div>
</footer>	
</body>
</html>  