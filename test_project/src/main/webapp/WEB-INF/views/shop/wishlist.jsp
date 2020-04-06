<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shop/wishlist</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<style>
.btn {
	width: 75px;
	height: 30px;
	border: 2px solid #34495e;
	text-align: center;
	cursor: pointer;
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
	margin: 0 0 0 20px;
}
.shopbtn {
	width: 100px;
	height: 50px;
	border: 2px solid #34495e;
	float: left;
	text-align: center;
	cursor: pointer;
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
	margin: 0 0 40px 50px;
}

.shopbtn a {
	font-family: arial;
	font-size: 16px;
	color: #34495e;
	text-decoration: none;
	line-height: 50px;
	transition: all .5s ease;
	z-index: 2;
	position: relative;
}
.eff {
	width: 100px;
	height: 50px;
	border: 0px solid #34495e;
	position: absolute;
	transition: all .5s ease;
	z-index: 1;
	box-sizing: border-box;
}
.shopbtn:hover .eff {
	border: 50px solid #34495e;
}

.shopbtn:hover a {
	color: #fff;
}
</style>
</head>
<body>
	<div id="root">
		<header>
			<div class="header_box">
				<nav id="nav">
					<div class="navbar-right">
						<%@ include file="../include/nav.jsp"%>
					</div>
					<div id="index_logo_div">
						<a href="../index.do"><img id="index_logo_img"
							src="${pageContext.request.contextPath }/resources/images/project.png" /></a>
					</div>
					<div class="navbar-left">
						<c:choose>
							<c:when test="${not empty sessionScope.id }">
								<%@ include file="../include/users_aside.jsp"%>
							</c:when>
							<c:otherwise>
								<%@ include file="../include/unknown_aside.jsp"%>
							</c:otherwise>
						</c:choose>
					</div>
				</nav>
			</div>
		</header>
	</div> 
   <c:choose>
      <c:when test="${map.count==0 }">
         	위시리스트가 비어있습니다.
      </c:when>
      <c:otherwise>
      <div class="container">
      <h1>WishList</h1>
	  <form role="form" enctype="multipart/form-data" >
      <table class="table table-hover">
         <thead>
            <tr>
               <th>이미지</th>
               <th>상품명</th>
               <th>가격</th>
               <th>선택</th>
            </tr>
         </thead>
         <tbody>
         <c:forEach var="tmp" items="${wishlist}" varStatus="1" >
            <tr>

               <td><img src="../resources/${tmp.itemImg }" width="156px" height="120px"/></td>
               <td> 
               		<a href="../Users_Item/itemView_form.do?itemNum=${tmp.itemNum}">${tmp.itemName}</a>
               		<input type="hidden" value="${tmp.itemName }" name="itemName">
               </td>       
               <td>
               		<input type="hidden" value="${tmp.itemPrice }" name="itemPrice">
              		 <fmt:formatNumber value="${tmp.itemPrice}" 
                      pattern="###,###,###"/>원
               </td>
               <td>        
                	<button type="button" id="shop_btn" class="btn">장바구니</button>      		   	   	
		   	   		<input type="button" class="btn" onclick="deleteWish(${tmp.wishNum})" value="삭제" />
               </td>     	
           </tr>
         </c:forEach>
         </tbody>
      </table>
      <div class="button" style="float: right">
     		<div class="shopbtn">
				<div class="eff"></div>
				<a href="../index.do">쇼핑계속</a>
			</div>
		</div>
      </form>
        </div>
      </c:otherwise>
   </c:choose>
   <script>
	var formObj = $("form[role='form']");
	console.log(formObj);
	$("#shop_btn").click(function() {
		var con = confirm("장바구니에 추가하시겠습니까?");
		if(con){
			formObj.attr("action","insertCart.do");
			formObj.attr("method", "post");
			formObj.submit();							
		}
		
	});
    function deleteWish(wishNum){
 	   var isDelete=confirm("위시리스트에서 삭제하시겠습니까?")
 	   if(isDelete){
 		   location.href="deleteWish.do?wishNum="+wishNum;
 	   }
     }
    </script>  
   <footer id="footer">
      <div id="footer_box">
         <%@ include file="../include/footer.jsp" %>
      </div>      
   </footer>
</body>
</html> 