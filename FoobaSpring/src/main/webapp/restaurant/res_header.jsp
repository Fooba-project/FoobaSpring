<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 
<fmt:setLocale value="ko_KR"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fooba</title>
<script type="text/javascript" src="/code.jquery.com/jquery-2.1.3.min.js"></script>
<script src = "../script/jquery-3.6.1.js"></script>
<link href="css/fooba.css" rel="stylesheet">
<script type="text/javascript">

function resCheck(){

	  if(document.res_loginForm.resid.value==""){
	      	alert("아이디를 입력하세요.");
	  }else if(document.res_loginForm.respw.value==""){
	     	alert("비밀번호를 입력하세요.");
	  }else{document.res_loginForm.submit();} 

}

function res_idcheck(){
		if( document.res_join_send_form.rid.value=="" ){
			alert("아이디를 입력하고 중복체크를 진행하세요" );
			documnet.res_join_send_form.rid.focus();
			return;
		}
		var url = "fooba.do?command=res_idCheckForm&rid=" + document.res_join_send_form.rid.value;
		var opt = "toolbar=no, menubar=no, resizable=no, width=550, height=400, top=100, left=700, scrollbars=no";
		window.open(url, "IdCheck", opt);	
	}

function res_post_zip(){
	var url = "fooba.do?command=res_findZipNum";
	var opt = "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=550, height=500, top=100, left=700";
	window.open( url, "우편번호 찾기", opt);
}

function menu_insert(){	
	if(document.food_menu.fname.value.length==0){
		alert("메뉴 이름을 입력하세요");
		document.food_menu.fname.focus();
	}else if(document.food_menu.fprice.value.length==0){
		alert("메뉴 가격을 입력하세요");
		document.food_menu.fprice.focus();
	}else if(document.food_menu.fimage.value.length==0){
		alert("메뉴 사진을 넣어주세요");
		document.food_menu.fimage.focus();
	}else if(document.food_menu.fside1.value.length==0){
		alert("사이드 메뉴 1을 입력하세요");
		document.food_menu.fside1.focus();
	}else if(document.food_menu.fsideprice1.value.length==0){
		alert("사이드 메뉴 1의 가격을 입력하세요");
		document.food_menu.fsideprice1.focus();
	}else if(document.food_menu.fside2.value.length==0){
		alert("사이드 메뉴 2를 입력하세요");
		document.food_menu.fside2.focus();
	}else if(document.food_menu.fsideprice2.value.length==0){
		alert("사이드 메뉴 2의 가격을 입력하세요");
		document.food_menu.fsideprice2.focus();
	}else if(document.food_menu.fside3.value.length==0){
		alert("사이드 메뉴 3을 입력하세요");
		document.food_menu.fside3.focus();
	}else if(document.food_menu.fsideprice3.value.length==0){
		alert("사이드 메뉴 3의 가격을 입력하세요");
		document.food_menu.fsideprice3.focus();
	}else{
	document.food_menu.action="fooba.do?command=res_foodmenuAdd";
	document.food_menu.submit();
	}
}

function menu_update(){
	document.food_menu.action="fooba.do?command=res_foodmenuUpdate";
	document.food_menu.submit();	
}

function go_order_save(oseq){
	document.rfm.action = "fooba.do?command=res_orderComplete&oseq="+oseq;
	document.rfm.submit();
}

function deletefm(fseq){
	var ok=confirm("메뉴를 삭제하시겠습니까?");
	if(ok)location.href="fooba.do?command=res_foodmenuDelete&fseq="+fseq;
	else return;
}

function update_ryn( rseq ){
	document.frmm.action = "fooba.do?command=res_restaurantRest&rseq="+rseq;
	document.frmm.submit();
} 

function return_ryn( rseq ){
	document.frmm.action = "fooba.do?command=res_restaurantReturn&rseq="+rseq;
	document.frmm.submit();
} 

