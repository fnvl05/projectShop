<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.a{	
		border: 1px solid red;
		width: 500px;
		height:500px;
		position:relative;
		top: 100px;
		margin: 0 auto;
	}	
	.img1{
		width: 100%;
		height:100%;
		z-index: 1;
		position:absolute;
	}
	.img2{
		width: 100%;
		height: 100%;
		z-index: 0;
		position:absolute;
	}
	/* .img1:active{
		z-index:-1;
	} */
</style>
</head>
<body>
	<div class="a">
		<img alt="" src="resources/images/제목-없음-1.png" class="img1">
		<img alt="" src="resources/images/제목-없음-111.gif" class="img2">
	</div>
	
	<script>
		$('.a').mouseover(function(){
			$('.img1').prop("style","z-index:-1");
		});
		$('.a').mouseout(function(){
			$('.img1').prop("style","z-index:1");
		});
		$('.a').mouseup(function(){
			location.href="index.do";
		})
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>