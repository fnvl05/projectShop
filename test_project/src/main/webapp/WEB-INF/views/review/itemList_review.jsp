<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/review/itemList_review.jsp</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-theme.min.css">
<style>
img {
	width: 100px;
	height: auto;
}

.star-rating {
	width: 75px;
}

.star-rating, .star-rating span {
	display: inline-block;
	height: 14px;
	overflow: hidden;
	background:
		url(${pageContext.request.contextPath}/resources/images/star.png)
		no-repeat;
}

.star-rating span {
	background-position: left bottom;
	line-height: 0;
	vertical-align: top;
}
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
			<%@ include file="../include/users_aside.jsp" %>
		</aside>
			<div class="container">
				<br/>
				<br/>
				<p style="font-weight:bold;">리뷰 평점 : 
					<span class="wrap-star"> 
						<span class='star-rating'>
								 <span style="width:<fmt:formatNumber value="${avg *10}" pattern=".0"/>%"></span>
						</span> 
					</span>
				</p>
				<br/>
				<br/>
				<table>
					<thead>
						<tr>
							<th>글 번호</th>
							<th>아이템 명</th>
							<th>이미지</th>
							<th>별점</th>
							<th>좋아요</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="tmp" items="${requestScope.list }" varStatus="status">
							<tr>
								<td>${status.count}</td>  <!-- <td>${tmp.reviewNum}</td> -->
								<td><a href="detail.do?reviewNum=${tmp.reviewNum }">${tmp.itemName }</a>
								</td>
								<td><img src="../resources${tmp.itemImg }" /></td>
								<td>
								<span class="wrap-star"> 
									<span class='star-rating'>
										<span style="width:<fmt:formatNumber value="${tmp.likeCount *10}" pattern=".0"/>%"></span>
									</span> 
								</span>
								</td>
								<td>${tmp.upCount }</td>
								<td>${tmp.reviewWriter }</td>
								<td>${tmp.regdate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${empty list  }">
					<p style="text-align: center;">해당 아이템의 리뷰가 없습니다.</p>
				</c:if>
				<div class="page-display">
					<ul class="pagination pagination-sm">
						<c:choose>
							<c:when test="${startPageNum ne 1 }">
								<li><a
									href="itemList_review.do?pageNum=${startPageNum-1 }&itemNum=${itemNum}">&laquo;</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="javascript:">&laquo;</a></li>
							</c:otherwise>
						</c:choose>
						<%-- step="1" 은 기본값이다. --%>
						<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }"
							step="1">
							<c:choose>
								<c:when test="${i eq pageNum }">
									<li class="active"><a
										href="itemList_review.do?pageNum=${i }&itemNum=${itemNum}">${i }</a>
									</li>
								</c:when>
								<c:otherwise>
									<li><a
										href="itemList_review.do?pageNum=${i }&itemNum=${itemNum}">${i }</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${endPageNum < totalPageCount }">
								<li><a
									href="itemList_review.do?pageNum=${endPageNum+1}&itemNum=${itemNum}">&raquo;</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="disabled">
									<!-- "javascript:" 이것만 쓰면 동작하지않음 --> <a href="javascript:">&raquo;</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
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