<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="clientEnroll" value="회원가입"/>
</jsp:include>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



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
        
        //비밀번호 일치하는지 확인  비밀번호가 틀리면  가입버튼 비활성화
       $(function(){ 
        	$("#alert-success").hide(); 
        	$("#alert-danger").hide(); 
        	$("[name=pwdCheck]").keyup(function(){ 
        		var pwd=$("#pwd").val(); 
        		var pwdCheck=$("#pwdCheck").val(); 
        		/* var reg_pwd =$("#pwd").val(/^.*(?=.{6,12})(?=.*[0-9])(?=.*[a-zA-Z]).*$/); */
        		if(pwd != "" || pwdCheck != ""|| reg_pwd !=""){ 
        			if(pwd == pwdCheck){ 
        				$("#alert-success").show(); 
        				$("#alert-danger").hide(); 
        				$("#submit").removeAttr("disabled"); 
        				}else { 
        					$("#alert-success").hide(); 
        					$("#alert-danger").show(); 
        					$("#submit").attr("disabled", "disabled"); 
        					} 
        			} 
        		}); 
        }); 
        
         
     
        
 

	$(function(){
		$("#id").blur(function() {
			// id = "id_reg" / name = "userId"
			var clientId = $('#id').val();
			$.ajax({
				url : "${pageContext.request.contextPath}/user/idCheck?cId="+ clientId,
																//cId=파라미터값으로 input에 name값이다.
				type : 'get',
				datatype : 'html',
				success : function(data) {
								console.log("1 = 중복o / 0 = 중복x : "+ data);							
								if (data == 1) {
									// 1 : 아이디가 중복되는 문구
									$("#id_check").text("사용중인 아이디입니다.");
									$("#id_check").css("color", "red");
								} else {
									if(data == 0){
										// 0 : 아이디 길이 / 문자열 검사
										$("#id_check").text("사용가능한 아이디입니다.");
										$("#id_check").css("color", "green");
									} 
								}
							}, error : function() {
									console.log("실패");
							}
						});
					});
		        
				}); 


	
     </script>
     

    <div class="row">

        <div class="col-xs-12 col-sm-12">
            <h1 class="text-center" style="margin-right: -50px;">회원가입</h1>
        </div>

        <div class="col-xs-3 col-sm-3"></div>
        <div class="col-xs-8 col-sm-8">

            <div>
                <p>&nbsp;</p>

                <form name="form1" class="form-horizontal" action="${path }/client/clientEnrollEnd.do" method="post" onsubmit="return signUp_validate();">
                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label >아이디</label>
                        </div>
                        <div class="col-sm-6 text-left">
                            <input type="text" name="cId" id="id" class="form-control">
                            <div class="check_font" id="id_check"></div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label>패스워드</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" name="cPw" id="pwd" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label>패스워드 체크</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" name="pwdCheck" id="pwdCheck" required/>
                         	<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
                            <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label>이름</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="cName" id="userName">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label>이메일</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" name="CEmail" id="email" value="${tomail }" readonly>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="zip_num">우편번호</label>
                        </div>
                        <div class="col-sm-3">
                            <input type="text" id="sample6_postcode" placeholder="우편번호" name="cAddr1"
                                class="form-control">
                        </div>
                        <div class="col-sm-3">
                            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
                                class="btn btn-primary">

                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="address1">주소</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="text" id="sample6_address" placeholder="주소" name="cAddr2"
                                class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="address1">상세주소</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="text" id="sample6_address2" placeholder="상세주소" name="cAddr3"
                                class="form-control">
                        </div>
                    </div>



                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="phone">전화번호</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="cPhone" id="phone">
                        </div>
                    </div>


                    <input type="hidden" name="ip" value="${GetIpAddress.getIp()}">
                    <div class="form-group">
                        <div class="col-sm-12  text-center">
                            <input type="submit" id=submit value="회원가입" class="btn btn-primary" style="margin-left: -170px;">
                           
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
<script>
function signUp_validate(){
	
	/* var idCheck = /^[A-Za-z0-9+]{4,12}$/;
	if(!idCheck.test($('#id').val())) {
		alert("아이디는 4글자이상,12글자만 가능합니다.");
	} */
	
	var pwCheck = /^[a-z]+[a-z0-9]{5,19}$/g;
	var pwCheck2= /^[a-z]+[a-z0-9]{5,19}$/g;
	if(!pwCheck.test($('#pwd').val()) &&!pwCheck2.test($('#pwd').val())) {
		alert('비밀번호는 소문자+숫자로 가능합니다.');
	}
	
	var getName= /^[가-힣]+$/;
	if(!getName.test($('#userName').val())) {
		alert("이름은 한글만 입력이 가능합니다.");
	}
	
	
	return false;
}
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
