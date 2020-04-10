<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
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
				<h2 class="title">유저 배송상태 관리</h2>
				<div id="container_box">
					<table class="table table-hover" style="width: 1200px; margin-left: auto; margin-right: auto;">
						 <thead>
							 <tr>
							   <th>아이디</th>
							   <th>상품이름</th>
							   <th></th>
							 </tr>
						 </thead>
						 <tbody>
						  <c:forEach items="${userList}" var="userList" varStatus="i">
							  <tr>
								   <td>${userList.userId }</td>
								   <c:forEach items="${itemList}" var="itemList" varStatus="j">
								   <c:if test="${userList.orderNum eq itemList.orderNum }">
									   		<td><input type="hidden" name="odNum" value="${itemList.odNum} "/>${itemList.itemName }<br/>
										    <select class="itemResult" name="itemResult" id="${itemList.odNum}">	
										    	<option value="처리" <c:if test="${itemList.result eq '처리'}">selected</c:if>>처리</option>
										    	<option value="미처리"<c:if test="${itemList.result eq '미처리'}">selected</c:if>>미처리</option>					
									   		</select>					     
									   </td>
								   </c:if>
								   </c:forEach>
							  </tr>   
						  </c:forEach>
						 </tbody>
					</table>
					<script type="text/javascript">	
						$("select").on("change",function(){
								var resultArray = [];
								var tag=$(this).attr("id");
								var target=$(this).val();
								resultArray.push(target);
								resultArray.push(tag);
					 		$.ajax({
								url:"resultUpDate.do",
								type:"post",
								data: {"resultArray":resultArray},
								success:function(responseData){
									if(responseData.isSuccess){									
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