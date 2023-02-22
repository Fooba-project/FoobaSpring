--admin

create or replace procedure getAdmin(p_id in admin.id%type, p_rc out sys_refcursor)
IS
BEGIN
    open p_rc for
    select * from admin where id = p_id;
END;


create or replace procedure adminGetAllCount(p_table in varchar2, p_key in varchar2, p_cnt out number)
IS
BEGIN
if p_table= 'r' then
    select count(*) into p_cnt from restaurant where rname like '%'|| p_key ||'%';
elsif p_table='o' then
    select count(distinct oseq) into p_cnt from order_view where id like '%'|| p_key ||'%' or rname like '%'|| p_key ||'%';
elsif p_table='m' then
    select count(*) into p_cnt from member where id like '%'|| p_key ||'%';
elsif p_table='q' then
    select count(*) into p_cnt from qna where content like '%'|| p_key ||'%' or subject like '%'|| p_key ||'%';
elsif p_table= 'b' then
    select count(rownum) into p_cnt from bannerf where bname like  '%'|| p_key ||'%';
end if;
END;


create or replace procedure adminList(p_table in varchar2, p_key in varchar2, p_startNum in number, p_endNum in number, p_rc out sys_refcursor)
IS
BEGIN
if p_table= 'r' then
    open p_rc for
    select * from (select * from (select rownum as rn, b.* from ((select * from restaurant where rname like '%'|| p_key ||'%' order by rseq desc) b)) where rn>=p_startNum) where rn<=p_endNum;
elsif p_table= 'o' then
    open p_rc for
    select * from (select * from (select rownum as rn, b.* from ((select distinct oseq, id, rname, totalprice, indate, result from order_view where id like '%'|| p_key ||'%' or rname like '%'|| p_key ||'%' order by oseq desc) b)) where rn>=p_startNum) where rn<=p_endNum;
elsif p_table= 'm' then
    open p_rc for
    select * from (select * from (select rownum as rn, b.* from ((select * from member where id like '%'|| p_key ||'%' order by indate desc) b)) where rn>=p_startNum) where rn<=p_endNum;
elsif p_table= 'q' then
    open p_rc for
    select * from (select * from (select rownum as rn, b.* from ((select * from qna where content like '%'|| p_key ||'%' or subject like '%'|| p_key ||'%' order by qseq desc) b)) where rn>=p_startNum) where rn<=p_endNum;
elsif p_table= 'b' then
    open p_rc for
    select * from (select * from (select rownum as rn, b.* from ((select * from bannerf where bname like  '%'|| p_key ||'%' order by border asc, indate desc) b)) where rn>=p_startNum) where rn<=p_endNum;
end if;
END;


create or replace procedure admin_resOx(p_ox in number, p_rseq in number)
IS
BEGIN
    update restaurant set ryn=p_ox where rseq=p_rseq;
    commit;
END;


create or replace procedure admin_orderLR(p_result in number, p_oseq in number)
IS
BEGIN
    update orders set result=p_result where oseq=p_oseq;
    if (p_result=3) then 
    delete from review where oseq=p_oseq;
    end if;
    commit;
END;


create or replace procedure adminQna(p_procedure in varchar2, p_qseq in number, p_subject in varchar2, p_content in varchar2)
IS
BEGIN
    if (p_procedure='insert') then
        insert into qna(qseq, subject, content) values(qna_seq.nextVal, p_subject, p_content);
    elsif (p_procedure='update') then
        update qna set subject=p_subject, content=p_content where qseq=p_qseq;
    elsif (p_procedure='delete') then
        delete from qna where qseq=p_qseq;
    end if;
    commit;
END;


create or replace procedure adminDetail(p_procedure in varchar2, p_var in number, p_rc out sys_refcursor)
IS
BEGIN
    if (p_procedure='res' ) then
        open p_rc for
        select*from restaurant where rseq=p_var;
    elsif (p_procedure='bannerUp' ) then
        open p_rc for
        select*from bannerf where bseq=p_var;
    else
        open p_rc for
        select*from qna where qseq=p_var;  
    end if;
END;


