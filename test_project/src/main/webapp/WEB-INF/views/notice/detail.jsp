<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/notice/detail.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap-theme.min.css">
<style>
/* 글 내용을 출력할 div 에 적용할 css */
.contents, table {
	width: 100%;
	border: 1px dotted #cecece;
	box-shadow: 3px 3px 5px 6px #ccc;
}
</style>
</head>
<body>
	<div id="root">
		<header id="heder_box">
			<div>
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>
	</div>
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp"%>
		</div>
	</nav>
	<section id="container">
		<aside>
			<div id="aside_box">
				<c:choose>
					<c:when test="${not empty sessionScope.userDto.userId }">
						<c:if test="${sessionScope.userDto.verify eq 1}">
							<%@ include file="../include/master_aside.jsp"%>
						</c:if>
						<c:if test="${sessionScope.userDto.verify eq 0}">
							<%@ include file="../include/users_aside.jsp"%>
						</c:if>
					</c:when>
					<c:otherwise>
						<%@ include file="../include/unknown_aside.jsp"%>
					</c:otherwise>
				</c:choose>
			</div>
		</aside>
		<div class="container">
			<ol class="breadcrumb">
				<li><a
					href="${pageContext.request.contextPath }/notice/list.do">목록</a></li>
				<li>글 상세 보기</li>
			</ol>
			<c:if test="${not empty keyword }">
				<p>
					<strong>${keyword }</strong> 검색어로 검색된 결과 자세히 보기 입니다.
				</p>
			</c:if>

			<c:if test="${dto.prevNum ne 0 }">
				<a
					href="detail.do?num=${dto.prevNum }&condition=${condition}&keyword=${encodedKeyword}">이전글</a>
			</c:if>

			<c:if test="${dto.nextNum ne 0 }">
				<a
					href="detail.do?num=${dto.nextNum }&condition=${condition}&keyword=${encodedKeyword}">다음글</a>
			</c:if>
			<table class="table table-bordered table-condensed">
				<colgroup>
					<col class="col-xs-3" />
					<col class="col-xs-9" />
				</colgroup>
				<tr>
					<th>글번호</th>
					<!-- num 인자를 전달 했을 때 글 하나의 정보를 리턴하는 메소드를 Dao에 만들어야 한다. -->
					<td>${dto.num }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${dto.writer }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${dto.title }</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${dto.regdate }</td>
				</tr>
			</table>
			<div class="contents">${dto.content }</div>
			<%-- 
			글 작성자와 로그인 된 아이디가 같을때만 기능을 제공해 준다. 
			즉, 본인이 작성한 글만 수정할수 있도록 하기 위해
		--%>
			<c:if test="${dto.writer eq id }">
				<!-- 글 작성자와 session에 있는 아이디가 같을 때! -->
				<a class="btn btn-info" href="updateform.do?num=${dto.num }"> 수정
				</a>
				<a class="btn btn-warning" href="javascript:deleteConfirm()">삭제</a>
			</c:if>
		</div>
	</section>
	<script>
		function deleteConfirm() {
			var isDelete = confirm("글을 삭제 하시 겠습니까?");
			if (isDelete) {
				location.href = "delete.do?num=${dto.num}";
			}
		}
	</script>
</body>
</html>




