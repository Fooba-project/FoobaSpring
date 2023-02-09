create or replace procedure getMemberFooba(
    p_id IN member.id%type,
    p_cursor OUT SYS_REFCURSOR
)
IS
    result_cur SYS_REFCURSOR;
BEGIN
    OPEN result_cur For select * from member where id=p_id;
    p_cursor := result_cur;
END;

