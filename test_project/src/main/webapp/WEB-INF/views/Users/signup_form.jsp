<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view/Users/signup_form</title>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
</head>
<body>
<section id="content">
 <form action="signup.do" method="post">
  <div class="input_area">
   <label for="userId">ID</label>
   <input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요" required="required" />      
  </div>
  
  <div class="input_area">
   <label for="userPass">PassWord</label>
   <input type="password" id="userPass" name="userPass" required="required" />      
  </div>
  
  <div class="input_area">
		<label for="PassQuiz">비밀번호 찾기 질문</label>
		<select name="PassQuiz" id="PassQuiz" required="required">
			<option value="titlename" >질문을 선택하세요.</option>
			<option value="Home">지금 사는 곳이 어디입니까?</option>
			<option value="Eat">집에 가면 밥을 먹습니까?</option>
			<option value="GoBack">지금 집에 가고 싶습니까?</option>
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
   <input type="text" id="userPhone" name="userPhone" placeholder="연락처를 입력해주세요" required="required" />      
  </div>
  
  <div class="input_area">
  	<label for="email">E-Mail</label>
  	<input type="email" id="email" name="email" placeholder="E-Mail을 입력하세요."/>
  </div>
  
  <div class="input_area">
  	<label for="userAddr1">주소 1</label>
  	<input type="text" id="userAddr1" name="userAddr1" placeholder="첫번째 주소를 입력하세요." />
  </div>

  <div class="input_area">
  	<label for="userAddr2">주소 2</label>
  	<input type="text" id="userAddr2" name="userAddr2" placeholder="두번째 주소를 입력하세요." />
  </div>
  
  <div class="input_area">
  	<label for="userAddr3">주소 3</label>
  	<input type="text" id="userAddr3" name="userAddr3" placeholder="세번째 주소를 입력하세요." />
  </div>
  
  <div class="input_area">
  	<label for="birthday">생일</label>
  	<input type="date" id="birthday" name="birthday" required="required" />
  </div>
  
  <button type="submit" id="signup_btn" name="signup_btn">회원가입</button>
 </form>   
</section> 
</body>
</html>