--1 마당서점의고객이요구하는다음질문에대해SQL 문을작성하시오.
--(5) 박지성이구매한도서의출판사수
select count(distinct publisher) from book where bookid in (select bookid from orders where custid = 1);

--(6) 박지성이구매한도서의이름, 가격, 정가와판매가격의차이
select bookname, b.price, b.price - o.saleprice as gap from book b, orders o where o.custid = 1 and b.bookid = o.bookid;

--(7) 박지성이구매하지않은도서의이름
select bookname from book where bookid != all (select bookid from orders where custid = 1) order by bookid;

--2 마당서점의운영자와경영자가요구하는다음질문에대해SQL 문을작성하시오.
--(8) 주문하지않은고객의이름(부속질의사용)
select name from customer c where not exists (select custid from orders where c.custid = orders.custid);

--(9) 주문금액의총액과주문의평균금액
select sum(saleprice) as total, avg(saleprice) from orders;

--(10) 고객의이름과고객별구매액
select c.name, sum(o.saleprice) from customer c, orders o where c.custid = o.custid group by c.name;

--(11) 고객의이름과고객이구매한도서목록
select (select name from customer where custid = od.custid) as customername, (select bookname from book where bookid = od.bookid) as bookname from orders od  order by custid;

--(12) 도서의가격(Book 테이블)과판매가격(Orders 테이블)의차이가가장많은주문
select * from orders o, book b where o.bookid = b.bookid and b.price - o.saleprice = (select max(b.price - o.saleprice) from orders o, book b where b.bookid = o.bookid);

--(13) 도서의판매액평균보다자신의구매액평균이더높은고객의이름
select name from customer c, orders o where c.custid = o.custid having  (select avg(saleprice)from orders) <  avg(saleprice) group by c.name;

--3. 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오.
--1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
--select name from customer c, book b, orders o where c.custid = o.custid and b.bookid = o.bookid group by name having b.publisher = (select publisher from book, customer, orders where customer.custid = orders.custid and book.bookid = orders.bookid group by name);

select name from book b, customer c, orders o where c.custid = o.custid and b.bookid = o.bookid and publisher in (select publisher from book b, customer c, orders o where c.custid = o.custid and b.bookid = o.bookid and name = '박지성') and name != '박지성';


--(2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
--select name from customer c, orders o where 
select name from orders o, customer c, book b where o.custid = c.custid and o.bookid = b.bookid group by o.custid, name having count(distinct publisher) >= 2;