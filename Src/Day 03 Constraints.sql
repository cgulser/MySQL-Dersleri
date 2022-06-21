-- ===================== CONSTRAINTS - KISITLAMALAR ======================================
/*           
    NOT NULL	- Bir Sütunun  NULL içermemesini, yani boş olmamasını sağlar.
    UNIQUE		- Bir sütundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar.  
    PRIMARY KEY	- Bir sütünün NULL içermemesini ve sütundaki verilerin
                  BENZERSİZ olmasını sağlar. (NOT NULL ve UNIQUE)
    FOREIGN KEY	- Başka bir tablodaki Primary Key’i referans göstermek için kullanılır.
                  Böylelikle, tablolar arasında ilişki kurulmuş olur.
                  foreign ve primary ile tablolar birbirine bağlamadan da, id leri ayni olan 
                  satirlarda işlem yap diyebiliriz, böylelikle
                  ayni field verilebilir, parent child ilişkisi olmamiş olur

-- ========================================================================================*/
use batch59;
 
CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE,
maas int NOT NULL,
ise_baslama DATE
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10020', null, 5000, '2018-04-14'); -- UNiQUE 2. ve daha fazla null engel değil
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); -- MAAS NULL OLAMAZ
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- UNiQUE
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'veli can', 6000, '2018-04-14');
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');
     
select * from calisanlar;
     
     
-- KISITLAMALAR (  FOREIGN KEY)
     
CREATE TABLE adresler
(
adres_id CHAR(5),    
sokak VARCHAR(50),
cadde VARCHAR(30),
sehir VARCHAR(15),
CONSTRAINT id_clsnlr FOREIGN KEY(adres_id) REFERENCES calisanlar(id)
-- adresler tablosundaki adres_id ile calisanlar tablosundaki id leri
-- id_clsnlr isminde foreign key ile birbirine bağladik.
-- (solda tablo seçiliyken üstteki info dan ismi kontrol edebilirsin)
);
   
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

select * from adresler;

-- parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
   
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from adresler;

select * from calisanlar;

SELECT * FROM calisanlar, adresler WHERE calisanlar.id = adresler.adres_id;


drop table calisanlar;
-- calisanlar tablosunu silmeyecek çünkü
-- CONSTRAINT id_clsnlr FOREIGN KEY(adres_id) REFERENCES calisanlar(id)
-- komutu ile calişanların idleri ile adres id leri birbirine bağladık.
-- bağlanti tablolarda child silinmeden parent silinmez

drop table adresler;
-- adresler table silebiliyoruz.

-- child table silindikten sonra parent table da silinebilir.



delete from calisanlar where id = 10002; -- parent
-- bağlantı olduğu için silemiyoruz.
     
delete from adresler where adres_id= 10002; -- child
     
     
/*============================== ON DELETE CASCADE =============================
  Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE
  silme özelliğini aktif hale getirebiliriz.
 
  Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmak yeterli
 
==============================================================================*/

CREATE TABLE talebeler
(
id CHAR(3) primary key,  
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
   
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

select * from talebeler;

CREATE TABLE notlar
( talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade);

-- on delete cascade sayesinde
-- parent taki silinen bir kayıt ile ilişkili olan tüm child kayıtlarınısiler.  
-- cascade yoksa önce child temizlenir sonra parent
   

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select * from notlar;
   
-- FK ile birleştirilen tablolardaki tüm verileri çekmek için
-- JOIN İşlemi yapmak gerekir. Bu konuyu sonra göreceğiz.
SELECT * FROM talebeler, notlar WHERE talebeler.id = notlar.talebe_id;
   
delete from notlar where talebe_id='123';-- child
-- child tablodaki veriyi sildiğimiz zaman sadece child'daki veri silinir. parent taki veri silinmez.
     
delete from talebeler where id='126';-- parent
-- parent tablodaki veriyi sildiğimiz zaman child'daki veride silinir.
   
select * from talebeler;
select * from notlar;