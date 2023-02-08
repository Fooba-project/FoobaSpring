<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_header.jsp"%>
 
  <script type="text/javascript">
  function go_left( oseq, result ){
		document.frm.action = "fooba.do?command=admin_orderList_lb&oseq="+oseq+"&result="+result;
		document.frm.submit();
	} 
  function go_right( oseq ){
		document.frm.action = "fooba.do?command=admin_orderList_rb&oseq="+oseq;
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
    <h2 class="admin_list">주문 리스트</h2>   
    <br> 
    <form name="frm" method="post">
        <table id="admin_searchres">
            <tr>
                <td style="font-size:17px; width:642;">주문자 ID, 가게이름: <input class="keyy" type="text" name="key" value="${key}">
                    <input class="admin_searchres_btn" type="button" name="btn_total" value="전체보기 " 
                        onClick="go_total( 'admin_orderList' );">
                    <input class="admin_searchres_btn" type="submit" name="btn_search" value="검색" 
                        onClick="go_search( 'admin_orderList' );">
                    
                </td>
            </tr>
        </table><br>
     	<table id="admin_list_table">
            <tr><th>주문번호</th><th>주문자 ID</th><th>가게이름</th><th>가격</th><th>주문시간</th><th>주문상태</th></tr>      
        <c:forEach items="${orderList}" var="OrderViewVO">
                <tr>
                    <td style="text-align:center;">${OrderViewVO.oseq}</td>
                    <td style="text-align:center;">${OrderViewVO.id}</td>
                    <td style="text-align:center;">${OrderViewVO.rname}</td>
                    <td style="text-align:center;">${OrderViewVO.totalprice}</td>                    
                    <td style="text-align:center;"><fmt:formatDate value="${OrderViewVO.indate}"/></td> 
       
         	<td style=text-align:center;>
         	<c:choose>
     			<c:when test='${OrderViewVO.result=="0"}'>
					<input disabled type="button" value="&lt;" onclick="go_left('${OrderViewVO.oseq}', '${OrderViewVO.result }');">
					주문확인중
					<input type="button" value="&gt;" onclick="go_right('${OrderViewVO.oseq}');"> 
                </c:when>
                <c:when test='${OrderViewVO.result=="1"}'>
						<input type="button" value="&lt;" onclick="go_left('${OrderViewVO.oseq}', '${OrderViewVO.result }');">
					배달중
					<input type="button" value="&gt;" onclick="go_right('${OrderViewVO.oseq}');"> 
                </c:when>
                <c:when test='${OrderViewVO.result=="2"}'>
					<input type="button" value="&lt;" onclick="go_left('${OrderViewVO.oseq}', '${OrderViewVO.result }');">
					배달완료
					<input type="button" value="&gt;" onclick="go_right('${OrderViewVO.oseq}');"> 
                </c:when>
                <c:otherwise>
					<input  type="button" value="&lt;" onclick="go_left('${OrderViewVO.oseq}', '${OrderViewVO.result }');">
					리뷰작성완료
					<input disabled type="button" value="&gt;" onclick="go_right('${OrderViewVO.oseq}');"> 
                </c:otherwise>
            </c:choose>
 
             </td> 
			     </tr>
         </c:forEach>                    
         </table>
	</form>

</article>
<br>
<jsp:include page="/admin/paging/paging.jsp">
<jsp:param name="command" value="fooba.do?command=admin_orderList"/>
</jsp:include>	
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<%@ include file="admin_footer.jsp"%>