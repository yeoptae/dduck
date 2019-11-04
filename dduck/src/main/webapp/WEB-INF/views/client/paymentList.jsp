<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="관리자마이페이지"/>
</jsp:include>
<section id="content">

<div class="container-fluid">
      <div class="row content">
        <div class="col-sm-3">
           <h4>마이페이지</h4>
          <ul class="nav nav-pills nav-stacked">
				<li><a
					href="${pageContext.request.contextPath}/client/panier?cId=${loginClient.CId}">장바구니</a></li>
				<li><a
					href="${pageContext.request.contextPath}/client/paymentList?cId=${loginClient.CId}">결제내역</a></li>
				<li><a
					href="${pageContext.request.contextPath}/update/update.do?cNo=${loginClient.CId}">정보수정</a></li>
				<li><a
					href="${pageContext.request.contextPath}//pwChange/pwChange.do">비밀번호 변경</a></li>
				<li><a
					href="${pageContext.request.contextPath}/withdraw/withdraw.do">회원탈퇴</a></li>
			</ul><br> 
           
          
        </div>

        <div class="col-sm-9">

          <hr>
          <h2>결제내역</h2><br><br>
          <div class="container-fluid" style="margin-top: 5%">
            <table class="table">
              <thead class="thead-light">
                <tr style="text-align: center;">
        
                <tr>
                  <th style="background-color: #eeeeee; text-align: center;">상품정보</th>
                  <th style="background-color: #eeeeee; text-align: center;">상품명</th>
                  <th style="background-color: #eeeeee; text-align: center;">배송주소</th>               
                  <th style="background-color: #eeeeee; text-align: center;">배송날짜</th>
                  <th style="background-color: #eeeeee; text-align: center;">배송시간</th>               
                  <th style="background-color: #eeeeee; text-align: center;">수량</th>               
                  <th style="background-color: #eeeeee; text-align: center;">합계 금액</th>            
                  <th style="background-color: #eeeeee; text-align: center;">결제 상태</th>            
                </tr>
              </thead>
              <tbody>
                 <c:forEach items="${list }" var="p" varStatus="pv">
              		<tr>
              			<td style="text-align: center;"><img src="${path }/resources/upload/board/${p['ATTACHREFILENAME'] }" height="50px" width="50px"></td>
              			<td style="text-align: center;"><c:out value="${p['SALENAME'] }"/></td>
              			<td style="text-align: center;"><c:out value="${p['PAYADDR1']},${p['PAYADDR2']},${p['PAYADDR3']}"/></td>
              			<td style="text-align: center;"><c:out value="${p['PAYDELIVERYEN'] }"/></td>
              			<td style="text-align: center;"><c:out value="${p['PAYTIME'] }"/></td>
              			<td style="text-align: center;"><c:out value="${p['PAYAMOUNT'] }"/>개</td>
              			<td style="text-align: center;"><c:out value="${p['PAYPRICE'] }"/>원</td>
              			<td style="text-align: center;">결제완료</td>
              	    </tr>
              	    <input type="hidden" name="cId" value="${loginClient.CId}">
                 </c:forEach>
              </tbody>
            </table>
            <div id="pageBar" style="text-align: center; color: black;">
              ${pageBar }
            </div>
          </div>

          <br><br>

        </div>
  </section>


</body>

 

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
