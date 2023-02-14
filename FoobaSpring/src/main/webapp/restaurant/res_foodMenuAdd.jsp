<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/restaurant/res_header.jsp"%>
<%@ include file="/restaurant/res_subhead.jsp"%>

        <div id="res_tab">
            <div class="res_infotab" onclick="res_foodmenu'" >메뉴</div>
            <div class="res_infotab" onclick="#" style="color:white;">
            메뉴 추가</div>
        </div>
        
        <div id="res_menuall_a">
        
        <form id="res_menuall_a" name="food_menu" method="post" action="res_foodmenuUA?procedure=add">
        	<input type="hidden" name="RSEQ" value="${loginRes.RSEQ}"> 
            	<div id="res_menuinfo">

	            	<div id="res_menu1">	                	
	                    	<h2>메뉴 정보 <span style="color:blue;text-align:center;">&nbsp;&nbsp;&nbsp;${messagex}</span></h2><hr>
                            <h3>메뉴 이름</h3>
                            <div id="food_text">
                                <input type="text" class="food_text" name="FNAME" value="${vo.FNAME}" placeholder=" 예) 떡볶이"/>
                            </div><hr>
                            

                            <h3>메뉴 가격</h3>
                            <div id="food_text">
                                <input type="text" value="${vo.FPRICE}" class="food_text" name="FPRICE" placeholder=" 예) 6000" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /> 원
                            </div><hr>
                            
                            <h3>메뉴 소개</h3>
                            <div id="food_text">
                            	<textarea name="FCONTENT" rows="5" cols="50" style="border-radius:10px;  resize:none;" maxlength="60" >${vo.FCONTENT}</textarea>
                                
                            </div><hr>		  
                                
                             <h3>사이드메뉴 1</h3>
                            <div id="food_text">
                           		<input type="text" class="food_text" 
                           		style="width:120px; height:35px;" name="FSIDE1" value="${vo.FSIDE1}" placeholder=" 예) 콘치즈 추가"/>
                           		&nbsp;
                                <input type="text" class="food_text" 
                                style="width:120px; height:35px;" name="FSIDEPRICE1" value="${vo.FSIDEPRICE1}" placeholder=" 예) 3000" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /> 원
                            </div><hr>
                            
                             <h3>사이드메뉴 2</h3>
                            <div id="food_text">
                           		<input type="text" class="food_text" 
                           		style="width:120px; height:35px;" name="FSIDE2" value="${vo.FSIDE2}" placeholder=" 예) 콘치즈 추가"/>
                           		&nbsp;
                                <input type="text" class="food_text" 
                                style="width:120px; height:35px;" name="FSIDEPRICE2" value="${vo.FSIDEPRICE2}" placeholder=" 예) 3000" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /> 원
                            </div><hr>
                            
                             <h3>사이드메뉴 3</h3>
                            <div id="food_text">
                           		<input type="text" class="food_text" 
                           		style="width:120px; height:35px;" name="FSIDE3" value="${vo.FSIDE3}" placeholder=" 예) 콘치즈 추가"/>
                           		&nbsp;
                                <input type="text" class="food_text" 
                                style="width:120px; height:35px;" name="FSIDEPRICE3" value="${vo.FSIDEPRICE3}" placeholder=" 예) 3000" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /> 원
                            </div>
                            
                            <h3>메뉴 사진</h3>        
                            	<input type="hidden" name="FIMAGE" id="fileimage" >
   								<div id="filename"></div>
                                
                            <div id="res_tab">
            					<input type="submit" class="res_infotab"  style="width:100%; height:50px; border-radius:5px; background:rgb(255,204,0);  position:absolute; bottom:-970px"
            					value="등록" >                                
                    		</div>          		                          
             	</div>
             </div>    
            </form>   
            <div style="position:absolute; bottom:75px; left:20px;">
       			<form name="fromm" id="fileupForm" method="post" enctype="multipart/form-data">
					<input type="file" name="fileimage"><input type="button" id="myButton" value="추가">
				</form> 
      		</div>
            
            </div>   
        </div>
        
        
        


<%@ include file="/restaurant/res_footer.jsp"%>