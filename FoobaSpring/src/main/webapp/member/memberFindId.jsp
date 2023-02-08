<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="script/jquery-3.6.1.js"></script>
<script type="text/javascript" src="script/fooba.js"></script>
<link href="css/fooba.css" rel="stylesheet"> 
<style type=text/css>
.login_form {position: relative; width:100%; height:745px;}
#logspace {width: 100%; height: 100px;}
#loginmessage {width: 100%; height: 20px; margin-top: 30px; color: red; text-align: center; }
#Login_form_space {width:100%; height:150px;}
#loginmain_logo{position: relative; text-align: center; width: 150px; height: 100px; margin: 0 auto; border-radius:50%; width: calc(5.5em / 0.7); height: calc(5em / 0.7); background-color: #fa6146; opacity:90%;}
#loginmain_logo img{width: 100px; height: 100px;}
#login_box{position: relative; height:300px; width:500px; border:2px solid rgb(224, 133, 80); margin: 0 auto; border-radius: 20px; margin-top:50px; }
#text_button_box{position:relative; width: 500px;height: 190px; margin-top: 50px; margin-left:0 auto;}
#login_idpw_box{position:relative; height:75px; width:310px; margin-top:0 auto; margin-left:90px;}
#find_name{position: relative; width:300px;height:36px; border:1px solid #616161; padding-left:10px;}
#find_phone{position: relative; width:300px; height:36px; bottom:1px; border:1px solid #616161; padding-left:10px; margin-top:10px;}
#log_buttonbox{position: relative; width: 310px; height:40px; margin-top: 40px;margin-left:90px;}
#log_button{position: relative; width: 310px; height:40px; background-color:#fa6146; opacity:80%;border-color:#fa6146; border-radius:10px; cursor: pointer;}
#log_button span{position: relative;font-size: 20px; font-weight:bold;color: white; } 
#login_idpw_box input:enabled{background:white;}
#login_idpw_box input:focus{background: rgb(255, 209, 182); outline: none;}
#loginform_linetextbox{height:25px; width:450px; margin:0 auto;}
.loginform_linetext span{ position: relative; float: left; cursor: pointer; width:100px; margin-left: 45px; }
.id_find_btn{text-align: center;}
</style>
</head>
<body>
    <form method="post" action="fooba.do?command=memberFindId" name="findId">
        <div class="login_form">
                <div id="logspace"></div>
                <div id="loginmain_logo">
                    <img src="images/mainlogo1.png">
                </div>
             
                <div id="login_box">
                    <div id="text_button_box">
                        <div id="login_idpw_box">
							<input type="text" id="find_name" name="username" placeholder="이름" title="이름" maxlength="30">
                            <input type="text" id="find_phone" name="userphone" placeholder="휴대폰 번호를 입력하세요" maxlength="13"  onkeyup="chkPhoneCode(event)">
                        </div>
            			<br>
            			<div style="text-align:center; "><p id="check" class="check" >${check}${message }</p></div>
                        <div id="log_buttonbox">
                            <button type="submit" id="log_button" onclick="return find_id()">
                                <span class="btn_text">아이디 찾기</span>
                            </button>
                        </div>
                    </div>                   
                </div>                
            </div>
        </form>
<script type="text/javascript">
    $("#find_name").focusout(function(){
        if($('#find_name').val() == ""){
            $('#check').text('이름을 입력해주세요.');
            $('#check').css('color', 'red');
        } else {
            $('#check').hide();
        }
    });

    $("#find_phone").focusout(function(){
        if($('#find_phone').val() == ""){
            $('#check').text('전화번호를 입력해주세요.');
            $('#check').css('color', 'red');
        } else {
            $('#check').hide();
        }
    });

    function find_id(){    	
         if(document.findId.username.value==0){
            alert('이름을 입력하세요');
            document.findId.username.focus();
            return false;
        } else if(document.findId.userphone.value==0) {
            alert('전화번호를 입력하세요');
            document.findId.userphone.focus();
            return false;
        } else {return true;} 
    }			
</script>
</body>
</html>
<%@ include file="../footer.jsp"%>