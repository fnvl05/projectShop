<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인/view/Users/login_form</title>
</head>
<body>
<section id="content">
 <form action="login.do" method="post">
  <div class="input_area">
   <h2>로그인 정보 입력</h2>
   <label for="userId">아이디</label>
   <input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요" required="required" />      
  </div>
  
  <div class="input_area">
   <label for="userPass">패스워드</label>
   <input type="password" id="userPass" name="userPass" required="required" />      
  </div>
  
  <button type="submit" id="signup_btn" name="signup_btn">로그인</button>
  <br/>
  <a href="${pageContext.request.contextPath }/Users/searchIdForm.do">아이디/패스워드 찾기</a>
 </form>   
</section> 	
</body>
</html>