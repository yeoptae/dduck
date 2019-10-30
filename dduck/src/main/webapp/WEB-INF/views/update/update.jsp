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
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullAddr = ''; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수

                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        fullAddr = data.roadAddress;

                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        fullAddr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                    if (data.userSelectedType === 'R') {
                        //법정동명이 있을 경우 추가한다.
                        if (data.bname !== '') {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if (data.buildingName !== '') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('sample6_address').value = fullAddr;

                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById('sample6_address2').focus();
                }
            }).open();
        }
    </script>
	<%--        
	<c:set var="str1" value="Hello World" />
                         <c:set var="subStr1" value="${fn:substring(str1, 0, 5) }" />
                         <c:out value="subStr1 - ${subStr1 }" />
 --%>
	<div class="row">
		<div class="col-xs-12 col-sm-12">
			<h1 class="text-center" style="margin-right: -50px;">정보수정</h1>
		</div>

		<div class="col-sm-3 sidenav">
			<h4>관리자페이지</h4>
			<ul class="nav nav-pills nav-stacked">
				<li><a
					href="${pageContext.request.contextPath}/admin/adminmypage.do">주문현황</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/adminClientList.do">회원리스트</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/adminQnaBoard.do">Qna게시판
						관리하기</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/insertproduct.do">상품등록</a></li>
			</ul>
			<br>
		</div>
		<div class="col-xs-8 col-sm-8">

			<div>
				<p>&nbsp;</p>

				<form class="form-horizontal" action="${path }/update/updateEnd.do"
					method="post">
					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label for="id">아이디</label>
						</div>
						<div class="col-sm-6 text-left">
							<input type="text" class="form-control" name="cId" id="id"
								value=${client.CId }>
						</div>
					</div>

					<!-- div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="pwd">패스워드</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" name="cPw" id="pwd">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="pwdCheck">패스워드 체크</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" name="pwdCheck" id="pwdCheck">
                        </div>
                    </div> -->

					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="name">이름</label>
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="cName" id="name"
								value=${client.CName }>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="email">이메일</label>
						</div>
						<div class="col-sm-6">
							<input type="email" class="form-control" name="cEmail" id="email"
								value=${client.CEmail }>
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="zip_num">우편번호</label>
						</div>
						<div class="col-sm-3">
							<input type="text" id="sample6_postcode" placeholder="우편번호"
								name="cAddr" class="form-control" value=${client.CAddr1 }>
						</div>
						<div class="col-sm-3">
							<input type="button" onclick="sample6_execDaumPostcode()"
								value="우편번호 찾기" class="btn btn-primary">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="address1">주소</label>
						</div>
						<div class="col-sm-6">
							<input type="text" id="sample6_address" placeholder="주소"
								name="cAddr" class="form-control" value=${client.CAddr2 }>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="address1">상세주소</label>
						</div>
						<div class="col-sm-6">
							<input type="text" id="sample6_address2" placeholder="상세주소"
								name="cAddr" class="form-control" value=${client.CAddr3 }>
						</div>
					</div>



					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="phone">전화번호</label>
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="cPhone"
								value=${client.CPhone }>
						</div>
					</div>


					<input type="hidden" name="ip" value="${GetIpAddress.getIp()}">
					<div class="form-group">
						<div class="col-sm-12  text-center">
							<input type="submit" value="정보수정" class="btn btn-primary"
								style="margin-left: -170px;"> <input type="reset"
								value="취소" class="btn btn-primary">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />