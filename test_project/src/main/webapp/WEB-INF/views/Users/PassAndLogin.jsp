<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/Users/PassAndLogin</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
</head>
<body>
<section id="content">

		<h1>귀하의 아이디는 ${dto.userId } 입니다.</h1>
	
		<p><a href="${pageContext.request.contextPath }/Users/login_form.do">로그인</a></p>
		<p><a href="${pageContext.request.contextPath }/Users/searchPassForm.do">비밀번호 찾기</a></p>

</section>
</body>
</html>