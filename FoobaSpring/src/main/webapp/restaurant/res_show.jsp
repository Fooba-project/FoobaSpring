<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/restaurant/res_header.jsp"%>
<%@ include file="/restaurant/res_subhead.jsp"%>

<!-- RestaurantloginRes, FoodmenuList, ReviewList-->

        <div id="res_tab">
            <div class="res_infotab" style="color:white;" >정보</div>
            <div class="res_infotab" onclick="location.href='res_updateForm'">정보수정</div>
        </div>

			<div id="res_menuall" style="overflow-x:hidden;">
           		 <div id="info_rev">           	
	       	    	<div id="rest_info">
                
                    <div id="res_cont">
                    	<br>
                        <h3>사장님 알림</h3><hr>
                        ${loginRes.CONTENT}
                    </div>
                    
                    <br>
                    
                    <div id="res_num">
                        <h3>업체 정보</h3><hr><br>
                        <a class="basic">사업자 번호</a>&nbsp; ${loginRes.RBIZNUM}<br>
                        <a class="basic">전화 번호</a>&nbsp; ${loginRes.RPHONE}<br>
                        <a class="basic">운영 정보</a>&nbsp;
                        	<c:if test="${loginRes.RYN==0}"> 운영 준비중입니다</c:if>
                        	<c:if test="${loginRes.RYN==1}"> 운영 중입니다</c:if>
                        	<c:if test="${loginRes.RYN==2}"> 당분간 영업을 중지 합니다.</c:if>
                        	<c:if test="${loginRes.RYN==3}"> 휴업 중입니다.</c:if><br>
                        <a class="basic">가게 주소</a>&nbsp; ${loginRes.RADDRESS}<br><br>
                        <hr>
                    </div>
                    
                    
                    <input type="button" onclick="res_withdrawal()" value="회원 탈퇴" 
                    style="background-color: rgb(255,204,0);border :1px solid lightyellow;
                    line-height: 50px; text-align: center; font-weight: bold;font-size: 110%;
                    height:50px; width:100px; border-radius:6px; cursor:pointer;" >
                    
                </div>
                
               
                
            </div>
            
        </div>
        
    </div>




<%@ include file="/restaurant/res_footer.jsp"%>