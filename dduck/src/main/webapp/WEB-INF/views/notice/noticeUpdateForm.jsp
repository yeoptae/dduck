<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="notice" value="noticeform"/>
</jsp:include>
<section id="content">
    <div class="centerset">
		<div class="centerset well well-sm writerform">
		<form class="form-horizontal" action="${path }/notice/noticeFormEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
		<input type="hidden" name="cId" value='admin' required>
		<fieldset>
		    <legend class="qna-form-header text-center">공지등록</legend>
		
		    <!-- Name input-->
		    <div class="form-group">
		    <div class="qna-form-text">제목</div>
            <div class="row">
                <div class="col-sm-2">
                    <select class="form-control" name="noticeCategory" required>
                        <option value="1">공지</option>
                        <option value="2">이벤트</option>
                    </select>
                </div>
            </div>
		    <div class="col-md-9">
		        <input id="name" value="${notice.NOTICETITLE }" name="noticeTitle" type="text" placeholder="제목을 입력해주세요" class="form-control" required>
		    </div>
		    </div>
		
		    <!-- Message body -->
		    <div class="form-group">
		    <div class="qna-form-text">내용</div>
		    <div class="col-md-9">
		        <pre><textarea value="${notice.NOTICECONTENT }" class="form-control" id="message" name="noticeContent" placeholder="내용을 입력해주세요" rows="5" style="height: 500px;" required></textarea></pre>
		    </div>
		    </div>
		    <br>

		    <!-- 첨부파일등록1 -->
		    <div class="input-group mb-3" style="padding:0px;">
            	<div class="input-group-prepend" style="padding:0px;">
                	<span class="input-group-text">첨부파일1</span>
                </div>
                <div class="custom-file">
                    <input type="file" class="btn btn-primary btn-round-sm btn-sm" name="upFile" id="upFile1">
<!--                     <label class="custom-file-label" for="upFile1">파일을 선택하세요</label> -->
                </div>
                <br>
                <div class="input-group-prepend" style="padding:0px;">
                    <span class="input-group-text">첨부파일2</span>
                </div>
                <div class="custom-file">
                    <input type="file" class="btn btn-primary btn-round-sm btn-sm" name="upFile" id="upFile2">
<!--                     <label class="custom-file-label" for="upFile2">파일을 선택하세요</label> -->
                </div>
            </div>
		    <div class="form-group">
		        <div class="col-md-12 text-right">
		            <button type="submit" class="btn btn-primary btn-lg">등록</button>
		        </div>
		    </div>
		</fieldset>
		</form>
		</div>
    </div>
</section>
	<script>
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
		
		$(function(){
			$('[name=upFile]').on('change',function(){
				var fileName=this.files[0].name;
				$(this).next('.custom-file-label').html(fileName);
			});
		});
    </script>
    <script>
    
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>