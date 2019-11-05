<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="qna" value="qnaview"/>
</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/style.css">
<section id="content">
    <div class="container">  
        <div>
            <h4 class="pull-left">　　QNA - </h4>
            <h4 class="pull-right">${qna.CID }　-　<fmt:formatDate value='${qna.QAEN }' pattern="yyyy.MM.dd"/>  　</h4>
        </div>
        <br><br>
	    <div class="well well-sm viewheadline1">
	    <p class="headline2">
	    <strong>　${qna.QATITLE} </strong>
	    </p>
	    </div>
        
        
    	<div class="row marketing">


        <div class="col-lg-6">
        	
            <h4><p>
            	<pre-wrap>${qna.QACONTENT}</pre-wrap>
            </p></h4>
        </div>
        </div>
        <br><br><br><br><br>
<!-- ---------------댓글구간--------------- -->
        <c:choose>
	        <c:when test="${!empty qnaC.CMCONTENT }">
				<div class="content">
		            <div class="panel panel-default">
		                <div class="panel-heading">
		                	<input type = "hidden" name = "qaCode" id = "qaCode" value = '${qnaC.QACODE}'/>
							${qnaC.CID } - <fmt:formatDate value='${qnaC.CMEN }' pattern="yyyy.MM.dd"/>
		                </div>
		                <div class="panel-body">
		                    <pre-wrap><textarea readonly class="commentTextArea" id="commentUpdate">${qnaC.CMCONTENT }</textarea></pre-wrap>
		                    <div class="updateShowButton pull-right" id="updateShowButton"></div>
							<c:if test="${loginClient.CId eq 'admin' }">
								<div class="qnaCNull"></div>
					            <div class="pull-right" id="updateHideButton">
					                <a href="javascript:void(0);" class="navbar-btn btn-danger btn" onclick="cmUpdate(this)">
					                    <span class="glyphicon"></span> 수정 </a>
					                <a href="${path }/qna/qnaCommentDelete.do?qaCode=${qna.QACODE }" class="navbar-btn btn-danger btn">
					                    <span class="glyphicon"></span> 삭제 </a>
					            </div>
				            </c:if>
		                </div>
		            </div>
				</div>
			</c:when>
			<c:when test="${loginClient.CId eq 'admin' && empty qnaC.CMCONTENT}">
				<form action="${path }/qna/qnaCommentSubmit.do" method="POST">
					<div class="content">
			            <div class="panel panel-default">
			                <div class="panel-body" style="background : rgb(245, 245, 245);">
			                    <pre-wrap><textarea rows="10" class="textareaComment" name="cmContent"></textarea></pre-wrap>
		                		<div class="pull-right">
	                                <input class="navbar-btn btn-danger btn" type="submit" value="등록" class="qnaSubmitButton">
	                            </div>
			                </div>
			            </div>
					</div>
				<input type="hidden" name="cId" value="${qna.CID }">
				<input type="hidden" name="qaCode" value="${qna.QACODE }">
				</form>
			</c:when>
		</c:choose>
		
<!-- ---------------게시글 수정 삭제 구간--------------- -->
<c:if test="${loginClient.CId eq qna.CID || loginClient.CId eq 'admin'}">
    <div class="navbar navbar-default navbar-fixed-bottom">
        <div class="container">
            <div class="pull-right">
                <a href="javascript:void(0);" onclick="qnaUpdate()" class="updateBtn navbar-btn btn-danger btn">
                    <span class="glyphicon"></span> 수정 </a>
                <a href="javascript:void(0);" onclick="qnaDelete()" class="navbar-btn btn-danger btn">
                    <span class="glyphicon"></span> 삭제 </a>
            </div>
        </div>
    </div>
</c:if>
</section>
<script>
	function qnaDelete(){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="${path}/qna/qnaDelete.do?qaCode=${qna.QACODE}";
		}
	}
	
	$(function(){
		$('.updateBtn').click(function(){
			if(confirm("게시글을 수정하시겠습니까?")){
				location.href='${path}/qna/qnaUpdate.do?qaCode=${qna.QACODE}';
			}
		})
	})

/* =======================qna comment=========================== */
	function cmUpdate(element){
		var textArea = $('#commentUpdate');

		var updateHideButton =$('#updateHideButton'); //기존 수정 삭제 버튼 가리기
		$(updateHideButton).hide();
		var updateShowButton = $('#updateShowButton'); //수정버튼 보이기
		$(updateShowButton).show();
		
		var commentContext = $(textArea).html();
		textArea.attr("readOnly",false);
		$(textArea).focus();
		var data="<input type='button' class='navbar-btn btn-danger btn' value='수정완료' onclick='commentUpdate();'>&nbsp<input type='button' class='navbar-btn btn-danger btn' value='취소' onclick='commentRollback(this,\""+commentContext+"\");'>";
		$(updateShowButton).html(data);
	}
	
	function commentUpdate(){
		var commentContext = $("#commentUpdate").val();
		console.log(commentContext);
		location.href="${path}/qna/qnaCommentUpdate.do?qaCode="+$('#qaCode').val()+"&cmContent="+commentContext;
	}
	
	function commentRollback(element,content) {
		var updateHideButton =$('#updateHideButton');
		$(updateHideButton).show();
		var textArea = $('#commentUpdate');
		var updateShowButton = $('#updateShowButton');
		$(updateShowButton).hide();
		$(textArea).val(content);
		textArea.attr("readOnly",true);
		
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>