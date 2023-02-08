<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="memberMypageSub.jsp"%>

<style type="text/css">
#memberOrderListdiv {width:100%; height:745px;}
table#memberOrderList {margin: 0 auto; border-collapse:collapse; width:50%;  border-top:0.5px solid black;}
#orderArticle h2 {text-align: center;}
#orderArticle hr {width: 200px; border: 1px solid gray;}
#memberOrderList td {text-align: center; font-family: Verdana;  border-bottom:0.5px solid black;  padding:5px 5px 0 0;}
#memberOrderDetailButton {width:100px; height:40px; background:#d0d0d0; cursor: pointer; font-size: 16px; border:0; border-radius:5px;}
</style>

<div id="memberOrderListdiv">
		<article  id="orderArticle">
			<h2>
	            ${memberOrderListT } 주문내역
	         </h2>
            <hr><br>
            <table id="memberOrderList">
                <c:forEach items="${memberOrderList }" var="ovo">
                    <tr>
                        <td style="width:20%">
                            <div id="memberOrderListimg">
                                <a href="fooba.do?command=restaurantDetail&rseq=${ovo.rseq }"><img src="images/title/${ovo.rimage }" width="80" height="80"></a>
                            </div>
                            <div>${ovo.rname }</div>
                        </td>
                        <td style="width:60%">
                            <div id="memberOrderListIntime" style="text-align: left; font-size: 70%; margin: 10px;">
                                <fmt:formatDate value="${ovo.indate }" type="date"/>
                            </div>
                            <div id="memberOrderListMenu" style="text-align: left; margin: 10px;">
                                ${ovo.oname }
                            </div>
                            <div id="memberOrderListPrice" style="text-align: left; margin: 10px;">
                                 <fmt:formatNumber value="${ovo.totalprice }" pattern="#,###"/>원
                            </div>
                        </td>
                        <td style="width:30%">
                            <div id="memberOrderListStatement" style="margin: 10px">
	                            <c:choose>
			                    	<c:when test="${ovo.result==0}">
			                    		주문확인중
			                    	</c:when>
			                    	<c:when test="${ovo.result==1}">
			                    		배달중
			                    	</c:when>
			                    	<c:when test="${ovo.result==2}">
			                    		배달완료
			                    	</c:when>
			                    	<c:when test="${ovo.result==3}">
			                    		후기작성완료
			                    	</c:when>
		                    	</c:choose>	
                            </div>
                            <div id="memberOrderListDetail" margin="10" >
                                <input type="button" value="주문상세" id="memberOrderDetailButton" onclick="location.href='fooba.do?command=memberOrderDetail&oseq=${ovo.oseq}'"/>
                            </div>            
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <br>
             <c:if test="${orderList=='ing'}">
					<div id="paging" style="font-size:110%; font-weight:bold; margin-left:60%;">
						<c:if test="${paging.prev}">
							<a href="fooba.do?command=memberOrderList&page=${paging.beginPage-1}">◀</a>&nbsp;
						</c:if>
						<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
							<c:choose>
								<c:when test="${paging.page==index}">
									<span style="color:red">${index}&nbsp;</span>
								</c:when>
								<c:otherwise>
									<a href="fooba.do?command=memberOrderList&page=${index}" style="text-decoration: none; color:black;">${index}</a>&nbsp;
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.next}">
							<a href="fooba.do?command=memberOrderList&page=${paging.endPage+1}">▶</a>&nbsp;
						</c:if>
				</div>
			</c:if>
            <c:if test="${orderList=='all'}">
					<div id="paging" style="font-size:110%; font-weight:bold; margin-left:60%;">
						<c:if test="${paging.prev}">
							<a href="fooba.do?command=memberOrderAll&page=${paging.beginPage-1}">◀</a>&nbsp;
						</c:if>
						<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
							<c:choose>
								<c:when test="${paging.page==index}">
									<span style="color:red">${index}&nbsp;</span>
								</c:when>
								<c:otherwise>
									<a href="fooba.do?command=memberOrderAll&page=${index}" style="text-decoration: none; color:black;">${index}</a>&nbsp;
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.next}">
							<a href="fooba.do?command=memberOrderAll&page=${paging.endPage+1}">▶</a>&nbsp;
						</c:if>
				</div>
			</c:if>

            
        </article>
</div>
<%@ include file="../footer.jsp"%>
