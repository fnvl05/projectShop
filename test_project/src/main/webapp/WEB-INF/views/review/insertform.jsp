<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/review/insertform.jsp</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.32/angular.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-theme.min.css">
</head>
<style>
 #star_grade a{
    text-decoration: none;
    color: gray;
}
#star_grade a.on{
    color: red;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#777;}
</style>
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
		<div id="container_box">
		<aside>
			<%@ include file="../include/users_aside.jsp" %>
		</aside>
			<div class="container">
				<form action="insert.do" method="post" id="form" onSubmit="s">
					<input type="hidden" name="itemNum" value="${itemNum }" />
					<input type="hidden" name="reviewWriter" value="${sessionScope.userDto.userId}" />
					<input type="hidden" id="likeCount" name="likeCount" value=2 />
					<div class="container" >
						<label for="reviewContent">상품 리뷰</label>
						<textarea name="reviewContent" id="reviewContent" ></textarea>
						<script type="text/javascript">
							$(function(){
								CKEDITOR.replace('reviewContent',{
									filebrowserUploadUrl: '${pageContext.request.contextPath }/fileupload.do'
								});
							});
						</script>
					</div>
			
					<div class="container">
						<label for="likeCount">평가</label>
						<!--  <input type="text" name="likeCount" id="likeCount" /> -->
						<p id="star_grade">
							<a href="#">★</a>
							<a href="#">★</a>
							<a href="#">★</a>
							<a href="#">★</a>
							<a href="#">★</a>
						</p>
					</div>
					<button id="starBtn" type="submit" >등록</button>
					<button type="reset">취소</button>
					<button type="button" id="back_btn">돌아가기</button>
				
					<script type="text/javascript">
					$("#back_btn").click(function () {
						history.back();
						/*location.href="itemList_review.do?itemNum=" + ${itemNum};*/
					})
					</script>
				</form>
				<script>
				
					$("#starBtn").on("click",function(){
						//제출 전 에디터 내용을 변수에 저장
						var content=CKEDITOR.instances.reviewContent.getData();
						//제출 전 에디터 내용 길이를 변수에 저장
						var content_len=CKEDITOR.instances.reviewContent.getData().length;
						//내용이 없는 경우
						if(content==""){
							alert("내용을 입력하세요.",function(){
								//에디터 내용에 포커스 on
								CKEDITOR.instances.reviewContent.focus();
								
							},"warning");
							return false;
						}
						//내용이 30글자 미만인 경우
						//기본적으로 8글자를 가짐 빈문자열+<p></p> =8글자
						if(content_len<18){
							alert("내용을  30자 이상 입력하세요.",function(){
								//에디터 내용에 초기화
								CKEDITOR.instances.reviewContent.setData("");
								//에디터 내용에 포커스 on
								CKEDITOR.instances.reviewContent.focus();
							},"warning");
							return false;
						}
					});
					
				</script>
			</div>
		</div>
	</section>
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>
	</footer>
</div>

<script>
	$('#star_grade a').click(function(){
	    $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
	    $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
	      var likeCount = document.querySelectorAll(".on").length*2;
	      $("#likeCount").val(likeCount);
	    return false;
	});
</script>

</body>
</html>