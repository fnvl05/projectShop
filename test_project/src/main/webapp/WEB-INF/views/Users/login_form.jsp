<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인/view/Users/login_form</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
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
<section id="content">
 <form action="login.do" method="post">
   <h2>Sign In</h2>
   <p>
   <label for="userId">ID</label>
   <input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요" required="required" />      
   </p>
   <p>
     <label for="userPass">Password</label>
     <input type="password" id="userPass" name="userPass" placeholder="비밀번호를 입력해주세요" required="required" />        
   </p>
   <p>
     <button type="submit" id="signup_btn" name="signup_btn">로그인</button> 
   </p>
   <p>
     <button type="button"><a href="${pageContext.request.contextPath }/Users/searchIdForm.do">아이디/패스워드 찾기</a></button>
   </p>
   <p>
     <button type="button"><a href="${pageContext.request.contextPath }/Users/signup_form.do">회원가입</a></button>
   </p> 
 </form>   
</section>
<footer id="footer">
   <div id="footer_box">
      <%@ include file="../include/footer.jsp" %>
   </div>      
</footer>

</body>
</html>