<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>

<style>

input , select {
  border: 1px solid #c4c4c4;
  border-radius: 5px;
  background-color: #fff;
  padding: 3px 5px;
/*   box-shadow: inset 0 3px 6px rgba(0,0,0,0.1); */
  width: 190px;
}
[type="date"] {
  background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
}
[type="date"]::-webkit-inner-spin-button {
  display: none;
}
[type="date"]::-webkit-calendar-picker-indicator {
  opacity: 0;
}
</style>

<section id="content">
	<form name="paymentFrm" class="paymentViewForm" method="post">
			  <div class="container">
				<div class="row">
					<table class="table table-responsive">
					    <thead style="background-color: #EAEAEA;">
					        <tr>
					            <th>품목이름</th>
					            <th>수량</th>
					            <th>배송일</th>
					            <th>배송선택</th>
					            <th>상품금액</th>
					            <th>총 합계 금액</th>
					        </tr>
					    </thead>
					    <tbody>
					        <tr>
					            <td>${name }</td>
					            <td>${payAmount }</td>
					            <td>
					            	<input type="date" name="payDay" id='dateofbirth'>
					            </td>
					            <td>
					            	<select name="ship" id="selectShip">
			                    		<option value="00">배송 선택</option>
			                    		<option value="5000">서울,경기 (+ 5000원)</option>
			                    		<option value="15000">서울,경기 외 (+ 15000원)</option>
			                    		<option value="0">직접방문 (+ 0원)</option>
			                    	</select>	
					            </td>
					            <td>${price * payAmount }</td>
					            <td>${totalPrice }</td>
					        </tr>
					    </tbody>
					</table>
				</div>
			</div>
		
		<input type="text" id="price2" value="${price * payAmount }">
		<input type="text" id="totalprice2" value="${totalPrice }">
		<input type="text" id="hap" value="">
		
		<script>
		
				var price2 = $('#price2').val();
				var ship2 = $('#totalprice2').val();
				var selectShip = $('#selectShip').val();
				$('#hap').val(price2+parseInt(shipPrice));
				
				
		</script>
		
			<div class="container text-center well">
				
				<div class="col-sm-12">
					<h1>주문자 정보</h1>
					
					<div class="col-sm-8" style="float: none; margin-left: 15%; auto;">
						
						<div class="form-group has-warning">
                        	<label class="col-xs-4 control-label">주문하시는분</label>
                        		<div class="col-xs-8">
                            		<input type="text" id="buyerName" class="form-control" value="${loginClient.CName }"><br>
                        		</div>
                		</div><br>
                		
                		<div class="form-group has-warning">
                        	<label class="col-xs-4 control-label">전화번호</label>
                        		<div class="col-xs-8">
                            		<input type="text" id="buyerPhone" class="form-control" value="${loginClient.CPhone }"><br>
                        		</div>
                		</div><br>
                		
                		<div class="form-group has-warning">
                        	<label class="col-xs-4 control-label">이메일</label>
                        		<div class="col-xs-8">
                            		<input type="text" id="buyerAddr" class="form-control" value="${loginClient.CEmail }"><br>
                        		</div>
                		</div><br>
					</div>
				</div>
				
				
				<div class="col-sm-12 well">
					<h1>배송지 정보</h1>
					<div class="col-sm-10"  style="float: none; margin-left: 10%; auto;">
						
						<div class="form-group has-warning">
                        	<label class="col-xs-4 control-label">받으실분</label>
                        		<div class="col-xs-8">
                            		<input type="text" name="payName" id="inputSuccess" class="form-control" value="${loginClient.CName }" style="width: 100px; height: 30px;"><br>
                        		</div>
                		</div><br>
                		
                		<div class="form-group has-warning">
                        	<label class="col-xs-4 control-label">우편번호</label>
                        		<div class="col-xs-8">
                            		<input type="text" name="payAddr1" id="zonecode" class="form-control" value="${loginClient.CAddr1 }" readonly style="width: 90px; height: 30px;">
                        			 
                        		</div>
                		</div>

                		<div class="form-group has-warning">
                        	<label class="col-xs-4 control-label">주소</label>
                        		<div class="col-xs-8">
                            		<input type="text" name="payAddr2" id="address" class="form-control" value="${loginClient.CAddr2 }" readonly>
                        		</div>
                		</div>

                		<div class="form-group has-warning">
                        	<label class="col-xs-4 control-label">상세주소</label>
                        		<div class="col-xs-8">
                            		<input type="text" name="payAddr3" id="address_etc" class="form-control" value="${loginClient.CAddr3 }"><br>
                        		</div>
                		</div><br>

                		<div class="form-group has-warning">
                        	<label class="col-xs-4 control-label"></label>
                        		<div class="col-xs-8">
                            		<input type="button" onClick="openDaumZipAddress();" class="btn btn-lg btn-primary" value = "주소변경"><br>
                        		</div>
                		</div><br>
                		
                		<div class="form-group has-warning">
                        	<label class="col-xs-4 control-label">전화번호</label>
                        		<div class="col-xs-8">
                            		<input type="text" name="payPhone" id="inputSuccess" class="form-control" value="${loginClient.CPhone }"><br>
                        		</div>
                		</div><br>
                		
                		<div class="form-group has-warning">
                        	<label class="col-xs-4 control-label">배송 시간</label>
                        		<div class="col-xs-6">
                            		<select name="payTime" id="selectShip" class="form-control">
			                    		<option value="0">시간 선택</option>
			                    		<option value="06~08시">06~08시 도착</option>
			                    		<option value="08~10시">08~10시 도착</option>
			                    		<option value="10~12시">10~12시 도착</option>
			                    		<option value="12~14시">12~14시 도착</option>
			                    		<option value="14`16시">14~16시 도착</option>
			                    		<option value="16~18시">16~18시 도착</option>
			                    	</select><br>
                        		</div>
                		</div>
                		
                		<div class="form-group has-warning">
                        	<label class="col-xs-4 control-label">요청사항</label>
                        		<div class="col-xs-8">
                            		<textarea name="payMemo" rows=7 cols=140 class="form-control" name="reviewContent" style="resize: none;"></textarea><br>
                        		</div>
                		</div><br>
                		
                		
					</div>
				</div><br><br>
				
				<input type="hidden" name="cId" value="${loginClient.CId }">
				<input type="hidden" name="pCode" value="${pCode }">
				<input type="hidden" name="payAmount" value="${panierAmount }">
				<input type="hidden" name="payPrice" id="totalprice1" value="${totalprice }">
				<input type="hidden" name="payDay" value="${date }"><br><br>

				
