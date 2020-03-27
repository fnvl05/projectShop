<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
	<div id="root">
		<header>
			<div class="header_box">
				<nav id="nav">
					<div class="navbar-right">
						<%@ include file="../include/nav.jsp" %>
					</div>
					<div id="index_logo_div">
						<%@ include file="../include/header.jsp" %>
					</div>
					<div class="navbar-left">
							<%@ include file="../include/master_aside.jsp" %>						
					</div>
				</nav>
			</div>
		</header>
		<section id="container">
			<div id="container_box">
				<h2>상품 목록</h2>
				<div id="container_box">
					<table>
						 <thead>
							 <tr>
							   <th>이미지</th>
							   <th>이름</th>
							   <th>카테고리</th>
							   <th>가격</th>
							   <th>수량</th>
							   <th>등록날짜</th>
							 </tr>
						 </thead>
						 <tbody>
						  <c:forEach items="${list}" var="list">
							  <tr>
								   <td><img alt="이미지" src="../resources${list.itemImg}" class="thumbImg"/></td>
								   <td><a href="itemView_form.do?itemNum=${list.itemNum}">${list.itemName}</a></td>
								   <td>${list.cateCode}</td>
								   <td> <fmt:formatNumber value="${list.itemPrice}" pattern="###,###,###"/> </td>
								   <td>${list.itemCount}</td>
								   <td>
								   <fmt:parseDate value="${list.itemDate}" var="itemDate"  pattern="yyyy-MM-dd HH:mm:ss.S" scope="page"/>
								   <fmt:formatDate value="${itemDate}"  pattern="yyyy.MM.dd"/>
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