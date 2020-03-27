<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<ul>
	<c:choose>
		<c:when test="${not empty id}">
			<c:if test="${sessionScope.userDto.verify eq 1}">
				<li><a href="${pageContext.request.contextPath }/master/master_index.do">관리자</a></li>
				<li><a href="${pageContext.request.contextPath}/home.do">홈으로</a></li>		
			</c:if>
			<li>${id}님 환영합니다.</li>
			<li><a href="${pageContext.request.contextPath }/Users/logout.do">로그아웃</a></li>
			<li><a href="${pageContext.request.contextPath }/shop/cartList.do" >장바구니</a></li>
			<li><a href="${pageContext.request.contextPath }/shop/orderList.do">구매내역</a></li>
		</c:when>
		<c:otherwise>
			<li><a href="${pageContext.request.contextPath }/Users/login_form.do">로그인</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/Users/signup_form.do">회원가입</a>
			</li>
		</c:otherwise>
	</c:choose>
</ul>