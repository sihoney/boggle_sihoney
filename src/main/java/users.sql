--테이블 삭제
drop table users;

--시퀀스 삭제
drop sequence seq_user_no;

--테이블생성
CREATE TABLE users (
	user_no NUMBER NOT NULL, /* user_no */
	user_name VARCHAR2(100), /* 이름 */
	nickname VARCHAR2(200), /* 닉네임 */
	email VARCHAR2(500) UNIQUE, /* 이메일 */
	password VARCHAR2(100), /* 비밀번호 */
	user_profile VARCHAR2(500), /* 프로필 이미지 경로 */
	join_date date, /* 가입날짜 */
    PRIMARY KEY(user_no)
);

--시퀀스 생성
CREATE SEQUENCE seq_user_no
INCREMENT BY 1 
START WITH 1 ;

--insert
insert into users
values(seq_user_no.nextval, '황일영', '가짜정우성', '1young@naver.com', '1234', '@@@@@', sysdate);
insert into users
values(seq_user_no.nextval, '김지연', '니모먹는스폰지밥', 'delay516@naver.com', '1234', '@@@@@', sysdate);
insert into users
values(seq_user_no.nextval, '이영림', '구직중입니다', 'rm1113@naver.com', '1234', '@@@@@', sysdate);
insert into users
values(seq_user_no.nextval, '장서윤', '신호는우엥', 'westyoon501@naver.com', '1234', '@@@@@', sysdate);
insert into users
values(seq_user_no.nextval, '황인경', '후추가득스테이크', 'inKe831@naver.com', '1234', '@@@@@', sysdate);
insert into users
values(seq_user_no.nextval, '황희원', '마크부인캐나다인', 'hee1@naver.com', '1234', '@@@@@', sysdate);

       
commit;   

select *
from users;
              
select  user_no,
        user_name,
        nickname,
        email,
        password,
        user_profile,
        to_char(join_date,'yyyy-mm-dd hh:mi:ss') join_date
from users;


--update문
update users 
set nickname = '제발채용해주세요'
where user_no = 3;


--delete문
delete from users
where no = 4;

