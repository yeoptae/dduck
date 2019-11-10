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
 	
<div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">비밀번호 변경하기</div>
                    </div>     
			<div style="padding-top:30px" class="panel-body" >
				<form id="pwChange5" class="form-horizontal" role="form" action="pass_change.do" method="post" onsubmit="return validate();" method="post">
					<div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
 		<input type="hidden" value="${e_mail}" name="cEmail">
                            <input  type="password" class="form-control" name="cPw"  placeholder="변경할 비밀번호">
                    </div>
                    <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->
                                 <div class="col-sm-12 controls">
                                 	<button type="submit" name="submit" class="btn btn-primary" >변경하기</button>
                           			<input type="button" class="btn btn-primary" value="취소하기" onClick="history.go(-1)"> 
                                 </div>                      
                             </div>
                          </form>
                  </div>
			</div>
		</div>
		</div>
	



<jsp:include page="/WEB-INF/views/common/footer.jsp" />