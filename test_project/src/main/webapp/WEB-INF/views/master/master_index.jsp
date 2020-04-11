<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
</head>
<body>
	<div id="root">		
		<header>
			<div class="header_box">
				<nav id="nav">
					<div class="navbar-right">
						<%@ include file="../include/nav.jsp" %>
					</div>
					<div id="index_logo_div">
						<%@ include file="../include/header.jsp" %>
					</div>
					<div class="navbar-left">
							<%@ include file="../include/master_aside.jsp" %>						
					</div>
				</nav>
			</div>
		</header>
		<section id="container">
			<div id="container_box">
				<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:1100px; height: 700px; margin: auto;">
				   <ol class="carousel-indicators">
				      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				      <li data-target="#myCarousel" data-slide-to="1"></li>
				      <li data-target="#myCarousel" data-slide-to="2"></li>
				      <li data-target="#myCarousel" data-slide-to="3"></li>
				    </ol>
			
				    <div class="carousel-inner" style="width:1100px; height: 700px;">
				      <div class="item active">
				        <img src="${pageContext.request.contextPath }/resources/imgUpLoad/KakaoTalk_20200410_175841743.png" alt="Los Angeles" style="width:100%; height: 100%;">
				      </div>
				
				      <div class="item">
				        <img src="${pageContext.request.contextPath }/resources/imgUpLoad/0b38bbbf-f2a8-4548-9d82-2287ee1e179d_p01fig0537_1l.jpg" alt="Chicago" style="width:100%; height: 100%;">
				      </div>
				    
				      <div class="item">
				        <img src="${pageContext.request.contextPath }/resources/imgUpLoad/96de0523-f1d4-4e8c-a258-501126ba6b87_999.jpg" alt="New york" style="width:100%; height: 100%;">
				      </div>
				      
				      <div class="item">
				        <img src="${pageContext.request.contextPath }/resources/imgUpLoad/KakaoTalk_20200410_180123960.gif" alt="New york" style="width:100%; height: 100%;">
				      </div>
				    </div>
				    
				    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
				      <span class="glyphicon glyphicon-chevron-left"></span>
				      <span class="sr-only">Previous</span>
				    </a>
				    <a class="right carousel-control" href="#myCarousel" data-slide="next">
				      <span class="glyphicon glyphicon-chevron-right"></span>
				      <span class="sr-only">Next</span>
				    </a>
				  </div>  
				  <div id="listBox" style="margin-top:100px;">
					  <c:choose>
					  	<c:when test="${not empty sessionScope.id }">
					  		<div id="bestItemBox">
					  		<h4>인기상품 목록</h4>
							<div class="row">
							  <c:forEach items="${bestItemList}" var="list">
									   	<div class="col-xs-6 col-md-3">
									   		<div class="thumbnail">
									   		<a href="Users_Item/itemView_form.do?itemNum=${list.itemNum}&pageNum=1&reviewNum=1">
											   <img id="indexItemImg" alt="이미지" src="resources${list.itemImg}" class="thumbImg"/>
									   		</a>
										   		<p style="padding:10px;  text-align: center;">${list.itemName }</p>
										   		<p style="padding:10px;  text-align: center;">${list.itemPrice }원</p>
									   		</div>
									   	</div>
							  </c:forEach>		
							</div>
					 		</div>
					 		<div id="newItemBox">
							  <h4>최신상품 목록</h4>
								<div class="row">
								  <c:forEach items="${newItemList}" var="list">
										   	<div class="col-xs-6 col-md-3">
										   		<div class="thumbnail">
										   		<a href="Users_Item/itemView_form.do?itemNum=${list.itemNum}&pageNum=1&reviewNum=1">
												   <img id="indexItemImg" alt="이미지" src="resources${list.itemImg}" class="thumbImg"/>
										   		</a>
											   		<p style="padding:10px;  text-align: center;">${list.itemName}</p>
											   		<p style="padding:10px;  text-align: center;">${list.itemPrice }원</p>
										   		</div>
										   	</div>
								  </c:forEach>		
								</div>
							  </div>
					  	</c:when>
					  	<c:otherwise>
					  		<div id="bestItemBox">
					  		<h4>인기상품 목록</h4>
							<div class="row">
							  <c:forEach items="${bestItemList}" var="list">
									   	<div class="col-xs-6 col-md-3">
									   		<div class="thumbnail">
									   		<a href="Unknown/itemView_form.do?itemNum=${list.itemNum}&pageNum=1&reviewNum=1">
											   <img id="indexItemImg" alt="이미지" src="resources${list.itemImg}" class="thumbImg"/>
									   		</a>
										   		<p style="padding:10px;  text-align: center;">${list.itemName }</p>
										   		<p style="padding:10px;  text-align: center;">${list.itemPrice }원</p>
									   		</div>
									   	</div>
							  </c:forEach>		
							</div>
					 		</div>
					 		<div id="newItemBox">
							  <h4>최신상품 목록</h4>
								<div class="row">
								  <c:forEach items="${newItemList}" var="list">
										   	<div class="col-xs-6 col-md-3">
										   		<div class="thumbnail">
										   		<a href="Unknown/itemView_form.do?itemNum=${list.itemNum}&pageNum=1&reviewNum=1">
												   <img id="indexItemImg" alt="이미지" src="resources${list.itemImg}" class="thumbImg"/>
										   		</a>
											   		<p style="padding:10px;  text-align: center;">${list.itemName}</p>
											   		<p style="padding:10px;  text-align: center;">${list.itemPrice }원</p>
										   		</div>
										   	</div>
								  </c:forEach>		
								</div>
							  </div>
					  	</c:otherwise>
					  </c:choose>	
					  
					</div>
			</div>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>