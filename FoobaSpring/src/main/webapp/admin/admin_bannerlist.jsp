<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_header.jsp"%>
<script type="text/javascript">
function admin_bannerWriteForm(){
	var opt = "toolbar=no, menubar=no, resizable=no, width=500, height=550";
	window.open("admin_bannerWriteForm", "banner write", opt);	
}
function admin_bannerUpdateForm(BSEQ){
	var opt = "toolbar=no, menubar=no, resizable=no, width=500, height=700";
	window.open("adminDetail?procedure=bannerUp&SEQ="+BSEQ, "banner update", opt);	
}
function admin_bannerDelete(BSEQ){
	var bool = confirm('정말로 삭제하시겠습니까?');
	if (bool) location.href="admin_bannerDelete?BSEQ="+BSEQ;
}
</script>
<h2 class="admin_list">배너 리스트<br>
	<input type="button" class="bbtn" value="새 배너 등록" style="margin-left:700px; width:100px; height:30px" onclick="admin_bannerWriteForm()">
</h2>  

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
					<input class="bbtn" id="bbtnud" type="button" value="▲" onclick="location.href='admin_bupdown?BSEQ=${vo.BSEQ}&num=4'"><br><br>
					<input class="bbtn" id="bbtnud" type="button" value="▼" onclick="location.href='admin_bupdown?BSEQ=${vo.BSEQ}&num=5'">
				</c:if>
			</div>
			<div class="banner_button2">
				<input class="bbtn" type="button" value="1" onclick="location.href='admin_bupdown?BSEQ=${vo.BSEQ}&num=1'"><input class="bbtn" type="button" value="2" onclick="location.href='admin_bupdown?BSEQ=${vo.BSEQ}&num=2'"><input class="bbtn" type="button" value="3" onclick="location.href='admin_bupdown?BSEQ=${vo.BSEQ}&num=3'"><br>
				<input class="bbtn" id="bbtnud" type="button" value="수정" onclick="admin_bannerUpdateForm('${vo.BSEQ}')"><br>
				<input class="bbtn" id="bbtnud" type="button" value="삭제" onclick="admin_bannerDelete('${vo.BSEQ}')">
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