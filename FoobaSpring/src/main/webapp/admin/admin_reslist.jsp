<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_header.jsp"%>
 
<script type="text/javascript">
function go_detail( RSEQ ){
	location.href="adminDetail?procedure=res&SEQ="+RSEQ;
}
function go_total(){
	location.href="adminList?table=r&first=y";
} 
function res_ox( ox, RSEQ ){
	location.href="admin_resOx?ox="+ox+"&RSEQ="+RSEQ;
}

</script>

<article>
	<h2 class="admin_list">가게 리스트</h2>   
	<br> 
	<form name="frm" method="post" action="adminList?table=r">
		<table id="admin_searchres">
			<tr>
				<td style="font-size:17px; width:642;">가게명: <input class="keyy" type="text" name="key" value="${key}">     
					<input class="admin_searchres_btn" type="button" name="btn_total" value="전체보기 " onClick="go_total();">
					<input class="admin_searchres_btn" type="submit" name="btn_search" value="검색"> 
				</td>
			</tr>
		</table><br>
		<table id="admin_list_table">
			<tr><th>번호</th><th>가게명</th><th>가입현황</th><th>승인현황</th></tr>       
			<c:forEach items="${list}" var="vo">
				<tr>
					<td height="23" align="center">${vo.RSEQ}</td>
					<td style="text-align:left; padding-left:40px;">
						<a style="text-decoration-line: none;"href="#" onClick="go_detail('${vo.RSEQ}');">${vo.RNAME}</a>
					</td>
					<td style=text-align:center;>
						<c:choose>
							<c:when test='${vo.RYN==1}'>운영중
	 							<td style="text-align:center;"><input type="button" value="거부" onClick="res_ox(2,'${vo.RSEQ}');"></td>
							</c:when>
							<c:when test='${vo.RYN==0}'>미승인           
								<td style="text-align:center;"><input type="button" value="승인" onClick="res_ox(1,'${vo.RSEQ}')">
									<input type="button" value="거부" onClick="res_ox(2,'${vo.RSEQ}')">
								</td>
							</c:when>
							<c:when test='${vo.RYN==3}'>휴업중
							</c:when>
							<c:otherwise>승인거부<td style="text-align:center;"><input type="button" value="복구" onClick="res_ox(1,'${vo.RSEQ}')"></td></c:otherwise>
						</c:choose>
					</td> 
				</tr>
			</c:forEach>
		</table>
	</form>
	<div class="clear"></div>
</article>
<br>
<jsp:include page="/admin/paging.jsp">
<jsp:param name="command" value="adminList?table=r"/>
</jsp:include>	
<br><br><br><br><br><br><br><br><br><br><br>

<%@ include file="admin_footer.jsp"%>

