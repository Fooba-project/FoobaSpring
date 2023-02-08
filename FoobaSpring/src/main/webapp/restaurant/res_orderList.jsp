<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/restaurant/res_header.jsp"%>
<%@ include file="/restaurant/res_subhead.jsp"%>

        <div id="res_tab">
            <div class="res_infotab" onclick="location.href='fooba.do?command=res_order'">진행중인 주문 현황</div>      
            <div class="res_infotab" onclick="location.href='fooba.do?command=res_orderAll'">총 주문현황</div>
        </div>
        
        <form id="res_menuall" name="rfm" method="post" >
                    <c:forEach items="${res_OrderList}" var="ovo">
                    <div id="res_orderlistitems">
                        <div class="res_order_list">
			                <div>
			                    주문번호 : ${ovo.oseq}
			                </div>
			                <div>
			                    주문일시 : <fmt:formatDate value="${ovo.indate}" type="date" pattern="yyyy-MM-dd (a)hh:mm:ss" />
			                </div>
			                <div id="wnanssodur">
			                    <div id="wnanssodurwpahr">주문내역 : </div><div id="wnanssodursodyd">${ovo.oname}</div> 
			                </div>
			                <div>
			                    주문금액 : <fmt:formatNumber value="${ovo.totalprice }" pattern="#,###원"/>
			                </div>
			                <div>
			                    주문상태 : 
			                    <c:if test="${ovo.result==0 }">
			                    주문확인중 <input id="res_OrderResultButton" type="button" value="다음으로" 
			                    onclick="go_order_save(${ovo.oseq})"/>
			                    </c:if>
			                    <c:if test="${ovo.result==1 }">
			                    배달중 <input id="res_OrderResultButton" type="button" value="다음으로" 
			                    onclick="go_order_save(${ovo.oseq})"/>
			                    </c:if>
			                    <c:if test="${ovo.result==2 }">
			                    배달완료
			                    </c:if>
			                    <c:if test="${ovo.result==3 }">
			                    리뷰완료
			                    </c:if>
			                </div>
			            </div>
                        
                        <div class="menuorderdetaildiv">
                            <div id="menuorderdetaildiv3">닉네임 : ${ovo.nick}</div>
                            <div id="menuorderdetaildiv3">배달주소 : ${ovo.address1}&nbsp;${ovo.address2}</div>
                            <div id="menuorderdetaildiv3">전화번호 : ${ovo.phone}</div>
                            <div id="menuorderdetaildiv3">배달/포장여부 : 
                                <c:if test="${ovo.rideryn==0}">
                                    배달
                                </c:if>
                                <c:if test="${ovo.rideryn==1}">
                                    포장
                                </c:if>
                            </div>
                            <div id="menuorderdetaildiv3">일회용품 여부 : 
                                <c:if test="${ovo.rideryn==0}">
                                    사용
                                </c:if>
                                <c:if test="${ovo.rideryn==1}">
                                    미사용
                                </c:if>
                            </div>
                            <div id="menuorderdetaildiv3">결제방법 : 
                                <c:if test="${ovo.rideryn==0}">
                                    카드결제
                                </c:if>
                                <c:if test="${ovo.rideryn==1}">
                                    현금결제
                                </c:if>
                            </div>
                        </div>  
                      <br><hr>
                    </div>
	                </c:forEach>
                </form>
 </div>

<%@ include file="/restaurant/res_footer.jsp"%>