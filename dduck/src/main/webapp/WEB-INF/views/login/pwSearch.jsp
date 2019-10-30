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
    <span style="color: green; font-weight: bold;">입력한 이메일로 받은 인증번호를 입력하세요. (인증번호가 맞아야 비밀번호를 변경하실 수 있습니다.)</span> <br> <br>  
        <br> <br>
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">메일을 입력하시면 인증번호가 발송됩니다.</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >
                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                        <form id="pwSearch" class="form-horizontal" role="form" action="${path }/pwSearch/pwSearch2.do${dice},${e_mail}" method="post">
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-username" type="email" class="form-control" name="e_mail" value="" placeholder="User Email">                                     
                                    </div>
                            <!--  <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-username" type="text" class="form-control" name="cEmailNum" value="" placeholder="인증번호">                                     
                                    </div> -->
                                <%--     <c:if test="${msg == '실패'}">
                                    <tr>
											<td colspan=2>
											아이디 또는 패스워드가 틀렸습니다.
											</td>
									</tr>
									</c:if> --%>
                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->
                           
                                    <div class="col-sm-12 controls">
                                    
                                      <button type="submit" name="submit" class="btn btn-primary">인증번호 전송</button>
                                       <!-- <button onclick="btn_auth()" name="submit" class="btn btn-primary">인증하기</button> -->
                                    <!-- <input type="submit" id="login" value="전송" class="btn btn-primary"> -->
                                     </div>                                    
                                   </div>
                        	</form>
                        </div>  
                    </div>  
              </div>
         </div>
         
<!--          <Script>
function btn_auth(){
    $.ajax({
         type:"POST",
         url:"${path}/pwSearch/auth.do",  //전송버튼 누르면 작동하는 컨트롤러 매핑값
         data : {email : $("input[name=e_mail]").val()},  //input name값
         success: function(data){
          sessionStorage.setItem("authkey",data);
         },error : function(data){
            console.log(data);
         }
     });
     alert("인증번호를 발송했습니다.");
 }
   
</Script>
          -->
         
         
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>