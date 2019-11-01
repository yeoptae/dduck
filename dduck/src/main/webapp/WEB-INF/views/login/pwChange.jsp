<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="clientEnroll" value="정보수정" />
</jsp:include>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 	
<body>
	<div class="row">
		<div class="col-sm-3 sidenav">
			<h4 style="padding:10px;">마이 페이지</h4>
			<ul class="nav nav-pills nav-stacked">
				<li><a
					href="${pageContext.request.contextPath}/admin/adminmypage.do">장바구니</a></li>
				<li><a
					href="${pageContext.request.contextPath}/update/update.do?cNo=${loginClient.CId}">정보수정</a></li>
				<li><a
					href="${pageContext.request.contextPath}//pwChange/pwChange.do">비밀번호 변경</a></li>
				<li><a
					href="${pageContext.request.contextPath}/withdraw/withdraw.do">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="col-xs-8 col-sm-8">
		<h1 class="text-center">비밀번호 변경</h1>
			<div>
				<form class="form-horizontal" action="${path }/pwChangeEnd/pwChangeEnd.do">

					<div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="pwd">패스워드</label>
                        </div>
                        <div class="col-sm-6">
                        	<input type="text" name="cId" value="${loginClient.CId }"> 
                            <input type="password" class="form-control" name="cPw" id="cPw">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="pwdCheck">패스워드 체크</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" name="cPw" id="cPw">
                        </div>
                    </div>
                    	 <div class="col-sm-12  text-center">
                            <input type="submit" value="변경하기" class="btn btn-primary" style="margin-left: -170px;">
                            <input type="reset" value="취소하기" class="btn btn-primary">
                        </div>
				</form>
			</div>
		</div>
	</div>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />