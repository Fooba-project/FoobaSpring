<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/restaurant/res_header.jsp"%>
<%@ include file="/restaurant/res_subhead.jsp"%>

<!-- 가게 정보 수정 폼  -->
        <div id="res_tab">
            <div class="res_infotab" 
             onclick="location.href='res_show'">돌아가기</div>
            <div class="res_infotab" onclick="res_editForm'" style="color:white;">정보수정</div>
        </div>

			<div id="res_menuall" style="overflow-x:hidden;">
			
				<form id="res_menuall_a" name="food_menu" method="post" action="res_Update">
					<input type="hidden" name="rseq" value="${RestaurantVO.RSEQ}">	
					<input type="hidden" name="oldImage" value="${RestaurantVO.RIMAGE}">
           		
           		 <div id="info_rev">
	       	    	<div id="rest_info">
                
	                    <div id="res_cont">
	                    	<br>
	                        <h3>사장님 알림</h3><hr>
	                        <textarea name="content" rows="5" cols="50" style="border-radius:2px; resize:none" maxlength="100" >${RestaurantVO.content}</textarea>
	                    </div><br>
                    	<div id="res_num">
	                        <h3>업체 정보</h3><hr>
	                        <a class="basic">사업자 번호</a>&nbsp; ${RestaurantVO.RBIZNUM}
	                        	<input type="hidden" name="rbiznum" value="${loginRes.RBIZNUM}"><br><hr>                    
	                        <a class="basic">전화 번호</a>&nbsp;
	                        	<input type="text" name="rphone" style="border-radius:5px; width:170px; height:20px;"
	                        	 value="${RestaurantVO.RPHONE}"  maxlength="13" id="rphone" onkeyup="chkPhoneCode(event)"/><br><hr>
	                        <a class="basic">가게 주소</a>&nbsp; 
	                        	<input type="text" name="raddress" style="border-radius:5px; width:310px; height:20px;"
	                        	value="${RestaurantVO.RADDRESS}"/><br><hr>
                    	</div>
                    	
                    	<div id="res_cont">
	                    	<br>
	                        <h3>가게 정보</h3><hr>
	                        <a class="basic">결제 방법</a>&nbsp;&nbsp; 신용카드, 현금<br><hr>                    
	                        <a class="basic">배달 팁</a>&nbsp;&nbsp;&nbsp;
	                        	<input type="text" name="rtip" style="border-radius:5px; width:100px; height:20px;"
	                        	 value="${RestaurantVO.RTIP}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /> 원<br><hr>
	                        <a class="basic">해시태그</a>&nbsp; 
	                        	# <input type="text" name="hash" style="border-radius:5px; width:100px; height:20px;"
	                        	value="${RestaurantVO.HASH}"/><br><hr>
	                        <a class="basic">가게로고</a>&nbsp; 
	                        		<img src="images/title/${RestaurantVO.RIMAGE}" width="100px"><br>            
                                <input type="file" name="fimage"/><br><hr>
	                        	
	                    </div><br>
	                    <input type="submit" value="수정 완료" class="res_infotab"  style="width:700px;">
	                    </div>
                    	
					</div>
				</form>
            </div>            
        </div>
        
<%@ include file="/restaurant/res_footer.jsp"%>