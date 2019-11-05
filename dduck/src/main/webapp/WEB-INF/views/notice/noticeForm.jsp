<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="notice" value="noticeform" />
</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/style.css">
<section id="content">
	<div class="centerset">
		<div class="centerset well well-sm writerform">
			<form class="form-horizontal"
				action="${path }/notice/noticeFormEnd.do" method="post"
				onsubmit="return validate();" enctype="multipart/form-data">
				<input type="hidden" name="cId" value="${loginClient.CId }" readonly
					required>
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
							<input id="name" name="noticeTitle" type="text"
								placeholder="제목을 입력해주세요" class="form-control" required>
						</div>
					</div>

					<!-- Message body -->
					<div class="form-group">
						<div class="qna-form-text">내용</div>
						<div class="col-md-9">
							<pre>
								<textarea class="form-control" id="message" name="noticeContent"
									placeholder="내용을 입력해주세요" rows="5" style="height: 500px;"
									required></textarea>
							</pre>
						</div>
					</div>
					<br>

					<!-- 첨부파일등록 -->
					<div id="fileDiv">
						<p>
							<input class="pull-left UPFILEdownline" type="file" name="upFile"/> <a href="#this" name="delete" class="btn">삭제하기</a>
						</p>
					</div>
					
					<a href="#this" id="add" class="btn">파일 추가하기</a>
					
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
	$(document).ready(function(){
		$("a[name='delete']").on("click",function(e){
            e.preventDefault();
            fn_fileDelete($(this));
        });
        $("#add").on("click",function(e){
            e.preventDefault();
            fn_fileAdd();
        });
	});
	function fn_fileDelete(obj){
        obj.parent().remove();
    }
    function fn_fileAdd(){
        var str = "<p><input class='pull-left UPFILEdownline' type='file' name='upFile'/><a href='#this' name='delete' class='btn'>삭제하기</a></p> ";
        $("#fileDiv").append(str);
        $("a[name='delete']").on("click",function(e){
            e.preventDefault();
            fn_fileDelete($(this));         
        })
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
	
	$(function(){
		$('[name=upFile]').on('change',function(){
			var fileName=this.files[0].name;
			$(this).next('.custom-file-label').html(fileName);
		});
	});
   </script>
<script>
    
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />