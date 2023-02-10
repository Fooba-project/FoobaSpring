<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_header.jsp"%>


<article><br><br><br>
	<h2 style="margin-left:31%"> QnA 게시판 </h2> 
	<form name="formmm" method="post" action="adminQna?procedure=insert">
		<fieldset style="width:700px; height:265px; margin:auto;">
			<legend style="font-weight: 700; font-size: 19px; ">QnA 작성</legend><br>
			<table>
				<th style="font-weight: 700;">Q:&nbsp;&nbsp; </th>
				<th><input type="text" name="SUBJECT" value="${vo.SUBJECT }"></input></th>
			</table>
			<table>
				<th style="font-weight: 700;">A:&nbsp;&nbsp; </th>
				<th><textarea style="height:160px; width: 600px; resize:none;"  name="CONTENT">${vo.CONTENT }</textarea></th>
			</table> 
		</fieldset>     
              
		<div class="qna_buttons">
			<input type="submit"  value="글쓰기" class="qna_button" > 
			<input type="button"   value="취소"  class="qna_button" onclick="location.href='adminList?table=q'">   
		</div>
	</form>
</article>
<h3 style="text-align:center;">${message}</h3>
<br><br><br><br><br><br><br><br><br>
<%@ include file="admin_footer.jsp"%>