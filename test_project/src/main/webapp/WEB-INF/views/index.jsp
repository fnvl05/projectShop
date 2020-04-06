<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<style>
	img{
		display: block;
		margin: 0px auto;
	}
</style>
</head>
<body>
	<div id="root">
		<header>
			<div class="header_box">
				<nav id="nav">
					<div class="navbar-right">
						<%@ include file="include/nav.jsp" %>
					</div>
					<div id="index_logo_div">
						<a href="../index.do"><img id="index_logo_img" src="${pageContext.request.contextPath }/resources/images/project.png"/></a>
					</div>
					<div class="navbar-left">
						<c:choose>
							<c:when test="${not empty sessionScope.id }">
									<%@ include file="include/users_aside.jsp" %>						
							</c:when>
							<c:otherwise>
									<%@ include file="include/unknown_aside.jsp" %>			
							</c:otherwise>
						</c:choose>
					</div>
				</nav>
			</div>
		</header>
		<section id="container">
			<div id="container_box">
				<img src="${pageContext.request.contextPath }/resources/images/main_banner1.png" />
			</div>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>
