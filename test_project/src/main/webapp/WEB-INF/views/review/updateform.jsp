<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/review/updateform.jsp</title>
</head>
<body>
<div class="container">
	<form action="update.do" method="post">
		<input type="hidden" name="itemNum" value="${dto.itemNum }" />
		<div class="container">
			<label for="reviewNum">글번호</label>
			<input type="text" id="reviewNum" value="${dto.reviewNum }" disabled/>
		</div>
		<input type="hidden" name="reviewWriter" value="${sessionScope.userDto.userId }" disabled />
		<div class="container">
			<label for="reviewContent">상품 리뷰</label>
			<input type="text" name="reviewContent" id="reviewContent" value="${dto.reviewContent }" />
		</div>
		<div class="container">
			<label for="likeCount">별점</label>
			<input type="text" name="likeCount" id="likeCount" value="${dto.likeCount }"/>
		</div>
		<button type="submit" onclick="submitContents(this);" >수정확인</button>
		<button type="reset">취소</button>
		<button><a href="list.do">돌아가기</a></button>
	</form>
</div>
<!-- SmartEditor 에서 필요한 javascript 로딩  -->
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
<script>
   var oEditors = [];
   
   //추가 글꼴 목록
   //var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
   
   nhn.husky.EZCreator.createInIFrame({
      oAppRef: oEditors,
      elPlaceHolder: "content",
      sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",   
      htParams : {
         bUseToolbar : true,            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
         bUseVerticalResizer : true,      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
         bUseModeChanger : true,         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
         //aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
         fOnBeforeUnload : function(){
            //alert("완료!");
         }
      }, //boolean
      fOnAppLoad : function(){
         //예제 코드
         //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
      },
      fCreator: "createSEditor2"
   });
   
   function pasteHTML() {
      var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
      oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
   }
   
   function showHTML() {
      var sHTML = oEditors.getById["content"].getIR();
      alert(sHTML);
   }
      
   function submitContents(elClickedObj) {
      oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용됩니다.
      
      // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
      
      try {
         elClickedObj.form.submit();
      } catch(e) {}
   }
   
   function setDefaultFont() {
      var sDefaultFont = '궁서';
      var nFontSize = 24;
      oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
   }
</script>
</body>
</html>