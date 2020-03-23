<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere atque earum eligendi quod incidunt dolor unde quo distinctio est odit commodi illum ullam sit ab facilis. Voluptate iure dignissimos delectus!</p>
<button type="submit" onclick="payment();">결제</button>
<a href="javascript:self.close();">닫기</a>
<script>
	var payment=function(){
		"redirect:order.do";
	};
</script>
</body>
</html>