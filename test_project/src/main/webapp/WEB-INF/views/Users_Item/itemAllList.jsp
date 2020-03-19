<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	#container_box table td { width:150px; text-align: center }
	.thumbImg{width: 100px; height: 70px;}
</style>

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
					<table>
						 <thead>
							 <tr>
							   <th>이미지</th>
							   <th>이름</th>
							   <th>가격</th>
							   <th>수량</th>
							 </tr>
						 </thead>
						 <tbody>
						  <c:forEach items="${list}" var="list">
							  <tr>
								   <td><img alt="이미지" src="../resources${list.itemImg}" class="thumbImg"/></td>
								   <td><a href="itemView_form.do?itemNum=${list.itemNum}">${list.itemName}</a></td>
								   <td> <fmt:formatNumber value="${list.itemPrice}" pattern="###,###,###"/> </td>
								   <td>${list.itemCount}</td>
							  </tr> 
						  </c:forEach>
						 </tbody>
					</table>
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