create or replace procedure admin_bupdown( p_bseq in number, p_num in number )
IS
v_border number;
BEGIN
    select border into v_border from bannerf where bseq=p_bseq;
    if (p_num=1) then
        update bannerf set border=4 where border=1;
        update bannerf set border=1 where bseq=p_bseq;
    elsif (p_num=2) then 
        update bannerf set border=4 where border=2;
        update bannerf set border=2 where bseq=p_bseq;
    elsif (p_num=3) then 
        update bannerf set border=4 where border=3;
        update bannerf set border=3 where bseq=p_bseq;
    elsif (p_num=4) then 
    	if (v_border=2) then
            update bannerf set border=2 where border=1;
            update bannerf set border=1 where bseq=p_bseq;    
        elsif (v_border=3) then
            update bannerf set border=3 where border=2;
            update bannerf set border=2 where bseq=p_bseq; 
        end if;
    elsif (p_num=5) then 
        if (v_border=1) then
            update bannerf set border=1 where border=2;
            update bannerf set border=2 where bseq=p_bseq;    
        elsif (v_border=2) then
            update bannerf set border=2 where border=3;
            update bannerf set border=3 where bseq=p_bseq; 
        end if;       
    end if;
    commit;
END;


create or replace procedure admin_bannerWrite (p_bname in varchar2, p_image in varchar2)
IS
BEGIN
    insert into bannerf (bseq, bname, bimage) values (banner_seq.nextVal, p_bname, p_image);
    commit;
END;


create or replace procedure admin_bannerUpdate (p_bname in varchar2, p_bimage in varchar2, p_bseq in number)
IS
BEGIN
    update bannerf set bname=p_bname, bimage=p_bimage where bseq=p_bseq;
    commit;
END;


create or replace procedure admin_bannerDelete (p_bseq in number)
IS
BEGIN
    delete from bannerf where bseq=p_bseq;
    commit;
END;


--restaurant

create or replace procedure getRes(p_rid in restaurant.rid%type, p_cur out sys_refcursor)
is    
begin
    open p_cur for
    select * from restaurant where rid=p_rid;
end;


create or replace procedure starAvg(p_rseq in number, p_cur out sys_refcursor)
is
begin
    open p_cur for
    select*from review where rseq=p_rseq;
end;


create or replace procedure resFindId(p_rname in restaurant.rname%type, p_cur out sys_refcursor)
is
begin
    open p_cur for
	select * from restaurant where rname=p_rname;
end;


create or replace procedure joinRes(
    p_rid in varchar2,
    p_rpwd in varchar2,
    p_rname in varchar2,
    p_ownername in varchar2,
    p_rphone in varchar2,
    p_zip_num in varchar2,
    p_raddress in varchar2,
    p_raddress2 in varchar2,
    p_raddress3 in varchar2,
    p_rimage in varchar2,
    p_content in varchar2,
    p_hash in varchar2,
    p_rbiznum in varchar2,
    p_kind in number,
    p_rtip in number
)
is
begin
    insert into restaurant(rseq,rid,rpwd,rname,ownername,rphone,zip_num,
    raddress,raddress2,raddress3,rimage,content,hash,rbiznum,kind,rtip ,ryn) 
    values(restaurant_seq.nextVal,p_rid,p_rpwd,p_rname,p_ownername,p_rphone,p_zip_num,
    p_raddress,p_raddress2,p_raddress3,
    p_rimage,p_content,p_hash,p_rbiznum,p_kind,p_rtip,0 );
    commit;
end;


create or replace procedure updateRes(
    p_rseq in number,
    p_content in varchar2,
    p_rphone in varchar2,
    p_zip_num in varchar2,
    p_raddress in varchar2,
    p_raddress2 in varchar2,
    p_raddress3 in varchar2,
    p_rtip in number,
    p_hash in varchar2,
    p_rimage in varchar2
)
is
begin
    update restaurant set content=p_content,rphone=p_rphone,zip_num=p_zip_num,raddress=p_raddress,raddress2=p_raddress2,
    raddress3=p_raddress3,rtip=p_rtip,hash=p_hash,rimage=p_rimage where rseq=p_rseq;
    commit;
end;


create or replace procedure withdrawal(p_rid in varchar2)
is 
begin
    update restaurant set ryn=4 where rid = p_rid;
    COMMIT;
end;


