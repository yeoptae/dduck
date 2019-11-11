<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="qna" value="qnalist"/>
</jsp:include>

<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR|Sunflower:300&display=swap" rel="stylesheet">
<style>
*{
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<div class="row"> 
		<div class="col-sm-3 sidenav">
			<h4 style="margin-right:10px; font-family: 'Black Han Sans', sans-serif;">장바구니</h4>
			<ul class="nav nav-pills nav-stacked">
				<li><a
					href="${pageContext.request.contextPath}/client/panier?cId=${loginClient.CId}" style="font-family: 'Black Han Sans', sans-serif;">장바구니</a></li>
				<li><a
					href="${pageContext.request.contextPath}/client/paymentList?cId=${loginClient.CId}" style="font-family: 'Black Han Sans', sans-serif;">결제내역</a></li>
				<li><a href="${pageContext.request.contextPath}/client/ClientQnaList.do?cId=${loginClient.CId}" style="font-family: 'Black Han Sans', sans-serif;">문의내역</a></li>
				<li><a
					href="${pageContext.request.contextPath}/update/update.do?cId=${loginClient.CId}" style="font-family: 'Black Han Sans', sans-serif;">정보수정</a></li>
				<li><a
					href="${pageContext.request.contextPath}/pwChange/pwChange.do" style="font-family: 'Black Han Sans', sans-serif;">비밀번호 변경</a></li>
				<li><a
					href="${pageContext.request.contextPath}/withdraw/withdraw.do" style="font-family: 'Black Han Sans', sans-serif;">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="col-xs-8 col-sm-8">
		<h1 class="text-center" style="font-family: 'Black Han Sans', sans-serif;">문의내역</h1>
          <div class="container-fluid" style="margin-top: 5%">
                  <c:if test="${!empty loginClient }">
	        <div class="qna-writer-button">
	            <button type="button" class="pull-right btn btn-white btn-cons" onclick='location.href="${path}/qna/qnaForm"'>글쓰기</button>
	        </div>
        </c:if>
        <br><br><br><br>
	        <div style="width : 20px;"></div>
            <table class="table" style="font-family: 'Do Hyeon', sans-serif;">
              <thead class="thead-light">
                <tr style="text-align: center;">
        
        
                <tr>
                  <th style="background-color: #eeeeee; text-align: center;">번호</th>
                  <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                  <th style="background-color: #eeeeee; text-align: center;">제목</th>                            
                  <th style="background-color: #eeeeee; text-align: center;">작성일</th>
                  <th style="background-color: #eeeeee; text-align: center;">답변상태</th>                         
                </tr>
              </thead>
              <tbody style="font-family: 'Noto Sans KR', sans-serif;">
            <c:forEach items="${list }" var="q" varStatus="v">
            <c:if test='${loginClient.CId eq q["CID"]}'>
            
              		<tr>
              			<td style="text-align: center;"><c:out value='${q["QACODE"] }'/></td>
              			<td style="text-align: center;"><c:out value='${q["CID"] }'/></td>
              			<td style="text-align: center;"><a href='${path }/qna/qnaView.do?qaCode=${q["QACODE"] }'><c:out value='${q["QATITLE"] }'/></a></td>
              			<td style="text-align: center;"><fmt:formatDate value='${q["QAEN"] }' pattern="yyyy.MM.dd"/></td>
              			<td style="text-align: center;">
							<div class="col col-5" data-label="답변">
			                	<c:choose>
			                		<c:when test='${empty q["CMCONTENT"]}'>
			                			<div>-</div>
			                		</c:when>
			                		<c:when test='${not empty q["CMCONTENT"]}'>
			                			<div style="color:red">답변완료</div>
			                		</c:when>
			                	</c:choose>
			                </div>
						</td>
              	    </tr>
              	    
            </c:if>
            </c:forEach>
              </tbody>
            </table>
          </div>

          <br><br>

        </div>
 </div>
<br><br><br>
    <center>${pageBar }</center>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>