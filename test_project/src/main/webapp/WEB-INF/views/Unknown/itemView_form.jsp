<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unknown/itemView_form.jsp</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<style>
 #underline {
	text-decoration: underline;
	text-underline-position: under;
	text-decoration-style: solid;
	text-decoration-color: darkred;
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
						<%@ include file="../include/header.jsp"%>
					</div>
					<div class="navbar-left">
						<%@ include file="../include/users_aside.jsp"%>
					</div>
				</nav>
			</div>
		</header>
	<section id="container">
		<div id="container_box">
		<form role="form" action="register.do" method="post" autocomplete="off" enctype="multipart/form-data">
		<input type="hidden" name="itemNum" value="${dto.itemNum }"/>
			<div class="inputArea">
				<img alt="이미지" src="../resources${dto.itemImg}" class="oriImg"/>
			</div>
			
			<div class="inputArea">
				<label for="itmeName">상품명</label>
				<span>${dto.itemName }</span>
			</div>
			<div class="inputArea">
				<label for="itmePrice">상품가격</label>
				<span>${dto.itemPrice }</span>
			</div>
			<div class="inputArea">
				<label for="itemCount">상품수량</label>		
				<span>${dto.itemCount }</span>
			</div>
			
			<div class="inputArea">
				<button type="button" id="shop_btn" class="btn btn-warning">장바구니</button>
				<button type="button" id="order_btn" class="btn btn-warning">바로 주문하기</button>
				<button type="button" id="wish_btn" class="btn btn-warning">Wish</button>
				<!--  
				<button type="button" id="back_btn" class="btn btn-warning">뒤로가기</button>
				<script type="text/javascript">
					$("#back_btn").click(function () {
						history.back();
					})
				</script>
				
				-->
			</div>
			<script>
				var formObj = $("form[role='form']");
				console.log(formObj);
				$("#shop_btn").click(function() {
					var con = confirm("로그인이 필요합니다. 로그인을 하시겠습니까?");
					if(con){
						formObj.attr("action","../Users/login_form.do");
						formObj.submit();							
					}
				});
				$("#order_btn").click(function() {
					var con = confirm("로그인이 필요합니다. 로그인을 하시겠습니까?");
					if(con){
						formObj.attr("action","../Users/login_form.do");
						formObj.submit();							
					}
				});
				$("#wish_btn").click(function() {
					var con = confirm("로그인이 필요합니다. 로그인을 하시겠습니까?");
					if(con){
						formObj.attr("action","../Users/login_form.do");
						formObj.submit();							
					}
				});
			</script>
			<br/><br/>
			<div align="center" id="underline">
				<span><a href="#detail">Detail</a>&nbsp;&nbsp;&nbsp;</span> 
				<span><a href="#qna">Q&A</a>&nbsp;&nbsp;&nbsp;</span> 
				<span><a href="#review">Review</a>&nbsp;</span>
			</div>
			<br /> <br />
			<div class="inputArea">
				<label for="itemDes">상품설명</label>
				<span>${dto.itemDes }</span>
			</div>
		</form>
		<br /><br />

		<!-- 해당아이템의  Q&A -->
		<div class="container" id="qna">
			<p style="text-align: center;" id="underline">
				<strong>Q&A</strong>
			</p>
			<br />
			<table class="table table-hover">
				<colgroup>
					<col class="col-xs-1" />
					<col class="col-xs-2" />
					<col class="col-xs-5" />
					<col class="col-xs-1" />
					<col class="col-xs-1" />
					<col class="col-xs-2" />
				</colgroup>
				<thead>
					<tr>
						<th>글번호</th>
						<th>상품정보</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${requestScope.list }">
						<tr>
							<td>${tmp.num }</td>
							<td><img src="../resources${tmp.itemImg }" id="itemImg" /></td>
							<td><c:choose>
									<c:when test="${not empty sessionScope.userDto.userId }">
										<c:choose>
											<c:when
												test="${sessionScope.userDto.verify eq 1 || sessionScope.userDto.userId == tmp.writer}">
												<a
													href="../qna/itemDetail.do?num=${tmp.num }&itemNum=${itemNum}">
													${tmp.title }[${tmp.commentCount }] </a>
											</c:when>
											<c:otherwise>
												비밀글입니다. <i class="fas fa-lock"></i>
											</c:otherwise>
										</c:choose>

									</c:when>
									<c:otherwise>
										비밀글입니다. <i class="fas fa-lock"></i>
									</c:otherwise>
								</c:choose></td>
							<td>${tmp.writer }</td>
							<td>${tmp.viewCount }</td>
							<td>${tmp.regdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div align="right">
				<a class="btn btn-info"
					href="../qna/insertform.do?itemNum=${itemNum }">문의하기</a>
			</div>
			<div class="page-display">
				<ul class="pagination pagination-sm">
					<c:choose>
						<c:when test="${startPageNum ne 1 }">
							<li>
								<a href="itemView_form.do?itemNum=${itemNum}&pageNum=${startPageNum-1 }&reviewNum=${reviewNum }">&laquo;</a>	
						   	</li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a href="javascript:">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }"
						step="1">
						<c:choose>
							<c:when test="${i eq pageNum }">
								<li class="active">
									<a href="itemView_form.do?itemNum=${itemNum}&pageNum=${i }&reviewNum=${reviewNum }">${i }</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="itemView_form.do?itemNum=${itemNum}&pageNum=${i }&reviewNum=${reviewNum }">${i }</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${endPageNum lt totalPageCount }">
							<li>
								<a href="itemView_form.do?itemNum=${itemNum}&pageNum=${endPageNum+1 }&reviewNum=${reviewNum }">&raquo;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a href="javascript:">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<br /> <br />
		<!-- 해당아이템의 리뷰 -->
		<div class="container" id="review">
			<p style="text-align: center;" id="underline">
				<strong>Review</strong>
			</p>
			<br />
			<p style="font-weight: bold;">
				리뷰 평점 : <span class="wrap-star"> <span class='star-rating'>
						<span style="width:<fmt:formatNumber value="${avg *10}" pattern=".0"/>%"></span>						
				</span>
				</span>
			</p>
			<br /> <br />

			<table class="table table-hover">
				<colgroup>
					<col class="col-xs-1" />
					<col class="col-xs-1" />
					<col class="col-xs-1" />
					<col class="col-xs-4" />
					<col class="col-xs-1" />
					<col class="col-xs-1" />
					<col class="col-xs-1" />
					<col class="col-xs-2" />
				</colgroup>
				<thead>
					<tr>
						<th>글 번호</th>
						<th>이미지</th>
						<th>아이템명</th>
						<th>리뷰</th>
						<th>별점</th>
						<th>좋아요</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${requestScope.reviewlist }"
						varStatus="status">
						<tr>
							<td>${status.count}</td>
							<!-- <td>${tmp.reviewNum}</td> -->
							<td><a
								href="../review/detail.do?reviewNum=${tmp.reviewNum }&itemNum=${itemNum}&pageNum=${pageNum}"><img
									src="../resources${tmp.itemImg }" id="itemImg" /></a></td>
							<td>${tmp.itemName }</td>
							<td style="word-break:break-all"><a href="../review/detail.do?reviewNum=${tmp.reviewNum }" class="review${tmp.reviewNum }">${tmp.reviewContent }</a></td>
							<script>
								/* reviewContent에 img가 있을 경우 삭제해줌*/
								$(document).ready(function(){
									$(".review${tmp.reviewNum} p img").remove();
									var text1=$(".review${tmp.reviewNum} p").text().substring(0,15);
									$(".review${tmp.reviewNum} p").text(text1);
								})
							</script>
						<td>
							<td><span class="wrap-star"> <span
									class='star-rating'> <span
										style="width:<fmt:formatNumber value="${tmp.likeCount *10}" pattern=".0"/>%"></span>		
								</span>
							</span></td>
							<td><span class="glyphicon glyphicon-thumbs-up"></span>
								${tmp.upCount }</td>
							<td>${tmp.reviewWriter }</td>
							<td>${tmp.regdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<c:if test="${empty reviewlist  }">
			<p style="text-align: center;">해당 아이템의 리뷰가 없습니다.</p>
		</c:if>
		<div class="page-display">
				<ul class="pagination pagination-sm">
					<c:choose>
						<c:when test="${RstartPageNum ne 1 }">
							<li>
								<a href="itemView_form.do?itemNum=${itemNum}&pageNum=${pageNum }&reviewNum=${RendPageNum-1}">&laquo;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a href="javascript:">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					<%-- step="1" 은 기본값이다. --%>
					<c:forEach var="i" begin="${RstartPageNum }" end="${RendPageNum }"
						step="1">
						<c:choose>
							<c:when test="${i eq reviewNum }">
								<li class="active">
									<a href="itemView_form.do?itemNum=${itemNum}&pageNum=${pageNum }&reviewNum=${i}">${i }</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="itemView_form.do?itemNum=${itemNum}&pageNum=${pageNum }&reviewNum=${i}">${i }</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${RendPageNum < RtotalPageCount }">
							<li>
								<a href="itemView_form.do?itemNum=${itemNum}&pageNum=${pageNum }&reviewNum=${RendPageNum+1}">&raquo;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="disabled">
								<!-- "javascript:" 이것만 쓰면 동작하지않음 --> <a href="javascript:">&raquo;</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
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