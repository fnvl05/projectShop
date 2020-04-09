<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<title>회원수정 창/Users/info.jsp</title>
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
	<br /><br />
<section id="content">
<div class="typeWrite">
<form action="info.do">
		<h2 class="title">개인 정보 페이지</h2>
		<br />
		<table id="signup">
		 <tbody id="signbody">
			<tr>
				<th class="row">ID</th>
				<td>${dto.userId}</td>
			</tr>
			<tr>
				<th class="row">PassWord</th>
				<td><a href="${pageContext.request.contextPath}/Users/newPassform.do">수정하기</a></td>
			</tr>
			<tr>
				<th class="row">이름</th>
				<td>${dto.userName}</td>
			</tr>
			<tr>
				<th class="row">연락처</th>
				<td>${dto.userPhone}</td>
			</tr>
			<tr>
				<th class="row">E-mail</th>
				<td>${dto.email}</td>
			</tr>
			<tr>
				<th class="row">첫번째 주소</th>
				<td>${dto.userAddr1}</td>
			</tr>
			<tr>
				<th class="row">두번째 주소</th>
				<td>${dto.userAddr2}</td>
			</tr>
			<tr>
				<th class="row">세번째 주소</th>
				<td>${dto.userAddr3}</td>
			</tr>
			<tr>
				<th class="row">생년월일</th>
				<td>${dto.birthday}</td>
			</tr>
			<tr>
				<th class="row">가입일</th>
				<td>${dto.regiDate}</td>
			</tr>
			</tbody>
		</table>		
		<%-- <p><a href="${pageContext.request.contextPath}/Users/updateform.do">개인 정보 수정하기</a></p> --%>
	</form>
	<br />
<div class="sbtn">
	<button class="signbtn" onclick="location.href='../index.do'">홈으로</button>
	<button class="signbtn" onclick="location.href='updateform.do'">수정하기</button>
</div>
</div>

</section>
</body>
</html>





