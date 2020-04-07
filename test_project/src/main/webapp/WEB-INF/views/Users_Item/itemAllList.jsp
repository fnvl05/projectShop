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
<style>
	 #ul1 li { display:inline-block; margin:10px; }
	.thumbImg { width:200px; height:200px; }
	.itemName { padding:10px 0; text-align:center; }
	.itemName a { color:#000; }
	#ul1.column5 li.itemThumb { width:20%; }
</style>

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
<div class="container">

<h2>상품 목록</h2>
<br />
<br />
<br />
<ul id="ul1" style="text-align: center;" class="column5">
	 <c:forEach items="${list}" var="list">
	 <li>
	  <div class="itemThumb">
		   <img alt="이미지" src="../resources${list.itemImg}" class="thumbImg" 
		   style="width:250px ;height:250px "
		   onclick="location.href='itemView_form.do?itemNum=${list.itemNum}'" />
	  </div> 
	  <div class="itemName">
	  	   <a href="itemView_form.do?itemNum=${list.itemNum}">${list.itemName}</a>
	  </div>
	  <div class="itemPrice" style="text-align: center;">${list.itemPrice }원</div>
	 </li>
	 </c:forEach>
	</ul>
</div>
<footer id="footer">
	<div id="footer_box">
		<%@ include file="../include/footer.jsp" %>
	</div>
</footer>

</body>
</html>