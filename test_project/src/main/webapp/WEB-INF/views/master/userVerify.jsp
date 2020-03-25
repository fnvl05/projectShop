<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
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
							   <th>이메일</th>
							   <th>전화번호</th>
							   <th>주소</th>
							   <th>생일</th>
							   <th>등급</th>
							 </tr>
						 </thead>
						 <tbody>
						  <c:forEach items="${userAllList}" var="userAllList">
							  <tr>
								   <td>${userAllList.userId }</td>
								   <td>${userAllList.email }</td>
								   <td>${userAllList.userPhone }</td>
								   <td>${userAllList.userAddr1 } - ${userAllList.userAddr2 } - ${userAllList.userAddr3 }</td>
								   <td>
									   <fmt:parseDate value="${userAllList.birthday}" var="birthday"  pattern="yyyy-MM-dd HH:mm:ss.S" scope="page"/>
									   <fmt:formatDate value="${birthday}"  pattern="yyyy.MM.dd"/>
								   </td>
								   <td>
								   		<select id="${userAllList.userId }">
								   			<option value="0" <c:if test="${userAllList.verify eq '0'}">selected</c:if>>유저</option> 
								   			<option value="1" <c:if test="${userAllList.verify eq '1'}">selected</c:if>>관리자</option> 
								   		</select>
								   </td>
							  </tr>   
						  </c:forEach>
						 </tbody>
					</table>
					<script type="text/javascript">	
						$("select").on("change",function(){
								var verifyArray = [];
								var tag=$(this).attr("id");
								var target=$(this).val();
								console.log(tag);
								console.log(target);
								verifyArray.push(tag);
								verifyArray.push(target);
					 		$.ajax({
								url:"verifyUpDate.do",
								type:"post",
								data: {"verifyArray":verifyArray},
								success:function(responseData){
									if(responseData.isSuccess){	
										alert("성공");
										location.reload();	
									}else {
										alert("실패");
									}
								}	
								});
							});
					</script>
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