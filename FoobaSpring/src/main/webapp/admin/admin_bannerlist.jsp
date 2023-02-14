<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_header.jsp"%>
<script type="text/javascript">
function bupdown(bseq, num) {
	
}
</script>
<h2 class="admin_list">배너 리스트</h2>  
<article>
	<c:forEach items="${list}" var="vo">
		<div class="banner_div">
			<c:if test="${vo.BORDER<=3}">
				<div class="bnseq">
					${vo.BORDER }
				</div>
			</c:if>
			<c:if test="${vo.BORDER>=4}">
				<div class="bnseqnone"></div>
			</c:if>
			<div class="banner_img">
				<img src="images/${vo.BIMAGE }">
			</div>
			<div class="banner_text">
				<p>배너명 : ${vo.BNAME }</p>
				<p>등록일자 : ${vo.INDATE }</p>
			</div>
			<div class="banner_button">
				<c:if test="${vo.BORDER<=3}">
					<input class="bbtn" id="bbtnud" type="button" value="▲" onclick="location.href='admin_bupdown?BSEQ=${vo.BSEQ}&num=4''"><br><br>
					<input class="bbtn" id="bbtnud" type="button" value="▼" onclick="location.href='admin_bupdown?BSEQ=${vo.BSEQ}&num=5''">
				</c:if>
			</div>
			<div class="banner_button2">
				<input class="bbtn" type="button" value="1" onclick="location.href='admin_bupdown?BSEQ=${vo.BSEQ}&num=1''"><input class="bbtn" type="button" value="2" onclick="location.href='admin_bupdown?BSEQ=${vo.BSEQ}&num=2''"><input class="bbtn" type="button" value="3" onclick="location.href='admin_bupdown?BSEQ=${vo.BSEQ}&num=3''"><br>
				<input class="bbtn" id="bbtnud" type="button" value="수정" onclick="bannerupdate('${vo.BSEQ}')"><br>
				<input class="bbtn" id="bbtnud" type="button" value="삭제" onclick="bannerdelete('${vo.BSEQ}')">
			</div>
		</div>
	</c:forEach>
</article>

<br>
<jsp:include page="/admin/paging.jsp">
	<jsp:param name="command" value="adminList?table=b"/>
</jsp:include>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<%@ include file="admin_footer.jsp"%>