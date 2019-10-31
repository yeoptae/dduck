<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="notice" value="noticeform"/>
</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/style.css">
<section id="content">
    <div class="centerset">
		<div class="centerset well well-sm writerform">
		<form class="form-horizontal" action="${path }/qna/qnaUpdateFormEnd.do" method="post" onsubmit="return validate();">
		<input type="hidden" name="cId" value="${loginClient.CId }" readonly required>
		<input type="hidden" name="qaCode" value="${qna.QACODE }" required>
		<fieldset>
		    <legend class="qna-form-header text-center">QNA수정</legend>
		
		    <!-- Name input-->
		    <div class="form-group">
		    <div class="qna-form-text">제목</div>
		    <div class="col-md-9">
		        <input id="name" name="qaTitle" type="text" value="${qna.QATITLE }" placeholder="제목을 입력해주세요" class="form-control" required>
		    </div>
		    </div>
		
		    <!-- Message body -->
		    <div class="form-group">
		    <div class="qna-form-text">내용</div>
		    <div class="col-md-9">
		        <pre><textarea class="form-control" value="" id="message" name="qaContent" placeholder="내용을 입력해주세요" rows="5" style="height: 500px;" required>${qna.QACONTENT }</textarea></pre>
		    </div>
		    </div>
		    <br>
		    <div class="form-group">
		        <div class="col-md-12 text-right">
		            <button type="submit" class="btn btn-primary btn-lg" onclick="Qupdate()">수정</button>
		        </div>
		    </div>,
		</fieldset>
		</form>
		</div>
    </div>
</section>
<script>
	function Qudate(){
		location.href="${path}/qna/qnaUpdateFormEnd.do"
	}
	/* 제목 필수 입력 */
    function checkValue(){ 
  		var title = $('#name');
        if(title.val().length==0){
            alert('제목을 입력하세요');
            title.focus();
            return false;
        	}
        return true;
        }
	
   </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>