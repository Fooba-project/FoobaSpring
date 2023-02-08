<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_header.jsp"%>


<script type="text/javascript">
 function go_detail( qseq ){
	var url = "fooba.do?command=admin_qnaView&qseq=" + qseq;
	document.frm.action = url; 
	document.frm.submit();
}
 
 
 function go_wrt(){
		document.frm.action = "fooba.do?command=admin_qnaWriteForm";
		document.frm.submit();
	}

 function go_search( comm ){
		var url = "fooba.do?command=" + comm + "&page=1";
		document.frm.action = url;
		
}

	function go_total( comm ){
		document.frm.key.value="";
		document.frm.action = "fooba.do?command=" + comm + "&page=1";
		document.frm.submit();
} 
 
</script>


<article>
    <h2 class="admin_list">질문 리스트</h2>   
    <br> 
    <form name="frm" method="post">
        <table id="admin_searchres">
            <tr>
                <td style="font-size:17px; width:642;">질문 제목: <input class="keyy" type="text" name="key" value="${key}">
                	<input class="admin_searchres_btn" type="button" name="btn_write" value="QnA등록"  onClick="go_wrt();">           
                    <input class="admin_searchres_btn" type="button" name="btn_total" value="전체보기" 
                        onClick="go_total( 'admin_qnaList' );">
                    <input class="admin_searchres_btn" type="submit" name="btn_search" value="검색" 
                        onClick="go_search( 'admin_qnaList' );">
                </td>
            </tr>
        </table><br>
        <table id="admin_list_table">
            <tr><th>질문번호</th><th>제목</th></tr>
        <c:forEach items="${qnaList}" var="QnaVO">
                <tr>
                    <td style="text-align:center;">${QnaVO.qseq}</td>
                    <td style="text-align:left; padding-left:20px;">
                    <a style="text-decoration-line: none;"href="#" onClick="go_detail('${QnaVO.qseq}');">${QnaVO.subject}</a>                
                </tr>
         </c:forEach>
         </table>
	</form>
		<div class="clear"></div>
</article>
<br>
<jsp:include page="/admin/paging/paging.jsp">
<jsp:param name="command" value="fooba.do?command=admin_qnaList"/>
</jsp:include>	
<br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="admin_footer.jsp"%>