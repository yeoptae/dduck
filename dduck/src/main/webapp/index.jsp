<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value=""/>
</jsp:include>
<section>
        <div class="container-fluid text-center">
            <div class="row content">
                <div class="col-sm-2 sidenav">
                    <p>
                        <img src="${pageContext.request.contextPath }/resources/images/LeftBanner1.png">
                        <img src="${pageContext.request.contextPath }/resources/images/LeftBanner2.gif">
                        <img src="${pageContext.request.contextPath }/resources/images/LeftBanner3.gif">
                    </p>
                </div>
                <div class="col-sm-8 text-left">
                    <hr>
                    <h3>Test</h3>1
                    <p>Lorem ipsum...</p>

<%-- 					<form name="form1" method="post" action="${path}/saleboard/saleboardSearch.do">
						<div id="custom-search-input">
							<div class="input-group col-md-12">
								<input type="text" class="search-query form-control" id="searchWord" name="searchWord" value="${map.searchWord }"  placeholder="떡 검색하기" />
								<span class="input-group-btn">
									<button class="btn btn-danger" onclick="searchDduck()" type="submit" id="btnSearch" name="btnSearch">
										<span class=" glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
					</form> --%>


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
    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>