<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/css/main.css" />
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value=""/>
</jsp:include>

<center>
	<section class="banner full">
	
		<article>
			<img src="${pageContext.request.contextPath }/resources/images/dduck3.jpg" width=400px;height=300px />
			<div class="inner"></div>
		</article>
		<article>
			<img src="${pageContext.request.contextPath }/resources/images/dduckcake2.jpg"  width=400px;height=300px/>
			<div class="inner"></div>
		</article>
		<article>
			<img src="${pageContext.request.contextPath }/resources/images/dduck4.jpg" width=400px;height=300px />
			<div class="inner"></div>
		</article>
		<article>
			<img src="${pageContext.request.contextPath }/resources/images/dduck5.jpg" width=400px;height=300px />
			<div class="inner"></div>
		</article>
		<article>
			<img src="${pageContext.request.contextPath }/resources/images/dduck6.jpg" alt="" />
			<div class="inner"></div>
		</article>
		
		</center>
	</section>
	<!-- Scripts -->
	<script src="${pageContext.request.contextPath }/resources/css/main/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/css/main/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/css/main/js/skel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/css/main/js/util.js"></script>
	<script src="${pageContext.request.contextPath }/resources/css/main/js/main.js"></script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
