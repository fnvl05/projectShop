<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<style>
	.form-control{
	display:inline-block;
	width:auto;
	padding-bottom:10;
	vertical-align:middle;
	}
	.navText{
	margin: 0;
    position: relative;
    display: block;
    top: 10px;
    padding: 10px 10px;
    padding-top: 15px;
	}
	.nav>li>a>img {
    max-width: none;
    position: relative;
    bottom: 4px;
	}
	
</style>
<ul class="nav nav-tabs">
	<c:choose>
		<c:when test="${not empty id}">
			<c:if test="${sessionScope.verify eq 1}">
				<li role="presentation"><a href="${pageContext.request.contextPath }/master/master_index.do">관리자</a></li>
				<li role="presentation"><a href="index.do">홈으로</a></li>		
			</c:if>
				<li role="presentation"><span class="navText"><strong>${id}님</strong> 환영합니다</span></li>
				<li>
					<a href="${pageContext.request.contextPath }/Users/logout.do">
					<img src="${pageContext.request.contextPath }/resources/images/header_logout_icon.png"  alt="로그아웃" 
					onmouseover="this.src='${pageContext.request.contextPath }/resources/images/header_logout_icon_on.png'" 
					onmouseout="this.src='${pageContext.request.contextPath }/resources/images/header_logout_icon.png'"/>	
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/shop/cartList.do" >
						<img src="${pageContext.request.contextPath }/resources/images/header_cart_icon.png"  alt="장바구니" 
						onmouseover="this.src='${pageContext.request.contextPath }/resources/images/header_cart_icon_on.png'" 
						onmouseout="this.src='${pageContext.request.contextPath }/resources/images/header_cart_icon.png'"/>	
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/Users/myPage.do" >
					<img src="${pageContext.request.contextPath }/resources/images/header_mypage_icon.png"  alt="마이페이지" 
					onmouseover="this.src='${pageContext.request.contextPath }/resources/images/header_mypage_icon_on.png'" 
					onmouseout="this.src='${pageContext.request.contextPath }/resources/images/header_mypage_icon.png'"/>	
					</a>
				</li>
				
				<li>
					<form class="navbar-form navbar-left" role="search" action="itemAllList.do" method="get">
					  <div class="form-group">
					    <input type="text" class="form-control" name="keyword" placeholder="Search">
					    <input type="image" src="${pageContext.request.contextPath }/resources/images/header_search_bt.png"/>					 
					  </div>					  
					</form>
				</li>
				 
		</c:when>
		<c:otherwise>
			<li>
				<a href="${pageContext.request.contextPath }/Users/login_form.do" class="log">
				<img src="${pageContext.request.contextPath }/resources/images/header_login_icon.png"  alt="로그인" 
				onmouseover="this.src='${pageContext.request.contextPath }/resources/images/header_login_icon_on.png'" 
				onmouseout="this.src='${pageContext.request.contextPath }/resources/images/header_login_icon.png'"/>				
			</a>
			</li>			
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/Users/signup_form.do">
					<img src="${pageContext.request.contextPath }/resources/images/header_join_icon.png"  alt="회원가입" 
						onmouseover="this.src='${pageContext.request.contextPath }/resources/images/header_join_icon_on.png'" 
						onmouseout="this.src='${pageContext.request.contextPath }/resources/images/header_join_icon.png'"/>
				</a>
			</li>
		</c:otherwise>
	</c:choose>
</ul>





