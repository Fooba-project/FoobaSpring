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

alter table restaurant add zip_num varchar2(100);
alter table restaurant add raddress2 varchar2(100);
alter table restaurant add raddress3 varchar2(100);

update restaurant set raddress2='999µ¿ 999È£', raddress3='½ÅÃÌ±æ',zip_num='01234';

select*from restaurant;