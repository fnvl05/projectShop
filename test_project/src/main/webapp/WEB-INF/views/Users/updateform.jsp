<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정/Users/updateform.jsp</title>
</head>
<body>
<section id="context">
 <form action="update.do" method="post">
 	<div class="input_area">
 		<h2>개인정보 수정 페이지</h2>
 		<div>
 			<label for="userId">ID</label>
 			<input type="text" name="userId" id="Id" required="required" />
 		</div>
 		<div>
 			<label for="userName">이름</label>
 			<input type="text" name="userName" id="newuserName" required="required" />
 		</div>
 		<div>
 			<label for="userPhone">연락처</label>
 			<input type="text" name="userPhone" id="newUserPhone" />
 		</div>
 		<div>
 			<label for="email">E-mail</label>
 			<input type="text" name="email" id="newemail" required="required" />
 		</div>
 		<div>
 			<label for="userAddr1">주소1</label>
 			<input type="text" name="userAddr1" id="newUserAddr1" />
 		</div>
 		<div>
 			<label for="userAddr2">주소2</label>
 			<input type="text" name="userAddr2" id="newUserAddr2" />
 		</div>
 		<div>
 			<label for="userAddr3">주소3</label>
 			<input type="text" name="userAddr3" id="newUserAddr3"/>
 		</div>
 		
 		<button type="submit" id="update_Btn" name="update_Btn">개인정보 수정완료</button>
 	</div>
 </form>	
</section>
</body>
</html>