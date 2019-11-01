<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="상세페이지"/>
</jsp:include>
<style>
        .jumbotron{
            padding-top: 0px !important;
            padding-bottom: 0px !important;
        }
        
        .sample_image1,.sample_image2,.sample_image3,.sample_image4,.sample_image5,.sample_image6  img {
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
}
.sample_image1:hover,.sample_image2:hover,.sample_image3:hover,.sample_image4:hover,.sample_image5:hover,.sample_image6:hover img {
    -webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.2);
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
input , select {
  border: 1px solid #c4c4c4;
  border-radius: 5px;
  background-color: #fff;
  padding: 3px 5px;
/*   box-shadow: inset 0 3px 6px rgba(0,0,0,0.1); */
  width: 190px;
}

</style>

<section id="content">

	<form name="calculatorFrm" class="detailViewForm" method="post">
    <div class="container">
        <div class="row">
                <br>
            <div class="col-sm-8">
                <div class="carousel-inner" role="listbox">
                	<c:forEach items="${att }" var="a" varStatus="at">
                		<c:if test='${a["attachFlag"]=="1" }'>
                    		<img src='${pageContext.request.contextPath}/resources/upload/board/${a["attachReFileName"]}' alt="Image"
                    		style="width:800px; height:550px;">
                		</c:if>
                	</c:forEach>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="well" style="background-color: white;">
                    	<h2 style="text-align: center">${saleList["SALENAME"] }</h2><hr>
                    	
                    	<input type = "hidden" name = "name" value="${saleList['SALENAME'] }">
                    	<input type = "hidden" name = "cId" value="${loginClient.CId }"/>
                    	<input type = "hidden" name = "pCode" value="${saleList['PCODE'] }"/>
                    	
                    	<div class="form-group">
                    	<label class="col-xs-4 control-label">판매가</label>
                    	<div class="col-xs-8">
                    	<input type="text" id="price" value="${saleList['SALEPRICE'] }" style="border:none" readonly>
                    	</div><br>
                    	</div>
                    	
                    	<input type="hidden" id="productPrice" name="productPrice">
                    	
                    	
                    	<div class="form-group">
                    	<label class="col-xs-4 control-label">수량</label>
                    	<div class="col-xs-8">
                    	&nbsp;최소 1개
                    	</div><br>
                    	</div>
                    	
                    	<div class="form-group">
                    	<label class="col-xs-4 control-label">브랜드</label>
                    	<div class="col-xs-8">
                    	&nbsp;내마음이 콩떡콩떡집
                    	</div><br>
                    	</div>
                    	
                    	<div class="form-group">
                    	<label class="col-xs-4 control-label">원산지</label>
                    	<div class="col-xs-8">
                    	&nbsp;아래참조
                    	</div><br>
                    	</div>
                    	
                    	<div class="form-group">
                    	<label class="col-xs-4 control-label">배송날짜</label>
                    	<div class="col-xs-8">
						<input type="date" name="date" id='dateofbirth'>
						</div><br>
                    	</div>
                    	
                    	<div class="form-group">
                    	<label class="col-xs-4 control-label">수량</label>
                    	<div class="col-xs-8">
                    	<input type="number" name="panierAmount" value="1" min="1" id="amount" onChange="OnKeyUp()">
                    	</div><br>
                    	</div>
                    	
                    	<div class="form-group">
                    	<label class="col-xs-4 control-label">배송비용</label>
                    	<div class="col-xs-8">
                    	<select name="ship" id="selectShip" onChange="changePrice()">
                    		<option value=>배송 선택</option>
                    		<option value="5000">서울,경기 (+ 5000원)</option>
                    		<option value="15000">서울,경기 외 (+ 15000원)</option>
                    		<option value="0">직접방문 (+ 0원)</option>
                    	</select>
                    	</div><br><hr>
                    	</div>
                    	
                    	<div class="form-group">
                    	<label class="col-xs-4 control-label">총 합계 금액</label>
                    	<div class="col-xs-8">
						<input type="text" name="totalprice" id="totalprice" style="border:none" readonly>
						</div><br>
                    	</div>
                </div>
				
				<div class="col-md-12 text-center">
                    <input type="button" class="btn btn-primary" value="장바구니" onclick="jangbaguni();"><br>
                </div>
                
                <div class="col-md-12 text-center">
               <input type="button" class="btn btn-danger" value="주문하기" onclick="payment();">
                </div>
                
                <div class="col-md-12 text-center">
               <input type="button" class="btn btn-danger" value="수정하기" onclick="boardUpdate();">
                </div>
                
                <div class="col-md-12 text-center">
               <%--  <input type = "text" id="pCode" value="${paymentList['PCODE'] }"/> --%>
                                                             
               <input type="button" class="btn btn-danger" value="삭제하기" onclick="boardDelete();">
                </div>
            </div>
        </div>
        
    </div>
    </form>
	
	<script>
	   
	
		function jangbaguni(){
			calculatorFrm.action="${pageContext.request.contextPath}/payment/panier";
			if(confirm("장바구니 등록하시겠습니까?")){
			calculatorFrm.submit();
			}
		}
		
		function payment() {
			calculatorFrm.action="${pageContext.request.contextPath}/dduck/payment";
			if(confirm("확인 버튼을 누르면 결제창으로 넘어갑니다")){
				calculatorFrm.submit();
			}
		}
		
		 function boardUpdate(){
		    	calculatorFrm.action="${pageContext.request.contextPath}/admin/boardUpdate.do";
				if(confirm("게시판을 수정하시겠습니까?")){
				calculatorFrm.submit();		
		    }
		 }
		    
		 
		    function boardDelete(){
		    	calculatorFrm.action="${pageContext.request.contextPath}/admin/boardDelete.do";
				if(confirm("삭제하시겠습니까?")){
				calculatorFrm.submit();
		    }
		    }
		    
		function changePrice() {
			
			var price = $("#price").val();
			var count= $("#amount").val();
			var shipPrice=$("#selectShip").val();						
			$("#totalprice").val("");
			$(totalprice).val(parseInt(price*count)+parseInt(shipPrice));
			
		}
		
		$(function(){
			$("#amount").on({"change":OnKeyUp,"keyup":OnKeyUp});
		})
		
		function OnKeyUp() {
			
			var price1 = document.getElementById("price").value;
			var amount1 = document.getElementById("amount").value;
			
			var selectValue = selectShip.options[selectShip.selectedIndex].value.split("|");
			
			var select5000 = selectValue[0]
			var select15000 = selectValue[1]
			var select0 = selectValue[2]
			console.log(select5000);
			
			var totalprice1 = document.getElementById("totalprice");
			totalprice1.value = Number(selectValue)+ (Number(price1) * Number(amount1));
			
			console.log(price1);
			console.log(amount1);
			var productPrice = document.getElementById("productPrice");
			productPrice.value = parseInt(price1)*parseInt(amount1); 
			
		}
		
	
	</script>
	
	<script>
	
  	document.getElementById('dateofbirth').value = new Date().toISOString().substring(0, 10);
  	
	</script>
	
	
 <div class="container text-center">    
  
  <br>
  <div class="row">
  	<c:forEach items="${att }" var="a">
	  	<c:if test='${a["attachFlag"] == 0}'>
		    <div class="sample_image1 col-sm-2">
		      <img src='${pageContext.request.contextPath}/resources/upload/board/${a["attachReFileName"]}' class="img-responsive" 
		      style="width:150px; height:80px;" alt="Image">  
		      
		      
		      
		      <p></p>
		    </div>
	    </c:if>
    </c:forEach>
  </div><hr>
