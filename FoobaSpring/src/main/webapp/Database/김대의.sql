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

create or replace procedure resFindId(
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

update restaurant set raddress2='999�� 999ȣ', raddress3='���̱�',zip_num='01234';

select*from restaurant;

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

select*from restaurant;

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

create or replace procedure withdrawal(
    p_rid in varchar2
)
is 
begin
    update restaurant set ryn=2 where rid=p_rid;
    COMMIT;
end;