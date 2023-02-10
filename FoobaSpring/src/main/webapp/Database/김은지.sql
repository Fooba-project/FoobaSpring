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

CREATE OR REPLACE  PROCEDURE cartList(p_rseq IN cart.rseq%TYPE, p_id IN cart.id%TYPE, p_cur OUT SYS_REFCURSOR )
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


CREATE OR REPLACE PROCEDURE CartListSum( p_id IN cart.id%type, p_rseq IN cart.rseq%type, p_sum OUT NUMBER)
IS
v_sum SYS_REFCURSOR;
v_cprice NUMBER;
BEGIN
    -- p_sum:=0;
    OPEN v_sum FOR
            select * from cart where id=p_id and rseq=p_rseq;
        LOOP
                FETCH v_sum INTO v_cprice;    
                EXIT WHEN v_sum%NOTFOUND;    
                p_sum := p_sum+v_cprice;
        END LOOP;
end;

CREATE OR REPLACE PROCEDURE CartListSum( p_id IN cart.id%type, p_rseq IN cart.rseq%type, p_sum OUT NUMBER)
IS
v_sum SYS_REFCURSOR;
v_cprice NUMBER;
BEGIN
        -- p_sum:=0;
        OPEN v_sum FOR
            select * from cart where id=p_id and rseq=p_rseq;
        close v_sum;
        
        LOOP
                FETCH v_sum INTO v_cprice;    
                EXIT WHEN v_sum%NOTFOUND;    
                p_sum := p_sum+v_cprice;
        END LOOP;
end;


insert into cart(cseq,quantity,id,fseq,cprice,cfname,rseq)values(cart_seq.nextval,1,'bsc1234',243,7000,'시나몬 밀크쉐이크',48);

select * from cart;