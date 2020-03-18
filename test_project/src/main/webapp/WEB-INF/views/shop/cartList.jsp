<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-theme.min.css">

<style>
	
		body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
		a { color:#05f; text-decoration:none; }
		a:hover { text-decoration:underline; }
		
		h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
		ul, lo, li { margin:0; padding:0; list-style:none; }
	
		/* ---------- */
		
		div#root { width:900px; margin:0 auto; }
		header#header {}
		nav#nav {}
		section#container { }
			section#content { float:right; width:700px; }
			aside#aside { float:left; width:180px; }
			section#container::after { content:""; display:block; clear:both; }	
		footer#footer { background:#eee; padding:20px; }
		
		/* ---------- */
		
		header#header div#header_box { text-align:center; padding:30px 0; }
		header#header div#header_box h1 { font-size:50px; }
		header#header div#header_box h1 a { color:#000; }
		
		nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; }
		nav#nav div#nav_box li { display:inline-block; margin:0 10px; }
		nav#nav div#nav_box li a { color:#333; }
		
		section#container { }
		
		aside#aside h3 { font-size:22px; margin-bottom:20px; text-align:center; }
		aside#aside li { font-size:16px; text-align:center; }
		aside#aside li a { color:#000; display:block; padding:10px 0; }
		aside#aside li a:hover { text-decoration:none; background:#eee; }
		
		aside#aside li { position:relative; }
		aside#aside li:hover { background:#eee; } 		
		aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
		aside#aside li:hover > ul.low { display:block; }
		aside#aside li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
		aside#aside li:hover > ul.low li a:hover { background:#fff;}
		aside#aside li > ul.low li { width:180px; }
		
		footer#footer { margin-top:100px; border-radius:50px 50px 0 0; }
		footer#footer div#footer_box { padding:0 20px; }
		
	</style>
	
	
	<style>
		/*
		section#content ul li { display:inline-block; margin:10px; }
		section#content div.goodsThumb img { width:200px; height:200px; }
		section#content div.goodsName { padding:10px 0; text-align:center; }
		section#content div.goodsName a { color:#000; }
		*/
		section#content ul li { margin:10px 0; padding:10px 0; border-bottom:1px solid #999; }
		section#content ul li img { width:250px; height:250px; }
		section#content ul li::after { content:""; display:block; clear:both; }
		section#content div.thumb { float:left; width:250px; }
		section#content div.gdsInfo { float:right; width:calc(100% - 320px); }
		section#content div.gdsInfo { font-size:20px; line-height:2; }
		section#content div.gdsInfo span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }
		section#content div.gdsInfo .delete { text-align:right; }
		section#content div.gdsInfo .delete button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}
		
		.allCheck { float:left; width:200px; }
		.allCheck input { width:16px; height:16px; }
		.allCheck label { margin-left:10px; }
		.delBtn { float:right; width:300px; text-align:right; }
		.delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}
		
		.checkBox { float:left; width:30px; }
		.checkBox input { width:16px; height:16px; }
		
		.listResult { padding:20px; background:#eee; }
		.listResult .sum { float:left; width:45%; font-size:22px; }
		
		.listResult .orderOpne { float:right; width:45%; text-align:right; }
		.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
		.listResult::after { content:""; display:block; clear:both; } 
		
		.orderInfo { border:5px solid #eee; padding:20px; display:none; }
		.orderInfo .inputArea { margin:10px 0; }
		.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
		.orderInfo .inputArea input { font-size:14px; padding:5px; }
		#userAddr2, #userAddr3 { width:250px; }
		
		.orderInfo .inputArea:last-child { margin-top:30px; }
		.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}
		
		.orderInfo .inputArea #sample2_address { width:230px; }
		.orderInfo .inputArea #sample2_detailAddress { width:280px; }
		.orderInfo .inputArea #sample2_extraAddress { display:none; }
		
	</style>

</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>
	
	
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp" %>
		</div>
	</nav>
	<section id="container">
	<h1>장바구니</h1>
	<c:choose>
		<c:when test="${map.count==0 }">
			장바구니가 비어있습니다.
		</c:when>
		<c:otherwise>
			<table class="table table-striped table-condensed">
				<thead>
					<tr>
						<th>이미지</th>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>최종 가격</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="tmp" items="${requestScope.cartList }">
					<tr>
						<td><img src="../resources/${tmp.itemImg }" width="156px" height="120px"/></td>
						<td>${tmp.itemName }</td>
						<td>
						<fmt:formatNumber value="${tmp.itemPrice}" 
								pattern="###,###,###"/>원
						</td>
						<td>${tmp.cartStock }</td>
						<td>
						<fmt:formatNumber value="${tmp.itemPrice * tmp.cartStock }" 
								pattern="###,###,###"/>원
						</td>
						<td><a href="javascript:deleteConfirm(${tmp.cartNum })">삭제</a></td>	
					</tr>
				</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td>
							<button type="button" class="btn btn-primary"
								onclick="location.href='orderform.do'">주문하기</button>
						</td>
						<td>
							<button type="button" class="btn btn-warning"
								onclick="location.href='../home.do'">쇼핑계속</button>
						</td>
					</tr>
				</tfoot>
			</table>
			<table class="table table-striped table-condensed">
				<thead>
					<tr>
						<th>총 상품금액</th>
						<th>총 배송비</th>
						<th>결제예정금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<fmt:formatNumber value="${map.sumMoney }" 
							pattern="###,###,###"/>원
						</td>
						<td>${map.fee }</td>
						<td>
							<fmt:formatNumber value="${map.allPrice }" 
							pattern="###,###,###"/>원
						<input  type="hidden" name="allPrice" id="allPrice"
								value="${map.allPrice}" />
						</td>
						
					</tr>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>
	</section>
			
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>		
	</footer>

</div>
<script>
	function deleteConfirm(cartNum){
		var isDelete=confirm("삭제 하시겠습니까?");
		if(isDelete){
			location.href="deleteCart.do?cartNum="+cartNum;
		}
	}
</script>



</body>
</html>