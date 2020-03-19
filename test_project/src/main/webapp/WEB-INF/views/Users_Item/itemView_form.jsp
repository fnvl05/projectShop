<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-theme.min.css">
	
	<style>
		 div.itemImg_box div.itemImg { float:left; width:350px;}
		 div.itemImg_box div.itemImg img { width:350px; height:250px;}
		 
		 div.itemImg_box div.itemInfo { float:right; width:330px; font-size:22px; }
		 div.itemImg_box div.itemInfo p { margin:0 0 20px 0; }
		 div.itemImg_box div.itemInfo p span { display:inline-block; width:100px; margin-right:15px; }
		 
		 div.itemImg_box div.itemInfo p.cartCount button { font-size:26px; border:none; background:none; }
		 
		 div.itemImg_box div.itemInfo p.cartCount input { font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee; }
		 div.itemImg_box div.itemInfo p.cartCount button { font-size:26px; border:none; background:none; }
		 div.itemImg_box div.itemInfo div.addCart {margin: 20px; text-align:right; }
		 div.itemDes { font-size:18px; clear:both; padding-top:30px; margin: 20px;}
</style>

</head>
<body>
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
			<%@ include file="../include/users_aside.jsp" %>
		</aside>
	<div id="container_box">
		<form role="form" enctype="multipart/form-data">
		<input type="hidden" name="itemNum" value="${dto.itemNum }"/>
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
						<script>
							$("#back_btn").click(function () {
								location.href="../home.do";
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
			</div>
		</form>
		<div class="itemDes">${dto.itemDes }</div>		
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