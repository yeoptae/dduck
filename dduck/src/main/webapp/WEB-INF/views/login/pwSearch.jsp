<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
                        <div class="panel-title">메일을 입력하시면 인증번호가 발송됩니다.</div>
                    </div>     

                    <div class="panel-body" >
                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                        <form id="pwSearch" class="form-horizontal" role="form" action="${path}/find_pass.do" method="post">
                            <div style="margin-bottom: 25px" class="input-group">
                                    </div>
                            <div style="margin-bottom: 25px" class="input-group">
                                      <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                        <input type="email" id="email" name="e_mail"  class="form-control" placeholder="User Email">                                  
                                   </div>
                                   <div class="check_font" id="mailCheck"></div>  
                                <div style="margin-top:10px" class="form-group">
                           
                                    <div class="col-sm-12 controls">
                                    
                                      <button type="submit" name="submit" class="btn btn-primary">인증번호 전송</button>
                                     </div>                                    
                                   </div>
                        	</form>
                        </div>  
                    </div>  
              </div>
         </div>
         
         
         
         
         
         
   


<script>
 $(function(){
		$("#email").blur(function() {
			var clientEmail = $('#email').val();
			
			$.ajax({                                                    //e_mail=파라미터값     
				url : "${pageContext.request.contextPath}/user/mailCheck?e_mail="+ clientEmail,															//cId=파라미터값으로 input에 name값이다.
				type : 'post',
				datatype : 'html',
				
				success : function(data) {
								console.log("1 = 중복o / 0 = 중복x : "+ data);	
								if (data == 1) {
									// 1 : 	이메일이 중복되는 문구
									$("#mailCheck").text("존재하는 이메일 입니다.");
									$("#mailCheck").css("color", "red");
									$("#injeng").hide();
								} else if(data == 0){
										// 0 : 아이디 길이 / 문자열 검사
									 	$("#mailCheck").text("존재하지않는 이메일 입니다. 다시 입력해주세요.");
										$("#injeng").show();
									} 
									
							}, error : function() {
									console.log("실패");
							}
						});
					});
		        
				});
        
        
</script>      
         
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>