<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="관리자마이페이지"/>
</jsp:include>

<body>
<form name="panierFrm" class="detailViewForm" method="post" >
	<div class="row">
		<div class="col-sm-3 sidenav">
			<h4 style="padding:10px;">장바구니</h4>
			<ul class="nav nav-pills nav-stacked">
				<li><a

					href="${pageContext.request.contextPath}/client/panier?cId=${loginClient.CId}">장바구니</a></li>
				<li><a
					href="${pageContext.request.contextPath}/client/paymentList?cId=${loginClient.CId}">결제내역</a></li>

				<li><a
					href="${pageContext.request.contextPath}/update/update.do?cId=${loginClient.CId}">정보수정</a></li>
				<li><a
					href="${pageContext.request.contextPath}/pwChange/pwChange.do">비밀번호 변경</a></li>
				<li><a
					href="${pageContext.request.contextPath}/withdraw/withdraw.do">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="col-xs-8 col-sm-8">
		<h1 class="text-center">마이 페이지</h1>
          <div class="container-fluid" style="margin-top: 5%">
            <table class="table">
              <thead class="thead-light">
                <tr style="text-align: center;">
        
                <tr>
                  <th style="background-color: #eeeeee; text-align: center;">상품정보</th>
                  <th style="background-color: #eeeeee; text-align: center;">상품명</th>
                  <th style="background-color: #eeeeee; text-align: center;">상품가격</th>                            
                  <th style="background-color: #eeeeee; text-align: center;">수량</th>
                  <th style="background-color: #eeeeee; text-align: center;">합계 금액</th>               
                  <th style="background-color: #eeeeee; text-align: center;">삭제,결제</th>               
                </tr>
              </thead>
              <tbody>
                 <c:forEach items="${list }" var="p" varStatus="pv">
              		<tr>
              			<td style="text-align: center;"><img src="${path }/resources/upload/board/${p['ATTACHREFILENAME'] }" height="50px" width="50px"></td>
              			<td style="text-align: center;"><c:out value="${p['SALENAME'] }"/></td>
              			<td style="text-align: center;"><c:out value="${p['SALEPRICE'] }"/></td>
              			<td style="text-align: center;"><c:out value="${p['PANIERAMOUNT'] }"/></td>
              			<td style="text-align: center;"><c:out value="${p['SALEPRICE'] * p['PANIERAMOUNT']}"/></td>
              			<td style="text-align: center;">
              				<input type="button" id="${p['PANIERCODE']}" class="btn btn-danger" value="삭제"  onclick="panierDelect(this.id);">
              				<input type="button" id="${p['PCODE']}" class="btn btn-primary" value="결제" onclick="paymentView(this.id);">
              			</td>
              	    </tr>
              	    <input type="hidden" name="cId" id="cid" value="${loginClient.CId}">
              	    <input type="hidden" name="panierCode" id="paCode" value="${p['PANIERCODE']}">
              	    <input type="hidden" name="pCode" id="pcode" value="${p['PCODE']}">
              	    
              	    <input type="text" name="payAmount" value="${p['PANIERAMOUNT'] }">
              	    <input type="text" name="name" value="${p['SALENAME'] }">
              	    <input type="text" name="price" value="${p['SALEPRICE'] }">
              	    <input type="text" name="panierCode" value="${p['PANIERCODE'] }">
              	    <input type="text" name="totalPrice" value="${p['SALEPRICE'] * p['PANIERAMOUNT']}">
              	    
                 </c:forEach>
              </tbody>
            </table>
            <div id="pageBar" style="text-align: center; color: black;">
              ${pageBar }
            </div>
          </div>

          <br><br>

        </div>
 </div>
 </form>
  
	<script>
	
	
	var panierCode = $('#paCode').val();
	var cId = $('#cid').val();
	var pCode = $('#pcode').val();
	
	function panierDelect(el){
		if(confirm("장바구니를 삭제하시겠습니까?")) {
			location.href="${pageContext.request.contextPath}/client/panierDelete?panierCode="+el+"&cId="+cId;	
		}
		console.log(panierCode);
	}
	
// 	function paymentView(pc) {
		
// 		if(confirm("결제페이지로 이동하시겠습니까?")) {
// 			location.href="${pageContext.request.contextPath}/detail/detailView?pCode="+pc;	
// 		}
// 	}
	
	function paymentView(pc) {
		
		panierFrm.action="${pageContext.request.contextPath}/panier/payment";
		if(confirm("결제페이지로 이동하시겠습니까?")) {
			panierFrm.submit();
		}
	}
	
	</script>

</body>

 

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
