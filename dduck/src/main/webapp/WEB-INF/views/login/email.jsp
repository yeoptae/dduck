<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value=""/>
</jsp:include>

 <div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">이메일 인증받기</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                        <form id="loginform" class="form-horizontal" role="form" action="${path}/member/auth.do" method="post">
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                        <input type="email" name="e_mail"  id="email" class="form-control"  placeholder="Email">
                                    </div>
                                    <div class="check_font" id="mailCheck"></div>  
                                <div style="margin-top:10px" class="form-group">
                           
                                    <div class="col-sm-12 controls">
                                    <button id="injeng" type="submit" name="submit" class="btn btn-primary">이메일 인증받기</button>
                                     </div>                                    
                                   </div>
                           </form>
                        </div>  
                    </div>  
              </div>
         </div>	

<script>







$(function(){
	$("#email").keyup(function() {
		var clientEmail = $('#email').val();
		if(clientEmail.length>11){
				$.ajax({
				url : "${pageContext.request.contextPath}/user/mailCheck?e_mail="+ clientEmail,
				//cId=파라미터값으로 input에 name값이다.
				type : 'get',
				datatype : 'html',
				success : function(data) {
								if (data == 1) {
									// 1 : 이메일 중복문구
									$("#mailCheck").text("중복된 이메일입니다.");
									$("#mailCheck").css({"color":"red","display":"block"});
									$("#injeng").hide();
								} else {
									if(data == 0){
										// 0 : 아이디 길이 / 문자열 검사
										$("#mailCheck").text("사용가능한 이메일입니다.");
										$("#mailCheck").css({"color":"green","display":"block"});
										$("#injeng").show();
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>