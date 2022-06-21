/*=========================== EXISTS, NOT EXIST ================================
	EXISTS Condition subquery’ler ile kullanilir. IN ifadesinin kullanımına benzer olarak,
	EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde 
	bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar. 
   
	EXISTS operatorü bir Boolean operatördür ve true - false değer döndürür. 
    EXISTS operatorü sıklıkla Subquery'lerde satırların doğruluğunu test etmek 
    için kullanılır.
    
    Eğer bir subquery (altsorgu) bir satırı döndürürse EXISTS operatörü de TRUE 
    değer döndürür. Aksi takdirde, FALSE değer döndürecektir.
    
    Özellikle altsorgularda hızlı kontrol işlemi gerçekleştirmek için kullanılır
    
    SYTAX:
    SELECT kolan_ismi  
	FROM tablo_ismi  
	WHERE [NOT] EXISTS (  
    SELECT kolon_ismi   
    FROM tablo_ismi   
    WHERE koşul  
); 
==============================================================================*/

use batch59;

CREATE TABLE mart
(
	urun_id int,
	musteri_isim varchar(50), 
	urun_isim varchar(50)
);
    
CREATE TABLE nisan 
(
	urun_id int ,
	musteri_isim varchar(50), 
	urun_isim varchar(50)
);
    
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');
   
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');
    
select * from mart;
select * from nisan;
    
 /* -----------------------------------------------------------------------------
  SORU1: MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  URUN_ID’lerini ve aynı zamanda bu ürünleri MART ayında alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 
 -----------------------------------------------------------------------------*/        
-- 1. YOL
select urun_id, musteri_isim from mart where exists (select urun_id from nisan where mart.urun_id = nisan.urun_id);

-- 2. YOL
select urun_id, musteri_isim from mart where urun_id in(select urun_id from nisan where mart.urun_id = nisan.urun_id);

select urun_id, musteri_isim from mart where urun_id in(10, 20);

-- (10, 20) yerine: select urun_id from nisan where mart.urun_id = nisan.urun_id


    
/* -----------------------------------------------------------------------------
SORU2: Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız. 
-----------------------------------------------------------------------------*/ 

select urun_isim, musteri_isim
from nisan as nisan_tablo
where exists
(select urun_isim
from mart as mart_tablo
where nisan_tablo.urun_isim=mart_tablo.urun_isim);




    
/* SORU3: Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve   bu ürünleri
  NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız. 
 -----------------------------------------------------------------------------*/

select urun_isim, musteri_isim
from nisan as nisan_tablo
where not exists
(select urun_isim
from mart as mart_tablo
where nisan_tablo.urun_isim = mart_tablo.urun_isim);







/*===================== IS NULL, IS NOT NULL, COALESCE ========================
    
    IS NULL, ve IS NOT NULL, BOOLEAN operatörleridir. Bir ifadenin NULL olup 
    olmadığını kontrol ederler.  
    
    COALESCE (Birleştirmek) ise bir fonksiyondur ve içerisindeki parameterelerden NULL olmayan
    ilk ifadeyi döndürür. Eğer aldığı tüm ifadeler NULL ise NULL döndürürür.
    
    sutun_adi = COALESCE(ifade1, ifade2, .....ifadeN)
    
==============================================================================*/

CREATE TABLE insanlar 
(
	ssn CHAR(9), -- Social Security Number
	isim VARCHAR(50), 
	adres VARCHAR(50) 
);

INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
INSERT INTO insanlar (adres) VALUES('Sakarya');
INSERT INTO insanlar (ssn) VALUES('999111222');
                
select * from insanlar;

-- SORU4: isimi null olanları sorgula
select * from insanlar where isim is null;

        
-- SORU5: isim null olmayanlar
select * from insanlar where isim is not null;


-- SORU6: isim 'i NULL olan kişilerin isim'ine NO NAME atayınız.
update insanlar set isim = 'NO NAME' WHERE isim is null;
-- ismi null olanlari 'NO NAME' yap
select * from insanlar;


-- SORU7: tabloyu eski haline döndürün
update insanlar set isim = null  WHERE isim = 'NO NAME';
-- ismi 'NO NAME' olanlari null yap
select * from insanlar;




/* 
SORU8:   isim 'i NULL olanlara 'Henuz isim girilmedi'
            adres 'i NULL olanlara 'Henuz adres girilmedi'
            ssn 'i NULL olanlara ' no ssn' atayalım.
            çoklu değişimde ve  WHERE isim IS NULL or adres is null....; 
            gibi ifade yazmamak için. coalesce=birleşmek
*/

update insanlar set isim = coalesce(isim, 'Henuz isim girilmedi'),
 adres = coalesce(adres, 'Henuz adres girilmedi'),
 ssn = coalesce(ssn, 'NO SSN')
 where isim is null or adres is null or ssn is null;
 
 select * from insanlar;