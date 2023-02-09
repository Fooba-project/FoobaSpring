create or replace procedure getRes(
    p_rid in restaurant.rid%type,
    p_cur out sys_refcursor
)
is
    
begin
    open p_cur for
        select * from restaurant where rid=p_rid;
end;