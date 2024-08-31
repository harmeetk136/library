create database library;
use library;
SELECT * FROM author;
SELECT * FROM book;
SELECT * FROM loan;
SELECT * FROM members;
SELECT * FROM reservation;

-- List all books along with their authors.
select title,author 
from book b;

-- Find all books published after the year 2009.
select title
from book
where publication_year>2009;

-- List all members who have borrowed books.
select distinct(m.member_name)
from members m
join loan l 
on m.member_id=l.member_id;

-- Find the books that are return in 2022 year
SELECT b.title
FROM book b
JOIN loan l
ON b.book_id = l.book_id
where year(l.return_date)=2022;

-- Get the details of all loans that were made in the 6th month.
 select *
 from loan
 where month(loan_date)=6;

-- Find the number of books borrowed by each member.
select m.member_name,count(l.book_id)
from members m
join loan l 
on m.member_id=l.member_id
group by m.member_name;

-- List all books along with their genres.
select distinct(title),genre
from book;

-- Find the members who have reserved the most books.
select m.member_name,count(r.reservation_id)
from members m
join reservation r
on r.member_id=m.member_id
group by m.member_name
order by count(r.reservation_id) desc
limit 1;

-- Get the list of all books that have not been borrowed.
select title
from book 
where book_id not in (select book_id from loan);

-- List the details of all books along with their author names, borrowed by a specific member (e.g., member_id = 1).
select l.member_id,b.title,b.author,l.loan_date,l.return_date
from book b
join loan l
on b.book_id=l.book_id 
where member_id=3;

-- Find all members who have borrowed a particular book
SELECT M.member_name, M.address, M.email, M.phone_number
FROM Members M
JOIN Loan L ON M.member_id = L.member_id
JOIN Book B ON L.book_id = B.book_id
WHERE B.title = 'Electric Machinery Fundamentals';

-- List book names, member name and date the book issue 
 select b.title,m.member_name,l.loan_date
 from loan l
 join book b
 on l.book_id=b.book_id
 join members m
 on m.member_id=l.member_id;

-- Count the number of books each member has borrowed
select m.member_name,count(l.loan_id)
from members m
join loan l
on m.member_id=l.member_id
group by member_name;

-- List all authors who have books in the library
select distinct(author_name) 
from author;

-- List all members alomg with reservation date,book name and year of book launch
select r.reservation_id,m.member_name,b.title,b.publication_year
from members m
join reservation r
on m.member_id=r.member_id
join book b
on r.book_id=b.book_id;

-- Generate a report showing each author and the total number of their books in the library
select author,count(title)
from book
group by author;

-- Find members who have borrowed the same book more than once
select m.member_name,b.title,count(l.loan_id)
from members m
join loan l
on m.member_id=l.member_id
join book b
on b.book_id=l.book_id
group by m.member_name,b.title
having count(l.loan_id)>1;

-- List all books along with their reservation count
select b.book_id,b.title,count(r.reservation_id)
from book b
join reservation r
on b.book_id=r.book_id
group by book_id,title;