<!-- 			<button class="btn btn-lg btn-primary btn-block" type="submit">결제</button><br><br><br> -->
<!-- 			<button id="check_module" type="button">아임 서포트 결제 모듈 테스트 해보기</button> -->
			 <input type="button" id="check_module" class="btn btn-danger" value="결제하기">
			</div>
		</form>
		
		 
</section>

<script>
	
  	document.getElementById('dateofbirth').value = new Date().toISOString().substring(0, 10);
  	
</script>

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

	$('#address_etc').val("");

}

	
///////////////////////////////////////////
		
		
		$("#check_module").click(function () {

			var totalprice = $('#totalprice1').val();
			console.log(totalprice.substr(0,totalprice.length-1));
			var totalprice1 = parseInt(totalprice.substr(0,totalprice.length-1));
			console.log(parseInt(totalprice.substr(0,totalprice.length-1)));
			$('#totalprice1').val(parseInt(totalprice.substr(0,totalprice.length-1)));
			
			
			if(PayValidation())
				{
				IMP.init('imp80374196');
				
				IMP.request_pay({
					 	pg : 'html5_inicis',
					    pay_method : 'card',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : "${name }",
					    amount : "${totalprice}",
					    buyer_email : $('#buyerEmail').val(),
					    buyer_name : $('#buyerName').val(),
					    buyer_tel : $('#buyerPhone').val(),
					    buyer_addr : $('#address').val() + " " + $('#address_etc').val(),
					    buyer_postcode : $('#zonecode').val()
					    
				}, function (rsp) {
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        paymentFrm.action="${pageContext.request.contextPath}/payment";
					    paymentFrm.submit();
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				    }
				    alert(msg);
				    
					});
				}
		});
		
		function PayValidation() {
		if($('#selectShip').val()=="0") {
			alert("시간을 선택해주세요.");
			
			return false;
			}
		return true;
		}
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>