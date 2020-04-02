<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/Users/boardList.jsp</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<style>
	img{
		width: 50px;
		height: auto;
	}
</style>
</head>
<body>
<div id="root">
	<header>
		<div class="header_box">
			<nav id="nav">
				<div class="navbar-right">
					<%@ include file="../include/nav.jsp" %>
				</div>
				<div id="index_logo_div">
					<a href="../index.do"><img id="index_logo_img" src="${pageContext.request.contextPath }/resources/images/project.png"/></a>
				</div>
				<div class="navbar-left">
						<%@ include file="../include/users_aside.jsp" %>						
				</div>
			</nav>
		</div>
	</header>
	<section id="container">	
	<div id="container_box">
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
							<td><a href="../Users_Item/itemView_form.do?itemNum=${tmp.itemNum }"><img src="../resources${tmp.itemImg }" /></a></td>
							<td>${tmp.title }</td>
							<td>${tmp.viewCount }</td>
							<td>${tmp.regdate }</td>
							<td>${tmp.writer }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
			<c:if test="${empty qnalist  }">
				<p style="text-align: center;">작성하신 Q&A가 없습니다.</p>
			</c:if>
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
							<td><a href="../Users_Item/itemView_form.do?itemNum=${tmp2.itemNum }"><img src="../resources${tmp2.itemImg }" /></a></td>
							<td>${tmp2.itemName }</td>
							<td>${tmp2.likeCount }</td>
							<td>${tmp2.upCount }</td>
							<td>${tmp2.regdate }</td>
							<td>${tmp2.reviewWriter }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
			<c:if test="${empty reviewlist  }">
				<p style="text-align: center;">작성하신 Review가 없습니다.</p>
			</c:if>
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