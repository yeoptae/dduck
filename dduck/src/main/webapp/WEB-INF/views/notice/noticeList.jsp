<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="notice" value="noticelist"/>
</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/style.css">
<section id="content">
    <br><br>
    <div class="mainlist bodystyle">
        <div class="container">
            <div class="row">
             	<c:if test="${loginClient.CId eq 'admin' }">
	            	<div class="pull-left buttonposi">
	            		<input type="button" value="글쓰기" id='btn-add' class='btn btn-lg btn-link' onclick='location.href="${path}/notice/noticeForm"'/>
	            	</div>
             	</c:if>
                <div class="col-md-3">
                    <form action="#" method="get">
                        <div class="input-group">
                            <!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
                            <input class="form-control" id="system-search" name="q" placeholder="검색" required>
                            <span class="input-group-btn">
                                <button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
                            </span>
                        </div>
                    </form>
                </div><br>
                <div class="col-md-9">
                <br>
                 <table class="table table-list-search">
                            <thead>
                                <tr>
                                    <th class="notice-table-6">분류</th>
                                    <th class="notice-table-1">번호</th>
                                    <th class="notice-table-2">제목</th>
                                    <th class="notice-table-3">작성자</th>
                                    <th class="notice-table-4">작성일</th>
                                    <!-- <th class="notice-table-5">조회수</th> -->
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list }" var="n" varStatus="v">
                                <tr class="noticeTrHeight">
                                    <td>
                                    	<c:choose>
                                    		<c:when test='${n["NOTICECATEGORY"] eq "1"}'>
                                    			공지
                                    		</c:when>
                                    	    <c:when test='${n["NOTICECATEGORY"] eq "2"}'>
                                    			이벤트
                                    		</c:when>
                                    	</c:choose>
                                    </td>
                                    <td>
                                    	<c:out value='${n["NOTICECODE"] }'/>
                                    </td>
                                    <td>
                                    	<a href='${path }/notice/noticeView.do?noticeCode=${n["NOTICECODE"]}'>
                                    		<c:out value='${n["NOTICETITLE"] }'/>
                                    	</a>
                                    </td>
                                    <td>
                                    	<c:out value='${n["CID"] }'/>
                                    </td>
                                    <td>
                                    	<fmt:formatDate value='${n["NOTICEEN"] }' pattern="yyyy.MM.dd"/>
										<%-- <c:out value='${n["NOTICEEN"] }'/> --%>
									</td>
                                    <%-- <td>
                                    	<c:out value='${n["NOTICECOUNT"] }'/>
                                    </td> --%>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>   
                       <center>${pageBar }</center>
                </div>
            </div>
        </div>
    </div>
    <script>
    $(document).ready(function() {
        var activeSystemClass = $('.list-group-item.active');

        //something is entered in search form
        $('#system-search').keyup( function() {
        var that = this;
            // affect all table rows on in systems table
            var tableBody = $('.table-list-search tbody');
            var tableRowsClass = $('.table-list-search tbody tr');
            $('.search-sf').remove();
            tableRowsClass.each( function(i, val) {
            
                //Lower text for case insensitive
                var rowText = $(val).text().toLowerCase();
                var inputText = $(that).val().toLowerCase();
                if(inputText != '')
                {
                    $('.search-query-sf').remove();
                    tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "'
                        + $(that).val()
                        + '"</strong></td></tr>');
                }
                else
                {
                    $('.search-query-sf').remove();
                }

                if( rowText.indexOf( inputText ) == -1 )
                {
                    //hide rows
                    tableRowsClass.eq(i).hide();
                    
                }
                else
                {
                    $('.search-sf').remove();
                    tableRowsClass.eq(i).show();
                }
            });
            //all tr elements are hidden
            if(tableRowsClass.children(':visible').length == 0)
            {
                tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
            }
        });
    });
    </script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>