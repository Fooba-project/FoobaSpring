create or replace procedure getMember(
    p_id IN member.id%type,
    p_curvar OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_curvar For select * from member where id=p_id;
END;
commit;