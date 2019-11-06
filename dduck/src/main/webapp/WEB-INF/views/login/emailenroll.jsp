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
<span style="color: green; font-weight: bold;">입력한 이메일로 받은 인증번호를 입력하세요. (인증번호가 맞아야 다음 단계로 넘어가실 수 있습니다.)</span> <br> <br>    
        <br> <br>
        
        
        <div style="text-align:center;">
            <tr>        
                <td>
                <center>
                    <form action="join_injeung.do${dice}" method="post"> //받아온 인증코드를 컨트롤러로 넘겨서 일치하는지 확인         
                    <center>
                    <input type="hidden" name="tomail" value="${tomail }"/>
                        <br>
                        <div>
                            인증번호 입력 : <input type="number" name="email_injeung"
                                placeholder="  인증번호를 입력하세요. ">
                        </div>                                        
 
                        <br> <br>
                        <button type="submit" name="submit">인증번호 전송</button>
 
                        </div>
                    </td>
                </tr>
                    </center>
            </table>
        </form>
</center>
=======
 <div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">인증번호 입력</div>
                    </div>     
>>>>>>> branch 'master' of https://github.com/yeoptae/dduck.git

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                        <form id="loginform" class="form-horizontal" role="form" action="join_injeung.do${dice}" method="post">
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                               <input type="hidden" name="tomail" value="${tomail }"/>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                        <input type="number"  id="ijNum" name="email_injeung"  class="form-control"  placeholder="인증번호"/>
                                    </div>
                                    <div class="check_font" id="mailCheck"></div>  
                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->
                           
                                    <div class="col-sm-12 controls">
                                    <button id="num" type="submit" name="submit" class="btn btn-primary">인증번호 확인</button>
                                     </div>                                    
                                   </div>
                           </form>
                        </div>  
                    </div>  
              </div>
         </div>	


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>