select * from emp, dept;

select * from emp cross join dept where emp.deptno = dept. deptno;

select ename, dname from emp cross join dept where emp.deptno = dept. deptno;

--테이블 별칭을 이용해서 컬럼 구별
select e.ename, d.dname from emp e, dept d where e.deptno = d.deptno;

--테이블 조인 연습
select empno, ename, job, dname, loc from emp e, dept d where e.deptno = d.deptno and e.ename = 'SCOTT';

--inner join 형식 연습
select * from emp e join dept d using (deptno) where ename = 'SCOTT';

select * from emp e join dept d using (deptno);

select * from emp e join dept d using (deptno) where dname = 'SALES0';

--salgrade 테이블을 사용해서 사원들의 사번, 이름 ,급여, 급여 등급을 출력
select ename, sal, grade from emp, salgrade s where emp.sal between s.losal and s.hisal;

select ename, losal, sal, hisal, grade from emp e join salgrade s on e.sal between s.losal and s.hisal;
