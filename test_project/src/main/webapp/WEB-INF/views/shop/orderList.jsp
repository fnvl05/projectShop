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
				
					<c:forEach var="tmp" items="${list }" varStatus="status">
						<c:if test="${status.first }">
						
						<tr>
							<td>${tmp.orderNum }</td>
							<td>${tmp.orderDate }</td>
							<c:if test="${size }>=0">
							<td>${tmp.itemName} 외 ${size }건</td>	
							</c:if>		
							<td>${tmp.itemName }</td>		
							<td>
							<fmt:formatNumber value="${tmp.allPrice }" pattern="###,###,###"/>원</td>
							<td><a href="detailList.do?orderNum=${tmp.orderNum }">조회</a></td>
							<td><a href="delivery.do?orderNum=${tmp.orderNum }">조회</a></td>
						</tr>
			
						</c:if>	
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