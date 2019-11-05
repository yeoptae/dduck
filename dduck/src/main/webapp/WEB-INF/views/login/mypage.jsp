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

					href="${pageContext.request.contextPath}/client/panier?cId=${loginClient.CId}">장바구니</a></li>
				<li><a
					href="${pageContext.request.contextPath}/client/paymentList?cId=${loginClient.CId}">결제내역</a></li>

				<li><a
					href="${pageContext.request.contextPath}/update/update.do?cId=${loginClient.CId}">정보수정</a></li>
				<li><a
					href="${pageContext.request.contextPath}/pwChange/pwChange.do">비밀번호 변경</a></li>
				<li><a
					href="${pageContext.request.contextPath}/withdraw/withdraw.do">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="col-xs-8 col-sm-8">
		<h1 class="text-center">마이 페이지</h1>
			<div>
				<form class="form-horizontal">
					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="id">아이디</label>
						</div>
						<div class="col-sm-6 text-left">
							<input type="text" class="form-control" name="cId" id="id"
								value=${loginClient.CId } readonly="readonly">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="name">이름</label>
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="cName" id="name"
								value=${loginClient.CName } readonly="readonly">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="email">이메일</label>
						</div>
						<div class="col-sm-6">
							<input type="email" class="form-control" name="cEmail" id="email"
								value=${loginClient.CEmail } readonly="readonly">
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="zip_num">우편번호</label>
						</div>
						<div class="col-sm-3">
							<input type="text" id="sample6_postcode" placeholder="우편번호"
								name="cAddr" class="form-control" value="${loginClient.CAddr1 }" readonly="readonly">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="address1">주소</label>
						</div>
						<div class="col-sm-6">
							<input type="text" id="sample6_address" placeholder="주소"
								name="cAddr" class="form-control" value="${loginClient.CAddr2 }" readonly="readonly">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="address1">상세주소</label>
						</div>
						<div class="col-sm-6">
							<input type="text" id="sample6_address2" placeholder="상세주소"
								name="cAddr" class="form-control" value="${loginClient.CAddr3 }" readonly="readonly">
						</div>
					</div>



					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="phone">전화번호</label>
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="cPhone"
								value=${loginClient.CPhone } readonly="readonly">
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />