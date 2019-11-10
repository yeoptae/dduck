<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR|Sunflower:300&display=swap" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="관리자마이페이지" />
</jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<section id="content">
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<ul class="nav nav-pills nav-stacked">
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
				<center><h2 style="margin-right:10px; font-family: 'Black Han Sans', sans-serif;">회원리스트</h2></center>
				
				
				<div class="container-fluid" style="margin-top: 5%">
				
				<form name="form1" method="post" action="${pageContext.request.contextPath}/admin/adminClientList.do">

    <select name="searchoption">
        <option value="cName" 
<c:if test="${mv.searchoption == 'cName'}">selected</c:if>
        >이름</option>
    </select>
    <input name="keyword" value="${mv.keyword}">
    <input type="submit" value="조회">
</form>
<br>

					<table class="table">
						<thead class="thead-light">
							<tr style="text-align: center;">
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">아이디</th>
								<th style="background-color: #eeeeee; text-align: center;">이름</th>
								<th style="background-color: #eeeeee; text-align: center;">이메일</th>
								<th style="background-color: #eeeeee; text-align: center;">전화번호</th>
								<th style="background-color: #eeeeee; text-align: center;">주소</th>
								<th style="background-color: #eeeeee; text-align: center;">작성일</th>
								<th style="background-color: #eeeeee; text-align: center;">탈퇴</th>
							</tr>
						</thead>
						<tbody>
							
								<c:forEach items="${clientList }" var="c" varStatus="v">
								<tr style="text-align: center;">
								<td><c:out value='${c["CID"] }' /></td>
								<td><c:out value='${c["CNAME"] }' /></td>
								<td><c:out value='${c["CEMAIL"] }' /></td>
								<td><c:out value='${c["CPHONE"] }' /></td>
								<td><c:out value="${c['CADDR2']},${c['CADDR3']}"/></td>
								<td><c:out value='${c["CEN"] }' /></td>
								<td>
								<button type="button" class="btn btn-primary tr${v.count}" id="getOut" onclick="getOut('${c['CID'] }','${v.count}');">탈퇴</button>
								<input type="text" class="num${v.count}" hidden/>
										</td>
								<%-- <td><input type="hidden"<c:out value='${c["CPW"] }' />></td> --%>
							    </tr>
								</c:forEach>
						</tbody>
						
					</table>
				 <center>${pageBar }</center>
				</div>



				<br>
				<br>

			</div>
  <script>
  function getOut(i, j) {
	   $.ajax({
		  url: "${pageContext.request.contextPath}/admin/withDraw.do",
		  data : {'cId' : i},
		  success : function(data) {
				if(data == 'true'){
					alert("탈퇴성공");
					$('.tr'+j).css({"display": "none"});
				}else{
					alert("실패");
				}		
			}, error : function() {
				console.log("ajax fail");
			}
		}); 
	}
  </script>			

</section>

</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