function autoHypenPhone(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }else if(str.length < 7){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    }else if(str.length < 11){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else{              
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }
    return str;
}
function chkPhoneCode(event){
    const regExp1 = /[^0-9a-zA-Z]/g;
    if (regExp1.test(event.target.value)) {
        event.target.value = event.target.value.replace(regExp1, '');
    }
    const regExp2 = /[0-9]/g;
    if (regExp2.test(event.target.value)) {
        var _val =  event.target.value.trim();
        event.target.value = autoHypenPhone(_val);
    }

    const regExp3 = /^[a-zA-Z]*$/;
    if (regExp3.test(event.target.value)) {
        event.target.value = event.target.value.replace(regExp3, '');
    }
}

</script>


<style type="text/css">
body {margin:0}

/* 레스토랑 css  */

.headback {width: 100%; height: 100px; background-color: rgb(255,204,0); margin: 0;}
#mainlogo {position: relative; text-align: center; width: 150px; height: 100px; margin: auto auto;}
#mainlogo img {width: 100px; height: 100px;}

.headbuttons {position:absolute; width: 380px; top:23px; left:calc(50% + 300px); }
.headbutton {width: 70px; height: 50px;border-radius: 5px; text-decoration: none; font-weight: bold; font-size: 90%; font-family: Verdana, Geneva, Tahoma, sans-serif; background-color: #fff; line-height: 50px; color:#fff; background-color: transparent; border: 2px solid white; }
.headbutton:hover {background-color: white; color: rgb(255,204,0); cursor: pointer;}

.footerbox{position:relative; height: 100px; width: 100%; background-color: white;}
.footerbox #copy{position:absolute; top: 50px; text-align: center; right:20px; font-size: 15px; opacity: 80%; color: rgb(255,204,0);}
.footerbox  #logo{position:absolute; width:80px; height: 90px;  left: 15px; opacity: 60%; }
.footerbox #logotextbox{position:absolute; top:10px; left: 110px; line-height:25px; width: 500px; }
.footerbox #logotext{font-family: Verdana; font-weight: bold; color: rgb(255,204,0); }
.footerbox .linemenubox{width: 150px; height: 20px; cursor: pointer; float: right; margin:10px; font-weight: bold; color: rgb(255,204,0); text-align: center;}

.login_form {position: relative; width:100%; height:745px;}
#logspace {width: 100%; height: 100px;}
#loginmessage {width: 100%; height: 20px; margin-top: 30px; color: red; text-align: center; }
#Login_form_space {width:100%; height:150px;}
#loginmain_logo{position: relative; text-align: center; width: 150px; height: 100px; margin: 0 auto; border-radius:50%; width: calc(5.5em / 0.7); height: calc(5em / 0.7); background-color: rgb(255,204,0); opacity:90%;}
#loginmain_logo img{width: 100px; height: 100px;}
#login_box{position: relative; height:300px; width:500px; border:2px solid rgb(224, 133, 80); margin: 0 auto; border-radius: 20px; margin-top:50px; }
#text_button_box{position:relative; width: 500px;height: 190px; margin-top: 50px; margin-left:0 auto;}
#login_idpw_box{position:relative; height:75px; width:310px; margin-top:0 auto; margin-left:90px;}
#login_id{position: relative; width:300px;height:36px; border:1px solid #616161; padding-left:10px;}
#login_pw{position: relative; width:300px; height:36px; bottom:1px; border:1px solid #616161; padding-left:10px; margin-top:10px;}
#log_buttonbox{position: relative; width: 310px; height:40px; margin-top: 40px;margin-left:90px;}
#log_button{position: relative; width: 310px; height:40px; background-color:rgb(255,204,0); opacity:80%;border-color:rgb(255,204,0); border-radius:10px; cursor: pointer;}
#log_button span{position: relative;font-size: 20px; font-weight:bold;color: white; } 
#login_idpw_box input:enabled{background:white;}
#login_idpw_box input:focus{background: rgb(255, 209, 182); outline: none;}
#loginform_linetextbox{height:25px; width:450px; margin:0 auto;}
.loginform_linetext span{ position: relative; float: left; cursor: pointer; width:100px; margin-left: 45px; }

#logspace {font-size: 30px; font-weight:bold; text-align:center;}

/* #dummy{height:745px; width:100%;  } */

#res_main{position: relative; width:700px; height: 100%;  margin:0 auto;
 overflow: hidden;}
