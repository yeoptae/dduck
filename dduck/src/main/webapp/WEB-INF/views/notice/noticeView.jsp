<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="notice" value="noticeview"/>
</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/style.css">
<section id="content">
    <div class="container">  
        <div>
            <h4 class="pull-left">　 
				<c:choose>
              		<c:when test='${notice.NOTICECATEGORY eq "1"}'>
              			공지사항
              		</c:when>
              	    <c:when test='${notice.NOTICECATEGORY eq "2"}'>
              			이벤트
              		</c:when>
              	</c:choose>
            </h4>
            <h4 class="pull-right">${notice.CID }　　</h4>
        </div>
        <br><br>
	    <div class="well well-sm viewheadline1">
	    <p class="headline2">
	    <strong>　${notice.NOTICETITLE} </strong>
	    </p>
	    </div>
        
        
    	<div class="row marketing">


        <div class="col-lg-6">
		<c:forEach items="${noticeFile }" var="ntf">
        	<img src="${path}/resources/upload/notice/${ntf.noticeFileOri}">
        </c:forEach>
            <h4><p>
            	${notice.NOTICECONTENT}
            </p></h4>
        </div>
        </div>
        <br><br><br><br><br>
<%--         <c:forEach items="${noticeFile }" var="ntf">
        	<span class="downfontsize btn btn-default btn-lg"><i class="glyphicon glyphicon-download-alt" onclick="fileDownload('${ntf.noticeFileOri}')"></i> 첨부파일</span>
        		- ${ntf.noticeFileOri }
       		<div class="noticeNull15px"></div>
        </c:forEach> --%>
    </div>
    <br><br><br><br><br>
    
	<!-- 관리자메뉴 -->
	<c:if test="${loginClient.CId eq 'admin' }">
	    <div class="navbar navbar-default navbar-fixed-bottom">
	        <div class="container">
	            <p class="navbar-text pull-left">
	                <a href="" target="_blank" ></a>
	            </p>
	            <div class="pull-right">
	                <a href='javascript:void(0)' onclick="noticeUpdate()" class="navbar-btn btn-danger btn">
	                    <span class="glyphicon"></span> 수정 </a>
	                <a href="javascript:void(0)" onclick="noticeDelete()" class="navbar-btn btn-danger btn">
	                    <span class="glyphicon deleteNotice" ></span> 삭제 </a>
	            </div>
	        </div>
	    </div>
    </c:if>
</section>
<script>
/* 삭제 ---------------------------------------------------------------- */
	function noticeUpdate(){
	if(confirm("수정하시겠습니까?")){
		location.href="${path}/notice/noticeUpdateForm.do?noticeCode=${notice.NOTICECODE}";
	}
}
	function noticeDelete(){
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href="${path}/notice/noticeDelete.do?noticeCode=${notice.NOTICECODE}";
	}
}
	

/* 파일 다운로드 -----------------------------------------------------------*/
	function fileDownload(oName){
		oName=encodeURIComponent(oName);
		location.href="${path}/notice/noticeFileDown.do?oName="+oName;
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>