</div><br>
	
	
	<div class="container text-center">
        <div class="col-sm-12 row well"  style="background-color: #F2FF92;">
            <h3>상세보기</h3>
            <br>
            <div class="row">
            <img src="${pageContext.request.contextPath }/resources/images/jumun.jpg"  /><br><br>
            <img src="${pageContext.request.contextPath }/resources/images/baesong.jpg"  /><br>
            
            </div>
        </div><br>
    </div><hr><br>
    
	<form name="reviewBoard"  method="post" action="${pageContext.request.contextPath}/review/reviewForm">
    <div class="container text-center"> <br>
            <div class="col-sm-12 row well" style="background-color:lightyellow;">
                <h3>후기를 등록해주세요</h3><br>
                <input type="hidden" name="cId" value="${loginClient.CId }">
                <input type="hidden" name="pCode" value="${saleList['PCODE'] }">
                
                <div class="col-sm-12 row well" style="float: none; margin: 0 auto; background-color: lightgray;">
                    <select class="form-control" name="reviewStar">
                        <option value="★★★★★">★★★★★ 아주만족</option>
                        <option value="★★★★">★★★★ 만족</option>
                        <option value="★★★">★★★ 보통</option>
                        <option value="★★">★★ 미흡</option>
                        <option value="★">★ 불만족</option>
                    </select><br>
                    <textarea rows=7 cols=140 class="form-control" name="reviewContent" placeholder="후기를 등록하세요 (500자 이하)" style="resize: none;"></textarea><br>
                    <input type="submit" class="btn btn-danger" value="리뷰등록"><br>
                    
                </div>
            </div>
        </div>
        </form>
        
        
        
        <div class="container">
        
        <c:forEach items="${list }" var="r" varStatus="v">
        
			<div class="col-sm-12 row">
				<hr>
				<div class="col-sm-4" style="text-align: center;">
				<input type = "hidden" name = "reviewNo" id = "no" value = '${r["REVIEWNO"]}'/>
				<input type = "hidden" name = "deletepcode" id = "deletepcode" value="${saleList['PCODE'] }"/>
					<h1>${r["REVIEWSTAR"]}</h1>
					<h3>${r["CID"]}</h3>
					<h4>${r["REVIEWEN"]}</h4>
					
					
					<c:if test="${loginClient.CId eq r['CID']}">
							<div class="col-sm-12">
							<input type="button" class="btn" value="수정"  id='${r["REVIEWNO"]}' onclick="reviewUpdate(this);">
							<input type="button" class="btn" value="삭제" id='${r["REVIEWNO"]}' onclick="reviewDelete(this);">
							</div>
					</c:if>
					
				</div>
				<div class="col-sm-8" >
					<textarea class="form-control" id="textarea" rows=7 cols=80 readonly style="background-color: white; resize: none;">${r["REVIEWCONTENT"]}</textarea><br>
					<br>
					<div class="add1"></div>
				</div>
			</div>
			<br>
		</c:forEach>
		${pageBar }
		</div>
		<hr>
		<br>
        

