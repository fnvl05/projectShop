<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/review/itemList_review.jsp</title>
</head>
<body>
<div class="container">
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
			
			
			<c:forEach var="tmp" items="${requestScope.list }">
				<tr>
					<td>${tmp.reviewNum }</td>
					<td>
						<a href="detail.do?num=${tmp.itemNum }">${tmp.itemName }</a>
					</td>
					<td><img src=../resources"${tmp.itemImg }"/></td>
					<td>${tmp.likeCount }</td>
					<td>${tmp.upCount }</td>
					<td>${tmp.reviewWriter }</td>
					<td>${tmp.regdate }</td>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>
	
	<div class="page-display">
		<ul class="pagination pagination-sm">
			<c:choose>
				<c:when test="${startPageNum ne 1 }">
					<li>
						<a href="list.do?pageNum=${startPageNum-1 }">&laquo;</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="disabled">
						<a href="javascript:">&laquo;</a>
					</li>
				</c:otherwise>
			</c:choose>
			<%-- step="1" 은 기본값이다. --%>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">
				<c:choose>
					<c:when test="${i eq pageNum }">
						<li class="active">
							<a href="list.do?pageNum=${i }">${i }</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="list.do?pageNum=${i }">${i }</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${endPageNum < totalPageCount }">
					<li>
						<a href="list.do?pageNum=${endPageNum+1}">&raquo;</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="disabled">
						<!-- "javascript:" 이것만 쓰면 동작하지않음 -->
						<a href="javascript:">&raquo;</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<a href="insertform.do?itemNum=${itemNum }">해당 상품 리뷰쓰기</a>
</body>
</html>