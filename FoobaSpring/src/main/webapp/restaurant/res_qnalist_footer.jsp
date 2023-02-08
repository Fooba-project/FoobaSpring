<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="res_header.jsp"%>

<style type="text/css">
.res_qnalist{text-align: center; margin-top:30px;}
#res_qnalist_table{margin: auto; width:810px;}
.qna_title{ padding-left: 10px; height:30px;padding-top: 10px; background-color:rgb(250, 236, 178);font-weight: bold;  border-radius: 10px;}
.qna_box{width:700px; margin:0 auto;}
.qna_content{padding-left:30px; height: 30px; overflow: hidden;  line-height: 30px;}
.qna_content:hover{height:auto;}
</style>

<article>
        <h2 class="res_qnalist">자주 묻는 질문</h2>   
        <br> 
        <form name="frm" method="post">
            <div id="res_qnalist_table">
                
                <c:forEach items="${qnaList}" var="QnaVO">        
                <tr> 
                    <div class="qna_box">
                        <div class="qna_title">
                             Q : ${QnaVO.subject} 
                        </div>
                    </div>
                </tr>
                <tr> 
                    <div class="qna_box">
                        <div class="qna_content">
                             A : ${QnaVO.content} 
                        </div>
                    </div>
                </tr>
                  <br>
                </c:forEach>
            </div>
        </form>
            <div class="clear"></div>
    </article> 
<br>
<jsp:include page="/member/paging/paging.jsp">
<jsp:param name="command" value="fooba.do?command=res_qnalist_footer"/>
</jsp:include>	
<br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="res_footer.jsp"%>