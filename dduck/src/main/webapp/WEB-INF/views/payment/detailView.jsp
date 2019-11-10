<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="상세페이지"/>
</jsp:include>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR|Sunflower:300&display=swap" rel="stylesheet">
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
#div1{
	font-family: 'Noto Sans KR', sans-serif;
}


</style>

<section id="content">

	<form name="calculatorFrm" class="detailViewForm" method="post" >
    <div class="container">
        <div class="row">
                <br>
            <div class="col-sm-8">
                <div class="carousel-inner" role="listbox">
                	<c:forEach items="${att }" var="a" varStatus="at">
                		<c:if test='${a["attachFlag"]=="1" }'>
                    		<img src='${pageContext.request.contextPath}/resources/upload/board/${a["attachReFileName"]}' alt="Image"
                    		style="width:800px; height:550px;">
                    		<input type = "hidden" name ="img" value="${a['attachReFileName'] }">
                		</c:if>
                	</c:forEach>
                </div>
            </div>
            <div class="col-sm-4">
                <div style="background-color: white;">
                    	<br>
                    	<h2 style="text-align: center"><p style="font-family: 'Black Han Sans', sans-serif;">${saleList["SALENAME"] }</p></h2><hr>
                    	
                    	<input type = "hidden" name = "name" value="${saleList['SALENAME'] }">
                    	<input type = "hidden" name = "cId" value="${loginClient.CId }"/>
                    	<input type = "hidden" name = "pCode" value="${saleList['PCODE'] }"/>
                    	
                    	<div class="form-group">
                    	<label class="col-xs-4 control-label"><p style="font-family: 'Do Hyeon', sans-serif;">판매가</p></label>
                    	<div class="col-xs-8"  id="div1">
                    	<input type="text" id="price1" value="${saleList['SALEPRICE'] }원" style="border:none;" readonly>
                    	<input type="hidden" id="price" value="${saleList['SALEPRICE'] }" style="border:none" readonly>
                    	</div><br>
                    	</div>
                    	
                    	<input type="hidden" id="productPrice" name="productPrice">
                    	
                    	
                    	<div class="form-group">
                    	<label class="col-xs-4 control-label"><p style="font-family: 'Do Hyeon', sans-serif;">수량</p></label>
                    	<div class="col-xs-8" id="div1">
                    	&nbsp;최소한개
                    	</div><br>
                    	</div>
                    	
                    	<div class="form-group">
                    	<label class="col-xs-4 control-label"><p style="font-family: 'Do Hyeon', sans-serif;">브랜드</p></label>
                    	<div class="col-xs-8"  id="div1">
                    	&nbsp;내마음이 콩떡콩떡집
                    	</div><br>
                    	</div>
                    	
                    	<div class="form-group">
                    	<label class="col-xs-4 control-label"><p style="font-family: 'Do Hyeon', sans-serif;">원산지</p></label>
                    	<div class="col-xs-8"  id="div1">
                    	&nbsp;아래참조
                    	</div><br>
                    	</div>
                    	
                    	<div class="form-group">
                    	<label class="col-xs-4 control-label"><p style="font-family: 'Do Hyeon', sans-serif;">배송날짜</p></label>
                    	<div class="col-xs-8"  id="div1">
						<input type="date" name="date" id='datePicker' >
						</div><br>
                    	</div>
                    	
                    	<div class="form-group">
                    	<label class="col-xs-4 control-label"><p style="font-family: 'Do Hyeon', sans-serif;">수량</p></label>
                    	<div class="col-xs-8"  id="div1">
                    	<input type="number" name="panierAmount" value="1" min="1" id="amount" onChange="OnKeyUp()">
                    	</div><br>
                    	</div>
                    	
                    	<div class="form-group">
                    	<label class="col-xs-4 control-label"><p style="font-family: 'Do Hyeon', sans-serif;">배송비용</p></label>
                    	<div class="col-xs-8"  id="div1">
                    	<select name="ship" id="selectShip" onChange="changePrice()">
                    		<option value="00">배송 선택</option>
                    		<option value="5000">서울,경기 (+ 5000원)</option>
                    		<option value="15000">서울,경기 외 (+ 15000원)</option>
                    	</select>
                    	</div><br><hr>
                    	</div>
                    	
                    	<input type="hidden" name="dCheck" value="0">
                    	
                    	<div class="form-group">
                    	<label class="col-xs-4 control-label" style="margin-top: 5%;"><p style="font-family: 'Do Hyeon', sans-serif;">총 합계 금액</p></label>
                    	<div class="col-xs-6"  id="div1">
							<input type="text" name="totalprice" id="totalprice" style="border:none; text-align:center; font-size: 200%;" value="${saleList['SALEPRICE'] }원" readonly>
						<br><br>
						</div>
							
						<br>
                    	</div>
                </div>
				<c:if test="${loginClient.CId != 'admin'}">  
				<div class="col-md-12 text-center">
                    <input type="button" class="btn btn-primary" style="width: 100%;" value="장바구니"  onclick="jangbaguni();"><br><br>
                </div>
                <div class="col-md-12 text-center">
               <input type="button" class="btn btn-danger" style="width: 100%;" value="주문하기" onclick="payment();">
                </div>
                </c:if>
              	<c:if test="${loginClient.CId eq 'admin'}">  
                <div class="col-md-12 text-center">
               <input type="button" class="btn btn-danger" value="수정하기" onclick="boardUpdate();">
                </div>
                
                <div class="col-md-12 text-center">
               <%--  <input type = "text" id="pCode" value="${paymentList['PCODE'] }"/> --%>
                                                             
               <input type="button" class="btn btn-danger" value="삭제하기" onclick="boardDelete();">
                </div>
                </c:if>
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
		
		if(buyValidation())
			{
			if(confirm("확인 버튼을 누르면 결제창으로 넘어갑니다")){
				calculatorFrm.submit();
			}
			}
		
		
	}
		
		function buyValidation()
		{
			if((${empty loginClient})) {
				alert('로그인이 필요한 서비스 입니다');
				location.href="${path}/login/loginView.do";
				
				return false;
			}
			
			if(($('#datePicker').val()) == "") {
				alert('배송날짜를 선택해주세요');
				
				return false;
			}
			
			if(($('#selectShip').val()) == "00") {
				alert('배송 비용을 선택하세요');
				
				return false;
			}
			
			
			return true;
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
			var total = parseInt(price*count)+parseInt(shipPrice)+"원";
			var total1 = $(totalprice).val(total); 
		}
		
		$(function(){
			$("#amount").on({"change":OnKeyUp,"keyup":OnKeyUp});
			
			OnKeyUp();
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
			var total1 = parseInt(selectValue)+ (parseInt(price1) * parseInt(amount1))+"원";
			totalprice1.value = total1;
			
			console.log(price1);
			console.log(amount1);
			var productPrice = document.getElementById("productPrice");
			var produc = parseInt(price1)*parseInt(amount1)+"원";
			productPrice.value = produc;
		}
		
	
	</script>
	
	<script>
	
	  	document.getElementById('datePicker').value = new Date().toISOString().substring(0, 10);
	  	
	  	document.getElementById('datePicker').value = new Date(new Date().setDate(new Date().getDate()+1)).toISOString().substring(0, 10);
		console.log(new Date(new Date().setDate(new Date().getDate()+1)));
		
		$('#datePicker').attr("min",new Date(new Date().setDate(new Date().getDate()+1)).toISOString().substring(0, 10));
		
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
        <div class="col-sm-12 row">
            <h1 style="font-family: 'Black Han Sans', sans-serif;">${saleList['SALENAME'] }</h1><br><hr>
            <br>
            <pre style="background-color: white; font-size: 30px; font-family: 'Nanum Gothic Coding', monospace; border:0px;">${saleList['DETAILSINFO'] }</pre><hr>
            <br>
            <div class="row">
            <img src="${pageContext.request.contextPath }/resources/images/abcd1.png"  />
            <img src="${pageContext.request.contextPath }/resources/images/jumun.jpg"  />
            <img src="${pageContext.request.contextPath }/resources/images/baesong.png"  />
            
            </div>
        </div><br>
    </div><hr><br>
    
	<form name="reviewBoard"  method="post" action="${pageContext.request.contextPath}/review/reviewForm">
    <div class="container text-center"> <br>
            <div class="col-sm-12 row" style="background-color:white;">
                <h3 style="font-family: 'Black Han Sans', sans-serif; font-size: 50px;">후기를 등록해주세요</h3><br>
                <input type="hidden" name="cId" value="${loginClient.CId }">
                <input type="hidden" name="pCode" value="${saleList['PCODE'] }">
                
                <div class="col-sm-12 row well" style="float: none; margin: 0 auto; background-color: #EAEAEA;">
                    <select class="form-control" name="reviewStar" style="font-family: 'Do Hyeon', sans-serif;" >
                        <option value="★★★★★">★★★★★ 아주만족</option>
                        <option value="★★★★">★★★★ 만족</option>
                        <option value="★★★">★★★ 보통</option>
                        <option value="★★">★★ 미흡</option>
                        <option value="★">★ 불만족</option>
                    </select><br>
                    <textarea rows=7 cols=140 class="form-control" name="reviewContent" placeholder="후기를 등록하세요 (500자 이하)" style="resize: none; font-family: 'Sunflower', sans-serif;"></textarea><br>
                    <c:choose>
                    <c:when test="${loginClient.CId == null}">
                    <p>로그인이 필요한 서비스 입니다.</p>
                	</c:when>
                	<c:otherwise>
                	<input type="submit"class="btn btn-danger" value="리뷰등록"><br>
                	</c:otherwise>
                	</c:choose>
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
					<h1 style="color:#EDD200;">${r["REVIEWSTAR"]}</h1>
					<h3>${r["CID"]}</h3>
					<h4><fmt:formatDate value='${r["REVIEWEN"]}' pattern="yyyy.MM.dd"/></h4>
					
					<c:if test="${loginClient.CId eq r['CID']}">
							<div class="col-sm-12">
							<input type="button" class="btn" value="수정"  id='${r["REVIEWNO"]}' onclick="reviewUpdate(this);">
							<input type="button" class="btn" value="삭제" id='${r["REVIEWNO"]}' onclick="reviewDelete(this);">
							</div>
					</c:if>
					
				</div>
				<div class="col-sm-8" >
					<textarea class="form-control" id="textarea" rows=7 cols=80 readonly style="background-color: white; resize: none; font-family: 'Sunflower', sans-serif;">${r["REVIEWCONTENT"]}</textarea><br>
					<br>
					<div class="add1"></div>
				</div>
			</div>
			<br>
		</c:forEach>
		<div id="pageBar" style="text-align: center; color: black;">
              ${pageBar }
            </div>
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
		
 		if(confirm("리뷰를 삭제하시겠습니까?")) {
		      location.href="${pageContext.request.contextPath}/review/reviewDelete?reviewNo="+$('#no').val()+"&PCode="+$('#deletepcode').val();
		      console.log($('#no').val());
			
		}
	}

</script>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>