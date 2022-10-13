-- 20221012

-- 사용 가능한 테이블 정보
select deptno, job, sal, ename
from emp;

-- 테이블 구조 정보 
desc dept;

-- select 컬럼이름, 컬럼이름, ...
-- from 테이블이름

-- distinct : 중복값 제거
-- [] : 키워드 또는 특수문자를 사용한다 표시
-- 컬럼 이름에 원하는 자료 순서대로 입력시 입력한 순서대로 출력된다
-- select[distinct] 컬럼이름, 컬럼이름, ...
-- from 테이블이름

select * from dept; -- 행을 선택하는 조건이 없기 때문에 모든 행이 결과로 출력

select deptno, dname 
from dept;
-- select 표현영역에서는 산술 연산이 가능
-- select을 이용해서 새로운 collum을 생성 가능
-- 산술 기호를 사용하면 해당 컬럼들의 값을 이용하되 연산의 결과를 연산식과 동일한 컬럼에 저장
select sal * comm 
from emp;

-- Null : 정해지지 않은 값, 알수없는 값, 연산, 할당, 비교가 불가능

select sal, sal - 100 
from emp;

select sal * 12
from emp;

-- 사원 테이블에서 사원 이름, 월 급여, 연봉 출력
-- null의 값을 치환해주는 함수 : nvl(원본데이터, 치환값)
-- mysql에선 ifnull(원본 데이터, 치환값) 함수로 null값 치환
select ename, sal, sal * 12, sal * 12 + nvl(comm, 0) 
from emp;

-- 데이터 뒤에 as 별칭명 을 입력하면 해당 칼럼이름을 별칭으로 인식

--문자열 연산
/
-- || : 문자열 더하기
-- '' : 문자열 입력, 출력되는 문자열에 추가됨
-- mysql에선 concat함수를 이용해서 문자열 합침
select ename, ename || '+' || job
from emp;

select * 
from emp
where sal >= 3000;

--키워드나 테이블 이름은 대소문자를 가리지 않지만 ''사이의 문자열은 대소문자를 구분한다
select *
from emp
where ename = 'SCOTT';


select *
from emp
where hiredate = '01/11/17';    --날짜 비교 시에서도 작은 따옴표를 사용해서 비교

-- 10번 부서에 소속된 사원이거나 직급이 manager인 사람을 검색하여
-- 사원명, 부서번호, 직급을 출력
select ename, deptno, job
from emp
where deptno = 10 or job = 'MANAGER';

