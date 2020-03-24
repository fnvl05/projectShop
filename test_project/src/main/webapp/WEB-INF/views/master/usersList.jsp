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
							   <th>처리여부</th>
							   <th>배송처리</th>
							   <th></th>
							 </tr>
						 </thead>
						 <tbody>
						  <c:forEach items="${list}" var="list">
							  <tr>
								   <td><input type="hidden" name="userId" value="${list.odNum }">${list.userId }</td>
								   <td>${list.verify }</td>
								   <td><input type="radio" name="result" value="미처리" id="result" <c:if test="${list.delivery eq '미처리'}" >checked</c:if>/>미처리							   
								   <input type="radio" name="result" value="처리" id="result" <c:if test="${list.delivery eq '처리'}" >checked</c:if>/>처리
								   </td>
								   <td>
									   <input type="radio" name="delivery" id="delivery" value="배송준비" <c:if test="${list.delivery eq '배송준비'}" >checked</c:if>/>배송준비
									   <input type="radio" name="delivery" id="delivery" value="배송중"  <c:if test="${list.delivery eq '배송중'}" >checked</c:if>/>배송중
									   <input type="radio" name="delivery" id="delivery" value="배송완료"  <c:if test="${list.delivery eq '배송완료'}" >checked</c:if>/>배송완료								   		
								   </td>		     
							  </tr>   
						  </c:forEach>
						 </tbody>
					</table>
					<script>
						$("#result").click(function() {
							var result = $("#result").val();
							$.ajax({
								url:url,
								method:"post",
								data:data,
								success:function(result){
									// responseData : {isSuccess:true}
									if(responseData){
										//폼을 안보이게 한다 
										$this.slideUp(200);
										//폼에 입력한 내용 읽어오기
										var content=$this.find("textarea").val();
										//pre 요소에 수정 반영하기 
										$this.parent().find("pre").text(content);
									}
								}
							});
						})
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