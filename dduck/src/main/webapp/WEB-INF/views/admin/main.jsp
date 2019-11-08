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
<link href="img/favicon.ico" rel="shortcut icon" />

<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=4b65ed0f-8a23-4128-abf7-7df859e62126"></script>


<!-- Stylesheets -->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/bootstrap.min.css"/> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/index/font-awesome.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/index/owl.carousel.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/index/animate.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/index/style.css" />
  <link href="${pageContext.request.contextPath }/resources/css/font/css/fontawesome.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/css/font/css/brands.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/css/font/css/solid.css" rel="stylesheet">
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
			data-setbg="${pageContext.request.contextPath }/resources/images/dduck1.jpg">
			<div class="hs-text">
				<h2 class="hs-title-1">
					<span>엄마의 손길</span>
				</h2>
				<h2 class="hs-title-2">
					<span>최고의 손맛</span>
				</h2>
				<h2 class="hs-title-3">
					<span>국내산만 사용</span>
				</h2>
			</div>
		</div>
		<div class="hero-slide-item set-bg"
			data-setbg="${pageContext.request.contextPath }/resources/images/dduck3.jpg">
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
			data-setbg="${pageContext.request.contextPath }/resources/images/dduck5.jpg">
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
<p align="center" style="margin-top: 80px; margin-bottom: 15px">
	<span
		style="font-family: Noto sans KR, sans-serif; font-size: 35px; color: #424242; letter-spacing: -0.07em;">콩떡콩떡</span>
	<span
		style="font-family: 'Roboto', sans-seri; font-size: 41px; color: #424242; letter-spacing: -0.02em;">New</span>
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


				<p align="center" style="margin-top: 80px; margin-bottom: 15px">
					<span
						style="font-family: Georgia, serif; font-size: 35px; color: #424242; letter-spacing: -0.07em;">답례떡</span>
				</p>
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
										<li class="list-inline-item"><c:out
												value='${b["SALENAME"] }' /></li>
<%-- 									</center> --%>
									<center>
									<li class="list-inline-item" name="money"
											style="color: #333; font-family: Georgia, serif; font-size:20px;">
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
						style="font-family: Georgia, serif; font-size: 35px; color: #424242; letter-spacing: -0.07em;">간식</span>
				</p>

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
										<li class="list-inline-item"><c:out
												value='${b["SALENAME"] }' /></li>
									</center>
									<center>
										<li class="list-inline-item" name="money"
											style="color: #333; font-family: Georgia, serif; font-size:20px;">
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
						style="font-family: Georgia, serif; font-size: 35px; color: #424242; letter-spacing: -0.07em;">돌떡</span>
				</p>
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
										<li class="list-inline-item"><c:out
												value='${b["SALENAME"] }' /></li>
									</center>
									<center>
										<li class="list-inline-item" name="money"
											style="color: #333; font-family: Georgia, serif; font-size:20px;">
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
						style="font-family: Georgia, serif; font-size: 35px; color: #424242; letter-spacing: -0.07em;">케이크</span>
				</p>
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
										<li class="list-inline-item"><c:out
												value='${b["SALENAME"] }' /></li>
									</center>
									<center>
										<li class="list-inline-item" name="money"
											style="color: #333; font-family: Georgia, serif; font-size:20px;">
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
						style="font-family: Georgia, serif; font-size: 35px; color: #424242; letter-spacing: -0.07em;">세트</span>
				</p>
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
										<li class="list-inline-item"><c:out
												value='${b["SALENAME"] }' /></li>
									</center>
									<center>
										<li class="list-inline-item" name="money"
											style="color: #333; font-family: Georgia, serif; font-size:20px;">
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
		
		
		 <div class="container padding">
      <div class="">

         <div class="col-md-12">
            <!-- start to destination -->
            <div class="addr">
            </div>
            <!-- title -->
            <div class="height">
          <span class="main__header__result"></span>
    <hr>
   <div class="main__map main__map-empty" id="map"></div> <!-- 지도 보이는 곳 --> 
   <div class="request">
   <hr>

   </div>
         </div>
      </div>
   </div>
</div>
	</section>
</section>

 

  




<script
	src="${pageContext.request.contextPath }/resources/js/index/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/index/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/index/main.js"></script>
	

<script>

//숫자만 입력받기 영어 한글 제외하는 로직
$("input:text[name=bidPrice]").keyup(function (e) {
    //  var reg = /[^0-9]*$/;
    var reg = /^[^0-9]/
    var v = $(this).val();
    console.log(v);
    if (reg.test(v)) {
        $(this).val(v.replace(reg, ""));
        $(this).focus();
    }

});  

newAddr = [];
   search(addr[0]);
   search(addr[1]);
function search(addr) {
  if(addr=="") {
      alert("주소를 차지 못 하였습니다");
  } else {
      textSearch(addr);
  }
}

