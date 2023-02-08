<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

    <div class="member_join">
        <div class="member_join_title">회원가입</div>
        <div style="border-top: 2px solid #fa6146; margin-top:15px;"></div>
        <form name="member_join_send_form" id="member_join_send_form" method="post" action="fooba.do?command=memberJoin">
            <table class="member_join_table">
                <div class="join_list">
                    <input type="text" class="input_text" style="width: 490px;" name="userid" placeholder="아이디" onkeyup="chkIdCode(event)"/>
                    <input type="hidden" name="userreid" value=""/>
                    <input type="button" id="id_btn" value="중복 확인" onclick="idcheck()">
                </div>

                <div class="join_list">
                    <input type="password" class="input_text" name="userpwd" 
                    id="userpwd"
                    placeholder="비밀번호"/>
                </div>

                <div class="join_list">
                    <input type="password" class="input_text" name="userpwdchk" id="userpwdchk" placeholder="비밀번호 확인"/>
                </div>

                <p class="error_text" id="error1"></p>
    
                <div class="join_list">
                    <input type="text" class="input_text" name="username" placeholder="이름"/>
                </div>

                <div class="join_list">
                    <input type="text" id="userphone" class="input_text" name="userphone" placeholder="전화번호" maxlength="13"  onkeyup="chkPhoneCode(event)"/>
                </div>

                <div class="join_list">
                    <input type="text" class="input_text" name="useremail"
                    id="useremail"
                    placeholder="이메일"/>
                </div>

                <p class="error_text" id="error2"></p>

                <div class="join_list">
                    <input type="text" class="input_text" style="width: 490px;" name="userzip_num" placeholder="우편번호" readonly/>
                    <input type="button" id="id_btn" value="우편번호 검색" onclick="post_zip()"> 
                </div>

                <div class="join_list">
                    <input type="text" class="input_text" name="useraddress1" placeholder="주소" readonly/>
                </div>

                <div class="join_list">
                    <input type="text" class="input_text" name="useraddress2" placeholder="상세 주소"/>
                </div>

                <div class="join_list" margin="20px">
                    <input type="text" class="input_text" name="usernick" placeholder="닉네임(별명)"/>
                </div>

                <p class="error_text">* 입력하지 않을 시 이름으로 사용됩니다.</p>

                <br>
                <div id="join_agree_btn">
                    <input type="checkbox" name="useragree" id="join_agree" value="Y">
                    <label for="join_agree">이용약관</label>
                </div>
                <div id="join_agree_text">
                    <h3 style="text-align: center;">제1장 총칙</h3>
                    <h5>제1조 [목 적]</h5>
                    <p>본 서비스 약관은 주식회사 푸바에서 제공하는 서비스의 이용에 관련하여 회원과 푸바 간의 권리, 의무, 책임 및 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
                </div>
            </table>
            <br><br>
            <div id="join_btn">
                <input class="join_btn" type="button" value="가입" onclick="joincheck()">
                <input class="join_btn" type="button" value="홈으로" onclick="location.href='fooba.do?command=index'">
            </div>
        </form>
    </div>
<%@ include file="../footer.jsp"%>