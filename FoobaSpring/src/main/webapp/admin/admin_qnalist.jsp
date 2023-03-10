<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_header.jsp"%>

<script type="text/javascript">
function go_detail( QSEQ ){
	location.href = "adminDetail?procedure=qna&SEQ="+QSEQ;
}
function go_total(){
	location.href = "adminList?table=q&first=y";
}
</script>


<article>
	<h2 class="admin_list">질문 리스트</h2><br> 
	<form name="frm" method="post" action="adminList?table=q">
		<table id="admin_searchres">
			<tr>
				<td style="font-size:17px; width:642;">질문 제목: <input class="keyy" type="text" name="key" value="${key}">
					<input class="admin_searchres_btn" type="button" name="btn_write" value="QnA등록"  onClick="location.href='admin_qnaWriteForm'">           
					<input class="admin_searchres_btn" type="button" name="btn_total" value="전체보기" onClick="go_total();">
                    <input class="admin_searchres_btn" type="submit" name="btn_search" value="검색"  onClick="go_search();">
				</td>
			</tr>
		</table><br>
		<table id="admin_list_table">
			<tr><th>질문번호</th><th>제목</th></tr>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td style="text-align:center;">${vo.QSEQ}</td>
					<td style="text-align:left; padding-left:20px;">
					<a style="text-decoration-line: none;"href="#" onClick="go_detail('${vo.QSEQ}');">${vo.SUBJECT}</a>                
				</tr>
			</c:forEach>
		</table>
	</form>
	<div class="clear"></div>
</article><br>
<jsp:include page="/admin/paging.jsp">
	<jsp:param name="command" value="adminList?table=q"/>
</jsp:include>	
<br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="admin_footer.jsp"%>