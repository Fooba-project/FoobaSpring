<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_header.jsp"%>

<script type="text/javascript">

//여기 작동 ?? 왜 
function qnaCheck(){
	if(document.formmm.subject.value == ''){
		alert("제목은 필수입니다")
		document.formmm.subject.focus();
		
	} else if (document.formmm.content.value == '') {
		  alert('내용을 입력하세요');	  
			document.formmm.content.focus();
			
	}else{
		document.formmm.action = "fooba.do?command=admin_qnaWrite";
		document.formmm.submit();		
	}

}
</script>

    <article><br><br><br>
        <h2 style="margin-left:31%"> QnA 게시판 </h2> 
                <form name="formmm" method="post"action="fooba.do">
                    <input type="hidden" name="command" value="admin_qnaWrite">
                    <fieldset style="width:700px; height:265px; margin:auto;">
                        <legend style="font-weight: 700; font-size: 19px; ">QnA 작성</legend><br>
                        <table>
                            <th style="font-weight: 700;">Q:&nbsp;&nbsp; </th>
                            <th><input type="text" name="subject"></input></th>
                        </table>
                        <table>
                            <th style="font-weight: 700;">A:&nbsp;&nbsp; </th>
                            <th><textarea style="height:160px; width: 600px; resize:none;"  name="content" ></textarea></th>
                        </table> 
                    </fieldset>     
                
                <div class="qna_buttons">
                    <input type="button"  value="글쓰기" class="qna_button" onclick="qnaCheck()"> 
                    <input type="button"   value="취소"  class="qna_button" onclick="location.href='fooba.do?command=admin_qnaList'">   
                </div>
                </form>
        </article>
<br><br><br><br><br><br><br><br><br>
<%@ include file="admin_footer.jsp"%>