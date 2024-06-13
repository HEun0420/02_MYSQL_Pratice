create database ogclass_db;
show databases;
grant all privileges on ogclass_db.* to 'baeHE'@'%';
show grants for 'baeHE'@'%';

use ogclass_db;

/*
 우리반 데이터베이스를 만드세요
’ogclass’ database  생성

class table
student_no : [int] primary key, auto increament --> 프리마리
stuent_name : [varchar[255]] not null
gender : [varchar[5]] notnull check(’남’,’여’)
github_id : [varchar[255]]  not null, unique
email : [varchar[255]]  not null, unique
mbti : [varchar[10]]
subject_no : [int] foregin key, --> 포린키

favorite_subject table
subject_no : [int] primary key, auto increament
subject_name : [varchar[255]] not null, unique
 */

drop table if exists class;
create table if not exists class
(
    student_no int primary key auto_increment,
    student_name varchar(255) not null unique,
    gender varchar(5) check(gender in ('남','여')),
    gitgub_id varchar(255) not null unique,
    email varchar(255) not null,
    mbti varchar(10),
    subject_no int,
    foreign key(subject_no)
        references favorite_subject (subject_no)
);

describe class;

drop table if exists favorite_subject;
create table if not exists favorite_subject
(
    subject_no int primary key auto_increment,
    subject_name varchar(255) not null unique
);

describe favorite_subject;

insert into favorite_subject(subject_name)
values('SPRING'),
      ('JDBC'),
      ('JAVA'),
      ('MYSQL'),
      ('MYBATIS'),
      ('REACT');
select * from favorite_subject;

describe class;
insert into class (/*student_no 는 안넣어도 됨.*/ student_name, gender, gitgub_id, email, mbti, subject_no)
values ('박태근','남','Ohgiraffers-bear','bear.ohgiraffers@gmail.com', null,1),
       ('지동현','남','Bring2it2on','yjkl0516@gmail.com', null,3),
       ('김강현','남','kimkinghyeon','modan8199@gmail.com', 'ISFP',3),
       ('이득규','남','MANTISKYU','asdaron44@gmail.com', 'ESTP',4),
       ('홍주연','여','juyeon99','juyeon0806@gmail.com', 'ISFP',3),
       ('양혜연','여','yanghyeyeon','yhy4058@gmail.com', null,1),
       ('이규섭','남','LKS9616','lks609591@gmail.com', null,4),
       ('전유안','남','euuuuuuan','euan.may24@gmail.com', null,5),
       ('박성은','여','seongeun223','jklun080921@gmail.com', null,4),
       ('박하얀','여','parkhayarn','s0224y92@gmail.com', null, 5),
       ('위성민','남','wdh970616','wdh970616@naver.com', null, 5),
       ('박효찬','남','qwes5674','qwes5674@gmail.com', null,4),
       ('이의정','남','himisterlee','lejlej100418@gmail.com', null,4),
       ('권은혜','여','dmsgpk237','a01027947353@gmail.com', null,4),
       ('권보현','남','Kwonbohyun','kwon18923@gmail.com', null,4),
       ('배하은','여','HEun0420','usialeta@gmail.com', 'INTP',4),
       ('강연진','여','kangyeonjin','yeonjin917n.n@gmail.com', null,1),
       ('강진영','남','weed97','weed9935@gmail.com', null,4);


select * from class;
