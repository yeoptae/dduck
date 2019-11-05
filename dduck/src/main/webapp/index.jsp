<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>
<section>
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
					<img src="${pageContext.request.contextPath }/resources/images/LeftBanner1.png">
					<img src="${pageContext.request.contextPath }/resources/images/LeftBanner2.gif">
					<img src="${pageContext.request.contextPath }/resources/images/LeftBanner3.gif">
			</div>
			<div class="col-sm-8">
			</div>
			<div class="col-sm-2 sidenav">
				<div class="well">
					<p>
						<img src="${pageContext.request.contextPath }/resources/images/RightBanner.png">
					</p>
				</div>
			</div>
		</div>
	</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />