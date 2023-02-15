CREATE OR REPLACE PROCEDURE foodList(
    p_rseq IN foodmenu.rseq%type,
    p_cur OUT SYS_REFCURSOR
)
IS

BEGIN

    open p_cur for

            SELECT * FROM foodmenu WHERE rseq = p_rseq; 
end;

CREATE OR REPLACE PROCEDURE selectFood(
    p_fseq IN foodmenu.fseq%type,
    p_cur OUT SYS_REFCURSOR
)
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

CREATE OR REPLACE PROCEDURE deleteFoodMenu(
    p_fseq IN foodmenu.fseq%type

)
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
        update foodmenu set fname=p_fname, fprice=p_fprice, fimage=p_fimage, fcontent=p_fcontent, fside1=p_fside1, fsideprice1=p_fsideprice1,
        fside2=p_fside2, fsideprice2=p_fsideprice2, fside3=p_fside3, fsideprice3=p_fsideprice3

            where fseq = p_fseq;  
    commit;

end;



CREATE OR REPLACE PROCEDURE restRes(
    p_rseq IN foodmenu.rseq%type,
     p_ryn IN restaurant.ryn%type
)
IS

BEGIN
            update restaurant set ryn=p_ryn where rseq = p_rseq;
            commit;
end;


CREATE OR REPLACE PROCEDURE nextOrderStatement(
    p_oseq IN orders.oseq%type

)
IS

BEGIN
        update orders set result=result+1 where oseq=p_oseq;

end;




CREATE OR REPLACE PROCEDURE selectOrdersIngByRseq(
    p_rseq IN number,
    p_cur OUT SYS_REFCURSOR

)
IS

BEGIN
 open p_cur for
    select DISTINCT oseq, indate,totalprice,result,nick,oname,oadd1,oadd2,ophone, rideryn from order_view where rseq=p_rseq and result in (0,1) order by oseq desc;

end;

select  DISTINCT oseq, indate,totalprice,result,nick,oadd1,oadd2,ophone, rideryn  from order_view where rseq=23 and result in (0,1) order by oseq desc;



--alter table orders add oname varchar2(100);

--create or replace view order_view
--as
--select a.oseq, a.result, a.oname, a.indate, a.id, a.rideryn, a.plasticyn, a.payment, a.address1 as oadd1, a.address2 as oadd2, a.phone as ophone, a.totalprice,
--      b.odseq, b.quantity, b.fseq, b.sideyn1, b.sideyn2, b.sideyn3,
--      c.nick, c.address1 as madd1, c.address2 as madd2, c.phone as mphone,
--      d.fname, d.fprice, d.fside1, d.fside2, d.fside3, d.fsideprice1, d.fsideprice2, d.fsideprice3, d.fimage, d.fcontent,
--      e.rname, e.rseq, e.rimage, e.rtip, e.ryn
--from orders a, order_detail b, member c, foodmenu d, restaurant e
--where a.oseq=b.oseq and a.id = c.id and b.fseq=d.fseq and d.rseq=e.rseq;


