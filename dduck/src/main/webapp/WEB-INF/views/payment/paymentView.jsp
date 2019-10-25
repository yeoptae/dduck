<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>

<section id="content">

        <div class="container text-center">
            <div class="col-sm-12">
                <h1>결제확인</h1>
                <br>
                <div class="col-sm-12" style="float: none; margin: 0 auto;">
                    
                    <table class="table table-striped table-condensed">
                    <tr>
                    	<th style="text-align: center;"><h2>품목이름</h2></th>
                    	<th style="text-align: center;"><h2>갯수</h2></th>
                    	<th style="text-align: center;"><h2>배송일</h2></th>
                    	<th style="text-align: center;"><h2>총 가격</h2></th>
                    </tr>
                    <tbody>
                    <tr>
                    	<td><h3>떡</h3></td>
                    	<td><h3>2</h3></td>
                    	<td><h3>19/10/22</h3></td>
                    	<td><h3>50000원</h3></td>
                    </tr>
                    </tbody>
                    </table>
                </div>
            </div>
        </div>


        <div class="container text-center" style="background-color: white;">
            <div class="col-sm-7" style="border-right:1px solid black; ">
                <h3>배송지정보</h3>
                <br>

                <div class="form-group has-warning">
                        <label class="col-xs-2 control-label">수령인</label>
                        <div class="col-xs-10">
                            <input type="text" id="inputSuccess" class="form-control" placeholder="남태관" style="width: 150px; height: 30px;"><br>
                        </div>
                </div><br>
                <div class="form-group has-warning">
                        <label class="col-xs-2 control-label">주소</label>
                        <div class="col-xs-10">
                            <input type="text" id="inputSuccess" class="form-control" placeholder="우편번호" style="width: 90px; height: 30px;">
                            <input type="text" id="inputSuccess" class="form-control" placeholder="api쓸거지롱" style="width: 300px; height: 30px;">
                            <input type="text" id="inputSuccess" class="form-control" placeholder="엌ㅋㅋ" style="width: 300px; height: 30px;"><br>
                        </div>
                </div><br>
                <div class="form-group has-warning">
                        <label class="col-xs-2 control-label">전화번호</label>
                        <div class="col-xs-10">
                            <input type="text" id="inputSuccess" class="form-control" placeholder='"-" 빼고 입력' style="width: 150px; height: 30px;"><br>
                        </div>
                </div><br>
                <div class="form-group has-warning">
                        <label class="col-xs-2 control-label">이메일</label>
                        <div class="col-xs-10">
                            <input type="email" id="inputSuccess" class="form-control" placeholder="asdfg@naver.com" style="width: 300px; height: 30px;"><br>
                        </div>
                </div><br>
                <div class="form-group has-warning">
                        <label class="col-xs-2 control-label">요청사항</label>
                        <div class="col-xs-10">
                             <textarea class="form-control"  placeholder="서울,경기 지역이면 배송받을시간을 적어주세요." rows=5 cols=50></textarea><br>
                        </div>
                </div><br>
            </div>
            
            
            <div class="col-sm-5">
                <h3>주문자정보</h3>
                <br><br><br><br><br><br>
                
                <div class="form-group has-success">
                        <label class="col-xs-2 control-label">이름</label>
                        <div class="col-xs-10">
                            <input type="text" id="inputSuccess" class="form-control" placeholder="남태관" style="width: 150px; height: 30px;"><br>
                        </div>
                </div><br>
                
                <div class="form-group has-success">
                        <label class="col-xs-2 control-label">전화번호</label>
                        <div class="col-xs-10">
                            <input type="text" id="inputSuccess" class="form-control" placeholder='"-" 빼고 입력' style="width: 150px; height: 30px;"><br>
                        </div>
                </div><br>
                <div class="form-group has-success">
                        <label class="col-xs-2 control-label">이메일</label>
                        <div class="col-xs-10">
                            <input type="email" id="inputSuccess" class="form-control" placeholder="asdfg@naver.com" style="width: 300px; height: 30px;"><br>
                        </div>
                </div><br><br><br><br><br><br><br><br><br><br>
            </div>
        </div><br><br>

        <div class="container text-center">
            <div class="col-sm-12 row"><br><br>
                <button class="btn btn-lg btn-primary btn-block" type="submit">결제</button><br><br><br>
                <div class="row">
                </div>
            </div>
        </div>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>