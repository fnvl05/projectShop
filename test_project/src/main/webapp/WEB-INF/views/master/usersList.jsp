<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="root">
		<header id="heder_box">
			<div>
				<%@ include file="../include/header.jsp" %>
			</div>
		</header>
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp" %>
			</div>
		</nav>
		<section id="container">
			<aside>
				<%@ include file="../include/master_aside.jsp" %>
			</aside>
			<div id="container_box">
				<h2>유저 관리</h2>
				<div id="container_box">
					<table>
						 <thead>
							 <tr>
							   <th>아이디</th>
							   <th>유저타입</th>
							   <th>상품이름</th>
							   <th>처리여부</th>
							   <th>배송처리</th>
							   <th></th>
							 </tr>
						 </thead>
						 <tbody>
						  <c:forEach items="${list}" var="list">
							  <tr>
								   <td>${list.userId }</td>
								   <td>${list.verify }</td>
								   <td>
								   	<select id="userVerify">
								   	
								   	</select>
								   </td>
								   <td>
								     	<select id="userResult">
								   	
								   		</select>
								   </td>
								   <td>
									    <select id="user">
								   	
								   		</select>			
								   </td>		     
							  </tr>   
						  </c:forEach>
						 </tbody>
					</table>
				
				</div>
			</div>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>