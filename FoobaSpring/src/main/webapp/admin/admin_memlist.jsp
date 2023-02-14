<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_header.jsp"%>

<article>
	<h2 class="admin_list">멤버 리스트</h2>
	<br>
	<form name="frm" method="post" action="adminList?table=m">
		<table id="admin_searchres">
			<tr>
				<td style="font-size:17px; width:642;">회원 ID: <input class="keyy" type="text" name="key" value="${key}">
					<input class="admin_searchres_btn" type="button" name="btn_total" value="전체보기 " onClick="location.href='adminList?table=m&first=y'">
					<input class="admin_searchres_btn" type="submit" name="btn_search" value="검색" onClick="go_search()">
				</td>
			</tr>
		</table><br>
		<table id="admin_list_table">
			<tr><th>회원 ID</th><th>회원 닉네임</th><th>전화번호</th><th>이메일</th><th>가입날짜</th></tr>       
			<c:forEach items="${list}" var="vo">
				<tr>
					<td style="text-align:center;">${vo.ID}</td>
					<td style="text-align:center;">${vo.NICK}</td>
					<td style="text-align:center;">${vo.PHONE}</td>
					<td style="text-align:center;">${vo.EMAIL}</td>                    
					<td style=text-align:center;><fmt:formatDate value="${vo.INDATE}"/></td> 
				</tr>
			</c:forEach>
		</table>
	</form>
	<div class="clear"></div>
</article>
<br>
<jsp:include page="/admin/paging.jsp">
<jsp:param name="command" value="adminList?table=m"/>
</jsp:include>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="admin_footer.jsp"%>