CREATE OR REPLACE  PROCEDURE getMemberFooba(
    p_id IN member.id%type,
    p_curvar OUT SYS_REFCURSOR 
)
IS
    result_cur SYS_REFCURSOR ;
BEGIN
        OPEN  result_cur  FOR
            SELECT*FROM member WHERE id = p_id;
        p_curvar := result_cur;        
END;