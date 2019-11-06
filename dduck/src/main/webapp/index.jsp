<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value="" />
</jsp:include>

   <!-- Favicon -->   
   <link href="img/favicon.ico" rel="shortcut icon"/>

   

   <!-- Stylesheets -->
   <%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/bootstrap.min.css"/> --%>
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/font-awesome.min.css"/>
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/owl.carousel.css"/>
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/animate.css"/>
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/style.css"/>

   <!--[if lt IE 9]>
     <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
     <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
   <![endif]-->

<div id="preloder">
      <div class="loader"></div>
   </div>

 <section class="hero-section">
      <div class="hero-slider owl-carousel">
         <div class="hero-slide-item set-bg" data-setbg="${pageContext.request.contextPath }/resources/images/dduck1.jpg" >
            <div class="hs-text">
               <h2 class="hs-title-1"><span>엄마의 손길</span></h2>
               <h2 class="hs-title-2"><span>최고의 손맛</span></h2>
               <h2 class="hs-title-3"><span>국내산만 사용</span></h2>
            </div>
         </div>
         <div class="hero-slide-item set-bg" data-setbg="${pageContext.request.contextPath }/resources/images/dduck3.jpg">
            <div class="hs-text">
               <h2 class="hs-title-1"><span>sns에서 핫한 그집</span></h2>
               <h2 class="hs-title-2"><span>품절임박</span></h2>
               <h2 class="hs-title-3"><span>쫀득쫀득</span></h2>
            </div>
         </div>
         
         <div class="hero-slide-item set-bg" data-setbg="${pageContext.request.contextPath }/resources/images/dduck5.jpg">
            <div class="hs-text">
               <h2 class="hs-title-1"><span>sns에서 핫한 그집</span></h2>
               <h2 class="hs-title-2"><span>품절임박</span></h2>
               <h2 class="hs-title-3"><span>쫀득쫀득</span></h2>
            </div>
         </div>
      </div>
   </section>
   
   <script src="${pageContext.request.contextPath }/resources/js/index/jquery-3.2.1.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/index/owl.carousel.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/index/main.js"></script>
    
   </body>





<jsp:include page="/WEB-INF/views/common/footer.jsp" />