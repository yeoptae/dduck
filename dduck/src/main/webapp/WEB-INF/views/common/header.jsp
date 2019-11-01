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
              <a href="${pageContext.request.contextPath}">
              <img src="${pageContext.request.contextPath }/resources/images/MainTitle.png"></a>
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
                 <%--  <c:forEach items="${list }" var="b"> --%>
                        <%-- <li><a href='${pageContext.request.contextPath}/admin/saleboardList.do?gCode=${b["GCODE"]}'>답례</a></li> --%>
                        <li><a href="http://localhost:9090/dduck">Home</a></li>
                        <li class="dropdown">
                        	<a class="dropdown-toggle" data-toggle="dropdown"">메뉴<b class="caret"></b></a>
                        	<ul class="dropdown-menu">
                        		<li><a href="${pageContext.request.contextPath}/notice/noticeList.do">공지사항</a></li>
                        		<li><a href="${path }/qna/qnaList.do">QNA</a></li>
                       		</ul>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/admin/saleboardList.do?gCode=1">답례</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/saleboardList.do?gCode=2">간식</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/saleboardList.do?gCode=3">돌</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/saleboardList.do?gCode=4">케익</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/saleboardList.do?gCode=5">세트</a></li>
                <%--  </c:forEach> --%>
                    </ul>
    	
	                	
	                	<!--로그인 시 보여지는 로직들  -->
	                	<c:choose>
                           <c:when test="${empty loginClient }">
                           <ul class="nav navbar-nav navbar-right">
                           <!--로그인 클릭시 해당 매핑값을 읽어들임  -->
                                    <li><a href="${pageContext.request.contextPath}/login/loginView.do"><span class="glyphicon glyphicon-user"></span> 로그인</a></li>
                                   <li><a href="${pageContext.request.contextPath}/member/email.do"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
                                  </ul>
                                  </c:when>
                            <c:when test="${loginClient.CId eq 'admin' }">
                               <ul class="nav navbar-nav navbar-right">   
                                    <li><a href="${pageContext.request.contextPath}/admin/adminmypage.do">관리자페이지</a></li>
                                        <li><a href="${pageContext.request.contextPath}/Client/ClientLogout.do">로그아웃</a></li>
                                   </ul>
                            </c:when>
                            <c:otherwise >
                                <ul class="nav navbar-nav navbar-right">
                               <%--  <li><a href="${pageContext.request.contextPath}/list/list.do?cNo=${loginClient.CId}" >내정보</a></li> --%>
                                      <li><a href="${pageContext.request.contextPath}/update/update.do?cNo=${loginClient.CId}">마이페이지</a></li>
                                      <li><a href="${pageContext.request.contextPath}/Client/ClientLogout.do">로그아웃</a></li>
                                   </ul>
                            </c:otherwise>
                        </c:choose>
              	  </div>
           	 </div>
        	 </nav>
    	</header>
	</html>

