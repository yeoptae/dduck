<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR|Sunflower:300&display=swap" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>

<!-- Favicon -->
<link href="img/favicon.ico" rel="shortcut icon" />

<!-- font awesome cdn -->
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<script
	src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=4b65ed0f-8a23-4128-abf7-7df859e62126"></script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>

<!-- Stylesheets -->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/bootstrap.min.css"/> --%>
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/index/font-awesome.min.css" /> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/index/owl.carousel.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/index/animate.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/index/style.css" />
<link
	href="${pageContext.request.contextPath }/resources/css/font/css/fontawesome.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/css/font/css/brands.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/css/font/css/solid.css"
	rel="stylesheet">
<!--[if lt IE 9]>
     <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
     <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
   <![endif]-->

<div id="preloder">
	<div class="loader"></div>
</div>

<section class="hero-section">
	<div class="hero-slider owl-carousel">
		<div class="hero-slide-item set-bg"
			data-setbg="${pageContext.request.contextPath }/resources/images/main1.jpg">
			<div class="hs-text">
				<h2 class="hs-title-1">
					<span>엄마의 손길</span>
				</h2>
				<h2 class="hs-title-2">
					<span>최고의 손맛</span>
				</h2>
				<h2 class="hs-title-3">
					<span>당일제조</span>
				</h2>
			</div>
		</div>
		<div class="hero-slide-item set-bg"
			data-setbg="${pageContext.request.contextPath }/resources/images/main2.jpg">
			<div class="hs-text">
				<h2 class="hs-title-1">
					<span>sns에서 핫한 그집</span>
				</h2>
				<h2 class="hs-title-2">
					<span>품절임박</span>
				</h2>
				<h2 class="hs-title-3">
					<span>쫀득쫀득</span>
				</h2>
			</div>
		</div>

		<div class="hero-slide-item set-bg"
			data-setbg="${pageContext.request.contextPath }/resources/images/main3.jpg">
			<div class="hs-text">
				<h2 class="hs-title-1">
					<span>유병승 강사도 극찬한 그집</span>
				</h2>
				<h2 class="hs-title-2">
					<span>달달한 꿀떡</span>
				</h2>
				<h2 class="hs-title-3">
					<span>곰돌이 푸우의 맛집</span>
				</h2>
			</div>
		</div>
	</div>
</section>
<br>
<br>
<p align="center" style="margin-top: 80px; margin-bottom: 15px;">
	<span
		style="font-family: Noto sans KR, sans-serif; font-size: 35px; color: #424242; letter-spacing: -0.07em;">콩떡콩떡</span>
	<span
		style="font-family: 'Black Han Sans', sans-serif; font-size: 41px; color: #424242; letter-spacing: -0.02em;">New</span>
</p>


