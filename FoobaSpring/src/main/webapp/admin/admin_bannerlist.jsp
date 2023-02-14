<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_header.jsp"%>
<script type="text/javascript">
function bsequpdown(bseq, num) {
	location.href="admin_bseqUpDown?BSEQ="+BSEQ+"&num="+num;
}
</script>
<article>
	<c:forEach items="${list}" var="vo">
		<div class="banner_div">
			<c:if test="${vo.BORDER<=3}">
				<div class="bnseq">
					${vo.BORDER }
				</div>
			</c:if>
			<c:if test="${vo.BSEQ>=4}">
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
				<input class="bbtn" id="bbtnud" type="button" value="▲" onclick="bsequpdown('${vo.BSEQ}', 4)"><br>
				<input class="bbtn" id="bbtnud" type="button" value="▼" onclick="bsequpdown('${vo.BSEQ}', 5)"><br>
				<input class="bbtn" type="button" value="1" onclick="bsequpdown('${vo.BSEQ}', 1)">
				<input class="bbtn" type="button" value="2" onclick="bsequpdown('${vo.BSEQ}', 2)">
				<input class="bbtn" type="button" value="3" onclick="bsequpdown('${vo.BSEQ}', 3)">
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