CREATE OR REPLACE PROCEDURE foodList(p_rseq IN foodmenu.rseq%type, p_cur OUT SYS_REFCURSOR)
IS
BEGIN
    open p_cur for
	SELECT * FROM foodmenu WHERE rseq = p_rseq; 
end;


CREATE OR REPLACE PROCEDURE selectFood(p_fseq IN foodmenu.fseq%type, p_cur OUT SYS_REFCURSOR)
IS
BEGIN
   	open p_cur for
 	SELECT * FROM foodmenu WHERE fseq = p_fseq; 
end;


CREATE OR REPLACE PROCEDURE addFoodMenu(
    p_rseq IN foodmenu.rseq%type,
    p_fseq IN foodmenu.fseq%type,
    p_fname IN foodmenu.fname%type,
    p_fprice IN foodmenu.fprice%type,
    p_fimage IN foodmenu.fimage%type,
    p_fcontent IN foodmenu.fcontent%type,
    p_fside1 IN foodmenu.fside1%type,
    p_fsideprice1 IN foodmenu.fsideprice1%type,
    p_fside2 IN foodmenu.fside2%type,
    p_fsideprice2 IN foodmenu.fsideprice2%type,
    p_fside3 IN foodmenu.fside3%type,
    p_fsideprice3 IN foodmenu.fsideprice3%type
)
IS
BEGIN
    insert into foodmenu(rseq,fseq,fname,fprice,fimage,fcontent,fside1,fsideprice1,fside2,fsideprice2,fside3,fsideprice3) 
    values(p_rseq,foodmenu_seq.nextVal,p_fname,p_fprice,p_fimage,p_fcontent,p_fside1,p_fsideprice1,p_fside2,p_fsideprice2,p_fside3,p_fsideprice3);
    commit;
end;


CREATE OR REPLACE PROCEDURE deleteFoodMenu(p_fseq IN foodmenu.fseq%type)
IS
BEGIN
	 delete FROM foodmenu WHERE fseq = p_fseq; 
end;


CREATE OR REPLACE PROCEDURE updateFoodMenu(
    p_fseq IN foodmenu.fseq%type,
    p_fname IN foodmenu.fname%type,
    p_fprice IN foodmenu.fprice%type,
    p_fcontent IN foodmenu.fcontent%type,
    p_fside1 IN foodmenu.fside1%type,
    p_fsideprice1 IN foodmenu.fsideprice1%type,
    p_fside2 IN foodmenu.fside2%type,
    p_fsideprice2 IN foodmenu.fsideprice2%type,
    p_fside3 IN foodmenu.fside3%type,
    p_fsideprice3 IN foodmenu.fsideprice3%type,
    p_fimage IN foodmenu.fimage%type
)
IS
BEGIN
	update foodmenu set fname=p_fname, fprice=p_fprice, fimage=p_fimage, fcontent=p_fcontent, fside1=p_fside1, fsideprice1=p_fsideprice1, fside2=p_fside2, fsideprice2=p_fsideprice2, fside3=p_fside3, fsideprice3=p_fsideprice3
	where  fseq = p_fseq;  
	commit;
end;


CREATE OR REPLACE PROCEDURE restRes(p_rseq IN foodmenu.rseq%type, p_ryn IN restaurant.ryn%type)
IS
BEGIN
	update restaurant set ryn=p_ryn where rseq = p_rseq;
	commit;
end;


CREATE OR REPLACE PROCEDURE nextOrderStatement(p_oseq IN orders.oseq%type)
IS
BEGIN
	update orders set result=result+1 where oseq=p_oseq;
end;


CREATE OR REPLACE PROCEDURE selectOrdersIngByRseq(p_rseq IN number, p_cur OUT SYS_REFCURSOR)
IS
BEGIN
 	open p_cur for
 	select DISTINCT oseq, indate,totalprice,result,nick,oname,oadd1,oadd2,ophone, rideryn from order_view 
 	where rseq=p_rseq and result in (0,1) order by oseq desc;
end;


select  DISTINCT oseq, indate,totalprice,result,nick,oadd1,oadd2,ophone, rideryn  from order_view where rseq=23 and result in (0,1) order by oseq desc;


