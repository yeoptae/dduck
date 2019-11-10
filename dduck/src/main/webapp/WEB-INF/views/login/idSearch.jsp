<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>\
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>

    <div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">아이디찾기</div>
                    </div>  
                        
                    	<div style="padding-top:30px" class="panel-body" >
                    	 <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
					<form id="idSearch" class="form-horizontal" role="form" action="${path }/searchIdEnd/searchIdEnd.do" method="post">
					          
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-username" type="text" class="form-control" name="cName"  placeholder="이름">                                        
                                    </div>
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                                        <input id="login-password" type="password" class="form-control" name="cPhone" placeholder="전화번호">
                                    </div>
                                <div style="margin-top:10px" class="form-group">
                        
                                    <!-- Button -->
                                 <div class="col-sm-12 controls">
                                 	<input type="submit" id="submit" value="아이디찾기" class="btn btn-primary" >
                           			<input type="button" class="btn btn-primary" value="취소하기" onClick="location.reload()"/>  
                                 </div>                      
                             </div>
                          </form>
                     </div>
                  </div>
			</div>
		</div>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>