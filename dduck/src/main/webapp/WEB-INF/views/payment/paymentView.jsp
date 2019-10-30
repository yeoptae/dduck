<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>

<section id="content">

			  <div class="container">
				<div class="row">
					<table class="table table-responsive">
					    <thead style="background-color: #EAEAEA;">
					        <tr>
					            <th>품목이름</th>
					            <th>수량</th>
					            <th>배송일</th>
					            <th>상품금액</th>
					            <th>배송비용</th>
					            <th>총 합계 금액</th>
					        </tr>
					    </thead>
					    <tbody>
					        <tr>
					            <td>${name }</td>
					            <td>${panierAmount }</td>
					            <td>${date }</td>
					            <td>${productPrice }원</td>
					            <td>${ship }원</td>
					            <td>${totalprice }원</td>
					        </tr>
					    </tbody>
					</table>
				</div>
			</div>
		
			
			<div class="container text-center well">
				
				<div class="col-sm-12">
					<h1>주문자 정보</h1>
					
					<div class="col-sm-8" style="float: none; margin-left: 15%; auto;">
						
						<div class="form-group has-warning">
                        	<label class="col-xs-4 control-label">수령인</label>
                        		<div class="col-xs-8">
                            		<input type="text" id="inputSuccess" class="form-control" value="${loginClient.CName }"><br>
                        		</div>
                		</div><br>
                		
                		<div class="form-group has-warning">
                        	<label class="col-xs-4 control-label">전화번호</label>
                        		<div class="col-xs-8">
                            		<input type="text" id="inputSuccess" class="form-control" value="${loginClient.CName }"><br>
                        		</div>
                		</div><br>
                		
                		<div class="form-group has-warning">
                        	<label class="col-xs-4 control-label">이메일</label>
                        		<div class="col-xs-8">
                            		<input type="text" id="inputSuccess" class="form-control" value="${loginClient.CName }"><br>
                        		</div>
                		</div><br>
					</div>
				</div>
				
				
				<div class="col-sm-12 well">
					<h1>배송지 정보</h1>
					<div class="col-sm-10 well"  style="float: none; margin-left: 10%; auto;">
						
						<div class="form-group has-warning">
                        	<label class="col-xs-4 control-label">받으실분</label>
                        		<div class="col-xs-8">
                            		<input type="text" id="inputSuccess" class="form-control" value="${loginClient.CName }"><br>
                        		</div>
                		</div><br>
                		
                		<div class="form-group has-warning">
                        	<label class="col-xs-4 control-label">주소</label>
                        		<div class="col-xs-8">
                            		<input type="text" id="inputSuccess" class="form-control" value="${loginClient.CName }"><br>
                        		</div>
                		</div><br>
                		
                		<div class="form-group has-warning">
                        	<label class="col-xs-4 control-label">전화번호</label>
                        		<div class="col-xs-8">
                            		<input type="text" id="inputSuccess" class="form-control" value="${loginClient.CName }"><br>
                        		</div>
                		</div><br>
                		
                		
					</div>
				</div>
			
			</div>
		
		
		
</section>

<script>
function openDaumZipAddress() {

	new daum.Postcode({

		oncomplete:function(data) {

			jQuery("#zonecode").val(data.zonecode);

			jQuery("#address").val(data.address);

			jQuery("#address_etc").focus();

			console.log(data);

		}

	}).open();

}

</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>