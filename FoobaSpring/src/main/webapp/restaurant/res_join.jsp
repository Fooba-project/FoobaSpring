<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="res_header.jsp"%>
<script type="text/javascript" src="/code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="script/jquery-3.6.1.js"></script>
<script type="text/javascript">


$( function(){
    $("#respwdchk").keyup( function(event){
    	
        event.target.value = event.target.value.trim();
        let pass1 = $("#rpwd").val();
        let pass2 = $("#respwdchk").val();
        if (pass1 != "" || pass2 != ""){
            if (pass1 == pass2){
                $("#error1").html('');
                
            } else {
                $("#error1").html('비밀번호가 일치하지 않습니다.');
                $("#error1").css('color','red');
            }
        }
    })

    $("#rpwd").keyup( function(event){
        event.target.value = event.target.value.trim();
        let pass1 = $("#rpwd").val();
        let pass2 = $("#respwdchk").val();
        if (pass1 != '' && pass2 != ''){
            if (pass1 == pass2){
                $("#error1").html('');
            } else {
                $("#error1").html('비밀번호가 일치하지 않습니다.');
                $("#error1").css('color','red');
            }
        }
    })
} )



function joincheck() {
	if(document.res_join_send_form.rid.value.length==0){
		alert("아이디를 입력하세요");
		document.res_join_send_form.rid.focus();
	}
	else if(document.res_join_send_form.reid.value.length==0){
		alert("아이디 중복확인을 하지 않았습니다.");
		document.res_join_send_form.rid.focus();		
	}
	else if(document.res_join_send_form.reid.value != document.res_join_send_form.rid.value){
		alert("아이디 중복확인을 하지 않았습니다.");
		document.res_join_send_form.rid.focus();	
	}
	else if(document.res_join_send_form.rpwd.value.length==0){
		alert("비밀번호를 입력하세요.");
		document.res_join_send_form.rpwd.focus();
	}
	else if(document.res_join_send_form.rpwd.value != document.res_join_send_form.respwdchk.value){
		alert("비밀번호 확인이 일치하지 않습니다.");
		document.res_join_send_form.respwdchk.focus();
	}
	else if(document.res_join_send_form.ownername.length==0){
		alert("사업자 이름을 입력하세요.");
		document.res_join_send_form.ownername.focus();
	}
	else if(document.res_join_send_form.rname.length==0){
		alert("가게 이름을 입력하세요.");
		document.res_join_send_form.rname.focus();
	}
	else if(document.res_join_send_form.rbiznum.length==0){
		alert("사업자 등록번호를 입력하세요.");
		document.res_join_send_form.rbiznum.focus();
	}
	else if(document.res_join_send_form.rphone.value.length==0){
		alert("가게 전화번호를 입력하세요.");
		document.res_join_send_form.rphone.focus();
	} 
	else if(document.res_join_send_form.raddress1.value.length==0){
		alert("주소를 입력하세요.");
		res_post_zip();
	}
	else if(document.res_join_send_form.raddress2.value.length==0){
		alert("상세 주소를 입력하세요.");
		document.res_join_send_form.raddress2.focus();
	}
	else if(document.res_join_send_form.rimage.value.length==0){
		alert("가게 대표이미지가 필요합니다.");
		document.res_join_send_form.rimage.focus();
	}
	else if(document.res_join_send_form.content.value.length==0){
		alert("가게 소개를 입력하세요.");
		document.res_join_send_form.content.focus();
	}

	else if(document.res_join_send_form.rtip.value.length==0){
		alert("기본 배달료를 설정해주세요.");
		document.res_join_send_form.rtip.focus();
	}
	else if( document.res_join_send_form.res_agree.checked==false){
		alert("약관에 동의하셔야 회원가입이 가능합니다.");
		document.res_join_send_form.res_agree.focus();
	}
	else {
		document.res_join_send_form.submit();
	}
}

