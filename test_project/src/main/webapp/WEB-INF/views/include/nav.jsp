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
			<li>
				<a href="${pageContext.request.contextPath }/Users/logout.do">
				<img src="../resources/images/header_logout_icon.png"  alt="로그아웃" 
				onmouseover="this.src='../resources/images/header_logout_icon_on.png'" 
				onmouseout="this.src='../resources/images/header_logout_icon.png'"/>	
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/shop/cartList.do" >
					<img src="../resources/images/header_cart_icon.png"  alt="장바구니" 
					onmouseover="this.src='../resources/images/header_cart_icon_on.png'" 
					onmouseout="this.src='../resources/images/header_cart_icon.png'"/>	
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/Users/myPage.do" >
				<img src="../resources/images/header_mypage_icon.png"  alt="마이페이지" 
				onmouseover="this.src='../resources/images/header_mypage_icon_on.png'" 
				onmouseout="this.src='../resources/images/header_mypage_icon.png'"/>	
				</a>
			</li>
		</c:when>
		<c:otherwise>
			<li>
				<a href="${pageContext.request.contextPath }/Users/login_form.do" class="log">
				<img src="resources/images/header_login_icon.png"  alt="로그인" 
				onmouseover="this.src='resources/images/header_login_icon_on.png'" 
				onmouseout="this.src='resources/images/header_login_icon.png'"/>				
			</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/Users/signup_form.do">
					<img src="resources/images/header_join_icon.png"  alt="회원가입" 
						onmouseover="this.src='resources/images/header_join_icon_on.png'" 
						onmouseout="this.src='resources/images/header_join_icon.png'"/>
				</a>
			</li>
		</c:otherwise>
	</c:choose>
</ul>