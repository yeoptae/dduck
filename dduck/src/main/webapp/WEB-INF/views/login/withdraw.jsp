<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value=""/>
</jsp:include>


<link href="//netdna.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="row">
		<div class="col-sm-3 sidenav">
			<h4 style="padding:10px;">마이 페이지</h4>
						<ul class="nav nav-pills nav-stacked">
				<li><a href="${pageContext.request.contextPath}/client/panier?cId=${loginClient.CId}">장바구니</a></li>
				<li><a href="${pageContext.request.contextPath}/client/paymentList?cId=${loginClient.CId}">결제내역</a></li>
				<li><a href="${pageContext.request.contextPath}/update/update.do?cId=${loginClient.CId}">정보수정</a></li>
				<li><a href="${pageContext.request.contextPath}/pwChange/pwChange.do">비밀번호 변경</a></li>
				<li><a href="${pageContext.request.contextPath}/withdraw/withdraw.do">회원탈퇴</a></li>
			</ul>
		</div>

    <div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-3 col-md-offset-3 col-sm-3 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">회원 탈퇴하기</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >
                        <form id="withraw" class="form-horizontal" role="form" action="${path }/withdraw1/withdraw1.do">
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input type="hidden" name="cId" value="${loginClient.CId}"/>
                                        <input id="login-password" type="password" class="form-control" name="cPw" placeholder="Password">
                                    </div>
                                    
                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->
                           
                                    <div class="col-sm-12 controls">
                                    <input type="submit" id="withraw" value="회원탈퇴" class="btn btn-primary">
                                    <input type="reset" value="취소하기" class="btn btn-primary">
                                     </div>                                    
                                   </div>
                           </form>
                        </div>  
                    </div>  
              </div>
         </div>
       </div>
         
 <script type="text/javascript">
 $(document).ready(function(e){
   $('#withraw').click(function(){
      
         // 입력 값 체크
         if($.trim($('#login-password').val()) == ''){
            alert("패스워드를 입력해 주세요.");
            $('#login-password').focus();
            return  false;
         }else {
         
         }
         
       //전송
         $('#withraw').submit(); 
      });
 });
      
</script>
         
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>