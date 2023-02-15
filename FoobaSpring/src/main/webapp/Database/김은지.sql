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

select*from restaurant;

CREATE OR REPLACE  PROCEDURE cartList( p_rseq IN cart.rseq%TYPE,  p_id IN cart.id%TYPE, p_cur OUT SYS_REFCURSOR )
IS
BEGIN
    OPEN  p_cur  FOR 
        select * from cart where id=p_id and rseq=p_rseq;
END;

CREATE OR REPLACE PROCEDURE foodList( p_rseq IN foodmenu.rseq%type,p_cur OUT SYS_REFCURSOR)
IS
BEGIN
    open p_cur for
            SELECT * FROM foodmenu WHERE rseq = p_rseq; 
end;


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


CREATE OR REPLACE PROCEDURE CartListFooba(
    p_id IN cart.id%TYPE,
    p_rseq IN cart.rseq%TYPE,
    p_cur OUT SYS_REFCURSOR    
)
IS
BEGIN
        OPEN p_cur FOR
            SELECT * FROM cart WHERE id=p_id and rseq=p_rseq;      
END;


--CREATE OR REPLACE PROCEDURE insertOrdersFooba( p_id IN orders.id%type, p_rideryn IN orders.rideryn%type,
--    p_plasticyn IN orders.plasticyn%type, p_payment IN orders.payment%type, p_address1  IN orders.address1%type, p_address2  IN orders.address2%type,
--    p_address3  IN orders.address3%type, p_phone  IN orders.phone%type,p_totalprice  IN orders.totalprice%type
--)
--IS
--
--BEGIN
--   insert into orders(oseq,id,rideryn,plasticyn,payment,address1,address2,address3,phone,totalprice) 
--   values(orders_seq.nextVal,p_id,p_rideryn,p_plasticyn,p_payment,p_address1,p_address2,p_address3,p_phone, p_totalprice);
--    commit;
--END;
--
--CREATE OR REPLACE PROCEDURE insertOrderFooba(p_id IN orders.id%type,p_oseq IN order_detail.oseq%type,p_quantity IN order_detail.quantity%type,p_fseq IN order_detail.fseq%type,
--p_sideyn1 IN order_detail.sideyn1%type, p_sideyn2 IN order_detail.sideyn2%type,p_sideyn3 IN order_detail.sideyn3%type)
--IS
--
--BEGIN
--    select max(oseq) as max_oseq from orders where id=p_id;
--    insert into order_detail(odseq,oseq,quantity,fseq,sideyn1,sideyn2,sideyn3)
--    values(order_detail_seq.nextVal,p_oseq,p_quantity,p_fseq,p_sideyn1,p_sideyn2,p_sideyn3);
--    commit;
--END;

 CREATE OR REPLACE PROCEDURE insertOrdersFooba( p_id IN orders.id%type, p_rideryn IN orders.rideryn%type,
    p_plasticyn IN orders.plasticyn%type, p_payment IN orders.payment%type, p_address1  IN orders.address1%type, p_address2  IN orders.address2%type,
    p_address3  IN orders.address3%type, p_phone  IN orders.phone%type,p_totalprice  IN orders.totalprice%type,    p_oseq OUT orders.oseq%type )
IS
    v_oseq orders.oseq%type;
    temp_cur SYS_REFCURSOR;
    v_cseq cart.cseq%type;
    v_fseq cart.fseq%type;
    v_quantity cart.quantity%type;
    v_sideyn1 cart.sideyn1%type;
    v_sideyn2 cart.sideyn2%type;
    v_sideyn3 cart.sideyn3%type;
BEGIN  
    INSERT INTO orders(oseq, id, rideryn, plasticyn, payment, address1, address2, address3, phone, totalprice)
    VALUES(orders_seq.nextVal, p_id, p_rideryn, p_plasticyn, p_payment, p_address1, p_address2, p_address3, p_phone, p_totalprice);
   select max(oseq) into v_oseq from orders where id=p_id;
     OPEN temp_cur FOR SELECT cseq, fseq, quantity FROM cart WHERE id = p_id ;    
    LOOP
        FETCH temp_cur INTO v_cseq, v_fseq, v_quantity;
        EXIT WHEN temp_cur%NOTFOUND;        --20มู
        INSERT INTO order_detail(odseq, oseq, quantity, fseq, sideyn1, sideyn2, sideyn3 )
        VALUES(order_detail_seq.nextVal, v_oseq, v_quantity, v_fseq, v_sideyn1, v_sideyn2, v_sideyn3);
        DELETE FROM cart WHERE id=p_id;
    END LOOP;
    commit;
    p_oseq := v_oseq;
END;



select*from orders where id='bsc1234';