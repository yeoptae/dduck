<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<c:set var="path" value="판매물품등록" />
<style>
.container {
	font-family: "Noto Sans KR", sans-serif;
	vertical-align: middle;
}

.inputFile {
	height: 45px;
}

.navbar {
	height: 65px;
	width: 100%;
}

.navbar-brand {
	width: 200px;
}

.navInput {
	width: 200px;
}

.navButton {
	width: 100px;
}

.input-dateofbirth-text {
	font-size: 18px;
	padding: 10px;
	vertical-align: inherit;
}

.container {
	vertical-align: center;
	margin: 0 auto;
}

#form-group-1 {
	vertical-align: inherit;
}

.custom-select-sm {
	background:
		url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'%3e%3cpath fill='%23343a40' d='M2 0L0 2h4zm0 5L0 3h4z'/%3e%3c/svg%3e")
		no-repeat right 0.5rem center/8px 10px;
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
	margin: 10px;
	margin-left: 0;
}

.select-birth-input {
	width: 80px;
}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="상품등록" />
</jsp:include>
<section id="content">

	<body>
		<div class="container" class="parallax-window fullscreen"
			data-parallax="scroll"
			data-image-src="http://hellonature.cafe24.com/contents/product/process1/instant/1701/15512_05.jpg"
			data-ios-fix="true" data-over-scroll-fix="true"
			data-android-fix="true">
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8 row well" style="margin: 0 auto;">
					<div class="col">

						<br> <br> <br> <br>
						<h2>상품수정</h2>
						<hr>
						<form name="boardFrm"
							action="${pageContext.request.contextPath}/admin/saleBoardUpdateEnd.do"
							method="post" onsubmit="return validate();"
							enctype="multipart/form-data">
							<div class="form-group">
								<th colspan="2"
									style="background-color: #eeeeee; text-align: left;">게시판 <br>
									<br> <select class="custom-select d-block w-100"
									name="gCode" id="gCode" required>
										<option value="">게시판선택</option>
										<option value="1">답례</option>
										<option value="2">간식</option>
										<option value="3">돌</option>
										<option value="4">케이크</option>
										<option value="5">세트</option>
								</select></th> <br> <br> <br> <label>게시글번호</label> <input
									type="hidden" name="pCode" value="${saleList['PCODE'] }"
									class="form-control" placeholder="게시글번호" readonly /> <label>제목</label>
								<input type="text" name="saleName"
									value="${saleList['SALENAME'] }" class="form-control"
									placeholder="제목" /> <label>판매가</label> <input type="text"
									name="salePrice" class="form-control"
									value="${saleList['SALEPRICE'] }" placeholder="금액(원)" /> <label>내용</label>
								<input type="text" class="form-control" placeholder="글 내용"
									name="detailsInfo" value="${saleList['DETAILSINFO'] }"
									maxlength="2048" style="height: 200px;" />
									
							</div>

							<div class="form-group">
								<label>상품판매 이미지 등록</label>
								<h2>메인이미지</h2>
							                         	
								<input type="file" name="dduckpic" id="dduckpic1"
									class="form-control btn btn-outline-secondary inputFile"
									accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
									
								
							
									
                                 

								<h2>서브이미지</h2>
								<%--  <c:forEach items="${att }" var="a" varStatus="at"> 
                                	<c:if test='${a["attachFlag"]!="1" }'> --%>
								<input type="file" name="dduckpic" id="dduckpic2"
									value="${a['attachCode'] }"
									class="form-control btn btn-outline-secondary inputFile"
									accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
									
							

								<input type="file" name="dduckpic" id="dduckpic3"
									value="${a['attachCode'] }"
									class="form-control btn btn-outline-secondary inputFile"
									accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
							

								<input type="file" name="dduckpic" id="dduckpic4"
									value="${a['attachCode'] }"
									class="form-control btn btn-outline-secondary inputFile"
									accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
							
								<input type="file" name="dduckpic" id="dduckpic5"
									value="${a['attachCode'] }"
									class="form-control btn btn-outline-secondary inputFile"
									accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
							
								<input type="file" name="dduckpic" id="dduckpic6"
									value="${a['attachCode'] }"
									class="form-control btn btn-outline-secondary inputFile"
									accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
							
								<input type="file" name="dduckpic" id="dduckpic7"
									value="${a['attachCode'] }"
									class="form-control btn btn-outline-secondary inputFile"
									accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
								
								<%-- 	</c:if>
                                   </c:forEach>  --%>
							</div>
							<div style="text-align: center;">
								<button type="submit" class="btn btn-primary">수정</button>
								<button type="button" onclick="history.back();"
									class="btn btn-primary">뒤로</button>
							</div>

						</form>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		<script>
			$("document").ready(function() {

				$(window).scroll(function() {
					$('#scroll').animate({
						top : $(window).scrollTop() + "px"
					}, {
						queue : false,
						duration : 350
					});
				});

				$('#scroll').click(function() {
					$('#scroll').animate({
						top : "+=15px",
						opacity : 0
					}, "slow");
				})

			});

			function deleteImg(img) {
				$("img[name=img_" + img + "]").attr("src", "");
				$("input[name=" + img + "]").val("null");
			}
		</script>

	</body>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
