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
        update foodmenu set fname=p_fname, fprice=p_fprice, fimage=p_fimage, fcontent=p_fcontent, fside1=p_fside1, fsideprice1=p_fsideprice1,
        fside2=p_fside2, fsideprice2=p_fsideprice2, fside3=p_fside3, fsideprice3=p_fsideprice3

            where fseq = p_fseq;  
    commit;

end;


create or replace procedure getRes(
    p_rid in restaurant.rid%type,
    p_cur out sys_refcursor
)
is
    
begin
    open p_cur for
        select * from restaurant where rid=p_rid;
end;


create or replace procedure starAvg(
    p_rseq in number,
    p_cur out sys_refcursor
)
is
begin
    open p_cur for
        select*from review where rseq=p_rseq;
end;