</section>




<script>

	var img = document.getElementsByClassName('img-responsive'); 
	for (var x = 0; x < img.length; x++) { 
		img.item(x).onclick=function() {
			window.open(this.src)
			}; 
		}



	function reviewUpdate(element){
		var target=$(element).parent().parent().next().find('.add1');
		var textArea=$(element).parent().parent().next().find('textarea');
		var id=$(element).attr("id");
		console.log(id);
		$(target).show();
		
		var textareacontent = $(textArea).html();
		console.log("aaaa : "+textareacontent);
		textArea.attr("readOnly",false);
		$(textArea).focus();
		//add1.innerHTML = "<input type='button' value='수정완료' onclick='update();'><input type='button' value='취소' onclick='asdfg();'>";
		var data="<input type='button' value='수정완료' onclick='update("+id+",event);'><input type='button' value='취소' onclick='asdfg(this,\""+textareacontent+"\");'>";
		$(target).html(data);
		console.log($(textArea).val());
		
	}
	
	function update(id,el) {
		var textareacontent=$(el.target).parent().prevAll("textarea").val();
		location.href="${pageContext.request.contextPath}/review/reviewUpdate?reviewNo="+id+"&reviewContent="+textareacontent+"&PCode="+$('#deletepcode').val();
	}
	
	
	function asdfg(element,content) {
		console.log("asdf:"+content)
		var target=$(element).parent();
		console.log(target);	
		var textArea=$(element).parent().prevAll("textarea");
		console.log(textArea);
		$(target).hide();
		$(textArea).val(content);
		textArea.attr("readOnly",true);
		
	}

	
	function reviewDelete() {
		
 		if(confirm("리뷰를 삭제할거냐..?")) {
		      location.href="${pageContext.request.contextPath}/review/reviewDelete?reviewNo="+$('#no').val()+"&PCode="+$('#deletepcode').val();
		      console.log($('#no').val());
			
		}
	}

</script>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>