<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
 	<h1>${dto.userId }</h1>
 	<h2>바로 비밀번호를 찾으로 갑니다. 고고!</h2>
<section id="content">
 <form action="searchPass.do" method="post">
 	<div class="input_area">
   		<label for="userId">ID</label>
   		<input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요" required="required" />      
  	</div>
  	
  	<div class="input_area">
		<label for="PassQuiz">비밀번호 찾기 질문 (회원가입시 선택한 질문으로 선택하여 답해주십시요.)</label>
		<select name="PassQuiz" id="PassQuiz">
			<option value="titlename" >질문을 선택하세요.</option>
			<option value="Mom">어머니의 성함은?</option>
			<option value="Dad">아버지의 성함은?</option>
			<option value="Pet">애완동물의 이름은?</option>
			<option value="Love">가장 사랑하는 인물은?</option>
			<option value="Faverite">가장 존경하는 인물은?</option>
		</select>
  </div>
  
  <div class="input_area">
  	<label for="quizAnswer">비밀번호 찾기 답변</label>
  	<input type="text" id="quizAnswer" name="quizAnswer" placeholder="답을 입력하세요." required="required" />
  </div>
  
  <div class="input_area">
   <label for="userName">이름</label>
   <input type="text" id="userName" name="userName" placeholder="닉네임을 입력해주세요" required="required" />      
  </div>
  
  <div class="input_area">
   	<label for="userPhone">연락처</label>
   	<input type="text" id="userPhone" name="userPhone" placeholder="연락처를 입력해주세요(- 표시바람)" required="required" />     
  </div>
  <div class="input_area">
  	<label for="email">이메일</label>
  	<input type="email" id="email" name="email" placeholder="이메일 형식에 맞게 입력해주세요." required="required" />
  </div>
  
  <button type="submit" id="update_Btn" name="update_Btn">비밀번호 찾기</button>
 </form>
</section>
</body>
</html>