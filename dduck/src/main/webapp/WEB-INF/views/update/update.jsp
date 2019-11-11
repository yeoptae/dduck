<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="clientEnroll" value="정보수정" />
</jsp:include>

<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR|Sunflower:300&display=swap" rel="stylesheet">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
    
	<div class="row">
		<div class="col-sm-3 sidenav">
			<h4 style="margin-right:10px; font-family: 'Black Han Sans', sans-serif;">정보수정</h4>
			<ul class="nav nav-pills nav-stacked">
				<li><a href="${pageContext.request.contextPath}/client/panier?cId=${loginClient.CId}" style="font-family: 'Black Han Sans', sans-serif;">장바구니</a></li>
				<li><a href="${pageContext.request.contextPath}/client/paymentList?cId=${loginClient.CId}" style="font-family: 'Black Han Sans', sans-serif;">결제내역</a></li>
				<li><a href="${pageContext.request.contextPath}/client/ClientQnaList.do?cId=${loginClient.CId}" style="font-family: 'Black Han Sans', sans-serif;">문의내역</a></li>
				<li><a href="${pageContext.request.contextPath}/update/update.do?cId=${loginClient.CId}" style="font-family: 'Black Han Sans', sans-serif;">정보수정</a></li>
				<li><a href="${pageContext.request.contextPath}/pwChange/pwChange.do" style="font-family: 'Black Han Sans', sans-serif;">비밀번호 변경</a></li>
				<li><a href="${pageContext.request.contextPath}/withdraw/withdraw.do" style="font-family: 'Black Han Sans', sans-serif;">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="col-xs-8 col-sm-8">
		<h1 class="text-center" style="margin-right:150px; font-family: 'Black Han Sans', sans-serif;">정보수정</h1>
			<div>
				<form class="form-horizontal" action="${path }/update/updateEnd.do" method="post" onsubmit="return signUp_validate();">
					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label style="background-color: #EAEAEA; font-family: 'Do Hyeon', sans-serif;">아이디</label>
						</div>
						<div class="col-sm-6 text-left">
							<input type="text" class="form-control" name="cId" id="id" readonly="readonly"
								value="${loginClient.CId }">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label style="background-color: #EAEAEA; font-family: 'Do Hyeon', sans-serif;">이름</label>
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="cName" id="name" readonly="readonly"
								value="${loginClient.CName }">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label style="background-color: #EAEAEA; font-family: 'Do Hyeon', sans-serif;">이메일</label>
						</div>
						<div class="col-sm-6">
							<input type="email" class="form-control" name="cEmail" id="email"
								value="${loginClient.CEmail }">
							<div class="check_font" id="mailCheck"></div>
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="zip_num" style="background-color: #EAEAEA; font-family: 'Do Hyeon', sans-serif;">우편번호</label>
						</div>
						<div class="col-sm-3">
							<input type="text" id="sample6_postcode" placeholder="우편번호"
								name="cAddr1" class="form-control" value="${loginClient.CAddr1 }">
						</div>
						<div class="col-sm-3">
							<input type="button" onclick="sample6_execDaumPostcode()"
								value="우편번호 찾기" class="btn btn-primary">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="address1" style="background-color: #EAEAEA; font-family: 'Do Hyeon', sans-serif;">주소</label>
						</div>
						<div class="col-sm-6">
							<input type="text" id="sample6_address" placeholder="주소"
								name="cAddr2" class="form-control" value="${loginClient.CAddr2 }">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label id="address1" style="background-color: #EAEAEA; font-family: 'Do Hyeon', sans-serif;">상세주소</label>
						</div>
						<div class="col-sm-6">
							<input type="text" id="sample6_address2" placeholder="상세주소"
								name="cAddr3" class="form-control" value="${loginClient.CAddr3 }">
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-2 control-label">
							<label style="background-color: #EAEAEA; font-family: 'Do Hyeon', sans-serif;">전화번호</label>
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="cPhone" id="phone"
								value="${loginClient.CPhone }">
						</div>
					</div>

					<input type="hidden" name="ip" value="${GetIpAddress.getIp()}">
					<div class="form-group">
						<div class="col-sm-12  text-center">
							<input type="submit" value="정보수정"  id="submit" class="btn btn-primary"
								style="margin-left: -170px;">
							<input type="button" class="btn btn-primary" value="취소하기" onClick="location.reload()"/>  
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
<script>

//이메일 우편번호 주소 상세주소 전화번호
function signUp_validate(){

	var phone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	if(!phone.test($('#phone').val())){
		alert('올바른 휴대폰 번호를 입력해주세요.');
		return false;
	}

	
	return true;
	}

$(function(){
	$("#email").keyup(function() {
		var clientEmail = $('#email').val();
		if(clientEmail==''||clientEmail.length<5){
			$("#mailCheck").css("display","none");
		}
		if(clientEmail.trim().length>4){
			$.ajax({
				url : "${pageContext.request.contextPath}/user/mailCheck2?cEmail="+ clientEmail,
				//cId=파라미터값으로 input에 name값이다.
				type : 'post',
				datatype : 'html',
				success : function(data) {
								if (data == 1) {
									// 1 : 이메일이 중복되는 문구
									$("#mailCheck").text("중복된 이메일입니다.");
									$("#mailCheck").css({"color":"red","display":"block"});
									$("#submit").hide();
								} else {
									if(data == 0){
										$("#mailCheck").text("사용가능한 이메일입니다.");
										$("#mailCheck").css({"color":"green","display":"block"});
										$("#submit").show();
									} 
								}
							}, error : function() {
									console.log("실패");
							}
				});
			}
		});
	});







</script>
 
	
	
	
	
	
	
	
	
	
	

<jsp:include page="/WEB-INF/views/common/footer.jsp" />