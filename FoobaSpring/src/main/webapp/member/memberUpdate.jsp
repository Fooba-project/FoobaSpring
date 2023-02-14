<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="memberMypageSub.jsp"%>
<script type="text/javascript" src="/code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="script/jquery-3.6.1.js"></script>
<script type="text/javascript" src="script/fooba.js"></script>
 
    <div class="member_join">
        <div class="member_join_title">회원정보수정</div>
        <div style="border-top: 2px solid #fa6146; margin-top:15px;"></div>
        <form name="member_update_form" id="member_join_send_form" method="post">
            <table class="member_join_table">
                <div class="join_list" >
                    <input type="text" class="input_text" name="ID" value="id : ${loginUser.ID} (수정 불가)" style="color:black" readonly/>
                </div>

                <div class="join_list">
                    <input type="password" class="input_text" name="PWD" 
                    id="userpwd" placeholder="비밀번호" style="color:red;"/>
                </div>
				<div class="join_list">
                  <input type="password" class="input_text" name="USERPWDCHK" id="userpwdchk" placeholder="비밀번호 확인" style="color:red;"/>
                </div>
			
                <p class="error_text" id="error1"></p>
    
                <div class="join_list">
                    <input type="text" class="input_text" name="NAME" value="이름 : ${loginUser.NAME} (수정 불가)" style="color:black" readonly/>
                </div>

                <div class="join_list">
                    <input type="text" id="userphone" class="input_text" name="PHONE" maxlength="13" placeholder="전화번호 : ${loginUser.PHONE}" onkeyup="chkPhoneCode(event)" style="color:red;"/>
                </div>

                <div class="join_list">
                    <input type="text" class="input_text" name="EMAIL"  id="useremail" placeholder="이메일 : ${loginUser.EMAIL}" style="color:red;"/>
                </div>

                <p class="error_text" id="error2"></p>

                <div class="join_list">
                    <input type="text" class="input_text" style="width: 490px; color:red;" name="userzip_num"  placeholder="우편번호  : ${loginUser.ZIP_NUM}" readonly />
                    <input type="button" id="id_btn" value="우편번호 검색" onclick="post_zip()"> 
                </div>

                <div class="join_list">
                    <input type="text" class="input_text" name="ADDRESS1" placeholder="주소 : ${loginUser.ADDRESS1}" style="color:red;" readonly/>
                </div>

                <div class="join_list">
                    <input type="text" class="input_text" name="ADDRESS2" placeholder="상세 주소1 : ${loginUser.ADDRESS2}" style="color:red;"/>
                </div>
				
				 <div class="join_list">
                    <input type="text" class="input_text" name="ADDRESS3" placeholder="상세 주소2 : ${loginUser.ADDRESS2}" style="color:red;"/>
                </div>
				
                <div class="join_list" margin="20px">
                    <input type="text" class="input_text" name="NICK" placeholder="닉네임 : ${loginUser.NICK}" style="color:red;"/>
                </div>

                <br>
                
            </table>
            <br><br>
            <div id="join_btn">
            <input class="join_btn" type="button" value="정보수정" class="submit" onclick="go_update();"> 
			<input class="join_btn" type="reset" value="취소" class="cancel" onclick="location.href='index'"></div>
            </div>
        </form>
    </div>
<%@ include file="../footer.jsp"%>