function chkIdCode(event) {
    const regExp = /[^0-9a-zA-Z]/g;
    if (regExp.test(event.target.value)) {
        event.target.value = event.target.value.replace(regExp, '');
    }
}


   
</script>
<div class="res_join">
    <div class="res_join_title">사업자 회원가입</div>
    <div style="border-top: 2px solid  rgb(255,204,0); margin-top:15px;"></div>
    <form name="res_join_send_form" id="res_join_send_form" method="post" action="fooba.do?command=res_join" enctype="multipart/form-data">
        <table class="member_join_table">
            <div class="join_list">
                <input type="text" class="input_text" style="width: 490px;" name="rid" placeholder="아이디" onkeyup="chkIdCode(event)"/>
                <input type="hidden" name="reid" value=""/>
                <input type="button" id="id_btn" value="중복 확인" onclick="res_idcheck()">
            </div>

            <div class="join_list">
                <input type="password" class="input_text" name="rpwd" 
                id="rpwd"
                placeholder="비밀번호"/>
            </div>

            <div class="join_list">
                <input type="password" class="input_text" name="respwdchk" id="respwdchk" placeholder="비밀번호 확인"/>
            </div>

            <p class="error_text" id="error1"></p>
    
            <div class="join_list">
                <input type="text" class="input_text" name="ownername" placeholder="사업자 이름"/>
            </div>

            <div class="join_list">
                <input type="text" class="input_text" name="rname" placeholder="가게 이름"/>
            </div>

            <div class="join_list">
                <input type="text" id="rbiznum" class="input_text" name="rbiznum" maxlength="12" placeholder="사업자 등록번호" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
            </div>

            <div class="join_list">
                <input type="text" class="input_text" name="rphone"
                maxlength="13" id="rphone"
                 placeholder="가게 전화번호" onkeyup="chkPhoneCode(event)"/>
            </div>


            <div class="join_list">
                <input type="text" class="input_text" style="width: 490px;" name="zip_num" placeholder="우편번호" readonly/>
                <input type="button" id="id_btn" value="우편번호 검색" onclick="res_post_zip()"> 
            </div>
			
			<div class="join_list">
                <input type="text" class="input_text" name="raddress1"
                id="raddress1"
                 placeholder="사업장 주소" readonly/>
            </div>
            
			<div class="join_list">
                <input type="text" class="input_text" name="raddress2"
                id="raddress2"
                 placeholder="상세 주소"/>
            </div>
 
            <div class="member_join">
                <div class="member_join_title">
                    사업장 정보 입력
                </div>
                <div style="border-top:2px solid  rgb(255,204,0); margin-top:15px;">
                </div>
                
            
                <div class="res_text_boxs">
                     가게 대표이미지
                </div> 
                <div class="join_list">
                    <div id="images_upload_box">
                         <input type="file" class="input_text" name="rimage">
                    </div>
                </div>
                   
                <div class="res_text_boxs">
                    사업장 업종 분류
                </div>
                <div id="res_select_box">
                    <select style="width:60px;" name="kind">
                        <option value="1">한식</option>
                        <option value="2">중식</option>
                        <option value="3">양식</option>
                        <option value="4">일식</option>
                        <option value="5">피자</option>
                        <option value="6">치킨</option>
                        <option value="7">분식</option>
                        <option value="8">디저트</option>
                    </select>
                </div>
                 
                <div id="textarea_box">
                    <textarea placeholder="사업장 소개글을 작성해주세요(100자 이내)" name="content" maxlength="100" style="resize:none;"></textarea>
                </div>
                <div class="join_list">
                    <input type="text" class="input_text" name="rtip" maxlength="4" placeholder="기본배달료를 입력하세요" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
                </div>
                <div class="join_list">
                    <input type="text" class="input_text" name="hash" placeholder="해시태그">
                </div>
                <div class="res_text_boxs">
                    <span style="line-height:0px; ">예시) &nbsp; 국물음식, 건강한, 가성비
                    </span>
                </div>
 
                <br>
                <div id="join_agree_btn">
                    <input type="checkbox" name="res_agree" id="join_agree" value="Y">
                    <label for="join_agree">이용약관</label>
                </div>
                <div id="join_agree_text">
                     <h3 style="text-align: center;">제1장 총칙</h3>
                    <h5>제1조 [목 적]</h5>
                    <p>본 서비스 약관은 주식회사 푸바에서 제공하는 서비스의 이용에 관련하여 회원과 푸바 간의 권리, 의무, 책임 및 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
                </div>
            </div>
        </table>
            <br><br>
            <div id="join_btn">
                <input class="join_btn" type="button" value="가입" onclick="joincheck()">
                <input class="join_btn" type="button" value="홈으로" onclick="location.href='fooba.do?command=res_login'">
            </div>
    </form>
</div>
<%@ include file="res_footer.jsp"%>