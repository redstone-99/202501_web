-- 가입된 회원정보를 저장할 테이블
CREATE TABLE users(
	num NUMBER PRIMARY KEY,
	userName VARCHAR2(100) UNIQUE,
	password VARCHAR2(100) NOT NULL,
	email VARCHAR2(100) UNIQUE,
	profileImage VARCHAR2(100),
	--'USER','STAFF','ADMIN' 만 들어간다.
	role VARCHAR2(10) DEFAULT 'USER' CHECK (role IN ('USER','STAFF','ADMIN')),
	createdAt DATE DEFAULT SYSDATE,
	updatedAt DATE DEFAULT SYSDATE
);

-- 회원번호를 얻어낼 시퀀스
CREATE SEQUENCE users_seq;