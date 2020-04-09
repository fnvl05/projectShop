<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

		<section id="container">
			<div id="container_box">
				<h2>상품 목록</h2>
					<ul id="ul1">
					 <c:forEach items="${cateList}" var="cateList">
					 <li>
					  <div class="itemThumb">
					   <img alt="이미지" src="../resources${cateList.itemImg}" class="thumbImg"/>
					  </div> 
					  <div class="itemName">
					   <a href="itemView_form.do?itemNum=${cateList.itemNum}&pageNum=1&reviewNum=1">${cateList.itemName}</a>
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
