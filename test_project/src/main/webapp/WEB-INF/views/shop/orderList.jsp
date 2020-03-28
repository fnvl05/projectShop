<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/orderList.jsp</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>

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
		<section id="container">
			<div id="container_box">
			<aside>
				<%@ include file="../include/users_aside.jsp" %>
			</aside>
				<p><strong>[${sessionScope.userDto.userName }]</strong> 님이 쇼핑몰에서 주문한 내역입니다.</p>
				<br/>
				<br/>
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>주문번호</th>
							<th>주문일자</th>
							<th>상품명</th>
							<th>결제금액</th>
							<th>주문상세</th>
							<th>배송현황</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="tmp" items="${orderList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${tmp.orderNum }</td>
								<td>
								<fmt:parseDate value="${tmp.orderDate }" var="orderDate" pattern="yyyy-MM-dd HH:mm:ss.S" scope="page"/>
								<fmt:formatDate value="${orderDate }" pattern="yyyy.MM.dd"/>
								</td>
								<td>${tmp.itemName}</td>	
								<td><fmt:formatNumber value="${tmp.allPrice }" pattern="###,###,###"/>원</td>
								<td><a href="detailList.do?orderNum=${tmp.orderNum }">조회</a></td>
								<td><a href="delivery.do?orderNum=${tmp.orderNum }">조회</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br/>
				<c:if test="${empty orderList  }">
					<p style="text-align: center;">구매내역이 존재하지 않습니다.</p>
				</c:if>
			</div>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>