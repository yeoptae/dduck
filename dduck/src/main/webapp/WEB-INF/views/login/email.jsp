<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value=""/>
</jsp:include>
<<<<<<< HEAD
<body>
 
 
<table border="1" width="300" height="300" align= "center">
<center>
<span style="color: green; font-weight: bold;">이메일 인증 (이메일을 인증 받아야 다음 단계로 넘어갈 수 있습니다.)</span> <br> <br>    
        <br> <br>
        
        
 
        
        <div style="text-align:center;">
            <tr>        
                <td>
                <center>
                                   <!--원래 auto.do만 존재  -->
                    <form action="${path}/member/auth.do" method="post">
                    
                    <center>
                        <br>
                        <div>
                            이메일 : <input type="email" name="e_mail" placeholder="  이메일주소를 입력하세요. ">
                        </div>                                                    
 
                        <br> <br>
                        <button type="submit" name="submit">이메일 인증받기 (이메일 보내기)</button>
 
                        </div>
                    </td>
                </tr>
                    </center>
            </table>
        </form>
</center>
 
</body>
=======

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
                                    <!-- Button -->
                           
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
>>>>>>> branch 'master' of https://github.com/yeoptae/dduck.git



//원래 되는부분
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
									$("#mailCheck").text("사용중인 이메일 입니다. 이메일을 다시입력해 주세요.");
									$("#mailCheck").css("color", "red");
									$("#injeng").hide();
								} else if(data == 0){
										// 0 : 아이디 길이 / 문자열 검사
									 	$("#mailCheck").text("사용가능한 이메일 입니다.");
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