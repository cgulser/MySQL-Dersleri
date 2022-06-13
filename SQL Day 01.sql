create database batch59;
-- create database: database olustururuz.
​
-- açiklama yazabilmek için "--" kullanlir
​
/*
Javadaki gibi açklama yazabiliriz
*/
​
use batch59;
-- birden fazla database var ise "use" komutu ile çalşacağimiz database'i seçeriz
​
​
-- TABLO OLUŞTURMA
​
create table student
(
id varchar(4),
name varchar(30),
age int
);
​
-- VERİ GİRİŞİ
​
insert into student values('1000', 'Ali Can', 25);
insert into student values('1001', 'Veli Yanan', 25);
insert into student values('1002', 'Ayşe Tan', 25);
insert into student values('1003', 'Derya Canan', 25);
​
select * from student;
-- student tablosundaki herşeyi getirir
​
select name from student;
-- student tablosundaki name sütununu geirir
​
select id from student;
-- student tablosundaki id sütununu geirir
​
select id, name from student;
-- student tablosundaki id ve name sütununu geirir
​
drop table student;
​
​