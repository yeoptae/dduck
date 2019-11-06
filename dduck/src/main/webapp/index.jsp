<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value="" />
</jsp:include>
<style>
.bodysize{
   width : 100%;
}
@media (min-width : 1366px){
   
}
@media (max-width : 1365px){
   .sidebenner{
      display : none;   
   }
/*    .navbar{
      display : none;   
   } */
}
</style>
<section class="bodysize">
   <div class="container-fluid text-center">
      <div class="row content">
         <div class="pull-left sidebenner" style="width : 280px">
               <img src="${pageContext.request.contextPath }/resources/images/LeftBanner1.png">
               <img src="${pageContext.request.contextPath }/resources/images/LeftBanner2.gif">
               <img src="${pageContext.request.contextPath }/resources/images/LeftBanner3.gif">
         </div>
         <div class="col-sm-8" style="width : 65%;">
         </div>
         <div class="pull-right sidebenner" >
            <div class="well sidenav" style="width : 100%">
                  <img src="${pageContext.request.contextPath }/resources/images/RightBanner.png">
            </div>
         </div>
      </div>
   </div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />