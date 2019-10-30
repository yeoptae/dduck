<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="관리자마이페이지" />
</jsp:include>
<section id="content">

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<h4>관리자페이지</h4>
				<ul class="nav nav-pills nav-stacked">
					<li><a
						href="${pageContext.request.contextPath}/admin/adminmypage.do">주문현황</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/adminClientList.do">회원리스트</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/adminQnaBoard.do">Qna게시판
							관리하기</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/insertproduct.do">상품등록</a></li>
				</ul>
				<br>


			</div>

			<div class="col-sm-9">
				<hr>
				<h2>Qna게시판</h2>
				
				<br>
				<br>
				<div class="container-fluid" style="margin-top: 5%">
					<table id='tbl-board' class='table table-striped table-hover'>
						<thead class="thead-light">
							<tr style="text-align: center;">
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">boardNo</th>
								<th style="background-color: #eeeeee; text-align: center;">작성자</th>
								<th style="background-color: #eeeeee; text-align: center;">제목</th>
								<th style="background-color: #eeeeee; text-align: center;">일자</th>
								<th style="background-color: #eeeeee; text-align: center;">작성일</th>

							</tr>
						</thead>
						<tbody>

							<c:forEach items="${QnaList }" var="q" varStatus="v">
								<tr style="text-align: center;">
									<td><c:out value='${q["QACODE"] }' /></td>
									<td><c:out value='${q["CID"] }' /></td>
									<td><c:out value='${q["QATITLE"] }' /></td>
									<td><c:out value='${q["QACONTENT"] }' /></td>
									<td><c:out value='${q["QAEN"] }' /></td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
					<center>${pageBar }</center>
				</div>
			</div>

			<br>
			<br>

		</div>
</section>


</body>



</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
