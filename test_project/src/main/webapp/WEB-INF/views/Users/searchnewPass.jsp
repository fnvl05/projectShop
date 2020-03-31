<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/Users/searchnewPass.jsp</title>
</head>
<body>
<section id="content">
<form action="changeNewPassData.do" method="post">
 <div class="input_area">
 	<h2>비밀번호 수정 페이지</h2>
 	<input type="hidden" name="userId" value="${dto.userId }"/>
 	<input type="hidden" name="userName" value="${dto.userName }"/>
	<div>
 		<label for="newuserPass1">신규 비밀번호</label>
 		<input type="password" name="newPass" id="newuserPass1"  />
 	</div>
 	
 	<div>
 		<label for="newuserPass2">신규 비밀번호 확인</label>
 		<input type="password" id="newuserPass2" />
 	</div>
 	
 	<button type="submit" id="searchupPass_Btn" name="searchupPass_Btn">수정확인</button>
 </div>
</form>
</section>
<script>
	//비밀번호를 입력할때 실행할 함수 등록
	$("#newuserPass1, #newuserPass2").on("input", function(){
		//상태값을 바꿔준다. 
		isPwdDirty=true;
		
		//입력한 비밀번호를 읽어온다.
		var pwd=$("#newuserPass1").val();
		var pwd2=$("#newuserPass2").val();
		
		if(pwd != pwd2){//두 비밀번호를 동일하게 입력하지 않았다면
			isPwdEqual=false;
		}else{
			isPwdEqual=true;
		}
		//isPwdEqual = pwd != pwd2 ? false : true;
		if(pwd.length == 0){
			isPwdInput=false;
		}else{
			isPwdInput=true;
		}
		//비밀번호 에러 여부 
		var isError=!isPwdEqual || !isPwdInput;
	});

</script>
</body>
</html>