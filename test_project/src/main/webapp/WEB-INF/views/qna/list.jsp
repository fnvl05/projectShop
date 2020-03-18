	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/qna/list.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-theme.min.css">
</head>
<body>
	<div id="root">
			<header id="heder_box">
				<div>
					<%@ include file="../include/header.jsp" %>
				</div>
			</header>
	</div>
	<nav id="nav">
				<div id="nav_box">
					<%@ include file="../include/nav.jsp" %>
				</div>
	</nav>
	<section id="container">
	<aside>
		<div id="aside_box">
			<c:choose>
					<c:when test="${not empty sessionScope.userDto.userId }">
						<c:if test="${sessionScope.userDto.verify eq 1}">
							<%@ include file="../include/master_aside.jsp" %>													
						</c:if>
						<c:if test="${sessionScope.userDto.verify eq 0}">
							<%@ include file="../include/users_aside.jsp" %>						
						</c:if>
					</c:when>
					<c:otherwise>
							<%@ include file="../include/unknown_aside.jsp" %>			
					</c:otherwise>
				</c:choose>
		</div>
	</aside>
		<div id="container_box">
	<c:if test="${not empty keyword }">
		<p>
			<strong>${keyword }</strong> 라는 검색어로 
			<strong>${totalRow }</strong> 개의 글이 검색 
			되었습니다.
		</p>
	</c:if>
	<h1>QnA</h1>
	<table class="table table-hover">
		<colgroup>
			<col class="col-xs-1"/>
			<col class="col-xs-1"/>
			<col class="col-xs-4"/>
			<col class="col-xs-1"/>
			<col class="col-xs-1"/>
			<col class="col-xs-3"/>
		</colgroup>
		<thead>
			<tr>
				<th>글번호</th>
				<th>상품정보</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${requestScope.list }">
			<tr>
				<td>${tmp.num }</td>
				<td><img src="../resources${tmp.itemImg }"/></td>
				<td>
					<c:choose>
						<c:when test="${not empty sessionScope.userDto.userId }">
							<c:choose>
								<c:when test="${sessionScope.userDto.verify eq 1 || sessionScope.userDto.userId == tmp.writer}">
									<a href="detail.do?num=${tmp.num }&condition=${condition }&keyword=${encodedKeyword }">
											${tmp.title }
									</a>
								</c:when>
								<c:otherwise>
									비밀글입니다. <img src="${pageContext.request.contextPath }/resources/images/keySmall.png"/>
								</c:otherwise>
							</c:choose>
							
						</c:when>
						<c:otherwise>
							로그인을 하세요.
						</c:otherwise>
					</c:choose>
				</td>
				<td>${tmp.writer }</td>
				<td>${tmp.viewCount }</td>
				<td>${tmp.regdate }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	
	<div class="page-display">
		<ul class="pagination">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li>
					<a href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedKeyword }">
						&laquo;
					</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPageNum }" 
			end="${endPageNum }" step="1">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="active"><a href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedKeyword }">${i }</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedKeyword }">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<li>
					<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedKeyword }">
						&raquo;
					</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		</ul>		
	</div>
	<%-- 글 검색 기능 폼 --%>
	
	<form action="list.do" method="get">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="titlecontent" <c:if test="${condition eq 'titlecontent' }">selected</c:if> >제목+내용</option>
			<option value="title" <c:if test="${condition eq 'title' }">selected</c:if> >제목</option>
			<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if> >작성자</option>
		</select>
		<input type="text" name="keyword" 
			placeholder="검색어 입력..." value="${keyword }"/>
		<button type="submit">검색</button>
	</form>
	</div>
	</section>
</body>
</html>