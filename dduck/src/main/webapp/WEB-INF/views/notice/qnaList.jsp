<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="qna" value="qnalist"/>
</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/style.css">
<section id="content">
    <div class="container">
        <h2>QNA <small>질문게시판</small></h2>
        <c:if test="${!empty loginClient }">
	        <div class="qna-writer-button">
	            <button type="button" class="qnawritebutton btn btn-white btn-cons" onclick='location.href="${path}/qna/qnaForm"'>글쓰기</button>
	        </div>
        </c:if>
        <div class="nullLine"></div>
        <br>
        <ul class="qnatable responsive-table">
            <li class="table-header">
                <div class="col col-1">번호</div>
                <div class="col col-2">작성자</div>
                <div class="col col-3">제목</div>
                <div class="col col-4">작성일</div>
                <div class="col col-5">답변</div>
            </li>
            <c:forEach items="${list }" var="q" varStatus="v">
		            <li class="qnaHover table-row">
		                <div class="col col-1" data-label="번호"><c:out value='${q["QACODE"] }'/></div>
		                <div class="col col-2" data-label="작성자"><c:out value='${q["CID"] }'/></div>
	                	<div class="col col-3" data-label="제목" style="-webkit-text-stroke-width: thin;"><a href='${path }/qna/qnaView.do?qaCode=${q["QACODE"] }'><c:out value='${q["QATITLE"] }'/></a></div>
		                <div class="col col-4" data-label="작성일"><fmt:formatDate value='${q["QAEN"] }' pattern="yyyy.MM.dd"/></div>
		                <div class="col col-5" data-label="답변">
<%-- 		                	<c:out value='${q["CMCONTENT"] }'/> --%>
		                	<c:choose>
		                		<c:when test='${empty q["CMCONTENT"]}'>
		                			<div>-</div>
		                		</c:when>
		                		<c:when test='${not empty q["CMCONTENT"]}'>
		                			<div style="color:red">답변완료</div>
		                		</c:when>
		                	</c:choose>
		                </div>
		            </li>
            </c:forEach>
        </ul>
    </div>
    <center>${pageBar }</center>
<br><br><br>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>