<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="qna" value="qnalist"/>
</jsp:include>
<section id="content">
    <div class="container">
        <h2>QNA <small>질문게시판</small></h2>
        <div class="qna-writer-button">
            <button type="button" class="btn btn-white btn-cons">글쓰기</button>
        </div>
        <br>
        <ul class="responsive-table">
            <li class="table-header">
                <div class="col col-1">번호</div>
                <div class="col col-2">작성자</div>
                <div class="col col-3">제목</div>
                <div class="col col-4">작성일</div>
            </li>
            <li class="table-row">
                <div class="col col-1" data-label="Job Id">4</div>
                <div class="col col-2" data-label="Customer Name">John Doe</div>
                <div class="col col-3" data-label="Amount">제목1</div>
                <div class="col col-4" data-label="Payment Status">2019-10-17</div>
            </li>
            <li class="table-row">
                <div class="col col-1" data-label="Job Id">3</div>
                <div class="col col-2" data-label="Customer Name">Jennifer Smith</div>
                <div class="col col-3" data-label="Amount">제목1</div>
                <div class="col col-4" data-label="Payment Status">2019-10-17</div>
            </li>
            <li class="table-row">
                <div class="col col-1" data-label="Job Id">2</div>
                <div class="col col-2" data-label="Customer Name">John Smith</div>
                <div class="col col-3" data-label="Amount">제목1</div>
                <div class="col col-4" data-label="Payment Status">2019-10-17</div>
            </li>
            <li class="table-row">
                <div class="col col-1" data-label="Job Id">1</div>
                <div class="col col-2" data-label="Customer Name">John Carpenter</div>
                <div class="col col-3" data-label="Amount">제목1</div>
                <div class="col col-4" data-label="Payment Status">2019-10-17</div>
            </li>
        </ul>
        
    </div>
<br><br><br>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>