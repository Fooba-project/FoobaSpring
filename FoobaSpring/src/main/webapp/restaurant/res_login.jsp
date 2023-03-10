<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="res_header.jsp"%>


<form method="post" action="res_login" name="res_loginForm">

	<div class="login_form">
			<div id="logspace"><br>restaurant login</div>
	        <div id="loginmain_logo">
	            <img src="images/res_logo.png">
	        </div>
	    
	        <div id="login_box">
	            <div id="text_button_box">
	                <div id="login_idpw_box">
	                    <input type="text" id="login_id" name="RID" placeholder="아이디" 
	                maxlength="30" value="${loginRes.RID }">
	    
	                    <input type="password" id="login_pw" name="RPWD" placeholder="비밀번호" 
	                maxlength="16" value="${loginRes.RPWD }">
	                </div>
	    
	                <div id="log_buttonbox">
	                    <button type="submit" id="log_button"  >
	                        <span class="btn_text">로그인</span>
	                    </button>
	                </div>
	            </div>
	            <div id="loginform_linetextbox">
	            <div class="loginform_linetext">
	                <span class="text1" onclick="location.href='res_FindIdForm'"> 아이디찾기</span>
	            </div>
	            <div class="loginform_linetext">            
	                <span class="text2"  onclick="location.href='res_FindPwForm'"> 비밀번호찾기 </span>
	            </div>
	            <div class="loginform_linetext">
	                <span class="text3" onclick="location.href='res_joinForm'"> 회원 가입</span>
	            </div>
	        </div>
	    </div>
	    <div id="loginmessage">${message}</div>
	</div>
</form>

<%@ include file="res_footer.jsp"%>