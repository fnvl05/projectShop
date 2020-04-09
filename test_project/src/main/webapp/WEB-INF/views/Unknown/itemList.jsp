<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
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
				<%@ include file="../include/unknown_aside.jsp" %>
			</aside>
				<h2>상품 목록</h2>
				<ul id="ul1">
				 <c:forEach items="${cateList}" var="cateList">
				 <li>
				  <div class="itemThumb">
				   <img alt="이미지" src="../resources${cateList.itemImg}" class="thumbImg"/>
				  </div> 
				  <div class="itemName">
				   <a href="itemView_form.do?itemNum=${cateList.itemNum}">${cateList.itemName}</a>
				  </div>
				 </li>
				 </c:forEach>
				</ul>
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