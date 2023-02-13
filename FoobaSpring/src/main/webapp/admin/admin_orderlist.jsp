<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_header.jsp"%>
 
  <script type="text/javascript">
  function lrb( result, oseq ){
		document.frm.action = "admin_orderLR?oseq="+oseq+"&result="+result;
		document.frm.submit();
	} 
  function go_search(){
		document.frm.action = "adminList?table=o";
		
}
	function go_total(){
		document.frm.action = "adminList?table=o&first=y";
		document.frm.submit();
} 
  
</script>
<article>
	<h2 class="admin_list">주문 리스트</h2>   
		<br> 
	<form name="frm" method="post">
		<table id="admin_searchres">
			<tr>
				<td style="font-size:17px; width:642;">주문자 ID, 가게이름: <input class="keyy" type="text" name="key" value="${key}">
					<input class="admin_searchres_btn" type="button" name="btn_total" value="전체보기 " onClick="go_total();">
					<input class="admin_searchres_btn" type="submit" name="btn_search" value="검색" onClick="go_search();">
				</td>
			</tr>
		</table><br>
		<table id="admin_list_table">
			<tr><th>주문번호</th><th>주문자 ID</th><th>가게이름</th><th>가격</th><th>주문시간</th><th>주문상태</th></tr>      
			<c:forEach items="${list}" var="OrderViewVO">
				<tr>
					<td style="text-align:center;">${OrderViewVO.OSEQ}</td>
					<td style="text-align:center;">${OrderViewVO.ID}</td>
					<td style="text-align:center;">${OrderViewVO.RNAME}</td>
					<td style="text-align:center;">${OrderViewVO.TOTALPRICE}</td>                    
					<td style="text-align:center;"><fmt:formatDate value="${OrderViewVO.INDATE}"/></td> 
					<td style=text-align:center;>
						<c:choose>
							<c:when test='${OrderViewVO.RESULT=="0"}'>
								<input disabled type="button" value="&lt;" onclick="lrb(0, '${OrderViewVO.OSEQ}')">
									주문확인중
								<input type="button" value="&gt;" onclick="lrb(1, '${OrderViewVO.OSEQ}')"> 
							</c:when>
							<c:when test='${OrderViewVO.RESULT=="1"}'>
								<input type="button" value="&lt;" onclick="lrb(0, '${OrderViewVO.OSEQ}')">
									배달중
								<input type="button" value="&gt;" onclick="lrb(2, '${OrderViewVO.OSEQ}')"> 
							</c:when>
							<c:when test='${OrderViewVO.RESULT=="2"}'>
								<input type="button" value="&lt;" onclick="lrb(1, '${OrderViewVO.OSEQ}')">
									배달완료
								<input type="button" value="&gt;" onclick="lrb(3, '${OrderViewVO.OSEQ}')"> 
							</c:when>
							<c:when test='${OrderViewVO.RESULT=="3"}'>
								<input  type="button" value="&lt;" onclick="lrb(2, '${OrderViewVO.OSEQ}')">
									리뷰작성완료
								<input disabled type="button" value="&gt;" onclick="lrb(3, '${OrderViewVO.OSEQ}')"> 
							</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</article>
<br>
<jsp:include page="/admin/paging.jsp">
	<jsp:param name="command" value="adminList?table=o"/>
</jsp:include>	
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<%@ include file="admin_footer.jsp"%>