<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="qna" value="qnaview"/>
</jsp:include>
<section id="content">
    <div class="container">  
            
    <h2>QNA - </h2>
            
        
    <div class="well well-sm viewheadline1">
    <p class="headline2">
    <strong>제목입니다 </strong>.
    </p>
    </div>
        
    <div class="row marketing">
        <div class="col-lg-6">
            <h4>제목입력내용</h4>
            <p>
            글내용작성칸<br>
            글ㄴ;ㅐ요ㅗㅇ두번쨰칸
            </p>
        </div>
        </div>
    </div>
    <br><br><br><br><br>
                   
    <div class="navbar navbar-default navbar-fixed-bottom">
        <div class="container">
            <p class="navbar-text pull-left">
                <a href="" target="_blank" ></a>
            </p>
            <div class="pull-right">
                <a href="" class="navbar-btn btn-danger btn">
                    <span class="glyphicon"></span> 수정 </a>
                <a href="" class="navbar-btn btn-danger btn">
                    <span class="glyphicon"></span> 삭제 </a>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>