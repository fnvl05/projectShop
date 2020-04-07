<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ind-script/optimizer.php?filename=rZRNbgMhDIX3mWx7Dqs_x-glwOMyJGBTbKrm9mWSjNSqm2rKBiHL73s2MoZFMsHjU4VSJVSXoZJKq0iAqvBWhQ1QchY-9sAD_CWf8KCSmkXhg5fPncJmttc0uQvVfVJzPtE3KeHUlKpCSY49CpTmU8RpsZxAZ5pm0hgY9Bz55Rm6szQD7zTi1WHOIryazw1tSlFtP3zl5Q5KtAEhE7fi8OwCDeWuhbLU7NJQ7A1ZXIgcBj7yrwH9L_AWGD4G2NQkj8eObv-G9eLqPA2t-bSxU_QKp_dG9XJMMSzW9wRsl-GdXM_JpHjH_GMz7B_pu1VuyaIuUl5Hfe07GIU_ur7vpIIr9ws&type=css&k=8dad99db3c03e2204f6885130760cc2f3fa286a8&t=1582009673" />

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
</footer>

</body>
</html>
