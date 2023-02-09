CREATE OR REPLACE  PROCEDURE getMemberFooba( p_id IN member.id%type, p_curvar OUT SYS_REFCURSOR )
IS
BEGIN
        OPEN  p_curvar  FOR SELECT*FROM member WHERE id = p_id; 
END;


CREATE OR REPLACE  PROCEDURE SearchResList(p_searchtext IN varchar2, p_key OUT SYS_REFCURSOR )
IS
    v_key  SYS_REFCURSOR;
BEGIN
    OPEN  v_key  FOR 
         select rname, rseq, rimage, kind, hash from search  where ryn in(1,3) 
         and (fname like '%'||p_searchtext||'%' or hash like '%'||p_searchtext||'%'  or  rname like '%'||p_searchtext||'%') group by rname,rseq,rimage,kind,hash;       
END;