#res_name{ height:50px ; font: gray; border-bottom: 1px solid black;font-size: 120%; font-weight: bold;
text-align: center;line-height: 50px;}
#res_info{height: 140px; border-bottom: 1px solid black; margin:0 auto;}
.res_logo{height: 120px; width: 120px; position: relative; float: left;margin: 10px;}
#res_basic{font-size: 100%; position: absolute; left: 150px;line-height: 33px; }
.basic{color: gray; font-weight: normal; font-size: 100%; word-break:break-all; width:400px;}
.grayyy{color: gray; font-weight: normal; font-size: 100%;  width: 500px;position: absolute; top: 50px;}
.menugaguk{bottom: 3px; position: absolute;}
#res_tab{height: 50px; }
.res_infotab{background-color: rgb(255,204,0); height:50px; width:347px ;position: relative; float:left ;
border :1px solid lightyellow; line-height: 50px; text-align: center; font-weight: bold;font-size: 110%;}
.res_infotab:hover{cursor: pointer;}
#res_menuall{ width: 700px; float: left; position: relative; }

#res_menu_icon{width:20px; height:20px; }
#res_menu_icon:hover{cursor: pointer; opacity:0.6;}
#res_menu{height: 140px; border-bottom: 1px solid rgb(231, 231, 231);
 padding-left:20px; font-weight: bold; line-height: 30px; position: relative;}
 #res_menu1{height: 140px;
 padding-left:20px; font-weight: bold; line-height: 30px; position: relative;}
.res_meima{height: 120px;width: 120px; position: absolute; right: 10px;top: 0px;}
#info_rev{width:700px; position:relative; top:0px; right: 0px; height:700px;}
#rest_info{padding-left: 15px; padding-right: 15px; line-height: 25px;  position: relative;}

#res_num{position: relative; margin:0 auto;}
#res_nick{}

#res_revbogi{text-align: center; position: relative;  }
.res_total{color: orange; font-weight: bold;}
#res_star h2{font-weight: bold; }
#res_star{border-bottom: 1px solid black;}

.res_review_nae{position: relative;border-bottom: 1px solid rgb(231, 231, 231); height: 210px;}
.res_revcon{margin: 0 auto; position: absolute;left: 5px; top: 5px; text-align: left;}
.res_revnick{font-size: 150%; margin-left:5px ; margin-right: 8px; font-weight: bold;}
.res_star{color: orange; margin-left: 7px; }
.rev_image{margin: 0 auto; position: absolute;right: 5px; top: 5px;}
.reviewimage{ height: 200px;  }
#res_star h1{color: orange;}

.food_text{position:relative; width:300px; height:50px; border:1px solid rgb(211, 210, 210); background:white;   
line-height: 60px; margin:0 auto; font-family: Verdana; border: 1; border-radius:5px ;}
#res_menuall_a{width: 700px; float: left; position: relative; height:700px; overflow:hidden; overflow-y: scroll;}


