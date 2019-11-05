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
      <div class="row content" >
        <div class="col-sm-3">
          <ul class="nav nav-pills nav-stacked" style="margin: 80px 0 0 0; margin-left: 60px;">
           <h4>관리자페이지</h4>
           <li><a href="${pageContext.request.contextPath}/admin/adminmypage.do">주문현황</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/adminClientList.do">회원리스트</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/adminQnaBoard.do">Qna게시판 관리하기</a></li>
             <li><a href="${pageContext.request.contextPath}/admin/insertproduct.do">상품등록</a></li>
          </ul><br> 
           
          
        </div>

        <div class="col-sm-9">

          <hr>
          <h2>주문현황</h2><br><br>
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
                </tr>
              </thead>
              <tbody>
                 <c:forEach items="${list }" var="p" varStatus="pv">
              		<tr>
              			<td><c:out value="${p['PAYCODE'] }"/></td>
              			<td><c:out value="${p['SALENAME'] }"/></td>
              			<td><c:out value="${p['PAYNAME'] }"/></td>
              			<td><c:out value="${p['PAYADDR1']},${p['PAYADDR2']},${p['PAYADDR3']}"/></td>
              			<td><c:out value="${p['PAYDAY']}"/></td>
              	    	<td><c:out value="${p['PAYDELIVERYEN'] }"/></td>
              	    	<td><c:out value="${p['PAYTIME'] }"/></td>
              	    	<td><c:out value="${p['PAYPHONE'] }"/></td>
              	    	<td><c:out value="${p['PAYAMOUNT'] }"/></td>
              	    	<td><c:out value="${p['PAYPRICE'] }"/></td>
              	    	<td><c:out value="${p['PAYMEMO'] }"/></td>
              	    </tr>
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
