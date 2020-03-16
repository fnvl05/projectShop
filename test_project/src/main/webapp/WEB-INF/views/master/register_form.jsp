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
			<form action="register.do" method="post" autocomplete="off" enctype="multipart/form-data">
				<div id="container_box">
					<h2>상품 등록</h2>
					 <label>1차 분류</label>
					 <select class="category1">
					  <option value="">전체</option>
					 </select>
					 
					 <label>2차 분류</label>
					 <select class="category2" name="cateCode">
					  <option value="">전체</option>
					 </select>
				</div>
				<div class="inputArea">
					<label for="itmeName">상품명</label>
					<input type="text" id="itemName" name="itemName">
				</div>
				<div class="inputArea">
					<label for="itmePrice">상품가격</label>
					<input type="text" name="itemPrice" id="itemPrice">
				</div>
				<div class="inputArea">
					<label for="itemCount">상품수량</label>
					<input type="text" name="itemCount" id="itemCount">
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
				<div class="inputArea">
					<label for="itemDes">상품설명</label>
					<textarea name="itemDes" id="itemDes"></textarea>
				</div>
				<script type="text/javascript">
				$(function(){
					CKEDITOR.replace('itemDes',{
						filebrowserUploadUrl: '${pageContext.request.contextPath }/fileupload.do'
					});
				});
				</script>

				<div class="inputArea">
					<label for="itemImg">이미지</label>
					<input type="file" id="itemImg" name="file"/>
					<div class="select_img">
						<img src=""/>
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
					<%=request.getRealPath("/") %>
				</div>
				
				<div id="inputArea">
					<button type="submit" id="register_Btn">등록</button>
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
	
		// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
		for(var i = 0; i < jsonData.length; i++) {
		 
		 if(jsonData[i].cateLevel == "1") {
		  cate1Obj = new Object();  //초기화
		  cate1Obj.cateCode = jsonData[i].cateCode;
		  cate1Obj.cateName = jsonData[i].cateName;
		  cate1Arr.push(cate1Obj);
		 }
		}
	
		// 1차 분류 셀렉트 박스에 데이터 삽입
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
		
	</script>
</body>
</html>