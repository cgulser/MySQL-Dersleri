-- DATA TYPE - CHAR VE VARCHAR
/*
char(size):		Sabit sayıda karakterleri (harf, numara ve özel karakter) saklar.
				size -> saklanacak karakter sayısıdır. 0 ile 255 arasında değer alabilir. char(11), char(255)
				char -> default olarak 1 dir.
				SSN, ISBN, Zip Code, Eyalet kısaltmaları (FL, CA, ..) gibi uzunluğun sabit olduğu durumlarda kullanılır.

varchar(size):	Farklı uzunluklardaki karakterleri (harf, numara ve özel karakter) saklar.
				size -> saklanacak karakter sayısıdır. 0 ile 65.535 arasında değer alabilir. varchar(125), varchar(9500)

https://dev.mysql.com/doc/refman/8.0/en/char.html

*/

use batch59;



/* ============================== DELETE ===================================  

DELETE FROM tablo_adı;  Tablonun tüm içerğini siler.
DELETE FROM tablo_adı WHERE sutun_adi = veri; Tabloda istediğiniz veriyi girer.

*/

CREATE TABLE ogrenciler
(
id CHAR(3),
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);
  
INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler;

    
/* =============================================================================
         Seçerek silmek için WHERE Anahtar kelimesi kullanılabilir. 
===============================================================================*/     

-- SORU1: id'si 124 olan ogrenciyi siliniz.
delete from ogrenciler where id=124;
 
 
-- SORU2: ismi Kemal Yasa olan satırını siliniz.
delete from ogrenciler where isim= 'Kemal Yasa';
     

-- SORU3: ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
delete from ogrenciler where isim = 'Nesibe Yilmaz' or isim = 'Mustafa Bak';
DELETe FROM ogrenciler WHERE isim in('Nesibe Yilmaz', 'Mustafa Bak');
delete from ogrenciler where isim = 'Nesibe Yilmaz | Mustafa Bak';      

-- SORU4: İsmi Ali Can ve id'si 123 olan kaydı siliniz.
delete from ogrenciler where isim='Ali Can' and id=123;
  

-- SORU5: id 'si 126'dan büyük olan kayıtları silelim.
delete from ogrenciler where id>126;

select * from ogrenciler;

    
-- SORU6: id'si 123, 125 veya 126 olanları silelim.
delete from ogrenciler where id in(123,125,126);
delete from ogrenciler where id=123 or id= 125 or id=126;
    
    
-- SORU7:  TABLODAKİ TÜM KAYITLARI SİLELİM..
delete from ogrenciler;
-- tablodaki tüm verileri siler.

drop table ogrenciler;
-- tabloyu siler

   


CREATE TABLE ogrenciler
(
id CHAR(3),
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);
  
INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);
savepoint abc;

-- savepoint komutuyla tabloları yanlışlıkla silinmeye karşı korumaya almış oluyoruz 

-- savepoint sikintisi varsa -> SET autocommit=0; 
-- ayarlar sql execution auto commit tiki kaldr

select * from ogrenciler;

delete from ogrenciler;

rollback to abc;
-- rollback komutu ile silinen verileri geri getiriyoruz.

drop table ogrenciler;
-- drop ile silersek olusturduumuz savepoint'ide silmiş oluruz.
-- yani verileri geri getiremeyiz
    
    
/* ======================== DELETE - TRUNCATE - DROP ============================   
  
  1-) TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamını siler.
    Ancak, seçmeli silme yapamaz.
    TRUNCATE TABLE where ...... OLMAZ
*/

TRUNCATE TABLE ogrenciler;
-- tablodaki verileri siler

select * from ogrenciler;

drop table ogrenciler;
-- tabloyu siler

delete from ogrenciler;
-- tablodaki verileri siler
    
/* 2-) DELETE komutu beraberinde WHERE cümleciği kullanılabilir. TRUNCATE ile kullanılmaz.
        
-- TRUNCATE komutu tablo yapısını değiştirmeden, 
-- tablo içinde yer alan tüm verileri tek komutla silmenizi sağlar.
        
3-) Delete komutu ile silinen veriler ROLLBACK Komutu ile kolaylıkla geri alınabilir.
    
4-) Truncate ile silinen veriler geri alınması daha zordur. Ancak Transaction yöntemi ile geri alınması mümkün olabilir.
    
5-) DROP komutu da bir DDL komutudur. Ancak DROP veriler ile tabloyu da siler. 
==============================================================================*/