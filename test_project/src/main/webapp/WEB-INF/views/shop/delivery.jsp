<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/delivery.jsp</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
</head>
<body>
<div id="root">
	<header>
		<div class="header_box">
			<nav id="nav">
				<div class="navbar-right">
					<%@ include file="../include/nav.jsp" %>
				</div>
				<div id="index_logo_div">
					<a href="index.do"><img id="index_logo_img" src="${pageContext.request.contextPath }/resources/images/project.png"/></a>
				</div>
				<div class="navbar-left">
						<%@ include file="../include/users_aside.jsp" %>						
				</div>
			</nav>
		</div>
	</header>
	<section id="container">	
	<div id="container_box">
		<div class="container">
		<c:forEach var="tmp" items="${list }">
		<p><strong>[${sessionScope.userDto.userName }]</strong> 님의 주문번호 : ${tmp.orderNum} 의  배달현황입니다.</p>
		
			<p>해당 주문번호:${tmp.orderNum} 의 배송 현황은 '${tmp.delivery }' 입니다.</p>
		</c:forEach>
		</div>
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