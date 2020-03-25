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
				<div class = "buy" style="float:right">
		<button class="btn btn-warning" id="buyEach" style="float:left">삭제</button>		
	</div>
	
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

			</c:otherwise>
		</c:choose>
	
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