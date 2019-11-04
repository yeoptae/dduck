<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>
<style>
 #money {
 
 
 }
</style>
<section id="content">

	<section>

		<div class="container">
			<div class="row">
				<c:if test="${empty list}">
					<tr>
						<th colspan="5">데이터가 없습니다</th>
					</tr>
				</c:if>
				
				<form name="form1" method="post" action="${path}/saleboard/saleboardSearch.do">
					<div id="custom-search-input">
						<div class="input-group col-md-12">
							<input type="text" class="search-query form-control" id="searchWord" name="searchWord" value="${searchWord }"  placeholder="떡 검색하기" />
							<span class="input-group-btn">
								<button class="btn btn-danger" onclick="searchDduck()" type="submit" id="btnSearch" name="btnSearch">
									<span class=" glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</div>
				</form>
				
				<c:forEach items="${list }" var="b" varStatus="v">
					<div class="col-lg-4 col-md-6 col-sm-8 col-sx-9 col-10 m-auto">
						<div class="blog-post">
							<div class="post-thumb">
								<%--  <c:if test="${param.cPage!=1 }">
								<c:out value="${v.count+5 }" />
							</c:if> --%>


								<c:forEach items="${fileList }" var="f" varStatus="vs">
									<c:if test='${f["PCODE"]==b["PCODE"]}'>
										<c:if test='${f["ATTACHFLAG"]=="1" }'>
											
											<input type="hidden" value="${f['PCODE'] }">
											
											<a href="${pageContext.request.contextPath}/detail/detailView?pCode=${f['PCODE'] }">
											<img
												src='<%=request.getContextPath()%>/resources/upload/board/${f["ATTACHREFILENAME"]}'
												class="img-responsive" style="width: 320px; height: 230px;"
												alt="Image" />

											<div class="panel-body">

											</a>
										</c:if>
									</c:if>
								</c:forEach>

							</div>

							<div class="post-title">
								<ul class="mt-1 mb-0">
									<center>
										<li class="list-inline-item"><c:out
												value='${b["SALENAME"] }' /></li>
									</center>
									<center>
										<li class="list-inline-item" name="money"
											style="color: #333; font-family:"Dotum",돋움; font-size:20px;">
											<fmt:formatNumber value='${b["SALEPRICE"] }' /> 원
										</li>
								</ul>
							</div>
						</div>
					</div>
			</div>

			</c:forEach>


		</div>
		</div>
		<br>
		<center>${pageBar }</center>
	</section>



</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
