create or replace procedure getMember(
    p_id IN member.id%type,
    p_curvar OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_curvar For select * from member where id=p_id;
END;
commit;

CREATE OR REPLACE PROCEDURE insertMember(
    p_id IN member.id%TYPE,
    p_pwd IN member.pwd%TYPE,
    p_name IN member.name%TYPE,
    p_email IN member.email%TYPE,
    p_phone IN member.phone%TYPE,
    p_zip_num IN member.zip_num%TYPE,
    p_address1 IN member.address1%TYPE,
    p_address2 IN member.address2%TYPE,
    p_address3 IN member.address3%TYPE,
    p_nick IN member.nick%TYPE 
)
IS
BEGIN
    INSERT INTO member( id, pwd, name, email, phone , zip_num, address1, address2, address3, nick)
    VALUES( p_id, p_pwd, p_name, p_email, p_phone, p_zip_num, p_address1, p_address2, p_address3, nick);
    COMMIT;
END;
