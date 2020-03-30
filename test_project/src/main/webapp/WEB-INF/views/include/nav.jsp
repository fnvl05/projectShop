<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<ul class="nav nav-tabs">
	<c:choose>
		<c:when test="${not empty id}">
			<c:if test="${sessionScope.verify eq 1}">
				<li role="presentation"><a href="${pageContext.request.contextPath }/master/master_index.do">관리자</a></li>
				<li role="presentation"><a href="index.do">홈으로</a></li>		
			</c:if>
				<li role="presentation"><span class="navText"><strong>${id}님</strong> 환영합니다</span></li>
				<li role="presentation"><a href="${pageContext.request.contextPath }/Users/logout.do">로그아웃</a></li>
				<li role="presentation"><a href="${pageContext.request.contextPath }/shop/cartList.do" >장바구니</a></li>
		</c:when>
		<c:otherwise>
			<li role="presentation"><a href="${pageContext.request.contextPath }/Users/login_form.do">로그인</a></li>
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/Users/signup_form.do">회원가입</a>
			</li>
		</c:otherwise>
	</c:choose>
</ul>