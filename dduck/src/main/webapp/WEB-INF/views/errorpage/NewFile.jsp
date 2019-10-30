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
        <div class="col-sm-3 sidenav">
           <h4>관리자페이지</h4>
          <ul class="nav nav-pills nav-stacked">
           <li><a href="${pageContext.request.contextPath}/admin/adminmypage.do">주문현황</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/adminClientList.do">회원리스트</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/adminQnaBoard.do">Qna게시판 관리하기</a></li>
             <li><a href="${pageContext.request.contextPath}/admin/insertproduct.do">상품등록</a></li>
          </ul><br> 
           
          
        </div>

        <div class="col-sm-9">

		<h1 class="text-center" style="margin-right: -50px;">정보수정</h1>

        <div class="col-xs-3 col-sm-3"></div>
        <div class="col-xs-8 col-sm-8">

            <div>
                <p>&nbsp;</p>

                <form class="form-horizontal" action="${path }/update/updateEnd.do" method="post">
                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label for="id">아이디</label>
                        </div>
                        <div class="col-sm-6 text-left">
                            <input type="text" class="form-control" name="cId" id="id" value=${client.CId }>
                        </div>
                    </div>

                    <!-- div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="pwd">패스워드</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" name="cPw" id="pwd">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="pwdCheck">패스워드 체크</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" name="pwdCheck" id="pwdCheck">
                        </div>
                    </div> -->
                    
                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="name">이름</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="cName" id="name"  value=${client.CName }>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="email">이메일</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" name="cEmail" id="email" value=${client.CEmail } >
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="zip_num">우편번호</label>
                        </div>
                        <div class="col-sm-3">
                            <input type="text" id="sample6_postcode" placeholder="우편번호" name="cAddr"
                                class="form-control" value=${client.CAddr1 }>
                        </div>
                        <div class="col-sm-3">
                            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
                                class="btn btn-primary">

                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="address1">주소</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="text" id="sample6_address" placeholder="주소" name="cAddr"
                                class="form-control" value=${client.CAddr2 } >
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="address1">상세주소</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="text" id="sample6_address2" placeholder="상세주소" name="cAddr"
                                class="form-control"  value=${client.CAddr3 }>
                        </div>
                    </div>



                    <div class="form-group">
                        <div class="col-sm-2 control-label">
                            <label id="phone">전화번호</label>
                        </div>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="cPhone"  value=${client.CPhone }>
                        </div>
                    </div>


                    <input type="hidden" name="ip" value="${GetIpAddress.getIp()}">
                    <div class="form-group">
                        <div class="col-sm-12  text-center">
                            <input  type="submit" value="정보수정" class="btn btn-primary" style="margin-left: -170px;">
                            <input type="reset" value="취소" class="btn btn-primary">
                        </div>
                    </div>
                </form>
            </div>
        </div>
		
        </div>
  </section>


</body>

 

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>