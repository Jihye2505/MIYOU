/* Drop Tables */

DROP TABLE conf_topic CASCADE CONSTRAINTS;
DROP TABLE conf_mng CASCADE CONSTRAINTS;
DROP TABLE e_member CASCADE CONSTRAINTS;
DROP TABLE e_dept CASCADE CONSTRAINTS;
DROP TABLE e_position CASCADE CONSTRAINTS;
DROP TABLE e_message CASCADE CONSTRAINTS;
drop sequence message_seq;
drop sequence conf_num_seq;
drop sequence subtitle_id_seq;


/* Create Tables */

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

CREATE TABLE e_dept
(
	dept_id varchar2(20) NOT NULL,
	dept_name varchar2(20) NOT NULL,
	PRIMARY KEY (dept_id)
);

CREATE TABLE e_position
(
	job_id varchar2(20) NOT NULL,
	job_name varchar2(20),
	PRIMARY KEY (job_id)
);


CREATE TABLE conf_mng
(
	conf_num number NOT NULL,
	conf_date date NOT NULL,
	todate date DEFAULT SYSDATE NOT NULL,
	-- 회의 참석자
	-- 다국적, 우리회사, 다른회사
	employee_nums varchar2(1000) NOT NULL,
	title varchar2(1000) NOT NULL,
	writer varchar2(20) NOT NULL,
	deleteCheck number default 0 NOT NULL,
	savedfile varchar2(30),
	originalfile varchar2(30),
	PRIMARY KEY (conf_num)
);

CREATE TABLE conf_topic
(
	subtitle_id number NOT NULL,
	subtitle varchar2(4000) NOT NULL,
	employee_num varchar2(10),
	conf_num number NOT NULL,
	process number default 0,
	PRIMARY KEY (subtitle_id)
);


CREATE TABLE e_message
(
	message_num number NOT NULL,
	-- 보내는 사람 사원번호
	-- 
	employee_num varchar2(20) NOT NULL,
	-- 보낸 날짜
	send_date date NOT NULL,
	receiver_num varchar2(20) NOT NULL,
	content varchar2(1000) NOT NULL,
	-- R 개인 연락
	-- N 공지
	notice varchar2(10),
	-- unread 안읽음
	-- read 읽음
	checked varchar2(10) DEFAULT 'unread',
	trash number DEFAULT 0,
	PRIMARY KEY (message_num)
);



/* Create Sequences Keys */

create sequence message_seq;
create sequence conf_num_seq;
create sequence subtitle_id_seq;


/* Create Foreign Keys */

ALTER TABLE conf_topic
	ADD FOREIGN KEY (conf_num)
	REFERENCES conf_mng (conf_num)
	on DELETE cascade 
;


ALTER TABLE e_member
	ADD FOREIGN KEY (dept_id)
	REFERENCES e_dept (dept_id)
	on DELETE cascade 
;


ALTER TABLE e_member
	ADD FOREIGN KEY (job_id)
	REFERENCES e_position (job_id)
	on DELETE cascade 
;



/* Comments */

COMMENT ON COLUMN conf_mng.employee_nums IS '회의 참석자
다국적, 우리회사, 다른회사';
COMMENT ON COLUMN e_message.employee_num IS '보내는 사람 사원번호
';
COMMENT ON COLUMN e_message.send_date IS '보낸 날짜';
COMMENT ON COLUMN e_message.notice IS '0 개인 연락
1 공지';
COMMENT ON COLUMN e_message.checkm IS '0 안읽음
1 읽음';


/* insert jobs */
insert into e_dept (dept_id, dept_name) values (100,'General Affairs'); --관리팀
insert into e_dept (dept_id, dept_name) values (200,'Personnel Dept');	--인사팀
insert into e_dept (dept_id, dept_name) values (301,'Sales Team1');		--영업1팀
insert into e_dept (dept_id, dept_name) values (302,'Sales Team2');		--영업2팀
insert into e_dept (dept_id, dept_name) values (303,'Sales Team3');		--영업3팀
insert into e_dept (dept_id, dept_name) values (401,'R&D Team1');		--개발1팀
insert into e_dept (dept_id, dept_name) values (402,'R&D Team2');		--개발2팀
insert into e_dept (dept_id, dept_name) values (403,'R&D Team3');		--개발3팀

insert into e_position (job_id, job_name) values (10,'CEO'); 				--사장
insert into e_position (job_id, job_name) values (20,'Executive Director'); --전무
insert into e_position (job_id, job_name) values (30,'Director');			--이사
insert into e_position (job_id, job_name) values (40,'Head of Department'); --부장
insert into e_position (job_id, job_name) values (50,'Deputy Director');	--차장
insert into e_position (job_id, job_name) values (60,'Section Chief');		--과장
insert into e_position (job_id, job_name) values (70,'Asst Manager');		--대리
insert into e_position (job_id, job_name) values (80,'Employee');			--사원

