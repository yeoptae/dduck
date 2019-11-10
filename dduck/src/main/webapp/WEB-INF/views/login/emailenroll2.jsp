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
                        <div class="panel-title">인증번호 입력</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                        <form id="loginform" class="form-horizontal" role="form" action="pass_injeung.do${dice},{e_mail}" method="post">
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                	<input type="hidden" name="cEmail" value="${e_mail}">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                        <input type="number"  name="pass_injeung"  class="form-control"  placeholder="인증번호"/>
                                    </div>
                                    <div class="check_font" id="mailCheck"></div>  
                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->
                           
                                    <div class="col-sm-12 controls">
                                    <button  type="submit" name="submit" class="btn btn-primary">인증번호 확인</button>
                                     </div>                                    
                                   </div>
                           </form>
                        </div>  
                    </div>  
              </div>
         </div>	


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>