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
			<aside>
				<%@ include file="../include/users_aside.jsp" %>
			</aside>
			<div id="container_box">
				<h2>상품 목록</h2>
			<div id="container_box">
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
								   <td><a href="../master/itemView_form.do?itemNum=${list.itemNum}">${list.itemName}</a></td> <!-- 임시 주소 -->
								   <td> <fmt:formatNumber value="${list.itemPrice}" pattern="###,###,###"/> </td>
								   <td>${list.itemCount}</td>
							  </tr>   
						  </c:forEach>
						 </tbody>
					</table>
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