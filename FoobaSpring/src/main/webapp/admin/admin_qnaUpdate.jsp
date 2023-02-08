<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_header.jsp"%>

<script type="text/javascript">
function go_save(){
	if(document.formm.subject.value == ''){
		alert("제목은 필수입니다")
		document.formm.subject.focus();
		
	} else if (document.formm.content.value == '') {
		  alert('내용을 입력하세요');	  
			document.formm.content.focus();
			
	}else{
		document.formm.action = "fooba.do?command=admin_qnaUpdate";
		document.formm.submit();		
	}

}
		
</script>

<div class="res_join">
    <div class="res_join_title">QnA</div>
     <form name="formm" method="post"action="fooba.do">
    <div style="border-top: 2px solid rgb(23,55,94); margin-top:15px;"></div>
        <table class="member_join_table"><br>
            <div class="qna_subject">
                Q : 
                <input type="text" name="subject" size="40" value="${qnaVO.subject}"></input>           
             </div>
                   
             <div class="qna_content">
                A : 
                <textarea style="height:150px; width:620px; line-height:24px; resize:none;" name="content">${qnaVO.content}</textarea>
             </div>
        </table>
         	
            <div id="join_btn">
            	<input type="hidden" name="qseq" value="${qnaVO.qseq}">
            	<input style="margin:auto; background-color:rgb(23,55,94)" class="join_btn1" type="button" value="수정완료" onclick="go_save()">
                <input style="margin:auto; background-color:rgb(23,55,94)" class="join_btn1" type="button" value="취소" onclick="location.href='fooba.do?command=admin_qnaView&qseq=${qnaVO.qseq}'">
            </div>
    </form>
</div>



<%@ include file="admin_footer.jsp"%>