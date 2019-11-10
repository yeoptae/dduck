<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
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
	#custom-search-input {
		width : 250px;
        margin:0;
        margin-top: 10px;
        padding: 0;
    }
 
    #custom-search-input .search-query {
        padding-right: 3px;
        padding-right: 4px \9;
        padding-left: 3px;
        padding-left: 4px \9;
        /* IE7-8 doesn't have border-radius, so don't indent the padding */
 
        margin-bottom: 0;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
    }
 
    #custom-search-input button {
        border: 0;
        background: none;
        /** belows styles are working good */
        padding: 2px 5px;
        margin-top: 2px;
        position: relative;
        left: -28px;
        /* IE7-8 doesn't have border-radius, so don't indent the padding */
        margin-bottom: 0;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
        color:#D9230F;
    }
 
    .search-query:focus + button {
        z-index: 3;   
    }
	
	</style>
<style>
.navbar-inverse .navbar-nav>li>a, .dropdown-menu>li>a{
	font-family: 'Do Hyeon', sans-serif;
	font-size : 20px;
    color : white;
}
.navbar-inverse .navbar-nav>li>ul>li>a:hover {
	background-color: e04e4e;
}
.navbar-inverse .navbar-nav>.open>a, .navbar-inverse .navbar-nav>li>a:focus, .navbar-inverse .navbar-nav>.open>a:hover, .navbar-inverse .navbar-nav>li>a:hover{
	background-color: #8e2615;
}
.redredredheader, .navbar-inverse .navbar-nav>li>ul{
    background-color: #BC331C;
}
.jumbotron {
   padding-top: 0px !important;
   padding-bottom: 0px !important;
}
.seroLine{
	margin-top : 15px;
	width : 1px;
	height : 20px;
	background-color : rgba(138, 16, 16, 0.822);
}
.loinglinestyle ul>li>a{
	height : 50px;
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
            <div class="redredredheader container-fluid" >
            
                <div class="navbar-header">
                    <button type="button" class="pull-left navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>


                <div class="collapse navbar-collapse" id="myNavbar" style=" text-align:center;">
                    <ul class="nav navbar-nav" id="menu">
                        <li><a href="${path}">Home</a></li>
                        <li><div class="seroLine"></div></li>
                        <li class="dropdown">
                           <a class="dropdown-toggle" data-toggle="dropdown"">메뉴<b class="caret"></b></a>
                           <ul class="dropdown-menu">
                              <li class="downmenufocus"><a href="${pageContext.request.contextPath}/notice/noticeList.do">공지사항</a></li>
                              <li class="downmenufocus"><a href="${path }/qna/qnaList.do">QNA</a></li>
                             </ul>
                        </li>
                        <li><div class="seroLine"></div></li>
                        <li><a href="${pageContext.request.contextPath}/admin/saleboardList.do?gCode=1">답례</a></li>
                        <li><div class="seroLine"></div></li>
                        <li><a href="${pageContext.request.contextPath}/admin/saleboardList.do?gCode=2">간식</a></li>
                        <li><div class="seroLine"></div></li>
                        <li><a href="${pageContext.request.contextPath}/admin/saleboardList.do?gCode=3">돌</a></li>
                        <li><div class="seroLine"></div></li>
                        <li><a href="${pageContext.request.contextPath}/admin/saleboardList.do?gCode=4">케익</a></li>
                        <li><div class="seroLine"></div></li>
                        <li><a href="${pageContext.request.contextPath}/admin/saleboardList.do?gCode=5">세트</a></li>
            
                    </ul>
					<ul class="nav navbar-nav">
						<li>
							<form name="form1" method="post"
								action="${path}/admin/searchList.do">
								<div id="custom-search-input">
									<div class="input-group col-md-12">
										<input type="text" id="searchWord" name="searchWord"
											value="${searchWord }" placeholder="전체 떡 검색하기" required
											class="  search-query form-control" placeholder="Search" />
										<span class="input-group-btn">
											<button class="btn btn-danger" onclick="searchDduck()"
												type="submit">
												<span class=" glyphicon glyphicon-search"></span>
											</button>
										</span>
									</div>
								</div>
							</form>
						</li>
					</ul>
					<!--로그인 시 보여지는 로직들  -->
                      <div class="loinglinestyle">
                      <c:choose>
                           <c:when test="${empty loginClient }">
                           <ul class="nav navbar-nav navbar-right">
                           <!--로그인 클릭시 해당 매핑값을 읽어들임  -->
                                    <li><a href="${pageContext.request.contextPath}/login/loginView.do"><span class="glyphicon glyphicon-user"></span> 로그인</a></li>
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
<%--                                       <li><a href="${pageContext.request.contextPath}/mypage/mypage.do?cNo=${loginClient.CId}">마이페이지</a></li> --%>
									<li><a href="${pageContext.request.contextPath}/client/panier?cId=${loginClient.CId}">마이페이지</a></li>

                                      <li><a href="${pageContext.request.contextPath}/Client/ClientLogout.do">로그아웃</a></li>
                                   </ul>
                            </c:otherwise>
                        </c:choose>
                        </div>
                   </div>
               </div>
            </nav>
       </header>
   </html>
