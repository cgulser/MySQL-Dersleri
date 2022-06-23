-- TABLO OLUŞTURMA

-- Yeni Tablo Oluşturma
CREATE TABLE students
(
student_id CHAR(3),
student_name VARCHAR(50),
student_age int,
student_dob DATE	-- dob (date of birth)
);

insert into students values (100, 'Ali Can', 15, '2015-02-02');

-- Var oan bir tabloyu kullanarak tablo Oluşturma
CREATE TABLE student_name_age AS SELECT student_name, student_age FROM students;

SELECT * FROM students;

SELECT * FROM student_name_age;






-- TABLOYA KISITLAMALAR (CONSTRAINT) EKLEME
-- 1) PRIMARY KEY
-- 2) FOREIGN KEY
-- 3) CHECK

use okul;



-- 1) PRIMARY KEY
-- Primary Key eklemenin 2 yolu var.
-- 1. YOL
CREATE TABLE students
(
    student_id CHAR(3) PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    student_age int,
    student_dob DATE
);

-- 2. YOL
CREATE TABLE students
(
    student_id CHAR(3),
    student_name VARCHAR(50),
    student_age int,
    student_dob DATE,
    CONSTRAINT student_id_pk PRIMARY KEY(student_id)
);






-- 2) FOREIGN KEY

CREATE TABLE parents
(
    student_id CHAR(3),
    parent_name VARCHAR(50),
    phone_number CHAR(10),
    CONSTRAINT student_id_pk PRIMARY KEY(student_id)
);

CREATE TABLE students
(
    student_id CHAR(3),
    student_name VARCHAR(50),
    student_age int,
    student_dob DATE,
    CONSTRAINT student_id_fk1 FOREIGN KEY(student_id) REFERENCES parents(student_id)
);






-- 3) CHECK
CREATE TABLE students
(
    student_id CHAR(3),
    student_name varchar(50),
    student_age int,
    student_dob DATE,
    CONSTRAINT student_age_check CHECK(student_age BETWEEN 0 AND 30),
    CONSTRAINT student_name_upper_case CHECK(student_name = upper(student_name))
);






-- TABLOYA DATA EKLEME
use batch59;
CREATE TABLE students
(
    student_id CHAR(3) PRIMARY KEY,
    student_name VARCHAR(50) UNIQUE,
    student_age int NOT NULL,
    student_dob DATE,
    CONSTRAINT student_age_check CHECK(student_age BETWEEN 0 AND 20),
    CONSTRAINT student_name_upper_case CHECK(student_name = upper(student_name))
);

-- Tam veri girişi
INSERT INTO students VALUES(101, 'ALI CAN', 13, '021-08-11');
INSERT INTO students VALUES(102, 'VELI HAN', 14, '2007-08-10');
INSERT INTO students VALUES(103, 'AYSE TAN', 14, '2007-08-08');
INSERT INTO students VALUES(104, 'KEMAL KUZU', 15, null);
INSERT INTO students VALUES(105, 'TOM HANKS', 20, '2005-10-12');
INSERT INTO students VALUES(106, 'ANGELINA JULIE', 18, '1986-10-12');
INSERT INTO students VALUES(107, 'BRAD PITT', 0, '2021-08-10');

-- Parçalı veri girişi
INSERT INTO students(student_id, student_age) VALUES('108', 17);
INSERT INTO students(student_name, student_id, student_age) VALUES('JOHN DAVID', '109', 20);

select * from students;





-- 108 id öğrencinin ismini 'LEO OCEAN' olarak güncelleyinin
update students set student_name = 'LEO OCEAN' where student_id = 108;


update students set student_age = 21 where student_id = 101;
-- tabloya ekleyemez. çünkü kstlama var.
--  CONSTRAINT student_age_check CHECK(student_age BETWEEN 0 AND 20)
--  Check constraint 'student_age_check' is violated.



