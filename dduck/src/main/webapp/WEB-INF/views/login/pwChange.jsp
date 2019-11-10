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
<link href="//netdna.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
 	
<div class="row">
		<div class="col-sm-3 sidenav">
			<h4 style="margin-right:10px; font-family: 'Black Han Sans', sans-serif;">비밀번호변경</h4>
						<ul class="nav nav-pills nav-stacked">
				<li><a href="${pageContext.request.contextPath}/client/panier?cId=${loginClient.CId}" style="font-family: 'Black Han Sans', sans-serif;">장바구니</a></li>
				<li><a href="${pageContext.request.contextPath}/client/paymentList?cId=${loginClient.CId}" style="font-family: 'Black Han Sans', sans-serif;">결제내역</a></li>
				<li><a href="${pageContext.request.contextPath}/update/update.do?cId=${loginClient.CId}" style="font-family: 'Black Han Sans', sans-serif;">정보수정</a></li>
				<li><a href="${pageContext.request.contextPath}/pwChange/pwChange.do" style="font-family: 'Black Han Sans', sans-serif;">비밀번호 변경</a></li>
				<li><a href="${pageContext.request.contextPath}/withdraw/withdraw.do" style="font-family: 'Black Han Sans', sans-serif;"> 회원탈퇴</a></li>
			</ul>
		</div>
		
<div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-3 col-md-offset-3 col-sm-3 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">비밀번호 변경하기</div>
                    </div>     
                    
                    	<div style="padding-top:30px" class="panel-body" >
				<form id="pwChange5" class="form-horizontal" role="form" action="${path }/pwChangeEnd/pwChangeEnd.do" onsubmit="return signUp_validate();" method="post">
					<div style="margin-bottom: 25px" class="input-group">
					<div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input type="hidden" name="cId" value="${loginClient.CId}">
                            <input type="password" class="form-control" name="cPw" id="pwd" placeholder="비밀번호" required/>
                    </div>
                    <br>
                        <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input type="password" class="form-control" name="pwdCheck" id="pwdCheck" placeholder="비밀번호 확인" required/>
                        </div>
                        </div>
                            <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
                            <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
                            
                            
                        
                    <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->
                                 <div class="col-sm-12 controls">
                                 	<input type="submit" id="submit" value="변경하기" class="btn btn-primary" >
                           			<input type="button" class="btn btn-primary" value="취소하기" onClick="location.reload()"/>  
                                 </div>                      
                             </div>
                          </form>
                     </div>
                  </div>
			</div>
		</div>
	</div>

<script>
 //비밀번호 일치하는지 확인  비밀번호가 틀리면  변경하기 버튼 비활성화
       $(function(){ 
        	$("#alert-success").hide(); 
        	$("#alert-danger").hide(); 
        	$("[name=pwdCheck]").keyup(function(){ 
        		var pwd=$("#pwd").val(); 
        		var pwdCheck=$("#pwdCheck").val(); 
        		if(pwd != "" || pwdCheck != ""){ 
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

 
 
 
 
 
       function signUp_validate(){
    		
    		
    		var pwCheck = /^[a-z]+[a-z0-9]{5,19}$/g;
    		if(!pwCheck.test($('#pwd').val())) {
    			alert('비밀번호는 소문자+숫자로 가능합니다.');
    			return false;
    		} 


    		
    		return true;
    		}



</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />