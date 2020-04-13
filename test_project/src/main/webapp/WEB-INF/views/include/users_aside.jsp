<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <ul class="nav nav-tabs">
		      <li role="presentation"><a href="${pageContext.request.contextPath }/Users_Item/itemAllList.do">전체 상품</a></li> 
      <li role="presentation" class="dropdown">
         <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
           Earing<span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
               <li><a href="${pageContext.request.contextPath }/Users_Item/itemList.do?cateCode=101&cateLevel=2">수제작</a></li>
               <li><a href="${pageContext.request.contextPath }/Users_Item/itemList.do?cateCode=102&cateLevel=2">롱 귀걸이</a></li>
               <li><a href="${pageContext.request.contextPath }/Users_Item/itemList.do?cateCode=103&cateLevel=2">링 귀걸이</a></li>
            </ul>
      </li>
      <li role="presentation"><a href="${pageContext.request.contextPath }/Users_Item/itemList.do?cateCode=200&cateLevel=1">Ring</a></li>
      <li role="presentation"><a href="${pageContext.request.contextPath }/Users_Item/itemList.do?cateCode=300&cateLevel=1">Necklace</a></li>
  
		
		<li role="presentation" class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
      		COMMUNITY <span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
					<li role="presentation"><a href="${pageContext.request.contextPath }/review/list.do">REVIEW</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath }/qna/list.do">Q&A</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath }/notice/list.do">NOTICE</a></li>
				</ul>
		</li>
	</ul>