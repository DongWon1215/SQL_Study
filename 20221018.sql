--20221018

-- inline view - rownum
-- from 절 뒤에 오는 서브쿼리를 inline view라고 함
-- select의 결과도 테이블
-- 사용자가 생성하는 컬럼X 시스템에서 제공하는 컬럼, insert된 순서대로 카운트 되어 자동적으로 생성

--top3 추출과 같은 작업이 가능해짐
--ex :
select rownum, t.* from (select * from emp order by hiredate) t where rownum <= 3;

--mysql 에서는 rownum 대신 limit라는 키워드를 사용한다
--limit(SELECT 시작 위치, 출력할 갯수) 방식

