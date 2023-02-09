create or replace procedure getAdmin(
p_id in admin.id%type,
p_rc out sys_refcursor
)
IS
BEGIN
    open p_rc for
    select * from admin where id = p_id;
END;

create or replace procedure adminGetAllCount(
p_table in varchar2,
p_key in varchar2,
p_cnt out number
)
IS
BEGIN
if p_table= 'r' then
    select count(*) into p_cnt from restaurant where rname like '%'|| p_key ||'%';
elsif p_table='o' then
    select count(*) into p_cnt from order_view where id like '%'|| p_key ||'%' or rname like '%'|| p_key ||'%';
elsif p_table='m' then
    select count(*) into p_cnt from member where id like '%'|| p_key ||'%';
elsif p_table='q' then
    select count(*) into p_cnt from qna where content like '%'|| p_key ||'%' or subject like '%'|| p_key ||'%';
elsif p_table= 'b' then
    select count(rownum) into p_cnt from banner;
end if;
END;


create or replace procedure adminList(
p_table in varchar2,
p_key in varchar2,
p_startNum in number,
p_endNum in number,
p_rc out sys_refcursor
)
IS
BEGIN
if p_table= 'r' then
    open p_rc for
    select * from (select * from (select rownum as rn, b.* from ((select * from restaurant where rname like '%'|| p_key ||'%' order by rseq desc) b)) where rn>=p_startNum) where rn<=p_endNum;
elsif p_table= 'o' then
    open p_rc for
    select * from (select * from (select rownum as rn, b.* from ((select * from order_view where id like '%'|| p_key ||'%' or rname like '%'|| p_key ||'%' order by odseq desc) b)) where rn>=p_startNum) where rn<=p_endNum;
elsif p_table= 'm' then
    open p_rc for
    select * from (select * from (select rownum as rn, b.* from ((select * from member where id like '%'|| p_key ||'%' order by indate desc) b)) where rn>=p_startNum) where rn<=p_endNum;
elsif p_table= 'q' then
    open p_rc for
    select * from (select * from (select rownum as rn, b.* from ((select * from qna where content like '%'|| p_key ||'%' or subject like '%'|| p_key ||'%' order by qseq desc) b)) where rn>=p_startNum) where rn<=p_endNum;
elsif p_table= 'b' then
    open p_rc for
    select * from banner order by useyn desc, order_seq asc;
end if;
END;



create or replace procedure admin_resOx( p_ox in number, p_rseq in number )
IS
BEGIN
    update restaurant set ryn=p_ox where rseq=p_rseq;
    commit;
END;

