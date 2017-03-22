
/* Drop Tables */

DROP TABLE conf_topic CASCADE CONSTRAINTS;
DROP TABLE conf_mng CASCADE CONSTRAINTS;
DROP TABLE e_member CASCADE CONSTRAINTS;
DROP TABLE e_dept CASCADE CONSTRAINTS;
DROP TABLE e_message CASCADE CONSTRAINTS;
DROP TABLE e_position CASCADE CONSTRAINTS;



/* Create Tables */

CREATE TABLE conf_mng
(
	conf_num number NOT NULL,
	conf_date date NOT NULL,
	-- 회의 참석자
	-- 다국적, 우리회사, 다른회사
	employee_num varchar2(1000) NOT NULL,
	title varchar2(20) NOT NULL,
	savedfile varchar2(30) NOT NULL,
	originalfile varchar2(30) NOT NULL,
	PRIMARY KEY (conf_num)
);


CREATE TABLE conf_topic
(
	subtitle_id number NOT NULL,
	subtitle varchar2(4000) NOT NULL,
	employee_num number,
	conf_num number NOT NULL,
	process number,
	PRIMARY KEY (subtitle_id)
);


CREATE TABLE e_dept
(
	dept_id varchar2(20) NOT NULL,
	dept_name varchar2(20) NOT NULL,
	PRIMARY KEY (dept_id)
);


CREATE TABLE e_member
(
	employee_num varchar2(10) NOT NULL,
	password varchar2(20) NOT NULL,
	name varchar2(20) NOT NULL,
	manager_num varchar2(20),
	email varchar2(30) NOT NULL,
	language varchar2(20) NOT NULL,
	phone varchar2(20),
	dept_id varchar2(20) NOT NULL,
	job_id varchar2(20) NOT NULL,
	PRIMARY KEY (employee_num)
);


CREATE TABLE e_message
(
	massage_num number NOT NULL,
	-- 보내는 사람 사원번호
	-- 
	employee_num varchar2(20) NOT NULL,
	-- 보낸 날짜
	send_date date NOT NULL,
	receiverenum varchar2(20) NOT NULL,
	text varchar2(1000) NOT NULL,
	-- 0 개인 연락
	-- 1 공지
	notice number DEFAULT 0,
	-- 0 안읽음
	-- 1 읽음
	checkm number DEFAULT 0,
	PRIMARY KEY (massage_num)
);


CREATE TABLE e_position
(
	job_id varchar2(20) NOT NULL,
	job_name varchar2(20),
	PRIMARY KEY (job_id)
);



/* Create Foreign Keys */

ALTER TABLE conf_topic
	ADD FOREIGN KEY (conf_num)
	REFERENCES conf_mng (conf_num)
;


ALTER TABLE e_member
	ADD FOREIGN KEY (dept_id)
	REFERENCES e_dept (dept_id)
;


ALTER TABLE e_member
	ADD FOREIGN KEY (job_id)
	REFERENCES e_position (job_id)
;



/* Comments */

COMMENT ON COLUMN conf_mng.employee_num IS '회의 참석자
다국적, 우리회사, 다른회사';
COMMENT ON COLUMN e_message.employee_num IS '보내는 사람 사원번호
';
COMMENT ON COLUMN e_message.send_date IS '보낸 날짜';
COMMENT ON COLUMN e_message.notice IS '0 개인 연락
1 공지';
COMMENT ON COLUMN e_message.checkm IS '0 안읽음
1 읽음';



