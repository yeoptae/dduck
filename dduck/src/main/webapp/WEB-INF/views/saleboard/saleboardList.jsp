<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>
<section id="content">

	<section>

		<div class="container">
			<div class="row">
				<c:if test="${empty list}">
					<tr>
						<th colspan="5">데이터가 없습니다</th>
					</tr>
				</c:if>

				<c:forEach items="${list }" var="b" varStatus="v">
					<div class="col-sm-4">
						<div class="panel panel-primary">
							<div class="panel-heading"></div>
							<%--  <c:if test="${param.cPage!=1 }">
								<c:out value="${v.count+5 }" />
							</c:if> --%> 
							<div class="panel-body">
							
								<c:forEach items="${fileList }" var="f" varStatus="vs">
									<c:if test='${f["PCODE"]==b["PCODE"]}'>
										<c:if test='${f["ATTACHFLAG"]=="1" }'>
											
											<input type="hidden" value="${f['PCODE'] }">
											
											<a href="${pageContext.request.contextPath}/detail/detailView?pCode=${f['PCODE'] }">
											<img
												src='<%=request.getContextPath()%>/resources/upload/board/${f["ATTACHREFILENAME"]}'
												class="img-responsive" style="width: 320px; height: 230px;"
												alt="Image" />
											</a>
										</c:if>
									</c:if>
								</c:forEach>

							</div>

							<div class="panel-footer">
								<ul class="list-inline">
									<li class="list-inline-item"><c:out
											value='${b["SALENAME"] }' /></li>
									<li class="list-inline-item"><c:out
											value='${b["SALEPRICE"] }' /> 원</li>
								</ul>
							</div>
						</div>
					</div>
					
				</c:forEach>

				<c:forEach items="${list }" var="b" varStatus="v">
					<c:if test='${b["GCODE"]=="2" }'>
						<div class="col-sm-4">
							<div class="panel panel-primary">
								<div class="panel-heading"></div>
								<%-- <c:if test="${param.cPage!=1 }">
									<c:out value="${v.count+5 }" />
								</c:if> --%>
								<div class="panel-body">
									<%-- <img src='${b["BOARDFILE"] }' class="img-responsive" style="width : 100%" alt="image"/> --%>


									<c:forEach items="${fileList }" var="f" varStatus="vs">
										<c:if test='${f["PCODE"]==b["PCODE"]}'>
											<c:if test='${f["ATTACHFLAG"]=="1" }'>
												<img
													src='<%=request.getContextPath()%>/resources/upload/board/${f["ATTACHREFILENAME"]}'
													class="img-responsive" style="width: 320px; height: 230px;"
													alt="Image" />
											</c:if>
										</c:if>
									</c:forEach>

								</div>

								<div class="panel-footer">
									<ul class="list-inline">
										<li class="list-inline-item"><c:out
												value='${b["SALENAME"] }' /></li>
										<li class="list-inline-item"><c:out
												value='${b["SALEPRICE"] }' /> 원</li>
									</ul>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>

				<c:forEach items="${list }" var="b" varStatus="v">
					<c:if test='${b["GCODE"]=="3" }'>
						<div class="col-sm-4">
							<div class="panel panel-primary">
								<div class="panel-heading"></div>
								<%-- <c:if test="${param.cPage!=1 }">
									<c:out value="${v.count+5 }" />
								</c:if> --%>
								<div class="panel-body">
									<%-- <img src='${b["BOARDFILE"] }' class="img-responsive" style="width : 100%" alt="image"/> --%>


									<c:forEach items="${fileList }" var="f" varStatus="vs">
										<c:if test='${f["PCODE"]==b["PCODE"]}'>
											<c:if test='${f["ATTACHFLAG"]=="1" }'>
												<img
													src='<%=request.getContextPath()%>/resources/upload/board/${f["ATTACHREFILENAME"]}'
													class="img-responsive" style="width: 320px; height: 230px;"
													alt="Image" />
											</c:if>
										</c:if>
									</c:forEach>

								</div>

								<div class="panel-footer">
									<ul class="list-inline">
										<li class="list-inline-item"><c:out
												value='${b["SALENAME"] }' /></li>
										<li class="list-inline-item"><c:out
												value='${b["SALEPRICE"] }' /> 원</li>
									</ul>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>

				<c:forEach items="${list }" var="b" varStatus="v">
					<c:if test='${b["GCODE"]=="4" }'>
						<div class="col-sm-4">
							<div class="panel panel-primary">
								<div class="panel-heading"></div>
								<%-- <c:if test="${param.cPage!=1 }">
									<c:out value="${v.count+5 }" />
								</c:if> --%>
								<div class="panel-body">
									<%-- <img src='${b["BOARDFILE"] }' class="img-responsive" style="width : 100%" alt="image"/> --%>


									<c:forEach items="${fileList }" var="f" varStatus="vs">
										<c:if test='${f["PCODE"]==b["PCODE"]}'>
											<c:if test='${f["ATTACHFLAG"]=="1" }'>
												<img
													src='<%=request.getContextPath()%>/resources/upload/board/${f["ATTACHREFILENAME"]}'
													class="img-responsive" style="width: 320px; height: 230px;"
													alt="Image" />
											</c:if>
										</c:if>
									</c:forEach>

								</div>

								<div class="panel-footer">
									<ul class="list-inline">
										<li class="list-inline-item"><c:out
												value='${b["SALENAME"] }' /></li>
										<li class="list-inline-item"><c:out
												value='${b["SALEPRICE"] }' /> 원</li>
									</ul>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>

				<c:forEach items="${list }" var="b" varStatus="v">
					<c:if test='${b["GCODE"]=="5" }'>
						<div class="col-sm-4">
							<div class="panel panel-primary">
								<div class="panel-heading"></div>
								<%-- <c:if test="${param.cPage!=1 }">
									<c:out value="${v.count+5 }" />
								</c:if> --%>
								<div class="panel-body">
									<%-- <img src='${b["BOARDFILE"] }' class="img-responsive" style="width : 100%" alt="image"/> --%>


									<c:forEach items="${fileList }" var="f" varStatus="vs">
										<c:if test='${f["PCODE"]==b["PCODE"]}'>
											<c:if test='${f["ATTACHFLAG"]=="1" }'>
												<img
													src='<%=request.getContextPath()%>/resources/upload/board/${f["ATTACHREFILENAME"]}'
													class="img-responsive" style="width: 320px; height: 230px;"
													alt="Image" />
											</c:if>
										</c:if>
									</c:forEach>

								</div>

								<div class="panel-footer">
									<ul class="list-inline">
										<li class="list-inline-item"><c:out
												value='${b["SALENAME"] }' /></li>
										<li class="list-inline-item"><c:out
												value='${b["SALEPRICE"] }' /> 원</li>
									</ul>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<br>
		<center>${pageBar }</center>
	</section>


</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
