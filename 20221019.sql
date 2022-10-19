--2022.10.19
--transaction = 여러 dml(데이터의 변형) 들을 묶어둔것
-- commit : 작업의 완료, 데이터의 물리적 저장
-- rollback : 작업의 실패, 마지막 commit 상태로 되돌아감

drop table dept02;
create table dept02 as (select * from dept)

select * from dept02;

insert into dept02 value (50,'개발','서울');
insert into dept02 value (60,'기획','판교');
update dept02 set loc ='제주' where deptno = 60;

select  * from emp02;

--view
-- 데이터를 제한 할 수 있고 복잡한 sql을 단순하게 처리 가능

select empno, ename, deptno from emp where deptno = 30;

create or replace view emp_view30 as 
select empno, ename, deptno from emp where deptno = 30;

select * from emp_view30 where ename like'%K%';

select view_name, text from user_views;

drop view emp_view30;

--rownum + view 를 이용해서 상위 몇개를 자르기 가능함


drop table dept04;

create table dept04 as select * from dept where 1 = 0;
create sequence dept_deptno_seq increment by 10 start with 10;

insert into dept04 values (dept_deptno_seq.nextval, '개발', '서울');

select * from dept04;

drop table emp01;
create table emp01 as select * from emp;
insert into emp01 select * from emp01;
insert into emp01 (empno, ename) values (1111,'son');

select * from emp01;
select * from emp01 where ename = 'son';

delete from emp01;

create index index_emp01_ename on emp01(ename);