.res_join {width: 700px; overflow: hidden; margin:50px auto;}
#input_warp { margin: 0; width: 700px;}
.join_list { position: relative; height: 50px; padding: 0; margin: 0; overflow: hidden; border-radius: 3px; margin: 10px;}
.res_join_title { text-align: left; font-size: 26px;font-weight: bold; }
.error_text { font-family: Verdana, Geneva, Tahoma, sans-serif; margin: 0; margin-left: 20px; font-size: 60%; padding: 0;}
.input_text {overflow: hidden;position: relative;display: block; width: 100%;padding: 10px 13px; background: #ffffff;box-sizing: border-box;-moz-box-sizing: border-box;-webkit-box-sizing: border-box;font-size: 15px;color: #616161;font-weight: 900;-webkit-transition: all .3s;transition: all .3s;border-radius: 3px;-webkit-border-radius: 3px; border: 1px solid #BCBCBC;}
.join_list #id_btn {  position: absolute;  width: 180px;  height: 45px;  top: 0px; right: 0;  border: 0; border-radius: 3px;}
.join_list #id_btn:hover { outline: 0px solid #9191dfab; background-color:rgb(248, 225, 225);}
#join_btn {margin-left: 200px;}
#join_btn .join_btn {width: 150px; height: 50px; border-radius: 5px; text-decoration: none; font-weight: bold; font-size: 100%; font-family: Verdana, Geneva, Tahoma, sans-serif; background-color:  rgb(255,204,0); line-height: 40px; color:#fff; border: 1px solid white; text-align: center;}
#join_btn .join_btn:hover {background-color: white; color:  rgb(255,204,0); cursor: pointer; border:2px solid  rgb(255,204,0)}
#join_agree_text {width: 680px; height: 120px; overflow-y: auto; border: 1px solid #ccc;  margin: 10px; }
#join_agree_btn {margin:10px; }
#res_select_box{ margin-left: 10px; margin-top: 10px;}
#textarea_box{margin-left: 10px; margin-top: 10px; height: 100px; width: 100%;}
#textarea_box textarea{height: 90px; width: 675px; opacity: 70%;}
.res_text_boxs{margin-top: 10px;  padding-left: 10px;}
#dongtext{border:0 ; border-bottom:1px solid rgb(201, 199, 199) ; height: 30px;width: 400px; outline: none; font-size: 100%; padding: 5px; line-height: 30px; padding-left:20px;}
#eheqhrl{background-image:url("../images/eheqhrl.png");width: 40px;height: 40px; cursor: pointer; border: 0;}
#zipcodee{margin: 0 auto;   width: 500px;}
#zipcodee th{ border: 3px solid #fa6146;border-radius: 5px; color: black; height: 30px;}
#zipcodee td{ border-bottom:1px solid rgb(201, 199, 199) ; border-right: 1px solid rgb(201, 199, 199); height: 30px;}
.zipa{color: black; text-decoration: none;}
#zipcodee td:hover{background-color: rgb(248, 225, 225); }
/* 레스토랑 주문확인 css */

#res_OrderListimg img{cursor: pointer;}
table#resOrderList{margin: 0 auto; border-collapse:collapse; width:700px; margin-bottom:20px}
#res_OrderListStatement{width:70px; height:70px;border:0; 
text-align:center; line-height:70px; background:rgb(245, 236, 114); border-radius:50%; align:center;}

#res_OrderResultButton{width:100px; height:30px; background:#d0d0d0; 
cursor: pointer; font-size: 16px; border:0; border-radius:5px; align:center;}

/*레스토랑 리뷰확인 css*/

