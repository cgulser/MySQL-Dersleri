use batch59;

/*============================== JOIN İSLEMLERİ =============================================================
    
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
==============================================================================================================*/   

CREATE TABLE sirketler 
(
	sirket_id int, 
	sirket_isim VARCHAR(20)
);
    
INSERT INTO sirketler VALUES(100, 'Toyota');
INSERT INTO sirketler VALUES(101, 'Honda');
INSERT INTO sirketler VALUES(102, 'Ford');
INSERT INTO sirketler VALUES(103, 'Hyundai');
  
CREATE TABLE siparisler
(
	siparis_id int,
	sirket_id int, 
	siparis_tarihi DATE
);
    
INSERT INTO siparisler VALUES(11, 101, '2022-04-17');
INSERT INTO siparisler VALUES(22, 102, '2022-04-18');
INSERT INTO siparisler VALUES(33, 103, '2022-04-19');
INSERT INTO siparisler VALUES(44, 104, '2022-04-20');
INSERT INTO siparisler VALUES(55, 105, '2022-04-21');

select * from sirketler;
select * from siparisler;
    
/*=============================== INNER JOIN  ==================================
    
    Iki tablonun kesisim kumesi ile yeni bir tablo olusturmak icin kullanilir.
    
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 (1. Tablo) 
    INNER JOIN tablo2 (2. Tablo)
    ON tablo1.sutun = tablo2.sutun;
================================================================================  
    
  
/* -----------------------------------------------------------------------------
  SORU1: Iki Tabloda sirket_id’si ayni olanlarin; sirket_ismi, siparis_id ve 
  siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/
-- sirketler tablosu = A
-- siparisler tablosu = B

select sirket_isim, siparis_id, siparis_tarihi, B.sirket_id
from sirketler as A
inner join siparisler as B
on A.sirket_id = B.sirket_id;






    
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
            
/* -----------------------------------------------------------------------------
  SORU2: sirketler tablosundaki tum sirketleri ve bu sirketlere ait olan 
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/   
-- 1 YOL left join
select A.sirket_isim, B.siparis_id, B.siparis_tarihi
from sirketler as A left join siparisler as B
on A.sirket_id = B.sirket_id;

-- 2 YOL right join
select A.sirket_isim, B.siparis_id, B.siparis_tarihi
from siparisler as B right join sirketler as A
on A.sirket_id = B.sirket_id;


          
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
      
/* -----------------------------------------------------------------------------
  SORU3: siparisler tablosundaki tum siparis_id ve siparis_tarihleri ile 
  bunlara karşılık gelen sirket_isimlerini listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/   
-- sirketler tablosu = A
-- siparisler tablosu = B
-- 1 YOL right join
select A.sirket_isim, B.siparis_id, B.siparis_tarihi
from sirketler as A right join siparisler as B
on A.sirket_id = B.sirket_id;


-- 2. YOL left join
select A.sirket_isim, B.siparis_id, B.siparis_tarihi
from siparisler as B left join sirketler as A
on A.sirket_id = B.sirket_id;



    
    
/*=============================== full JOIN  ==================================
	full JOIN: (left join + union  + right join)
	full  JOIN, Her iki tablo icin secilen sutunlara ait olan tum satirlari 
    getirmek icin kullanilir. 
    
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    left JOIN tablo2
    ON tablo1.sutun = tablo2.sutun
    union all
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    right JOIN tablo2
    ON tablo1.sutun = tablo2.sutun
==============================================================================*/   
   
