<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/detailList.jsp</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-theme.min.css">
<style>
	img{
		width:100px;
		heigth:auto;
	}
</style>
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
		<p><strong>[${sessionScope.userDto.userName }]</strong> 님의 주문번호 : ${orderNum} 의  주문 상세내역입니다.</p>
		<br/>
		<table>
			<c:forEach var="list" items="${list }">
			<tr>
				<th>주문번호</th>
				<td>${list.orderNum}</td>
			</tr>
			<tr>
				<th>주문자</th>
				<td>${userDto.userId }</td>
			</tr>
			<tr>
				<th>수신자</th>
				<td>${list.orderRec }</td>
			</tr>
			<tr>
				<th>연락처1</th>
				<td>${list.orderPhone1 }</td>
				<th>연락처2</th>
				<td>${list.orderPhone2 }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${list.userAddr1 }</td>
				<td>${list.userAddr2 }</td>
				<td>${list.userAddr3 }</td>
			</tr>
			<tr>
				<th>주문날짜</th>
				<td>${list.orderDate }</td>
			</tr>
			<tr>
				<th>지불방법</th>
				<c:choose>
				<c:when test="${list.payment eq 'card'}">
					<td>카드결제</td>
				</c:when>
				<c:when test="${list.payment eq 'cash'}">
					<td>현금결제</td>
				</c:when>
				<c:otherwise>
					<td>휴대폰결제</td>
				</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th>총 가격</th>
				<td><fmt:formatNumber value="${list.allPrice }" 
                     pattern="###,###,###"/>원</td>
			</tr>
			</c:forEach>
		</table>
		<br/>
		<br/>
		<br/>
		<table>
			<thead>
				<tr>
					<th>이미지</th>
					<th>아이템 명</th>
					<th>수량</th>
					<th>가격</th>
					<th>총 가격</th>
					<th>리뷰</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list2 }">
					<tr>
						<td>
							<img src="../resources${tmp.itemImg }"/>
						</td>
						<td>${tmp.itemName }</td>
						<td>${tmp.quantity }</td>
						<td><fmt:formatNumber value="${ tmp.itemPrice}" pattern="###,###,###"/>원</td>
						<td>
						<fmt:formatNumber value="${tmp.quantity *tmp.itemPrice }" pattern="###,###,###"/>원
						</td>
						<td><button onclick="insertform();">리뷰쓰기</button></td>
						<script>
							function insertform(){
								location.href="../review/insertform.do?itemNum=${tmp.itemNum}";
							}
						</script>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>