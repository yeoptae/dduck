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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>



<!--    <style>
      div#enroll-container{width:400px; margin:0 auto; text-align:center;}   
      div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
      
    /*중복아이디체크관련*/
    div#userId-container{position:relative; padding:0px;}
    div#userId-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
    div#userId-container span.ok{color:green;}
    div#userId-container span.error{color:red;}
    
   </style> -->

<body>
    <script src="https://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
        
        
        
        
        
        
   function validate() {
           
           var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); 
           var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/); 
           var getName= RegExp(/^[가-힣]+$/); 
           var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정

             //아이디 공백확인
        	if($("#id").val() == ""){ 
        		alert("아이디를 입력해주세요"); 
				id.focus()        		
        		return false; 
        	}
        	
       		//아이디 유효성검사
        	if(!getCheck.test($("#id").val())){ 
        		alert("아이디는 소문자,숫자 4글자 이상,12자이하로 가능합니다"); 
        		$("#id").focus(); 
        		
        		return false; 
        	}
       		
        	//비밀번호 공백 확인
        	if (form1.pwd.value=="" || form1.pwdCheck.value=="") {
            alert("비밀번호를 입력하지 않았습니다.")
            form1.pwdCheck.focus();
            return false;
              }
           
            //아이디 비밀번호 같음 확인 
           if (form1.pwd.value == form1.id.value) {
            alert("아이디와 비밀번호가 같습니다.")
            form1.pwd.focus();
            return false;
<<<<<<< HEAD
              }
            
            //이름 유효성
=======
       		 }
        	 
        	 //이름 유효성
>>>>>>> branch 'master' of https://github.com/yeoptae/dduck.git
            var namePattern = /^[가-힣]{2,10}$/;
            
<<<<<<< HEAD
              if(!namePattern.test(form1.name.value)){
=======
           	if(!namePattern.test(form1.name.value)){
>>>>>>> branch 'master' of https://github.com/yeoptae/dduck.git
            alert("이름은 한글만 입력이 가능합니다..");
            form1.name.focus();
            return false;
<<<<<<< HEAD
            }
=======
        	 }
>>>>>>> branch 'master' of https://github.com/yeoptae/dduck.git
           
           //주소 빈칸
             if(form1.sample6_postcode.value==""){
                 alert("우편번호를 입력해주세요.");
                 form1.sample6_postcode.focus();
                 return false;
              }
              
                if(form1.sample6_address2.value=="" || form1.sample6_address.value==""){
                 alert("상세주소를 입력해주세요.");
                 form1.sample6_address2.focus();
                 return false;
              }
             
       
<<<<<<< HEAD
             //핸드폰 빈칸
=======
         	 //핸드폰 빈칸
>>>>>>> branch 'master' of https://github.com/yeoptae/dduck.git
            if(form1.phone.value==""){
                alert("핸드폰번호를 입력해 주십시오.");
                form1.phone.focus();
                return false;
         }
            return true;
            
<<<<<<< HEAD
    }
             
       
     
   $(function(){
      $("#id").blur(function() {
         // id = "id_reg" / name = "userId"
         var clientId = $('#id').val();
         $.ajax({
            url : "${pageContext.request.contextPath}/user/idCheck?cId="+ clientId,                                             //cId=파라미터값으로 input에 name값이다.
            type : 'get',
            datatype : 'html',
            success : function(data) {
                        console.log("1 = 중복o / 0 = 중복x : "+ data);                     
                        if (data == 1) {
                           // 1 : 아이디가 중복되는 문구
                           $("#id_check").text("사용중인 아이디입니다.");
                           $("#id_check").css("color", "red");
                           $("#reg_submit").attr("disabled", true);
                        } else {
                           console.log("sadsdsdsd");
                           if(data == 0){
                              // 0 : 아이디 길이 / 문자열 검사
                              $("#id_check").text("");
                              $("#reg_submit").attr("disabled", false);
                     
                           } else if(data == ""){
                              
                              $('#id_check').text('아이디를 입력해주세요 :)');
                              $('#id_check').css('color', 'red');
                              $("#reg_submit").attr("disabled", true);            
                              
                           } else {
                              
                              $('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
                              $('#id_check').css('color', 'red');
                              $("#reg_submit").attr("disabled", true);
                           }  
                           
                        } 
                     }, error : function() {
                           console.log("실패");
                     }
                  });
               });
              
            });
=======
 	}
         	 
       
     
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
									} 
								}
							}, error : function() {
									console.log("실패");
							}
						});
					});
		        
				});
>>>>>>> branch 'master' of https://github.com/yeoptae/dduck.git
        
        
     </script>
     

    <div class="row">

        <div class="col-xs-12 col-sm-12">
            <h1 class="text-center" style="margin-right: -50px;">회원가입</h1>
        </div>

        <div class="col-xs-3 col-sm-3"></div>
        <div class="col-xs-8 col-sm-8">

            <div>
                <p>&nbsp;</p>

                <form  name="form1" class="form-horizontal" action="${path }/client/clientEnrollEnd.do" method="post" onsubmit="return validate();">
                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label for="id">아이디</label>
                        </div>
                        <div class="col-sm-4 text-left">
                            <input type="text" name="cId" id="id" class="form-control">
                            <div class="check_font" id="id_check"></div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="pwd">패스워드</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" name="cPw" id="pwd">
                            <div class="check_font" id="id_check"></div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="pwdCheck">패스워드 체크</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" name="pwdCheck" id="pwdCheck">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="name">이름</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="cName" id="name">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="email">이메일</label>
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
                            <input type="submit" value="회원가입" class="btn btn-primary" style="margin-left: -170px;">
                            <input type="reset" value="취소" class="btn btn-primary">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>