/* -----------------------------------------------------------------------------
  SORU4: sirketler ve siparisler adındaki tablolarda yer alan sirket_isim, 
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/ 
select sirket_isim, siparis_id, siparis_tarihi
from sirketler as A left join siparisler as B
on A.sirket_id = B.sirket_id
union
select sirket_isim, siparis_id, siparis_tarihi
from sirketler as A right join siparisler as B
on A.sirket_id = B.sirket_id;











-- ================================================================================

	CREATE TABLE bolumler (
      bolum_id   int PRIMARY KEY,
      bolum_isim VARCHAR(14),
      konum      VARCHAR(13)
    );
    
    INSERT INTO bolumler VALUES (10,'MUHASEBE','IST');
    INSERT INTO bolumler VALUES (20,'MUDURLUK','ANKARA');
    INSERT INTO bolumler VALUES (30,'SATIS','IZMIR');
    INSERT INTO bolumler VALUES (40,'ISLETME','BURSA');
    INSERT INTO bolumler VALUES (50,'DEPO', 'YOZGAT');
    
    select * from bolumler;

    CREATE TABLE personel (
      personel_id   int PRIMARY KEY,
      personel_isim VARCHAR(10),
      meslek        VARCHAR(9),
      mudur_id      int,
      maas          int,
      bolum_id      int
    );
    
  
    INSERT INTO personel VALUES (7369,'AHMET','KATIP',1111,800,20);
    INSERT INTO personel VALUES (7499,'BAHATTIN','SATISE',1222,1600,30);
    INSERT INTO personel VALUES (7521,'NESE','SATISE',1222,1250,30);
    INSERT INTO personel VALUES (1111,'MUZAFFER','MUDUR',7839,2975,20);
    INSERT INTO personel VALUES (7654,'MUHAMMET','SATISE',1222,1250,30);
    INSERT INTO personel VALUES (1222,'EMINE','MUDUR',7839,2850,30);
    INSERT INTO personel VALUES (1333,'HARUN','MUDUR',7839, 2450,10);
    INSERT INTO personel VALUES (7788,'MESUT','ANALIST',1111,3000,20);
    INSERT INTO personel VALUES (7839,'SEHER','BASKAN',NULL,5000,10);
    INSERT INTO personel VALUES (7844,'DUYGU','SATISE',1222,1500,30);
    INSERT INTO personel VALUES (7876,'ALI','KATIP',1111,1100,20);
    INSERT INTO personel VALUES (7900,'MERVE','KATIP',1222,950,30);
    INSERT INTO personel VALUES (7902,'NAZLI','ANALIST',1111,3000,20);
    INSERT INTO personel VALUES (7934,'EBRU','KATIP',1333,1300,10);
    INSERT INTO personel VALUES (7956,'SIBEL','MIMAR',1333,3300,60);
    INSERT INTO personel VALUES (7933,'ZEKI','MUHENDIS',1333,4300,60);
    
   SELECT * FROM personel;
/* -----------------------------------------------------------------------------
  SORU1: SATIS ve MUHASEBE bolumlerinde calisan personelin isimlerini ve 
  bolumlerini, once bolum, sonra isim sıralı olarak listeleyiniz
------------------------------------------------------------------------------*/ 
-- P: personel tablo
-- B: bolumler tablo

-- 1. YOL
select personel_isim, bolum_isim
from bolumler as B LEFT join personel as P
on B.bolum_id = P.bolum_id
where bolum_isim in('SATIS', 'MUHASEBE')
order by B.bolum_isim, P.personel_isim;

-- 2. YOL
select personel_isim, bolum_isim
from personel as P right join bolumler as B
on B.bolum_id = P.bolum_id
where bolum_isim in('SATIS', 'MUHASEBE')
order by B.bolum_isim, P.personel_isim;


/* -----------------------------------------------------------------------------
  SORU2: SATIS,ISLETME ve DEPO bolumlerinde calisan personelin isimlerini,  
  bolumlerini  isim sıralı olarak listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  

-- P: personel tablo
-- B: bolumler tablo

-- 1. YOL
select bolum_isim, personel_isim
from bolumler as B left join personel as P
on B.bolum_id = P.bolum_id
where B.bolum_id in (30, 40, 50)
order by bolum_isim;

-- 2. YOL
select bolum_isim, personel_isim
from personel as P right join bolumler as B
on B.bolum_id = P.bolum_id
where B.bolum_id in (30, 40, 50)
order by bolum_isim;





/* -----------------------------------------------------------------------------
  SORU3: Tüm bolumlerde calisan personelin isimlerini, bolum isimlerini ve 
  maaslarini, bolum ters ve maas sirali listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  
-- P: personel tablo
-- B: bolumler tablo

-- 1.YOL
select bolum_isim, personel_isim, maas
from bolumler as B left join personel as p
on B.bolum_id = P.bolum_id
order by bolum_isim desc, P.maas;

-- 2.YOL
select bolum_isim, personel_isim, maas
from personel as p right join bolumler as B
on B.bolum_id = P.bolum_id
order by bolum_isim desc, P.maas;




/* -----------------------------------------------------------------------------
  SORU4: SATIS ve MUDURLUK bolumlerinde calisan personelin maaslari 2000'den 
  buyuk olanlarinin isim,bolum ve maas bilgilerini bolume ve isme gore
  siralayarak listeleyiniz.
------------------------------------------------------------------------------*/   
-- P: personel tablo
-- B: bolumler tablo
select personel_isim, bolum_isim, maas
from bolumler as B LEFT join personel as P
on B.bolum_id = P.bolum_id
where bolum_isim in('SATIS',  'MUDURLUK') and maas > 2000;

-- bu şekildede aynsonucu aliriz
select personel_isim, bolum_isim, maas from personel as P
left join bolumler as B
on B.bolum_id = P.bolum_id
where bolum_isim in('SATIS','MUDURLUK') and maas>2000;




/* -----------------------------------------------------------------------------
  SORU5: MUDUR'u Harun veya Emine olan personelin bolumlerini,isimlerini,  
  maaslarini ve ayrica MUDUR isimlerini 
  (emine kimin müdürüyse onun satirinda yazsin) 
------------------------------------------------------------------------------*/   
select B.bolum_isim, P.personel_isim, P.maas, 
(select personel_isim from personel where P.mudur_id = personel_id) as mudur
from bolumler as B right join personel as P
on B.bolum_id = P.bolum_id
where mudur_id in (1222, 1333);


