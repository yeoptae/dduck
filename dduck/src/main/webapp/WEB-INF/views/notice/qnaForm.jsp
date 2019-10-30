<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="${path }/resources/css/style.css">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="qna" value="qnaform"/>
</jsp:include>
<section id="content">
    <div class="centerset">
        <div class="">
        <div class="">
            <div class="well well-sm writerform">
            <form class="form-horizontal" action="" method="post">
            <fieldset>
                <legend class="qna-form-header text-center">QNA등록</legend>
        
                <!-- Name input-->
                <div class="form-group">
                <div class="qna-form-text">제목</div>
                <div class="col-md-9">
                    <input id="name" name="name" type="text" placeholder="제목을 입력해주세요" class="form-control">
                </div>
                </div>
        
                <!-- Message body -->
                <div class="form-group">
                <div class="qna-form-text">내용</div>
                <div class="col-md-9">
                    <textarea class="form-control" id="message" name="message" placeholder="내용" rows="5" style="height: 500px;"></textarea>
                </div>
                </div>
                <br>
                <!-- 첨부파일등록 -->
                <div class="">
                        <div class="qna-inputfile">    
                            <div class="col-xs-12 col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">  
                                <!-- image-preview-filename input [CUT FROM HERE]-->
                                <div class="input-group image-preview">
                                    <input type="text" class="form-control image-preview-filename" disabled="disabled"> <!-- don't give a name === doesn't send on POST/GET -->
                                    <span class="input-group-btn">
                                        <!-- image-preview-clear button -->
                                        <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                                            <span class="glyphicon glyphicon-remove"></span> Clear
                                        </button>
                                        <!-- image-preview-input -->
                                        <div class="btn btn-default image-preview-input">
                                            <span class="glyphicon glyphicon-folder-open"></span>
                                            <span class="image-preview-input-title">Browse</span>
                                            <input type="file"  name="input-file-preview"/> <!-- rename it -->
                                        </div>
                                    </span>
                                </div><!-- /input-group image-preview [TO HERE]--> 
                            </div>
                        </div>
                    </div>
                <!-- Form actions -->
                <div class="form-group">
                    <div class="col-md-12 text-right">
                        <button type="submit" class="btn btn-primary btn-lg">등록</button>
                    </div>
                </div>
            </fieldset>
            </form>
            </div>
        </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>