<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
	<!-- RestaurantVO, FoodmenuList, ReviewList, clist-->
<div style="height:${listsize*210}px">
	<div id="realjenche">
        <div id="jenche"> 
        <div id="gageirm">${RestaurantVO.RNAME}</div>
        <div id="gagemain">
           		<img class="smlogo"src="images/title/${RestaurantVO.RIMAGE}" ></img>
         
            <div id="gibon">
            <a class="basic">별점</a>&nbsp;&nbsp;<a class="starr">
	    		<c:choose>
            		<c:when test="${intstar==0}">없음</c:when>
            		<c:when test="${intstar==1}">★☆☆☆☆</c:when>
            		<c:when test="${intstar==2}">★★☆☆☆</c:when>
            		<c:when test="${intstar==3}">★★★☆☆</c:when>
            		<c:when test="${intstar==4}">★★★★☆</c:when>
            		<c:otherwise>★★★★★</c:otherwise>
            	</c:choose>${doublestar}</a><br>
            <a class="grayy">배달팁</a>&nbsp;&nbsp;  ${RestaurantVO.RTIP} 원<br>
            <a class="grayy">결제</a>&nbsp;&nbsp; 신용카드, 현금<br>            
            <a class="grayy">해시태그</a>&nbsp;&nbsp; #${RestaurantVO.HASH}<br>
            </div>
        </div>
        <br>
        <div id="menujengbo">
            <div class="menujengbotab" onclick="menumove(-1);" id="menutabb" style="width:cals(50% - 1px)">메뉴</div>
            <div class="menujengbotab" onclick="menumove(1);" id="jengbotabb" style="width:cals(50% - 1px)">가게 정보/리뷰</div>
        </div>
        
        <div id="tul" style="overflow-y: scroll;">
        	<c:choose>
        		<c:when test="${RestaurantVO.RYN==1}">
        			<div id="menudel">
            			<c:forEach items="${FoodmenuList}" var="FoodmenuVO">
	                		<div id="gagemenu" onclick="menupopup(${FoodmenuVO.FSEQ});">
	                    	<h3>${FoodmenuVO.FNAME }</h3>
	                    	<div class="grayyy">${FoodmenuVO.FCONTENT }</div><br>
	                    	<div class="menugaguk">${FoodmenuVO.FPRICE}원</div>
	                    	<img class="smmenu" src="images/foodmenu/${FoodmenuVO.FIMAGE}">
	                		</div>
                		</c:forEach>
            		</div>
        		</c:when>
        		<c:otherwise>
	        		<div id="menudel" disabled>
	            	<c:forEach items="${FoodmenuList}" var="FoodmenuVO">
		                <div id="gagemenu" onclick="menupopup(${FoodmenuVO.FSEQ});">
		                    <h3>${FoodmenuVO.FNAME }</h3>
		                    <div class="grayyy">${FoodmenuVO.FCONTENT }</div><br>
		                    <div class="menugaguk">${FoodmenuVO.FPRICE}원</div>
		                    <img class="smmenu" src="images/foodmenu/${FoodmenuVO.FIMAGE}">
		                </div>
	                </c:forEach>
	           		</div>
        		</c:otherwise>
        	</c:choose>
        

            <div id="jengboreview"  >
                <div id="gagejengbo">
                    <div id="gagesoge">
                        <h3>사장님 알림</h3><hr>
                        ${RestaurantVO.CONTENT}
                    </div>
                    <br>
                    <div id="gagebunho">
                        <h3>업체 정보</h3><hr>
                        <a class="grayy">사업자 번호</a>&nbsp; ${RestaurantVO.RBIZNUM}<br>
                        <a class="grayy">운영 정보</a>&nbsp;
                        	<c:if test="${RestaurantVO.RYN==0}"> 운영 준비중입니다</c:if>
                        	<c:if test="${RestaurantVO.RYN==1}"> 운영 중입니다</c:if>
                        	<c:if test="${RestaurantVO.RYN==2}"> 당분간 영업을 중지 합니다.</c:if>
                        	<c:if test="${RestaurantVO.RYN==3}"> 휴업 중입니다.</c:if><br>
                        <a class="grayy">전화 번호</a>&nbsp; ${RestaurantVO.RPHONE}<br>
                        <a class="grayy">가게 주소</a>&nbsp; ${RestaurantVO.RADRESS}<br><br>
                    </div>
                </div>
                <div id="reviewbogi">
                    <div id="reviewww">
                        <h2 id="cleanreview">클린리뷰</h2>
                        <h1 id="bigstarr"><a class="starr">
					    		<c:choose>
				            		<c:when test="${intstar==0}">없음</c:when>
				            		<c:when test="${intstar==1}">★☆☆☆☆</c:when>
				            		<c:when test="${intstar==2}">★★☆☆☆</c:when>
				            		<c:when test="${intstar==3}">★★★☆☆</c:when>
				            		<c:when test="${intstar==4}">★★★★☆</c:when>
				            		<c:otherwise>★★★★★</c:otherwise>
				            	</c:choose>${doublestar}</a>
			            </h1>
                    </div>
                    <c:forEach items="${ReviewList}" var="ReviewVO">
	                    <div class="reviewdel">
	                        <div class="rvnaeyong">
	                        <div class="m_nick" ></div>
	                        <a class="rvnick">${ReviewVO.ID }</a>님 &nbsp; 
	                        <a class="grayy"><fmt:formatDate value="${ReviewVO.INDATE }" type="date"/></a><br>
	                        <a class="starr">
								<c:choose>
			                    	<c:when test="${ReviewVO.STAR==1}">★ 1.0</c:when>
			                    	<c:when test="${ReviewVO.STAR==2}">★★ 2.0</c:when>
			                    	<c:when test="${ReviewVO.STAR==3}">★★★ 3.0</c:when>
			                    	<c:when test="${ReviewVO.STAR==4}">★★★★ 4.0</c:when>
			                    	<c:otherwise>★★★★★ 5.0</c:otherwise>
			                    </c:choose>
							</a><br><br>
	                        <br>
								&nbsp;${ReviewVO.CONTENT }
	                        </div>
	                        <c:choose>
		                        <c:when test="${ReviewVO.IMAGE==null}"></c:when>
		                        <c:otherwise>
			                        <div class="rvsajin">
			                            <img class="reviewimage" src="images/review/${ReviewVO.IMAGE }" 
			                            style="width:150px; height:100px;">
			                        </div>
		                        </c:otherwise>
	                        </c:choose>
	                    </div>
	                </c:forEach>
                 </div>
            </div>
        </div>
    </div>
    
    <div id="jangbagunitul">
        <div id="jbtitle">주문표</div>
          
        <c:forEach items="${clist}" var="CartVO">
        	<div class="jbitem" id="${CartVO.CSEQ}">
            <a class="jbitemname" style="font-size:140%; font-weight:bold">${CartVO.CFNAME} x ${CartVO.QUANTITY }&nbsp;&nbsp;&nbsp;</a><br>
            <a class="jbitemsub">${CartVO.SIDEYN1}&nbsp;&nbsp; ${CartVO.SIDEYN2} &nbsp;&nbsp;${CartVO.SIDEYN3}</a><br>
            <div class="jbitemprice">
                ${CartVO.CPRICE} 원&nbsp;
                <input  style="border: 1px solid #a0a0a0"type="button" class="jbcancel" value="X" onclick="deleteejb(${CartVO.CSEQ},${RestaurantVO.RSEQ });">
            </div>
        </div>
        </c:forEach>
        <div class="baedaltip">배달요금 : ${RestaurantVO.RTIP}원 별도&nbsp;&nbsp;&nbsp;</div>
        <div class="jbtotal">합계 : <input type="text" value="${carttotalprice}" id="jbtotalprice" name="totalprice" readonly>원&nbsp;&nbsp;</div>
        <form method="post" name="frm" action="orderForm">
        	<input type="hidden" value="${RestaurantVO.RTIP }" name="RTIP">
	        <input type="hidden" value="${RestaurantVO.RSEQ }" name="RSEQ"> 
	        <input type="hidden" value="${carttotalprice}" name="carttotalprice">
	   		<input type="hidden" value="${loginUser.ID}" name="ID"> 
	   		<c:choose>
	   			<c:when test="${RestaurantVO.RYN==1}">
	   				<input type="submit" value="주문하기" class="jbwanryo" onclick="return goPay()"> 	
	   			</c:when>
	   			<c:otherwise>
	   				<input type="submit" value="지금은 영업중이 아닙니다" class="jbwanryo" style="background: #BCBCBC;" disabled="disabled;" > 		   				
	   			</c:otherwise>
	   		</c:choose>
	   		
		</form>
		</div>
	</div> 
</div>
<%@ include file="../footer.jsp"%>