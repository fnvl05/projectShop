<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<section id="content">
 <form action="searchPass.do" method="post">
 	<div class="input_area">
   		<label for="userName">이름</label>
   		<input type="text" id="userName" name="userName" placeholder="이름을 입력해주세요" required="required" />      
  	</div>
  	<div class="input_area">
   		<label for="userPhone">연락처</label>
   		<input type="text" id="userPhone" name="userPhone" placeholder="연락처를 입력해주세요" required="required" />      
  	</div>
  	<div class="input_area">
  		<label for="birthday">생년월일</label>
  		<input type="date" id="birthday" name="birthday" required="required" />
  	</div>
  	
  	<button type="submit" id="searchId_btn" name="searchId_btn">아이디 찾기</button>
 </form>
</section>
</body>
</html>