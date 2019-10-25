<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>\
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>


<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

    <div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Sign In</div>
                        <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#">비밀번호초기화</a></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form id="loginform" class="form-horizontal" role="form" action="${path }/client/clientLogin.do">
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-username" type="text" class="form-control" name="cId" value="" placeholder="User Id">                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login-password" type="password" class="form-control" name="cPw" placeholder="Password">
                                    </div>
                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->
									
                                    <div class="col-sm-12 controls">
                                    <input type="submit" id="login" value="로그인" class="btn btn-primary">
                                    <input type="button" value="회원가입" class="btn btn-primary">
                                     </div>                                    
                                	</div>
								</form>
                        </div>                     
                    </div>  
        		</div>
   		</div>
   		
 <!-- <script type="text/javascript">
	$('#login').click(function(e){
		
			// 입력 값 체크
			if($.trim($('#cID').val()) == ''){
				alert("아이디를 입력해 주세요.");
				$('#cID').focus();
				return;
			}else if($.trim($('#cPW').val()) == ''){
				alert("패스워드를 입력해 주세요.");
				$('#cPW').focus();
				return;
			}
			
/* 			//전송
			$('#loginFrm').submit(); */
		}); -->
		
</script>
   		
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>