-- 109 idli öğrencinin doğumtarihini 2010-12-11 olarak update yapın.
update students set student_dob= '2010-12-11' where student_id = 109;







CREATE TABLE workers 
(  
  id int, 
  name varchar(20),
  title varchar(60),
  manager_id int 
);

INSERT INTO workers VALUES(1, 'Ali Can', 'Dev', 2);
INSERT INTO workers VALUES(2, 'John Davis', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'Dev Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);

select * from workers;


-- Tabloya company_industry  varchar(20) isminde sütun ekleyiniz
alter table workers add company_industry varchar(20);




-- TABLOYA worker_address sütunu ve defaullt olarakta 'Miami, FL, USA' adresini ekleyiniz.
alter table workers add worker_address varchar(100) default 'Miami, FL, USA';
select * from workers;




-- Tabloya number_of_workers ve name_of_ceo sütunlarını ekleyiniz.
alter table workers add (number_of_workers int , name_of_ceo varchar(20));
select * from workers;

    

-- tablodaki name_of_ceo sütununu siliniz
alter table workers drop column name_of_ceo;
select * from workers;




-- Tablodaki company_industry sütununu, company_profession olarak değiştiriniz.
alter table workers rename column company_industry to company_profession;
select * from workers;





-- Tablonun ismini employees olarak değişitiriniz.
alter table workers rename to employees;
select * from employees;



-- Tablodaki number_of_workers sütununa "NOT NULL" kısıtlaması ekleyiniz.
alter table employees modify number_of_workers int NOT NULL;


-- Tablodaki company_profession sütununa "UNIQUE" kısıtlaması ekleyiniz.
alter table employees modify company_profession varchar(20) unique;


-- Tablokdaki worker_address sütununa "UNIQUE" kıstlaması ekleyiniz.
alter table employees modify worker_address varchar(100) unique;
-- Çalşmaz
-- Duplicate entry 'Miami, FL, USA' for key 'employees.worker_address'



-- Tablodaki company_profession sütununun data tipini CHAR(5) olarak değiştiriniz.
alter table employees modify company_profession char(5);
-- bu tür data type dğişikliklerinde tablodaki mevcut dataya dikkat etmek gerekir.


-- Tablodaki worker_address sütununun data türünü CHAR(5) yapınız;
alter table employees modify worker_address char(5);
-- Çalişmaz
-- Data too long for column 'worker_address' at row 1



-- Tablodaki worker_address sütununun data türünü CHAR(30) yapınız;
alter table employees modify worker_address char(30);







CREATE TABLE workers 
(  
  id int,
  name varchar(50), 
  state varchar(50), 
  salary int,
  company varchar(20)
);

INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM workers;

-- Çalışanları toplam maaşını, büyükten küçüğe göre listeleyiniz.
select name, sum(salary) as total_maas
from workers
group by name
order by total_maas desc;




-- Çalışanların eyaletlere gör çalışan sayılarını büyükten küçüğe göre listeleyiniz.
select state, count(state) as calisan_sayisi
from workers
group by state
order by calisan_sayisi desc;


-- Şirketlerde 2000$ fazla alan çalışan sayılarını listeleyiniz.  
select company, count(*) as calisan_sayisi
from workers
where salary > 2000
group by company;


-- Her şirket için minimum ve maximum maasları listeleyiniz.
select company, min(salary) as "Minumum Maas", max(salary) as "Maksimum Maas"
from workers
group by company;




-- HAVING CLAUSE
-- Find the total salary if it is greater than 2500 for every employee
select name, sum(salary) as "Toplam Maas"
from workers
group by name
having sum(salary) > 2500;

-- GROUP BY dan sonra  WHERE yerine HAVING kullanmalıyız.





-- Birden fazla çalışanı olan eyalet ve çalışan sayılarını listeleyiniz.
select state, count(state) as "Calisan Sayisi"
from workers
group by state
having count(state) > 1;