<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/delivery.jsp</title>
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
		<c:forEach var="tmp" items="${list }">
		<p><strong>[${sessionScope.userDto.userName }]</strong> 님의 주문번호 : ${tmp.orderNum} 의  배달현황입니다.</p>
		
			<p>해당 주문번호:${tmp.orderNum} 의 배송 현황은 '${tmp.delivery }' 입니다.</p>
		</c:forEach>
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