function textSearch(addr) {
  if(addr != null) {
      $.ajax({
          method: "GET",
          url: "https://api2.sktelecom.com/tmap/geo/fullAddrGeo?version=1",
          data: {
             fullAddr: addr,
             appKey: "4b65ed0f-8a23-4128-abf7-7df859e62126"
          },
          success: function(data) {
              var obj = JSON.stringify(data);
              obj = JSON.parse(obj);
              newAddr.push(obj.coordinateInfo.coordinate[0].newLat);
              newAddr.push(obj.coordinateInfo.coordinate[0].newLon);
              if( newAddr.length == 4){
                 startingMap();
              }
          },
          error:function(request,status,error){
              
          }
      });
  }
}



 var authKey = "4b65ed0f-8a23-4128-abf7-7df859e62126";
  var route1 = ["startingAddress", "destinationAddress"];
  var places = {
    startingAddress: {
      locY: 37.4871,
      locX: 127.0529
    },
    destinationAddress: {
      locY: 35.8714,
      locX: 128.6014
    }
  };
  var startX; // 출발지 x 좌표
  var startY; // 출발지 y 좌표
  var endX; // 도착지 x 좌표
  var endY; // 도착지 y 좌표
  
  var passList = null; //경로탐색에 사용할 경유지. 경유지가  포함되어서 검색될 경우 이 변수에 경유지 리스트가 들어감.
  var departureTime; //출발 시간을 담을 변수
  // date.js에 입력한 출발/도착/경유지의 해당 좌표를 변수에  입력토록 하는 함수
  var idToLoc = function(route) {
    startY = newAddr[0];
    startX = newAddr[1];
    endY = newAddr[2];
    endX = newAddr[3];
  };
  // 경로탐색 전 MAP div 초기화 -> 고야이 사진 삭제 및 투명도 0%  설정
  var initMap = function() {
  };
  // 지도 실행하기///////////////////////////////////////////////////////////////
  function startingMap() {
    idToLoc(route1);
    return findpath();
  };
   
   
  function findpath() {
    // 지도 삽입 전 map div 초기화
     var map = new Tmap.Map({
        div: "map", // 결과 지도를 표시할 곳
        height: "300px",
        width: "100"
      });
    
    initMap();
    
    var prtcl;
    var headers = {};
    headers["appKey"] = authKey; // 발급받은 인증키를 넣어야  한다
    $.ajax({
      method: "POST",
      headers: headers,
      url:  "https://api2.sktelecom.com/tmap/routes?version=1&format=xml",
      async: false,
      data: {
        startX: startX,
        startY: startY,
        endX: endX,
        endY: endY,
        passList: passList,
        reqCoordType: "WGS84GEO",
        resCoordType: "EPSG3857",
        angle: "172",
        searchOption: "0",
        trafficInfo: "Y" //교통정보 표출 옵션입니다.
      },
      success: function(response) {
        //API가 제대로 작동할 경우 실행될 코드
        prtcl = response;
        var prtclString = new  XMLSerializer().serializeToString(prtcl); //xml to String
        (xmlDoc = $.parseXML(prtclString)),
          ($xml = $(xmlDoc)),
          ($intRate = $xml.find("Document"));
        var tDistance =
          " 총 거리 : " +
          (
             $intRate[0].getElementsByTagName("tmap:totalDistance")[0]
              .childNodes[0].nodeValue / 1000
          ).toFixed(1) +
          "km,";
        var tTime =
          " 예상 소요 시간 : " +
          (
             $intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0]
              .nodeValue / 60
          ).toFixed(0) +
          "분";
         document.querySelector("#totalTime").innerText =
          tTime;
         document.querySelector("#totalDistance").innerText =
             tDistance;
        // 실시간 교통정보 추가
        var trafficColors = {
          extractStyles: true,
          /* 실제 교통정보가 표출되면 아래와 같은 Color로 Line이  생성됩니다. */
          trafficDefaultColor: "#000000", //Default
          trafficType1Color: "#009900", //원활
          trafficType2Color: "#8E8111", //지체
          trafficType3Color: "#FF0000" //정체
        };
        var kmlForm = new  Tmap.Format.KML(trafficColors).readTraffic(prtcl);
        routeLayer = new Tmap.Layer.Vector("vectorLayerID");  //백터 레이어 생성
        routeLayer.addFeatures(kmlForm); //교통정보를 백터  레이어에 추가
        map.addLayer(routeLayer); // 지도에 백터 레이어 추가
        // 경로탐색 결과 반경만큼 지도 레벨  조정
        map.zoomToExtent(routeLayer.getDataExtent());
      },
      error: function(request, status, error) {
        // API가 제대로 작동하지 않을 경우
        console.log(
          "code:" +
            request.status +
            "\n" +
            "message:" +
            request.responseText +
            "\n" +
            "error:" +
            error
        );
      }
    }); 
  }
   
</script>

</body>





<jsp:include page="/WEB-INF/views/common/footer.jsp" />