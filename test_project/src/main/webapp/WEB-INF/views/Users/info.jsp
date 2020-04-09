<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<title>회원수정 창/Users/info.jsp</title>
</head>
<body>
<section id="content">
<form action="info.do">
	<div class="select_area">
		<h1>개인 정보 페이지</h1>
		<table>
			<tr>
				<th>ID</th>
				<td>${dto.userId}</td>
			</tr>
			<tr>
				<th>PassWord</th>
				<td><a onclick="newpassform();">수정하기</a></td>
			</tr>
            <script>
               function newpassform(){
                  window.open("newPassform.do","newpass",
                        "width=400,height=300,top=250,left=550,resizable=no");
               }
            </script>
			<tr>
				<th>이름</th>  
				<td>${dto.userName}</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${dto.userPhone}</td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td>${dto.email}</td>
			</tr>
			<tr>
				<th>첫번째 주소</th>
				<td>${dto.userAddr1}</td>
			</tr>
			<tr>
				<th>두번째 주소</th>
				<td>${dto.userAddr2}</td>
			</tr>
			<tr>
				<th>세번째 주소</th>
				<td>${dto.userAddr3}</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${dto.birthday}</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${dto.regiDate}</td>
			</tr>
		</table>
		<a href="${pageContext.request.contextPath}/home.do">홈으로</a>
		<p><a href="updateform.do">개인 정보 수정하기</a></p>
		
		<%-- <p><a href="${pageContext.request.contextPath}/Users/updateform.do">개인 정보 수정하기</a></p> --%>
	</div>
</form>
</section>
</body>
</html>





