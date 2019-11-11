<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="관리자마이페이지"/>
</jsp:include>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR|Sunflower:300&display=swap" rel="stylesheet">
<body>
	<div class="row">
		<div class="col-sm-3 sidenav">
			<h4 style="margin-right:10px; font-family: 'Black Han Sans', sans-serif;">결제내역</h4>
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
		<h1 class="text-center" style="font-family: 'Black Han Sans', sans-serif;">결제내역</h1>

          <div class="container-fluid" style="margin-top: 5%">
            <table class="table">
              <thead class="thead-light" style="font-family: 'Do Hyeon', sans-serif;">
                <tr style="text-align: center;">
        
                <tr>
                  <th style="background-color: #eeeeee; text-align: center;">상품정보</th>
                  <th style="background-color: #eeeeee; text-align: center;">상품명</th>
                  <th style="background-color: #eeeeee; text-align: center;">배송주소</th>               
                  <th style="background-color: #eeeeee; text-align: center;">배송날짜</th>
                  <th style="background-color: #eeeeee; text-align: center;">배송시간</th>               
                  <th style="background-color: #eeeeee; text-align: center;">수량</th>               
                  <th style="background-color: #eeeeee; text-align: center;">합계 금액</th>            
                  <th style="background-color: #eeeeee; text-align: center;">배송 상태</th>            
                  <th style="background-color: #eeeeee; text-align: center;">결제 상태</th>            
                </tr>
              </thead>
              <tbody style="font-family: 'Noto Sans KR', sans-serif;">
                 <c:forEach items="${list }" var="p" varStatus="pv">
              		<tr>
              			<td style="text-align: center;"><img src="${path }/resources/upload/board/${p['ATTACHREFILENAME'] }" height="50px" width="50px"></td>
              			<td style="text-align: center;"><a id="${p['PCODE']}" onclick="move1(this.id);"><c:out value="${p['SALENAME'] }"/></a></td>
              			<td style="text-align: center;"><c:out value="${p['PAYADDR1']},${p['PAYADDR2']},${p['PAYADDR3']}"/></td>
              			<td style="text-align: center;"><fmt:formatDate value="${p['PAYDELIVERYEN'] }" pattern="yyyy.MM.dd"/></td>
              			<td style="text-align: center;"><c:out value="${p['PAYTIME'] }"/></td>
              			<td style="text-align: center;"><c:out value="${p['PAYAMOUNT'] }"/>개</td>
              			<td style="text-align: center;"><c:out value="${p['PAYPRICE'] }"/>원</td>
              			<c:if test="${p['DCHECK'] =='1' }">						
              			<td style="text-align: center;">배송완료</td>
						</c:if>
              			<c:if test="${p['DCHECK'] =='0' }">						
              			<td style="text-align: center;">배송 전</td>
						</c:if>
              			<td style="text-align: center;">결제완료</td>
              	    </tr>
              	    <input type="hidden" name="cId" value="${loginClient.CId}">
                 </c:forEach>
              </tbody>
            </table>
<!--             <div id="pageBar" style="text-align: center; color: black;"> -->
<%--               ${pageBar } --%>
<!--             </div> -->
          </div>

          <br><br>

        </div>
</div>

</body>
<script>
function move1(pc) {
	
	if(confirm("이동하시겠습니까?")) {
		location.href="${pageContext.request.contextPath}/detail/detailView?pCode="+pc;	
	}
}
</script>
 

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
