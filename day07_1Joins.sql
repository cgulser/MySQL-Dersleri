/*========================================= JOIN İSLEMLERİ ===================================================
    
    Set Operatorleri (Union,Union All, {oracle->Intersect,Minus}) farklı tablolardaki sutunlari 
    birlestirmek için kullanılır.
    
    Join islemleri, farklı Tablolari birlestirmek icin kullanilir. Diger bir ifade ile farkli tablolardaki
    secilen sutunlar ile yeni bir tablo olusturmak icin kullanilabilir.
    
    JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku Foreign Key'ler ile iliskili
    olan tablolardan istenilen sutunlari cekmek icin JOIN islemleri kullanilabilir.
    
    mySQL'de 3 Cesit Join islemi kullanilabilmektedir.
    
    1) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir.
    2) LEFT JOIN:  Ilk tabloda (Sol) olan sonuclari gosterir
    3) RIGHT JOIN:  Ikinci tabloda (sağ) olan tum sonuclari gosterir
       FULL JOIN: (left join + union  + right join) Tablodaki tum sonuclari gosterir
===================================================================================================================*/   


use batch59;

create table qa_dersler
(ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);

insert into qa_dersler values (101, 'Core Java', 40);
insert into qa_dersler values (102, 'Selenium', 30);
insert into qa_dersler values (103, 'API', 15);
insert into qa_dersler values (104, 'SQL', 10);
insert into qa_dersler values (105, 'SDLC', 10);
insert into qa_dersler values (106, 'LAMDA', 12);

create table developer_dersler
(ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);

insert into developer_dersler values (101, 'Core Java', 40);
insert into developer_dersler values (103, 'API', 15);
insert into developer_dersler values (104, 'SQL', 10);
insert into developer_dersler values (105, 'SDLC', 10);
insert into developer_dersler values (106, 'LAMDA', 12);
insert into developer_dersler values (107, 'Spring Framework', 20);
insert into developer_dersler values (108, 'Micro Services', 12);

select * from qa_dersler;

select * from developer_dersler;


-- ortak dersler

select qa_dersler.ders_id, qa_dersler.ders_ismi, qa_dersler.ders_saati
from qa_dersler, developer_dersler
where qa_dersler.ders_id = developer_dersler.ders_id;


select developer_dersler.ders_id, developer_dersler.ders_ismi, developer_dersler.ders_saati
from qa_dersler, developer_dersler
where qa_dersler.ders_id = developer_dersler.ders_id;



/*=============================== INNER JOIN  ==================================
    
    Iki tablonun kesisim kumesi ile yeni bir tablo olusturmak icin kullanilir.
    
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 (1. Tablo) 
    INNER JOIN tablo2 (2. Tablo)
    ON tablo1.sutun = tablo2.sutun; -- ortak olan sütunlar buraya yazilir.
================================================================================ */

-- Ortak olan dersleri sorgula (INNER JOIN)

-- qa_dersler = A
-- developer_dersler : B
-- sorguyu sadeleştirmek için
select A.ders_id, A.ders_ismi, A.ders_saati from qa_dersler as A
inner join developer_dersler as B
on A.ders_id = B.ders_id;	-- 2 tabloyu burada birlestirdik.




/*=============================== LEFT JOIN  ==================================
    
    LEFT JOIN, 1. tablodan (sol tablo) SELECT ile ifade edilen sutunlara ait tum
    satirlari getirir. 
    Ancak, diger tablodan sadece ON ile belirtilen kosula uyan satirlari getirir. 
        
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    LEFT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/  


-- left join qa derslerini sorgula

-- qa_dersler = A
-- developer_dersler : B
-- sorguyu sadeleştirmek için

select A.ders_id, A.ders_ismi, A.ders_saati from qa_dersler as A
left join developer_dersler as B
on A.ders_id = B.ders_id;

select A.ders_id, A.ders_ismi, A.ders_saati from developer_dersler as B
right join qa_dersler as A
on A.ders_id = B.ders_id;




/*======================================== RIGHT JOIN  =============================================
    
    RIGHT JOIN, 2. tablodan (sag tablo) SELECT ile ifade edilen sutunlara ait tum satirlari getirir. 
    Ancak, diger tablodan sadece ON ile belirtilen kosula uyan satirlari getirir. 
        
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    RIGHT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
====================================================================================================*/ 


-- right join developerların derslerini sorgula

select B.ders_id, B.ders_ismi, B.ders_saati from qa_dersler as A
right join developer_dersler as B
on A.ders_id = B.ders_id;

select B.ders_id, B.ders_ismi, B.ders_saati from developer_dersler as B
left join qa_dersler as A
on A.ders_id = B.ders_id;


-- full join
-- left join + union + right join

select A.ders_id, A.ders_ismi, A.ders_saati from qa_dersler as A
left join developer_dersler as B
on A.ders_id = B.ders_id
union
select B.ders_id, B.ders_ismi, B.ders_saati from qa_dersler as A
right join developer_dersler as B
on A.ders_id = B.ders_id;


-- isimlendirmeyi as ile yapiyoruz.



