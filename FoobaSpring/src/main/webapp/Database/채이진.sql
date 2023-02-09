CREATE OR REPLACE PROCEDURE foodList(
    p_rseq IN foodmenu.rseq%type,
    p_cur OUT SYS_REFCURSOR
)
IS

BEGIN

    open p_cur for

            SELECT * FROM foodmenu WHERE rseq = p_rseq; 
end;

