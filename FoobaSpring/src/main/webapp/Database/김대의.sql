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

create or replace procedure getRes(
    p_rname in restaurant.rname%type,
    p_cur out sys_refcursor
)
is
    
begin
    open p_cur for
        select * from restaurant where rname=p_rname;
end;

