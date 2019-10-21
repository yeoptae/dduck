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
    <title>메인페이지</title>
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
                        <li><a href="#">답례</a></li>
                        <li><a href="#">간식</a></li>
                        <li><a href="#">돌</a></li>
                        <li><a href="#">케익</a></li>
                        <li><a href="#">세트</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span> 로그인</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
</head>
