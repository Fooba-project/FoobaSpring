<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_header.jsp"%>
 
<script type="text/javascript">
function qnaDelete(qseq){
	var bool = confirm('정말로 삭제하시겠습니까?');
	if (bool) return true;
	else return false;
}
</script>

<div class="res_join">
	<div class="res_join_title">QnA</div>
	<div style="border-top: 2px solid rgb(23,55,94); margin-top:15px;"></div>
	<table class="member_join_table"><br>
		<div class="qna_subject">
			Q : ${vo.SUBJECT}           
		</div> 
		<div class="qna_content">
			A : ${vo.CONTENT} 
		</div>
	</table>
	<form action="adminQna">
		<input type="hidden" value="delete" name="procedure">
		<input type="hidden" value="${vo.QSEQ}" name="QSEQ">
		<input type="hidden" value="${vo.SUBJECT}" name="SUBJECT">
		<input type="hidden" value="${vo.CONTENT}" name="CONTENT">
		<div id="join_btn" style="margin: auto; width: 470px;">
			<input style="margin:auto; background-color:rgb(23,55,94)" class="join_btn1" type="button" value="수정" onclick="location.href='adminDetail?procedure=qnaUp&seq=${vo.QSEQ}'">
			<input style="margin:auto; background-color:rgb(23,55,94)" class="join_btn1" type="button" value="목록" onclick="location.href='adminList?table=q'">
			<input style="margin:auto; background-color:rgb(23,55,94)" class="join_btn1" type="submit" value="삭제" onclick="return qnaDelete()">
		</div>
	</form>
</div>
<br><br><br><br><br><br><br><br><br><br>
<%@ include file="admin_footer.jsp"%>