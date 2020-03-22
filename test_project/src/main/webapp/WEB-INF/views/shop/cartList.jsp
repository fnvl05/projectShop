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
	<div class = "buy" style="float:right">
			<ul>
				<li><button class="btn btn-warning" id="buyEach" style="float:left">삭제</button></li>
			</ul>
	</div>
	<form action="${pageContext.request.contextPath }/shop/updateCart.do" method="post" id="form1" name="form1" >
	<table class="table table-striped table-condensed">
		<thead>
			<tr>
				<th><input type="checkbox" id="AllCheck"/></th>
				<th>이미지</th>
				<th>상품명</th>
				<th>가격</th>
				<th>수량</th>
				<th>최종 가격</th>
			</tr>
		</thead>
		<tbody>
		<c:set var="sumMoney" value="0"/>
		<c:forEach var="tmp" items="${map.list }" varStatus="i">
			<tr>
				<td> 
					<input type="checkbox" name="delBox" value="${tmp.cartNum }"/>
				</td>
				<td><img src="../resources/${tmp.itemImg }" width="156px" height="120px"/></td>
				<td>${tmp.itemName }</td>
				<td>
					<input type="hidden" id="itemPrice" />
                	<fmt:formatNumber value="${tmp.itemPrice}" 
                    	 pattern="###,###,###"/>원
                </td>
				<td>
               	<input type="number" min="1" value="${tmp.cartStock }" style="width:40px" name="cartStock"/>
               	<input type="hidden" name="itemNum" value="${tmp.itemNum }" />
               	<button type="button" class="btn btn-primary" onClick="updateCart()">수정</button>
               	
                </td>
				<td>
					
                	<fmt:formatNumber value="${tmp.cartStock * tmp.itemPrice}" 
                     pattern="###,###,###"/>원
                </td>
			</tr>
			 <c:set var="sumMoney" value="${sumMoney+(tmp.cartStock * tmp.itemPrice) }"/>
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
	</form>
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
               <c:set var="allPrice" value="${sumMoney+fee }"/>
               <td>
                  <fmt:formatNumber value="${sumMoney }" 
                  pattern="###,###,###"/>원
               </td>
               <td>
               +<fmt:formatNumber value="${map.fee }" 
                  pattern="###,###,###"/>원
               </td>
               <td>
                  <fmt:formatNumber value="${map.allPrice }" 
                  pattern="###,###,###"/>원
               <input  type="hidden" name="allPrice" id="allPrice"
                     value="${allPrice}" />
               </td>
               
            </tr>
         </tbody>
      </table>
	</section>
	<!-- 전부 선택 -->
	<script type="text/javascript">
		 $("#AllCheck").click(function(){
			if($("#AllCheck").prop("checked")){
				$("input[name=delBox]").not("[disabled]").prop("checked",true);
			}else {
				$("input[name=delBox]").prop("checked", false);
			}
		});
		$("#buyEach").click(function(){
			 var eachSize=$("input[name=delBox]:checked").length;
	         if(eachSize==0){
	            alert("1개 이상 체크해주세요.");
	            return false;
	         }
		var arrCheckBox=[];
		$("input[name=delBox]:checked").each(function(i) {
			arrCheckBox.push($(this).val());
		});
		
		  $.ajax({
              url: "deleteEachCart.do", //이동할 주소
              type: "post", //form 전송 방식
              data:
                 //데이터는 arrEachCode라는 이름으로 배열 전달
                 {"arrCheckBox": arrCheckBox},
                 //ajax 성공이라면 전달된값을 전달자로 받아 함수실행
              success:function(responseData){
                 if(responseData.isSuccess){
                    //알림 띄우고 새로고침
                    alert("성공.");
                    location.reload();
                 }else{                    
                    alert("실패.");
                 }
              }   
           });
		});

	</script>		
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>		
	</footer>

</div>
</body>
</html>