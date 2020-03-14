<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-theme.min.css">
<style>
	.select_img img{width: 500px; margin: 20px 0;}
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
		<section id="container">
			<aside>
				<c:choose>
					<c:when test="${not empty sessionScope.userDto.userId }">
						<c:if test="${sessionScope.userDto.verify eq 1}">
							<%@ include file="../include/master_aside.jsp" %>
						</c:if>
					</c:when>
					<c:otherwise>
							<%@ include file="../include/user_aside.jsp" %>
					</c:otherwise>
				</c:choose>
			</aside>
			<form action="item_modify.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="itemNum" value="${dto.itemNum} "/>
				<div id="container_box">
					<h2>상품 수정</h2>
					 <label>1차 분류</label>
					 <select class="category1">
					  <option value="">전체</option>
					 </select>
					 
					 <label>2차 분류</label>
					 <select class="category2" name="cateCode">
					  <option value="">전체</option>
					 </select>
				</div>
				<div id="inputArea">
					<label for="itmeName">상품명</label>
					<input type="text" id="itemName" name="itemName" value="${dto.itemName }"/>
				</div>
				<div id="inputArea">
					<label for="itmePrice">상품가격</label>
					<input type="text" name="itemPrice" value="${dto.itemPrice }" id="itemPrice"/>
				</div>
				<div id="inputArea">
					<label for="itemCount">상품수량</label>
					<input type="text" name="itemCount" value="${dto.itemCount }" id="itemCount"/>
				</div>
				<script>
					var regExp = /[^0-9]/gi;
					
					$("#itemPrice").keyup(function(){ numCheck($(this)); });
					$("#itemCount").keyup(function(){ numCheck($(this)); });
					
					function numCheck(selector) {
					 var tempVal = selector.val();
					 selector.val(tempVal.replace(regExp, ""));
					}
				</script>
				<div id="inputArea">
					<label for="itemDes">상품설명</label>
					<textarea rows="10" cols="50" name="itemDes" id="itemDes">${dto.itemDes }</textarea>
					<script type="text/javascript">
						$(function(){
							CKEDITOR.replace('itemDes',{
								filebrowserUploadUrl: '${pageContext.request.contextPath }/fileupload.do'
							});
						});
					</script>
				</div>
				
				<div class="inputArea">
					<label for="itemImg">이미지</label>
					<input type="file" id="itemImg" name="file"/>
					<div class="select_img">
						<img src="../resources${dto.itemImg}"/>
						<input type="hidden" name = "itemImg" value="../resources${dto.itemImg}"/>
						<input type="hidden" name = "itemThumbImg" value="../resources${dto.itemThumbImg}"/>
					</div>
					<script>
						$("#itemImg").change(function() {
							if(this.files && this.files[0]){
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src", data.target.result).width(500);
								}
								reader.readAsDataURL(this.files[0]);
							}
						})
					</script>
				</div>
				
				<div id="inputArea">
					<button type="submit" id="update_btn" class="btn btn-primary">완료</button>
					<button type="button" id="back_btn" class="btn btn-warning">취소</button>
					<script>
						$("#back_btn").click(function(){
							location.href="itemView_form.do?itemNum=" + ${dto.itemNum};
						})
					</script>
				</div>
			</form>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>
	
	<script>
	var jsonData = JSON.parse('${list}');
	console.log(jsonData);

	var cate1Arr = new Array();
	var cate1Obj = new Object();

	for(var i = 0; i < jsonData.length; i++) {
	 
	 if(jsonData[i].cateLevel == "1") {
	  cate1Obj = new Object();  //초기화
	  cate1Obj.cateCode = jsonData[i].cateCode;
	  cate1Obj.cateName = jsonData[i].cateName;
	  cate1Arr.push(cate1Obj);
	 }
	}

	var cate1Select = $("select.category1")

	for(var i = 0; i < cate1Arr.length; i++) {
	 cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
	      + cate1Arr[i].cateName + "</option>"); 
	}
	
	$(document).on("change", "select.category1", function(){

		 var cate2Arr = new Array();
		 var cate2Obj = new Object();
		 
		 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
		 for(var i = 0; i < jsonData.length; i++) {
		  
		  if(jsonData[i].cateLevel == "2") {
		   cate2Obj = new Object();  //초기화
		   cate2Obj.cateCode = jsonData[i].cateCode;
		   cate2Obj.cateName = jsonData[i].cateName;
		   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
		   
		   cate2Arr.push(cate2Obj);
		  }
		 }
		 
		 var cate2Select = $("select.category2");
		 
		 cate2Select.children().remove();

		 $("option:selected", this).each(function(){
		  
		  var selectVal = $(this).val();
		  cate2Select.append("<option value='"+ selectVal + "'>전체</option>");
		  
		  for(var i = 0; i < cate2Arr.length; i++) {
		   if(selectVal == cate2Arr[i].cateCodeRef) {
		    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
		         + cate2Arr[i].cateName + "</option>");
		   }
		  }
		  
		 });
		 
		});
	
	var select_cateCode = '${dto.cateCode}';
	var select_cateCodeRef = '${dto.cateCodeRef}';
	var select_cateName = '${dto.cateName}';

	if(select_cateCodeRef != null && select_cateCodeRef != '') {
	 $(".category1").val(select_cateCodeRef);
	 $(".category2").val(select_cateCode);
	 $(".category2").children().remove();
	 $(".category2").append("<option value='"
	       + select_cateCode + "'>" + select_cateName + "</option>");
	} else {
	 $(".category1").val(select_cateCode);	
	 $(".category2").append("<option value=" + select_cateCode + " selected='selected'>전체</option>");
	}
	</script>
</body>
</html>