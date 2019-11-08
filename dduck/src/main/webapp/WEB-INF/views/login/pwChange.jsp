<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="clientEnroll" value="정보수정" />
</jsp:include>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
 	
<div class="row">
		<div class="col-sm-3 sidenav">
			<h4 style="padding:10px;">마이 페이지</h4>
						<ul class="nav nav-pills nav-stacked">
				<li><a href="${pageContext.request.contextPath}/client/panier?cId=${loginClient.CId}">장바구니</a></li>
				<li><a href="${pageContext.request.contextPath}/client/paymentList?cId=${loginClient.CId}">결제내역</a></li>
				<li><a href="${pageContext.request.contextPath}/update/update.do?cId=${loginClient.CId}">정보수정</a></li>
				<li><a href="${pageContext.request.contextPath}/pwChange/pwChange.do">비밀번호 변경</a></li>
				<li><a href="${pageContext.request.contextPath}/withdraw/withdraw.do">회원탈퇴</a></li>
			</ul>
		</div>
		
<div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-3 col-md-offset-3 col-sm-3 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">비밀번호 변경하기</div>
                    </div>     

			<div style="padding-top:30px" class="panel-body" >
				<form id="pwChange5" class="form-horizontal" role="form" action="${path }/pwChangeEnd/pwChangeEnd.do" onsubmit="return validate();" method="post">
					<div style="margin-bottom: 25px" class="input-group">
					<div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input  type="password" class="form-control" name="cPw" id="cPw" placeholder="비밀번호">
                    </div>
                    <br>
                        <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        	<input type="hidden" name="cId" value="${loginClient.CId }"> 
                            <input type="password" class="form-control"  name="cPwCheck" id="pwdCheck" placeholder="비밀번호확인">
                        </div>
                        </div>
                        
                    <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->
                                 <div class="col-sm-12 controls">
                                 	<input type="submit" value="변경하기" class="btn btn-primary" >
                           			<input type="reset" value="취소하기" class="btn btn-primary">
                                 </div>                      
                             </div>
                          </form>
                     </div>
                  </div>
			</div>
		</div>
	</div>
	
	<script>
		function validate(){
			//영문 숫자 혼합하여 6~20자이내
			 var cPw = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

	         
	     	//비밀번호 유효성검사       		
       	  if(checkNumber <0 || checkEnglish <0){
                 alert("숫자와 영문자를 혼용하여야 합니다.");
                 $('#password').val('').focus();
                 return false;
             }
			
			if(!pwdCheck( $.trim($('#mpassword').val()))){ 

			 alert('비밀번호를 확인하세요.₩n(영문,숫자를 혼합하여 6~20자 이내)');    

			 $('#mpassword').val('');

			 $('#mpassword').focus(); return false;

			 }

		}
	
	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />