<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/orderform.jsp</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-theme.min.css">


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
		
		<table class="table table-striped table-condensed">
			<thead>
				<tr>
					<th>상품번호</th>
					<th>상품이미지</th>
					<th>상품명</th>
					<th>수량</th>
					<th>가격</th>
					
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="tmp" items="${requestScope.list }">
					<tr>
						<td>${tmp.itemNum }</td>
						<td><img src="../resources${tmp.itemImg }"/></td>
						<td>${tmp.itemName }</td>
						<td>${tmp.cartStock }</td>
						<td>${tmp.itemPrice *tmp.cartStock}</td>
					</tr>
					<c:set var="sumMoney" value="${sumMoney+(tmp.itemPrice * tmp.cartStock) }"/>
				</c:forEach>
			</tbody>
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
               <c:set var="fee" value="0"/>
               <c:choose>
                  <c:when test="${sumMoney >= 50000  }">
                     <c:set var="fee" value="0"/>
                  </c:when>
                  <c:otherwise>
                     <c:set var="fee" value="2500"/>
                  </c:otherwise>
               </c:choose>
               
               <c:set var="allPrice" value="${sumMoney+fee }"/>
               <td>
                  <fmt:formatNumber value="${sumMoney }" 
                  pattern="###,###,###"/>원
               </td>
               <td>
               +<fmt:formatNumber value="${fee }" 
                  pattern="###,###,###"/>원
               </td>
               <td>
                  <fmt:formatNumber value="${allPrice }" 
                  pattern="###,###,###"/>원
               <input  type="hidden" name="allPrice" id="allPrice"
                     value=${ allPrice} />
               </td>
               
            </tr>
         </tbody>
		</table>
		<label for="allPrice">총 결제금액</label>
		<fmt:formatNumber value="${allPrice }" 
                  pattern="###,###,###"/>원
		<br/>
		<br/>
		<br/>
		<form action="order.do" method="post">
			
			<div class="container">
				<label for="userName">주문자</label>
				<input type="text" name="userName" id="userName" value=${sessionScope.userDto.userName } />
			</div>
			<div class="container">
				<label for="userPhon">연락처</label>
				<input type="text" name="userPhon" id="userPhon" value=${sessionScope.userDto.userPhone } />
			</div>
			<input type="hidden" name="addr1" id="addr1" value=${sessionScope.userDto.userAddr1 } />
			<input type="hidden" name="addr2" id="addr2" value=${sessionScope.userDto.userAddr2 } />
			<input type="hidden" name="addr3" id="addr3" value=${sessionScope.userDto.userAddr3 } />
			<br/>
			<br/>
			<br/>
			<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
			<!--  <a href="javascript:check();">주문자 정보 동일</button>-->
			<label for="check">주문자 정보 동일</label>
			 <input type="checkbox" id="equal" />
			<script>
				$("#equal").on("click",function(){
					if($('input:checkbox[id="equal"]').is(":checked")==true){
						var userName=$("#userName").val();
						$("#orderRec").val(userName);
						var userPhon=$("#userPhon").val();
						$("#orderPhone1").val(userPhon);
						var addr1=$("#addr1").val();
						$("#userAddr1").val(addr1);
						var addr2=$("#addr2").val();
						$("#userAddr2").val(addr2);
						var addr3=$("#addr3").val();
						$("#userAddr3").val(addr3);
					}else if($('input:checkbox[id="equal"]').is(":checked")==false){
						$("#orderRec").val("");
						$("#orderPhone1").val("");
						$("#userAddr1").val("");
						$("#userAddr2").val("");
						$("#userAddr3").val("");
					}
				});
				
				/*
				만약 폼의 값이 바뀌면은 체크박스가 false가 되게 구현하기
				$("#orderRec","#orderPhone1","#orderAddr1","#orderAddr2","#orderAddr3").change(function(){
					$('input:checkbox[id="equal"]').prop('checked',false);
				});

				*/
			
			
			
			</script>
			<input type="hidden" name="allPrice" id="allPrice" value=${allPrice } />
			<div class="container">
				<label for="orderRec">수령인</label>
				<input type="text" name="orderRec" id="orderRec" />
			</div>
			<div class="container">
				<label for="orderPhone1">연락처1</label>
				<input type="text" name="orderPhone1" id="orderPhone1" />
			</div>
			<div class="container">
				<label for="orderPhone2">연락처2</label>
				<input type="text" name="orderPhone2" id="orderPhone2" />
			</div>
			<div class="container">
				<label for="userAddr1">우편 번호</label>
				<input type="text" name="userAddr1" id="userAddr1" placeholder="우편번호"/>
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			</div>
			
			<div class="container">
				<label for="userAddr2">기본 주소</label>
				<input type="text" name="userAddr2" id="userAddr2" placeholder="기본주소" />
			</div>
			<span id="guide" style="color:#999;display:none"></span>
			<div class="container">
				<label for="userAddr3">상세 주소</label>
				<input type="text" name="userAddr3" id="userAddr3" placeholder="상세주소"/>
			</div>
			<div class="container">
				<label for="msg">주문 메세지</label>
				<input type="text" name="msg" id="msg"/>
			</div>
			<div class="container">
				<span>결제 수단</span>
				<input type="radio" name="payment" id="card" value="card"  />
				<label for="card">카드결제</label>
				<input type="radio" name="payment" id="cash" value="cash"  />
				<label for="cash">계좌이체</label>
				<input type="radio" name="payment" id="phone" value="phone"  />
				<label for="phone">휴대폰결제</label>
			</div>
			<button type="submit">결제하기</button>
			<!--  
			<button onclick="showPopup();">결제하기</button>
			<script>
				function showPopup(){
					window.open("paymentform.do","payment",
							"width=400,height=300,top=100,left=100,resizable=no");
				}
				
			</script>
			-->
			<button type="button" id="back_btn">주문취소</button>
			<script type="text/javascript">
				$("#back_btn").click(function () {
				location.href="cartList.do";
				})
			</script>
		</form>
		
		<!-- 다음 주소 API 사용 -->
		
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
			//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		    function sample4_execDaumPostcode() {
		    	
				new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		 
		                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
		 
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		                if(fullRoadAddr !== ''){
		                    fullRoadAddr += extraRoadAddr;
		                }
		 
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('userAddr1').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('userAddr2').value = fullRoadAddr;
		                //document.getElementById('userAddr3').value = data.jibunAddress;
						
		                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
		                if(data.autoRoadAddress) {
		                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
		                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
		                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
		 
		                } else if(data.autoJibunAddress) {
		                    var expJibunAddr = data.autoJibunAddress;
		                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
		 
		                } else {
		                    document.getElementById('guide').innerHTML = '';
		                }
		            }
					
		        }).open();
		    }
			
		   
		</script>
		
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>