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
.indexoverSize{
	padding-left : -280px !important;
	padding-right : -280px !important;
}
.bodysize{
	width : 1366px;
    margin: 0 auto;
    margin-left: auto;
    margin-right: auto;
}
@media (min-width : 1366px){
	
}
@media (max-width : 1365px){
	.sidebenner{
		display : none;	
	}
}
</style>
<section class="bodysize">
	<div class="container-fluid text-center">
		<div class="row content">
<%-- 			<div class="indexoverSize">
				<div class="pull-left sidebenner" style="width : 270px">
						<img src="${pageContext.request.contextPath }/resources/images/LeftBanner1.png">
						<img src="${pageContext.request.contextPath }/resources/images/LeftBanner2.gif">
						<img src="${pageContext.request.contextPath }/resources/images/LeftBanner3.gif">
				</div>
				<div class="pull-right sidebenner" >
					<div class="well sidenav" style="width : 100%; padding : 10px;">
							<img src="${pageContext.request.contextPath }/resources/images/RightBanner.png">
					</div>
				</div>
			</div> --%>

<!-- ------------------------------메인게시판------------------------------ -->

		</div>
	</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>