create or replace procedure getMemberFooba(
    p_id IN member.id%type,
    p_cursor OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_cursor For select * from member where id=p_id;
END;
