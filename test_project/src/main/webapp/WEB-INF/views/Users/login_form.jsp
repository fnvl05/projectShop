<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<title>로그인/view/Users/login_form</title>
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
				<a href="../index.do">
				<img id="index_logo_img" src="${pageContext.request.contextPath }/resources/images/project.png" /></a>
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
<section id="content">
<div class="login_pg_box">
 <form action="login.do" method="post">
   <h2 class="login">로그인</h2>
  
  <div class="item">
	<label class="ePlaceholder" title="아이디">
	<input type="text" id="userId" name="userId" placeholder="아이디" required="required" />
	</label>
</div>
<div class="item">
	<label class="ePlaceholder" title="패스워드">
	<input id="userPass" name="userPass" type="password" placeholder="패스워드" required="required" />
	</label>	
</div>
  
  <button type="submit" id="signup_btn" name="signup_btn">로그인</button>
<div class="item">
<ul class="ot_link">
	<li><a href="#">
	<div class="icon"><img src="${pageContext.request.contextPath }/resources/images/ico_6601.png" alt=""></div>아이디찾기</a></li>
	<li><a href="#">
	<div class="icon"><img src="${pageContext.request.contextPath }/resources/images/ico_6602.png" alt=""></div>비밀번호찾기</a></li>
	<li><a href="#">
	<div class="icon"><img src="${pageContext.request.contextPath }/resources/images/ico_6603.png" alt=""></div>회원가입</a></li>
</ul>
</div>
  
 </form>  
 </div> 
</section> 	
</body>
</html>