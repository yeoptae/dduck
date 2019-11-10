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
			<h4 style="padding:10px;">마이 페이지</h4>
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
		<h1 class="text-center" style="font-family: 'Black Han Sans', sans-serif;">장바구니</h1>
          <div class="container-fluid" style="margin-top: 5%">
            <table class="table" style="font-family: 'Do Hyeon', sans-serif;">
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
              <tbody style="font-family: 'Noto Sans KR', sans-serif;">
                 <c:forEach items="${list }" var="p" varStatus="pv">
              		<tr>
              			<td style="text-align: center;"><img src="${path }/resources/upload/board/${p['ATTACHREFILENAME'] }" height="50px" width="50px"></td>
              			<td style="text-align: center;"><a id="${p['PCODE']}" onclick="move1(this.id);"><c:out value="${p['SALENAME'] }"/></a></td>
              			<td style="text-align: center;"><c:out value="${p['SALEPRICE'] }"/>원</td>
              			<td style="text-align: center;"><c:out value="${p['PANIERAMOUNT'] }"/>개</td>
              			<td style="text-align: center;"><c:out value="${p['SALEPRICE'] * p['PANIERAMOUNT']}"/>원</td>
              			<td style="text-align: center;">
              				<input type="button" id="${p['PANIERCODE']}" class="btn btn-danger" value="삭제"  onclick="panierDelect(this.id);">
              				<input type="button" id="${p['PANIERCODE']}" class="btn btn-primary" value="결제" onclick="paymentView(this.id);">
              			</td>
              	    </tr>
              	    <input type="hidden" id="cId" value="${loginClient.CId}">
              	    
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
	<script>
	
	
	var panierCode = $('#paCode').val();
	var cId = $('#cid').val();
	var pCode = $('#pcode').val();
	
	function panierDelect(el){
		if(confirm("장바구니를 삭제하시겠습니까?")) {
			location.href="${pageContext.request.contextPath}/client/panierDelete?panierCode="+el+"&cId="+$('#cId').val();	
// 			location.href="${pageContext.request.contextPath}/client/panierDelete?cId="+cId;	
		}
		console.log(panierCode);
	}
	
	function move1(pc) {
		
		if(confirm("이동하시겠습니까?")) {
			location.href="${pageContext.request.contextPath}/detail/detailView?pCode="+pc;	
		}
	}
	
	function paymentView(pc) {
		
		if(confirm("결제페이지로 이동하시겠습니까?")) {
		location.href="${pageContext.request.contextPath}/panier/payment?panierCode="+pc;
// 		panierFrm.action="${pageContext.request.contextPath}/panier/payment";
// 			panierFrm.submit();
		}
	}
	
	</script>

</body>

 

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
