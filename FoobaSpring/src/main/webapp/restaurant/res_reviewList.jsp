<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/restaurant/res_header.jsp"%>
<%@ include file="/restaurant/res_subhead.jsp"%>

            <div id="res_tab">
                <div class="res_infotab" 
                onclick="location.href='res_review?key=2'">
                전체답변</div>      
                <div class="res_infotab" 
                onclick="location.href='res_review?key=1'">
                미답변</div>
            </div>
		
            <div id="res_menuall_b" style="background-color: rgb(250, 248, 215);">
                	
                <div style="text-align:center;"><span style="color:red;font-weight:bold;">&nbsp;&nbsp;&nbsp;${message}</span></div>
                    <c:forEach items="${list}" var="ReviewVO">
                    <form action="res_reviewReplyWrite" method="post" name="frm">
			 		<input type="hidden" name="REVIEW_SEQ" value="${ReviewVO.REVIEW_SEQ}"/>
                        <div id="res_review" >
                            <div id="res_rev_info" >
                                <div id="nick_img" > </div>
                                <div id="m_nick" >&nbsp;&nbsp;${ReviewVO.ID}</div>
                                <div id="mrev_star" >&nbsp;&nbsp;
                                <c:choose>
			                    	<c:when test="${ReviewVO.STAR==1}">★ 1.0</c:when>
			                    	<c:when test="${ReviewVO.STAR==2}">★★ 2.0</c:when>
			                    	<c:when test="${ReviewVO.STAR==3}">★★★ 3.0</c:when>
			                    	<c:when test="${ReviewVO.STAR==4}">★★★★ 4.0</c:when>
			                    	<c:otherwise>★★★★★ 5.0</c:otherwise>
			                    </c:choose>
                                </div>
                                <div class="rev_indate" >&nbsp;&nbsp;
                                	<fmt:formatDate value="${ReviewVO.INDATE}" type="date" pattern="MM-dd" />
                                </div>
                            </div>
                            <a style="color:gray; font-size:90%">&nbsp;&nbsp;&nbsp;&nbsp;${ReviewVO.FNAMES}</a>
                            <div id="mrev_conbox" >
                            	<c:if test="${ReviewVO.image!=null }">	
	                                	<img id="mrev_img" src="images/review/${ReviewVO.IMAGE}" >                               
	                                  
                                </c:if>
                                <div id="mrev_con" style="background:white;" >&nbsp;&nbsp;&nbsp; ${ReviewVO.CONTENT}</div>   
                            </div>
                            <!-- if문을 이용한 사장님 답글 -->
                            
                            <div id="sa_reviewbox" >
                                <div id="sarev_info" >
                                	<div id="nick_sa" ></div>
                                	<div id="sanick" >&nbsp;&nbsp;사장님</div>    
                                	                  
                                </div>
                                <c:if test="${ReviewVO.REPLYYN==0}">
                                 <div id="sa_thank">  
                                 <script type="text/javascript">
                                        function addReply(ab){
                                        	if( document.getElementById(ab).value=="" ){
                                        		alert("답글을 적어주세요");
                                        		document.getElementById(ab).focus();
                                        		return false;
                                        	}     
                                        	return true;
                                        	
                                        	                                        
                                        }
                                        </script>                            
                                    <textarea class="sa_thank_text" name="REPLY" rows="5" cols="50" id="${ReviewVO.REVIEW_SEQ }"  maxlength="100" ></textarea><br>
                                    <input type="hidden" value="${key}" name="key">
                                    <div id="rev_buttonbox" >
                                        <input type="submit" value="답글 달기" id="rev_button" style="box-shadow: 2px 1px rgb(231, 231, 151);"  
                                        >   
                                        
                                    </div>
                                </div>
                                </c:if>    
                                <c:if test="${ReviewVO.REPLYYN==1}">
                                <div id="sa_thank" >
                                	<div id="sa_thank2"  style="background:white;">
                                		${ReviewVO.REPLY}
                                	</div>
                                	
                                </div>
                                </c:if>                                            
                            </div>  
                        </div><br><hr>
                        </form>
                    </c:forEach>
                                       
            	
        	</div>
        
</div>
<%@ include file="/restaurant/res_footer.jsp"%>