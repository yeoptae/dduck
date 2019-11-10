<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="관리자마이페이지" />
</jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR|Sunflower:300&display=swap" rel="stylesheet">
<section id="content">

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-2">
				<ul class="nav nav-pills nav-stacked"
					>
					<h4 style="margin-right:10px; font-family: 'Black Han Sans', sans-serif;">관리자페이지</h4>
					<li><a
						href="${pageContext.request.contextPath}/admin/adminmypage.do" style="font-family: 'Black Han Sans', sans-serif;">주문현황</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/adminClientList.do" style="font-family: 'Black Han Sans', sans-serif;">회원리스트</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/adminQnaBoard.do" style="font-family: 'Black Han Sans', sans-serif;">Qna게시판
							관리하기</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/insertproduct.do" style="font-family: 'Black Han Sans', sans-serif;">상품등록</a></li>
				</ul>
				<br>


			</div>

			<div class="col-sm-10">

				<hr>
				<center><h2 style="margin-right:10px; font-family: 'Black Han Sans', sans-serif;">주문현황</h2></center>
				<div class="container-fluid" style="margin-top: 5%">
					<table class="table">
						<thead class="thead-light">
							<tr style="text-align: center;">
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">주문번호</th>
								<th style="background-color: #eeeeee; text-align: center;">떡이름</th>
								<th style="background-color: #eeeeee; text-align: center;">주문자</th>
								<th style="background-color: #eeeeee; text-align: center;">주소</th>
								<th style="background-color: #eeeeee; text-align: center;">결제완료일</th>
								<th style="background-color: #eeeeee; text-align: center;">배송일</th>
								<th style="background-color: #eeeeee; text-align: center;">배송시간</th>
								<th style="background-color: #eeeeee; text-align: center;">휴대폰번호</th>
								<th style="background-color: #eeeeee; text-align: center;">수량</th>
								<th style="background-color: #eeeeee; text-align: center;">금액</th>
								<th style="background-color: #eeeeee; text-align: center;">요청사항</th>
								<th style="background-color: #eeeeee; text-align: center;">배송상태</th>
								<th style="background-color: #eeeeee; text-align: center;">배송완료</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="p" varStatus="pv">
								<tr>
									<td><c:out value="${p['PAYCODE'] }" /></td>
									<td><c:out value="${p['SALENAME'] }" /></td>
									<td><c:out value="${p['PAYNAME'] }" /></td>
									<td><c:out
											value="${p['PAYADDR1']},${p['PAYADDR2']},${p['PAYADDR3']}" /></td>
									<td><fmt:formatDate value="${p['PAYDAY']}"
											pattern="yyyy.MM.dd" /></td>
									<td><fmt:formatDate value="${p['PAYDELIVERYEN'] }"
											pattern="yyyy.MM.dd" /></td>
									<td><c:out value="${p['PAYTIME'] }" /></td>
									<td><c:out value="${p['PAYPHONE'] }" /></td>
									<td><c:out value="${p['PAYAMOUNT'] }" /></td>
									<td><c:out value="${p['PAYPRICE'] }" /></td>
									<td><c:out value="${p['PAYMEMO'] }" /></td>
									<c:if test="${p['DCHECK'] =='0' }">
										<td><p class="trt${pv.count}">배송전</p></td>
									</c:if>
									<c:if test="${p['DCHECK'] =='1' }">
										<td><p class="trt${pv.count}">배송완료 </p></td>
									</c:if>
									<c:if test="${p['DCHECK'] =='0' }">
										<td>
											<button type="button" class="btn btn-primary tr${pv.count}" id="${p['DCHECK']}" onclick="dComplete(${p['PAYCODE'] }, ${pv.count});">배송완료</button>
											<input type="text" class="num${pv.count}" hidden/>
										</td>
									</c:if>

								</tr>
                                   
							</c:forEach>
								
						</tbody>
					</table>
					<div id="pageBar" style="text-align: center; color: black;">
						${pageBar }</div>
				</div>

				<br>
				<br>

			</div>
</section>


</body>
<script>
		//function dComplete() {
		//	var a="${p['PAYCODE'] }";
		//	console.log(a);
		//	console.log("<c:out value="${p['PAYCODE'] }"/>");
		//	location.href = "${pageContext.request.contextPath}/payment/dComplete.do?payCode="+"${p['PAYCODE'] }";										}
		//}
		//$(function () {
			function dComplete(i, j) {
				//a.push("<c:out value="${p['PAYCODE'] }"/>");
				//var c = $(".num${pv.count}").val();
				//console.log(j);


				$.ajax({
					url : "${pageContext.request.contextPath}/payment/dComplete.do",														//cId=파라미터값으로 input에 name값이다.
					data : {payCode : i},
					//jquery를 사용한 ajax
					success : function(data) {
						if(data == 'true'){
							console.log("성공");
							$('.tr'+j).css({"display": "none"});
							$('.trt'+j).text("배송완료");
						}else{
							console.log("실패");
						}
						
					}, error : function() {
						console.log("ajax fail");
					}
				});
			}
				

		//});
		
</script> 

 

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
