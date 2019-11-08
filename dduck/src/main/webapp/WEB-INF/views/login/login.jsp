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
                        <div class="panel-title">로그인</div>
                        <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="${pageContext.request.contextPath}/pwSearch/pwSearch.do">비밀번호찾기</a></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                        <form id="loginform" class="form-horizontal" method="post" role="form" action="${path }/client/clientLogin.do">
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-username" type="text" class="form-control" name="cId" value="" placeholder="아이디">                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login-password" type="password" class="form-control" name="cPw" placeholder="비밀번호">
                                    </div>
                                    <c:if test="${msg == '실패'}">
                                    <tr>
                                 <td colspan=2>
                                ` 아이디 또는 패스워드가 틀렸습니다.
                                 </td>
                           </tr>
                           </c:if>
                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->
                           
                                    <div class="col-sm-12 controls">
                                    <input type="submit" id="login" value="로그인" class="btn btn-primary">
                                    <button type="button" onclick="button1_click();" class="btn btn-primary">회원가입</button>
                                     </div>                                    
                                   </div>
                           </form>
                        </div>  
                    </div>  
              </div>
         </div>
         
 <script type="text/javascript">
 $(document).ready(function(e){
   $('#login').click(function(){
      
         // 입력 값 체크
         if($.trim($('#login-username').val()) == ''){
            alert("아이디를 입력해 주세요.");
            $('#login-username').focus();
            return  false;
         }else if($.trim($('#login-password').val()) == ''){
            alert("패스워드를 입력해 주세요.");
            $('#login-password').focus();
            return false;
         }
         
       //전송
         $('#loginform').submit(); 
      });
 });
 
 function button1_click() {
	 location.href = "${pageContext.request.contextPath}/member/email.do";
	}
 
 
      
</script>
         
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>