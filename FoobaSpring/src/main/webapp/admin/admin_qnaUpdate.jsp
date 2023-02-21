<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_header.jsp"%>


<div class="res_join">
	<div class="res_join_title">QnA</div>
	<form name="formm" method="post" action="adminQna?procedure=update">
		<div style="border-top: 2px solid rgb(23,55,94); margin-top:15px;"></div>
		<table class="member_join_table"><br>
			<div class="qna_subject">
				Q : 
				<input type="text" name="SUBJECT" size="40" value="${vo.SUBJECT}"></input>           
			</div>
			<div class="qna_content">
				A : 
				<textarea style="height:150px; width:620px; line-height:24px; resize:none;" name="CONTENT">${vo.CONTENT}</textarea>
			</div>
		</table>
         	
		<div id="join_btn">
			<input type="hidden" name="QSEQ" value="${vo.QSEQ}">
			<input style="margin:auto; background-color:rgb(23,55,94)" class="join_btn1" type="submit" value="수정완료">
			<input style="margin:auto; background-color:rgb(23,55,94)" class="join_btn1" type="button" value="취소" onclick="location.href='adminDetail?procedure=qna&SEQ=${vo.QSEQ}'">
		</div>
	</form>
	<h3 style="text-align:center;">${message}</h3>
</div>

<%@ include file="admin_footer.jsp"%>