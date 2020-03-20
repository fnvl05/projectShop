<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/orderList.jsp</title>
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
		
		<p><strong>[${sessionScope.userDto.userName }]</strong> 님이 쇼핑몰에서 주문한 내역입니다.</p>
		<br/>
		<br/>
		<table>
			<thead>
				<tr>
					<th>주문번호</th>
					<th>주문일자</th>
					<th>상품명</th>
					<th>결제금액</th>
					<th>주문상세</th>
					<th>배송현황</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td>${tmp.orderNum }</td>
						<td>${tmp.regdate }</td>
						<td>${tmp.itemName }</td>
						<td>${tmp.allPrice }</td>
						<td><button onclick="#">조회</button></td>
						<td><button onclick="#">조회</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
		
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>