CREATE OR REPLACE PROCEDURE selectOrdersAllByRseq(p_rseq IN number, p_cur OUT SYS_REFCURSOR)
IS
BEGIN
	 open p_cur for
	 select DISTINCT oseq, indate,totalprice,result,nick,oname,oadd1,oadd2,ophone, rideryn from order_view 
 	where rseq=p_rseq order by oseq desc;
end;


create or replace procedure selectReview(
    p_rseq in number,
    key in number,
    p_cur out sys_refcursor
)
is
begin
    open p_cur for
        select*from review where rseq=p_rseq and replyyn<key order by review_seq desc;
end;



--member


create or replace procedure rollingBanner(p_cur out sys_refcursor)
is
begin
    open p_cur for
    select*from bannerf where border<=3 order by border;
end;


create or replace procedure getMember(p_id IN member.id%type, p_curvar OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN p_curvar For 
    select * from member where id=p_id;
END;


CREATE OR REPLACE PROCEDURE insertMember(
    p_id IN member.id%TYPE,
    p_pwd IN member.pwd%TYPE,
    p_name IN member.name%TYPE,
    p_email IN member.email%TYPE,
    p_phone IN member.phone%TYPE,
    p_zip_num IN member.zip_num%TYPE,
    p_address1 IN member.address1%TYPE,
    p_address2 IN member.address2%TYPE,
    p_address3 IN member.address3%TYPE,
    p_nick IN member.nick%TYPE 
)
IS
BEGIN
    INSERT INTO member( id, pwd, name, email, phone, zip_num, address1, address2, address3, nick)
    VALUES( p_id, p_pwd, p_name, p_email, p_phone, p_zip_num, p_address1, p_address2, p_address3, p_nick );
    COMMIT;
END;


create or replace procedure memberFindId(p_name in member.name%type, p_curvar OUT SYS_REFCURSOR)
is
begin
    open p_curvar for
    select * from member where name=p_name;
end;


create or replace procedure memberQnaList(p_rc out sys_refcursor)
IS
BEGIN
	open p_rc for
	select * from qna order by qseq desc;
END;


create or replace procedure memberUpdate(
    p_id IN member.id%TYPE,
    p_pwd IN member.pwd%TYPE,
    p_name IN member.name%TYPE,
    p_email IN member.email%TYPE,
    p_phone IN member.phone%TYPE,
    p_zip_num IN member.zip_num%TYPE,
    p_address1 IN member.address1%TYPE,
    p_address2 IN member.address2%TYPE,
    p_address3 IN member.address3%TYPE,
    p_nick IN member.nick%TYPE,
    p_curvar out sys_refcursor
)
IS
BEGIN
    UPDATE member SET pwd=p_pwd, name=p_name, email=p_email, phone=p_phone, zip_num = p_zip_num, address1=p_address1, address2=p_address2, address3=p_address3, nick=p_nick
    WHERE id=p_id;
    COMMIT;
    OPEN p_curvar For select * from member where id=p_id;
END;


create or replace procedure withdrawalMember(p_id IN member.id%TYPE)
is 
v_cur SYS_REFCURSOR;
v_oseq NUMBER;
begin
    OPEN v_cur for select oseq from orders where id=p_id;
    LOOP
        FETCH v_cur INTO v_oseq;
        EXIT WHEN v_cur%NOTFOUND;
        delete from order_detail where oseq=v_oseq;
    END LOOP;
    delete from review where id=p_id;
    delete from orders where id=p_id;
    delete from cart where id=p_id;  
    delete from member where id=p_id;
    COMMIT;
end;

------------------------------------

CREATE OR REPLACE  PROCEDURE getMemberFooba( p_id IN member.id%type, p_curvar OUT SYS_REFCURSOR )
IS
BEGIN
    OPEN  p_curvar  FOR SELECT*FROM member WHERE id = p_id; 
END;


CREATE OR REPLACE  PROCEDURE FimagebyRseq(p_rseq IN NUMBER, p_cur OUT SYS_REFCURSOR )
IS
BEGIN
    OPEN p_cur  FOR select distinct fimage from foodmenu where rseq=p_rseq;
END;


CREATE OR REPLACE  PROCEDURE SearchResList(p_searchtext IN varchar2, p_key OUT SYS_REFCURSOR )
IS
BEGIN
    OPEN  p_key  FOR 
    select rname, rseq, rimage, kind, hash from search where ryn in(1,3) 
    and (fname like '%'||p_searchtext||'%' or hash like '%'||p_searchtext||'%'  or  rname like '%'||p_searchtext||'%') group by rname,rseq,rimage,kind,hash;         
END;


CREATE OR REPLACE  PROCEDURE searchKind(p_kind IN restaurant.kind%TYPE, p_cur OUT SYS_REFCURSOR )
IS
BEGIN
    OPEN  p_cur  FOR 
    select*from restaurant where kind=p_kind and ryn in(1,3);
END;


CREATE OR REPLACE  PROCEDURE resInf(p_rseq IN restaurant.rseq%TYPE, p_cur OUT SYS_REFCURSOR )
IS
BEGIN
    OPEN  p_cur  FOR 
	select*from restaurant where rseq=p_rseq;
END;


CREATE OR REPLACE  PROCEDURE reviewList(p_rseq IN review.rseq%TYPE, p_cur OUT SYS_REFCURSOR )
IS
BEGIN
    OPEN  p_cur  FOR 
	select*from review where rseq=p_rseq order by review_seq desc;
END;


CREATE OR REPLACE  PROCEDURE cartList( p_rseq IN cart.rseq%TYPE,  p_id IN cart.id%TYPE, p_cur OUT SYS_REFCURSOR )
IS
BEGIN
    OPEN  p_cur  FOR 
	select * from cart where id=p_id and rseq=p_rseq;
END;


CREATE OR REPLACE  PROCEDURE getFoodDetail(p_fseq IN foodmenu.fseq%TYPE, p_cur OUT SYS_REFCURSOR )
IS
BEGIN
    OPEN  p_cur  FOR 
	select*from foodmenu where fseq=p_fseq;
END;


CREATE OR REPLACE PROCEDURE insertCartFooba( 
    p_id  IN cart.id%type,
    p_fseq IN cart.fseq%type,
    p_sideyn1 IN cart.sideyn1%type,
    p_sideyn2 IN cart.sideyn2%type,
    p_sideyn3 IN cart.sideyn3%type,
    p_quantity  IN cart.quantity%type,
    p_cprice  IN cart.cprice%type,
    p_cfname  IN cart.cfname%type,
    p_rseq  IN cart.rseq%type
)
IS
BEGIN
    insert into cart(cseq,id,fseq,sideyn1,sideyn2,sideyn3,quantity,cprice,cfname,rseq)
	values(cart_seq.nextVal,p_id,p_fseq,p_sideyn1,p_sideyn2,p_sideyn3,p_quantity,p_cprice,p_cfname,p_rseq);
    commit;
END;


CREATE OR REPLACE PROCEDURE deletecartFooba( p_cseq IN cart.cseq%TYPE , p_rseq IN cart.rseq%TYPE )
IS
BEGIN
	DELETE FROM cart WHERE cseq = p_cseq;    
END;


CREATE OR REPLACE PROCEDURE CartListFooba(p_id IN cart.id%TYPE, p_rseq IN cart.rseq%TYPE, p_cur OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN p_cur FOR
	SELECT * FROM cart WHERE id=p_id and rseq=p_rseq;      
END;


CREATE OR REPLACE PROCEDURE lookupOseq(p_id IN orders.id%type, p_oseq OUT orders.oseq%type)
IS
BEGIN
    select max(oseq)  into p_oseq from orders where id=p_id;
END;


CREATE OR REPLACE PROCEDURE insertOrder_Detail(p_oseq IN order_detail.oseq%type, p_quantity IN order_detail.quantity%type,p_fseq IN order_detail.fseq%type, 
p_sideyn1 IN varchar2,p_sideyn2 IN varchar2,p_sideyn3 IN varchar2)
IS
    v_sideyn1 number;
    v_sideyn2 number;
    v_sideyn3 number;
BEGIN
	if(p_sideyn1 is null) then v_sideyn1 := 0;
	else v_sideyn1 := 1;
	end if;
	if(p_sideyn2 is null) then v_sideyn2 := 0;
	else v_sideyn2 := 1;
	end if;
	if(p_sideyn3 is null) then v_sideyn3 := 0;
	else v_sideyn3 := 1;
	end if;
	INSERT INTO order_detail(odseq, oseq, quantity, fseq, sideyn1, sideyn2, sideyn3 )
	VALUES(order_detail_seq.nextVal, p_oseq, p_quantity, p_fseq, v_sideyn1, v_sideyn2, v_sideyn3);
	commit;
END;


CREATE OR REPLACE PROCEDURE delCart( p_cseq  IN varchar2   )
IS
BEGIN
    DELETE FROM cart WHERE cseq = p_cseq;
    COMMIT;    
END;


CREATE OR REPLACE PROCEDURE insertOrder(p_rseq IN orders.rseq%type, p_id IN orders.id%type, p_rideryn IN orders.rideryn%type,
    p_plasticyn IN orders.plasticyn%type, p_payment IN orders.payment%type, p_address1  IN orders.address1%type, p_address2  IN orders.address2%type,
    p_phone  IN orders.phone%type,p_totalprice  IN orders.totalprice%type,  p_oname  IN orders.oname%type)
IS
BEGIN
    INSERT INTO orders(oseq, rseq, id, rideryn, plasticyn, payment, address1, address2, phone, oname ,totalprice)
    VALUES(orders_seq.nextVal, p_rseq, p_id, p_rideryn, p_plasticyn, p_payment, p_address1, p_address2, p_phone,p_oname, p_totalprice);
    commit;
END;


CREATE OR REPLACE PROCEDURE getOrderCount( p_id IN orders.id%TYPE, p_oa IN varchar2, p_cnt  OUT  NUMBER)
IS
BEGIN
	if (p_oa ='?���?') then
		select count(rownum) into p_cnt from orders where id=p_id;
	else
    	select count(rownum) into p_cnt from orders where id=p_id and result in(0,1);
    end if;
END;


CREATE OR REPLACE PROCEDURE selectOrdersById( p_id IN orders.id%TYPE, p_oa IN varchar2, p_startNum IN NUMBER, p_endNum IN NUMBER, p_cur OUT SYS_REFCURSOR)
IS
BEGIN
	IF(p_oa ='?���?')then
		OPEN p_cur FOR
        select * from ( select * from ( select rownum as rn, b.* from 
        ((select distinct oseq,rseq,oname,rname,rimage,indate,result,totalprice from order_view where id=p_id  order by oseq desc) b)) where rn>=p_startNum ) where rn<=p_endNum;
	ELSE
		OPEN p_cur FOR
		select * from ( select * from ( select rownum as rn, b.* from 
		((select distinct oseq,rseq,oname,rname,rimage,indate,result,totalprice from order_view where id=p_id and result in(0,1) order by oseq desc) b)) where rn>=p_startNum ) where rn<=p_endNum;
	END IF;
END;


create or replace PROCEDURE getOrderbyOseq(p_oseq IN number, p_cur OUT SYS_REFCURSOR)
IS
BEGIN
 open p_cur for
    select * from orders where oseq=p_oseq;
end;


create or replace PROCEDURE getOrderReviewByOseq(p_oseq IN number, p_cur OUT SYS_REFCURSOR )
IS
BEGIN
    open p_cur for
    select * from review where oseq=p_oseq;
end;


create or replace PROCEDURE selectOrderViewByOseq( p_oseq IN order_view.oseq%TYPE, p_cur OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN p_cur FOR select * from order_view where oseq=p_oseq;
END;


create or replace PROCEDURE memberReviewWrite(
p_id in review.id%type,
p_rseq in review.rseq%type,
p_star in review.star%type,
p_image in review.image%type,
p_content in review.content%type,
p_oseq in review.oseq%type,
p_nick in review.nick%type
)
IS
BEGIN
    insert into review (review_seq,id,rseq,star,image,content,oseq,nick) values (review_seq_seq.nextVal,p_id,p_rseq,p_star,p_image,p_content,p_oseq,p_nick);
	update orders set result=3 where oseq=p_oseq;
    commit;
END;
	
    
create or replace procedure memberFindpw(p_id in member.id%type, p_curvar OUT SYS_REFCURSOR)
is
begin
    open p_curvar for
    select * from member where id=p_id;
end;


create or replace procedure updateReply(
    p_rseq in number,
    p_reply in varchar2
)
is
begin
    update review set reply=p_reply,replyyn='1' where review_seq=p_rseq;
    commit;
end;