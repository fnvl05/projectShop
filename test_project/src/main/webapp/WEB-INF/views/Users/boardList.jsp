<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/Users/boardList.jsp</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-theme.min.css">
<style>
	img{
		width: 50px;
		height: auto;
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
			<h3>Q&A</h3>
			<table>
				<thead>
					<tr>
						<th>글번호</th>
						<th>이미지</th>
						<th>제목</th>
						<th>조회수</th>
						<th>등록일</th>
						<th>작성자</th>
					</tr>				
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${qnalist }" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td><img src="../resources${tmp.itemImg }" /></td>
							<td>${tmp.title }</td>
							<td>${tmp.viewCount }</td>
							<td>${tmp.regdate }</td>
							<td>${tmp.writer }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
		</div>
		<br/>
		<div class="container">
			<h3>Review</h3>
			<table>
				<thead>
					<tr>
						<th>글번호</th>
						<th>이미지</th>
						<th>아이템명</th>
						<th>평점</th>
						<th>좋아요</th>
						<th>등록일</th>
						<th>작성자</th>
					</tr>				
				</thead>
				<tbody>
					<c:forEach var="tmp2" items="${reviewlist }" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td><img src="../resources${tmp2.itemImg }" /></td>
							<td>${tmp2.itemName }</td>
							<td>${tmp2.likeCount }</td>
							<td>${tmp2.upCount }</td>
							<td>${tmp2.regdate }</td>
							<td>${tmp2.reviewWriter }</td>
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