<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<section id="container">
			<div id="container_box">
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