<section id="content">

	<section>

		<div class="container">
			<div class="row">
				<c:if test="${empty list}">
					<tr>
						<th colspan="5">데이터가 없습니다</th>
					</tr>
				</c:if>
                 
				<center> <table><p style="margin-top: 80px; margin-bottom: 15px">
					<span
						style="font-family: 'Black Han Sans', sans-serif; font-size: 35px; color: #424242; letter-spacing: -0.07em; ">답례떡
					</span>
				</p></table></center>
				<br>
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

											<a
												href="${pageContext.request.contextPath}/detail/detailView?pCode=${f['PCODE'] }">
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
										<li class="list-inline-item" style="font-family: 'Do Hyeon', sans-serif;" ><c:out
												value='${b["SALENAME"] }' /></li>
										<%-- 									</center> --%>
										<center>
											<li class="list-inline-item" name="money"
												style="font-family: 'Noto Sans KR', sans-serif;" font-size: 20px;">
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


		<div class="container">
			<div class="row">
				<c:if test="${empty list}">
					<tr>
						<th colspan="5">데이터가 없습니다</th>
					</tr>
				</c:if>
				<p align="center" style="margin-top: 80px; margin-bottom: 15px">
					<span
						style="font-family: 'Black Han Sans', sans-serif; font-size: 35px; color: #424242; letter-spacing: -0.07em;">간식</span>
				</p>
               <br>
				<c:forEach items="${list2 }" var="b" varStatus="v">

					<div class="col-lg-4 col-md-6 col-sm-8 col-sx-9 col-10 m-auto">
						<div class="blog-post">
							<div class="post-thumb">

								<c:forEach items="${fileList }" var="f" varStatus="vs">
									<c:if test='${f["PCODE"]==b["PCODE"]}'>
										<c:if test='${f["ATTACHFLAG"]=="1" }'>

											<input type="hidden" value="${f['PCODE'] }">

											<a
												href="${pageContext.request.contextPath}/detail/detailView?pCode=${f['PCODE'] }">
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
										<li class="list-inline-item" style="font-family: 'Do Hyeon', sans-serif;"><c:out
												value='${b["SALENAME"] }' /></li>
									</center>
									<center>
										<li class="list-inline-item" name="money"
											style="font-family: 'Noto Sans KR', sans-serif;" font-size: 20px;">
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


		<div class="container">
			<div class="row">
				<c:if test="${empty list}">
					<tr>
						<th colspan="5">데이터가 없습니다</th>
					</tr>
				</c:if>
				<p align="center" style="margin-top: 80px; margin-bottom: 15px">
					<span
						style="font-family: 'Black Han Sans', sans-serif; font-size: 35px; color: #424242; letter-spacing: -0.07em;">돌떡</span>
				</p>
				<br>
				<c:forEach items="${list3 }" var="b" varStatus="v">
					<div class="col-lg-4 col-md-6 col-sm-8 col-sx-9 col-10 m-auto">
						<div class="blog-post">
							<div class="post-thumb">



								<c:forEach items="${fileList }" var="f" varStatus="vs">
									<c:if test='${f["PCODE"]==b["PCODE"]}'>
										<c:if test='${f["ATTACHFLAG"]=="1" }'>

											<input type="hidden" value="${f['PCODE'] }">

											<a
												href="${pageContext.request.contextPath}/detail/detailView?pCode=${f['PCODE'] }">
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
										<li class="list-inline-item" style="font-family: 'Do Hyeon', sans-serif;"><c:out
												value='${b["SALENAME"] }' /></li>
									</center>
									<center>
										<li class="list-inline-item" name="money"
											style="font-family: 'Noto Sans KR', sans-serif;" font-size: 20px;">
											<fmt:formatNumber value='${b["SALEPRICE"] }' /> 원
										</li>
								</ul>
							</div>
						</div>
					</div>
			</div>

			</c:forEach>
		</div>

		<div class="container">
			<div class="row">
				<c:if test="${empty list}">
					<tr>
						<th colspan="5">데이터가 없습니다</th>
					</tr>
				</c:if>
				<p align="center" style="margin-top: 80px; margin-bottom: 15px">
					<span
						style="font-family: 'Black Han Sans', sans-serif; font-size: 35px; color: #424242; letter-spacing: -0.07em;">케이크</span>
				</p>
				<br>
				<c:forEach items="${list4 }" var="b" varStatus="v">
					<div class="col-lg-4 col-md-6 col-sm-8 col-sx-9 col-10 m-auto">
						<div class="blog-post">
							<div class="post-thumb">



								<c:forEach items="${fileList }" var="f" varStatus="vs">
									<c:if test='${f["PCODE"]==b["PCODE"]}'>
										<c:if test='${f["ATTACHFLAG"]=="1" }'>

											<input type="hidden" value="${f['PCODE'] }">

											<a
												href="${pageContext.request.contextPath}/detail/detailView?pCode=${f['PCODE'] }">
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
										<li class="list-inline-item" style="font-family: 'Do Hyeon', sans-serif;"><c:out
												value='${b["SALENAME"] }' /></li>
									</center>
									<center>
										<li class="list-inline-item" name="money"
											style="font-family: 'Noto Sans KR', sans-serif;" font-size: 20px;">
											<fmt:formatNumber value='${b["SALEPRICE"] }' /> 원
										</li>
								</ul>
							</div>
						</div>
					</div>
			</div>

			</c:forEach>
		</div>

		<div class="container">
			<div class="row">
				<c:if test="${empty list}">
					<tr>
						<th colspan="5">데이터가 없습니다</th>
					</tr>
				</c:if>
				<p align="center" style="margin-top: 80px; margin-bottom: 15px">
				 	<span
						style="font-family: 'Black Han Sans', sans-serif; font-size: 35px; color: #424242; letter-spacing: -0.07em;">세트</span>
				</p>
				<br>
				<c:forEach items="${list5 }" var="b" varStatus="v">
					<div class="col-lg-4 col-md-6 col-sm-8 col-sx-9 col-10 m-auto">
						<div class="blog-post">
							<div class="post-thumb">



								<c:forEach items="${fileList }" var="f" varStatus="vs">
									<c:if test='${f["PCODE"]==b["PCODE"]}'>
										<c:if test='${f["ATTACHFLAG"]=="1" }'>

											<input type="hidden" value="${f['PCODE'] }">

											<a
												href="${pageContext.request.contextPath}/detail/detailView?pCode=${f['PCODE'] }">
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
										<li class="list-inline-item" style="font-family: 'Do Hyeon', sans-serif;"><c:out
												value='${b["SALENAME"] }' /></li>
									</center>
									<center>
										<li class="list-inline-item" name="money"
											style="font-family: 'Noto Sans KR', sans-serif;" font-size: 20px;">
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
		<br> <br> <br>
		<p style="margin-top: 80px; margin-bottom: 15px">
			<span
				style="font-family: Noto sans KR, sans-serif; font-size: 35px; color: #424242; letter-spacing: -0.07em;">오시는길</span>
		</p>
		<div>
			<table>
				<tr>
					<th
						style="display: table-ceil; vertical-align: inherit; text-align: -internal-center;">주소</th>
					<td
						style="border-bottom: 1px solid #e5e5e5; height: 42px; color: #6d6e72; padding-left: 34px;">서울특별시
						강남구 테헤란로 14길 6 남도빌딩 1F ( T :02.123.1234)</td>
				</tr>
				<tr>
					<th
						style="display: table-ceil; vertical-align: inherit; text-align: -internal-center;">지하철</th>
					<hr>
					<td
						style="border-bottom: 1px solid #e5e5e5; height: 42px; color: #6d6e72; padding-left: 34px;">지하철
						2호선 역삼역 3번출구 직진 100m후 기업은행 골목으로 들어가 10m 우측</td>
				</tr>
			</table>
			<br><br>
		</div>
		<div id="map" style="width: 800px; height: 500px;"></div>

	</section>
</section>








<script
	src="${pageContext.request.contextPath }/resources/js/index/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/index/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/index/main.js"></script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b0677ab683f93637bdf3d83781b922c1"></script>
<script>
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(37.4989727, 127.0328766),
		level : 3
	};
	var map = new kakao.maps.Map(container, options);

	var markerPosition = new kakao.maps.LatLng(37.4989727, 127.0328766);

	var marker = new kakao.maps.Marker({
		position : markerPosition
	});
	marker.setMap(map);
</script>

</body>





<jsp:include page="/WEB-INF/views/common/footer.jsp" />