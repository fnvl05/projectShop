<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
</head>
<body>
	<header>
		<div class="header_box">
			<nav id="nav">
				<div class="navbar-right">
					<%@ include file="../include/nav.jsp" %>
				</div>
				<div id="index_logo_div">
					<a href="index.do"><img id="index_logo_img" src="${pageContext.request.contextPath }/resources/images/project.png"/></a>
				</div>
				<div class="navbar-left">
						<%@ include file="../include/users_aside.jsp" %>						
				</div>
			</nav>
		</div>
	</header>
	<section id="container">	
	<div id="container_box">
		<form role="form" enctype="multipart/form-data">
		<input type="hidden" name="itemNum" value="${dto.itemNum }"/>
		<input type="hidden" name="itemPrice" value="${dto.itemPrice }"/>
		<input type="hidden" name="userId" value="${sessionScope.userDto.userId}"/>
			<div class="itemImg_box">
				<div class = "itemImg">
					<img alt="이미지" src="../resources${dto.itemImg}"/>
				</div>
			</div>
			<div class = "itemInfo">
				<div class="inputArea">		
					<p><span>상품명: </span>${dto.itemName }</p>
				</div>
				<div class="inputArea">
					<p><span>상품 가격: </span><fmt:formatNumber pattern="###,###,###" value="${dto.itemPrice}" /> 원</p>
				</div>
				<div class="inputArea">
					<p><span>상품 재고: </span><fmt:formatNumber pattern="###,###,###" value="${dto.itemCount}" /> EA</p>
				</div>
				<div class="cartStock">
					<span>구입 수량: </span>
					<p class="cartStock"> 
					<button type="button" class ="plus">+</button>
					<input type = "number" class ="numBox" min="1" max="${dto.itemCount }" value="1" name="cartStock" readonly="readonly"/>
					<button type="button" class ="minus">-</button>
					<script>
					  $(".plus").click(function(){
					   var num = $(".numBox").val();
					   var plusNum = Number(num) + 1;
					   if(plusNum > ${dto.itemCount}) {
					    $(".numBox").val(num);
					   } else {
					    $(".numBox").val(plusNum);          
					   }
					  });
					  
					  $(".minus").click(function(){
					   var num = $(".numBox").val();
					   var minusNum = Number(num) - 1;
					   
					   if(minusNum <= 0) {
					    $(".numBox").val(num);
					   } else {
					    $(".numBox").val(minusNum);          
					   }
					  });
					 </script>
					 <p>
				</div>
				<div class="inputArea">
					<div class = "addCart">
						<button type="button" id="shop_btn" class="btn btn-warning">장바구니</button>
						<button type="button" id="back_btn" class="btn btn-warning">뒤로가기</button>
						<button type="button" id="order_btn" class="btn btn-warning">바로 주문하기</button>
						<script>
							$("#back_btn").click(function () {
								location.href="../index.do";
							})
						</script>
					</div>
				</div>
				<script>
					var formObj = $("form[role='form']");
					console.log(formObj);
					$("#shop_btn").click(function() {
						var con = confirm("장바구니에 추가하시겠습니까?");
						if(con){
							formObj.attr("action","cart.do");
							formObj.attr("method", "post");
							formObj.submit();							
						}
					});
				</script>
				<script>
					var formObj = $("form[role='form']");
					console.log(formObj);
					$("#order_btn").click(function() {
						var con = confirm("바로 주문하시겠습니까?");
						if(con){
							formObj.attr("action","cart2.do");
							formObj.attr("method", "post");
							formObj.submit();							
						}
					});
				</script>
			</div>
		</form>
		<div class="itemDes">${dto.itemDes }</div>		
		<a href="../qna/itemList_qna.do?itemNum=${dto.itemNum }">QnA</a><br/>
		<a href="../review/itemList_review.do?itemNum=${dto.itemNum} ">해당 상품의 리뷰보기</a>	
		
	</div>
	</section>
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>
	</footer>
</body>
</html>