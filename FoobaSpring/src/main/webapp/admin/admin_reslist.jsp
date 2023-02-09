<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_header.jsp"%>
 
 <script type="text/javascript">
 function go_detail( rseq ){
	var url = "admin_restaurantDetail?rseq=" + rseq;
	document.frm.action = url; 
	document.frm.submit();
}
 
 function go_search(){
		document.frm.action = "adminList?table=r";
}

	function go_total(){
		document.frm.action = "adminList?table=r&first=y";
		document.frm.submit();
} 
	function res_ox( ox, rseq ){
		document.frm.action = "admin_resOx?ox="+ox+"&rseq="+rseq;
		document.frm.submit();
}
	

 </script>

 <article>
    <h2 class="admin_list">가게 리스트</h2>   
    <br> 
    <form name="frm" method="post">
        <table id="admin_searchres">
            <tr>
                <td style="font-size:17px; width:642;">가게명: <input class="keyy" type="text" name="key" value="${key}">     
                    <input class="admin_searchres_btn" type="button" name="btn_total" value="전체보기 " 
                        onClick="go_total();">
                    <input class="admin_searchres_btn" type="submit" name="btn_search" value="검색" 
                        onClick="go_search();">   
                    
                </td>
            </tr>
        </table><br>
        <table id="admin_list_table">
            <tr><th>번호</th><th>가게명</th><th>가입현황</th><th>승인현황</th></tr>       
        <c:forEach items="${resList}" var="RestaurantVO">
                <tr>
                    <td height="23" align="center">${RestaurantVO.RSEQ}</td>
                    <td style="text-align:left; padding-left:40px;">
                        <a style="text-decoration-line: none;"href="#" onClick="go_detail('${RestaurantVO.RSEQ}');">${RestaurantVO.RNAME}</a>
                    </td>
                    <td style=text-align:center;>
                        <c:choose>
                              <c:when test='${RestaurantVO.RYN==1}'>운영중
   								 <td style="text-align:center;"><input type="button" value="거부" onClick="res_ox(2,'${RestaurantVO.RSEQ}');"></td>
                              </c:when>
                              <c:when test='${RestaurantVO.RYN==0}'>미승인           
	                              <td style="text-align:center;"><input type="button" value="승인" onClick="res_ox(1,'${RestaurantVO.RSEQ}')">
	                              <input type="button" value="거부" onClick="res_ox(2,'${RestaurantVO.RSEQ}')"></td>
	                   		  </c:when>
	                   		  <c:when test='${RestaurantVO.RYN==3}'>휴업중
	                   		  </c:when>
                              <c:otherwise>승인거부<td style="text-align:center;"><input type="button" value="복구" onClick="res_ox(1,'${RestaurantVO.RSEQ}')"></td></c:otherwise>
                        </c:choose>
                    </td> 
                </tr>
            </c:forEach>
            </table>
	</form>
		<div class="clear"></div>
</article>
<br>1
<jsp:include page="../../paging.jsp">
<jsp:param name="command" value="adminList?table=r" />
</jsp:include>	1
<br><br><br><br><br><br><br><br><br><br><br>

<%@ include file="admin_footer.jsp"%>

