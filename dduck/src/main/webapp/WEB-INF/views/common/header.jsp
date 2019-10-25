<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${path }/resources/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
    <style>
    .jumbotron {
        padding-top: 0px !important;
        padding-bottom: 0px !important;
    }

    
   </style>

<body>
    <header>
        <div class="jumbotron" style="background-color: white;">
            <div class="container text-center">
                <img src="${pageContext.request.contextPath }/resources/images/MainTitle.png">
            </div>
        </div>

        <nav class="navbar navbar-inverse">
            <div class="container-fluid" >
            
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>


                <div class="collapse navbar-collapse" id="myNavbar" style=" text-align:center;">
                    <ul class="nav navbar-nav" id="menu">
                        <li><a href="${path }/notice/noticeList.do">공지사항</a></li>
                        <li><a href="#">답례</a></li>
                        <li><a href="#">간식</a></li>
                        <li><a href="#">돌</a></li>
                        <li><a href="#">케익</a></li>
                        <li><a href="#">세트</a></li>
                    </ul>
                    
                    
                  <%--    <c:if test="${not empty loginMember }">
                     	<ul class="nav navbar-nav navbar-right">
                    	<li><a href="${pageContext.request.contextPath}">마이페이지</a></li>
                        <li><a href="${pageContext.request.contextPath}">로그아웃</a></li>
                    	</ul>
                    </c:if>
                    
                    <c:if test="${loginMember.CID eq 'admin'}">
    					<ul class="nav navbar-nav navbar-right">
                    	<li><a href="${pageContext.request.contextPath}">관리자페이지</a></li>
                    	</ul>
					</c:if> --%>
					
					<c:if test="${empty loginClient }">
                    	<ul class="nav navbar-nav navbar-right">
                        <li><a href="${pageContext.request.contextPath}/login/loginView.do"><span class="glyphicon glyphicon-user"></span> 로그인</a></li>
                        <li><a href="${pageContext.request.contextPath}/member/email.do"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
                   		</ul>
                	</c:if>
					
					<c:choose>
						<c:when test="${not empty loginClient }">
                     	<ul class="nav navbar-nav navbar-right">
                    	<li><a href="${pageContext.request.contextPath}">마이페이지</a></li>
                        <li><a href="${pageContext.request.contextPath}/Client/ClientLogout.do">로그아웃</a></li>
                    	</ul>
                    	</c:when>
                    	
<%--                     	<c:when test="${loginClient.cId eq 'admin' }">
                    	<ul class="nav navbar-nav navbar-right">
                    	<li><a href="${pageContext.request.contextPath}">관리자페이지</a></li>
                        <li><a href="${pageContext.request.contextPath}/Client/ClientLogout.do">로그아웃</a></li>
                    	</ul>
                    	</c:when> --%>
                    </c:choose>
                    
                </div>
            </div>
         </nav>
    </header>
</html>