#res_menuall_b{width: 100%; float: left; position: relative; height:700px; 
overflow:hidden; overflow-y: scroll; background-color: rgb(250, 248, 215);}
#res_review{ width:100%; height:400px; position:relative;}
#res_rev_info{ width:100%; height: 50px; }
#nick_img{ width:30px; height: 30px; border: 1px solid black; border-radius:50px ; 
background-image:url("images/mainlogo2.png"); background-position: center; 
background-size: cover; margin-top: 10px; margin-left:10px; float: left; }
#m_nick{ font-size: 110%; font-weight: bold; line-height: 50px; float: left; }
#mrev_star{position:relative; line-height: 50px; color: orange; float: left; }
.rev_indate{ line-height: 50px; color:#BCBCBC; font-size: 80%;}
#mrev_conbox{width:680px; height:330px;}
#mrev_img{  height:170px; border-radius: 20px; position:absolute; top:50px; right:10px; }
#mrev_con{ width:50%; height:150px; border-radius: 10px; -webkit-border-radius: 10px; -moz-border-radius: 10px; border:1px solid gray; word-break:break-all; margin-left:20px;}

#sa_reviewbox{width:680px; height:170px;  bottom: 0px;position: absolute;}

#sarev_info{width:100%; height: 50px; }
#nick_sa{ width:30px; height: 30px; border: 1px solid black; border-radius:50px ; 
background-image:url("images/mainlogo1.png"); background-position: center; background-size: cover; 
background-color: black; margin-top: 10px; float: right; margin-right:10px; }
#sanick{ font-size: 110%; font-weight: bold; line-height: 50px; float: right; margin-right:10px;}
#sa_thank{width:680px; height:150px;}
#sa_thank2{width:300px; height:127px; border-radius:10px;  float: right; text-align:left; word-break:break-all; border:1px solid gray;margin-right:20px;padding-left:5px;}
.sa_thank_text{width:50%; height:100px; margin-left:320px; resize:none; }
#rev_buttonbox{ width:100%; height:40px;}
#rev_button{ width:100px; height:35px; background-color: rgb(255, 255, 147);
 text-align: center; line-height: 35px; border-radius:5px; margin-right:40px; float: right; 
 cursor: pointer;}

#res_orderlistitems {padding-bottom: 20px;}
#res_menuall {width: 100%; height:500px; overflow-y:scroll;}
.res_order_list { width:100%; position: relative; font-size: 16px; font-weight: bold; line-height: 30px; margin:20px;  margin-top: 10px; width: 600px;}
#res_OrderResultButton{width:100px; height:30px; background:#ff6f21; cursor: pointer; font-size: 16px; border:0; border-radius:5px; text-align:center;}
.menuorderdetaildiv {width: 80%; background-color: #bbbbbb;border-radius: 20px; padding: 20px; overflow: hidden; margin-left: 40px; line-height: 28px;}
#wnanssodur {position: relative;}
#wnanssodurwpahr {width: 86px; float: left;}
#wnanssodursodyd {width: 440px;margin-left: 86px;}
#res_orderlistitemsall {height:55px; overflow:hidden; border-bottom:1px solid grey; cursor:pointer; padding-bottom: 20px; }
#res_orderlistitemsall:hover {height:auto;}
.starr{color:orange;}
</style>
</head>


<body>

    <div class="headback" id="resheadback">
        <div id="mainlogo">
            <a href="fooba.do?command=index"><img src="images/mainlogo1.png"></a>
        </div>
    </div>
    
    <div class="headbuttons" id="resheadbuttons">
    	<c:choose>
    		<c:when test="${empty loginRes}">
	    		<input type="button" value="가입신청" class="headbutton" name="userLogin" onclick="location.href='fooba.do?command=res_joinForm'">
	    		<input type="button" value="Home" class="headbutton" name="userJoin" onclick="location.href='fooba.do?command=res_loginForm'">
    		</c:when>
    		<c:otherwise>
    			<input type="button" value="로그아웃" class="headbutton" onclick="location.href='fooba.do?command=res_logout&page=1&search=&key='">
	    		<input type="button" value="주문관리" class="headbutton" onclick="location.href='fooba.do?command=res_order&page=1&search=&key='">
	    		<input type="button" value="리뷰관리" class="headbutton" onclick="location.href='fooba.do?command=res_review&key=2'">
	    		<input type="button" value="메뉴관리" class="headbutton" onclick="location.href='fooba.do?command=res_foodmenu&page=1&search=&key='">
	    		 <input type="button" value="정보관리" class="headbutton" onclick="location.href='fooba.do?command=res_show&page=1&search=&key='">   		
	    	</c:otherwise>
    	</c:choose>
    </div>