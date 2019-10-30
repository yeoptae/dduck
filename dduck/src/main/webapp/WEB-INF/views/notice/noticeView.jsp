<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="${path }/resources/css/style.css">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="notice" value="noticeview"/>
</jsp:include>
<section id="content">
    <div class="container">  
        <div>
            <h4 class="pull-left">　　공지사항 - </h4>
            <h4 class="pull-right">${notice.CID }　　</h4>
        </div>
        <br><br>
	    <div class="well well-sm viewheadline1">
	    <p class="headline2">
	    <strong>${notice.NOTICETITLE} </strong>
	    </p>
	    </div>
        
        
    	<div class="row marketing">


        <div class="col-lg-6">
        	
            <h4><p>
            	${notice.NOTICECONTENT}
            </p></h4>
        </div>
        </div>
        <br><br><br><br><br>
        <c:forEach items="${noticeFile }" var="ntf">
        	<span class="downfontsize btn btn-default btn-lg"><i class="glyphicon glyphicon-download-alt" onclick="fileDownload('${ntf.noticeFileOri}')"></i> 첨부파일</span>
        		- ${ntf.noticeFileOri }
<%--         	<button type="button" onclick="fileDownload('${ntf.noticeFileOri}')">
        	</button> --%>
        </c:forEach>
    </div>
    <br><br><br><br><br>
    
	<!-- 관리자메뉴 -->
<%-- 	<c:if test="${cId eq 'admin' }"> --%>
	    <div class="navbar navbar-default navbar-fixed-bottom">
	        <div class="container">
	            <p class="navbar-text pull-left">
	                <a href="" target="_blank" ></a>
	            </p>
	            <div class="pull-right">
	                <a href='${path }/notice/updateNotice.do?noticeCode=${notice.NOTICECODE}' class="navbar-btn btn-danger btn">
	                    <span class="glyphicon" onclick=""></span> 수정 </a>
	                <a href="" class="navbar-btn btn-danger btn">
	                    <span class="glyphicon deleteNotice" onclick=""></span> 삭제 </a>
	            </div>
	        </div>
	    </div>
<%--     </c:if> --%>
</section>
<script>
/* 삭제 ---------------------------------------------------------------- */
	$(function(){
		$('.deleteNotice').click(function(){
			if(confirm("정말로 삭제하시겠습니까?")){
				location.href='${path}/notice/noticeDelete.do?noticeCode=${NOTICECODE}';
			}
		})
	})
	

/* 파일 다운로드 -----------------------------------------------------------*/
	function fileDownload(oName){
		oName=encodeURIComponent(oName);
		location.href="${path}/notice/noticeFileDown.do?oName="+oName;
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>