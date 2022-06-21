/*======================== SET OPERATORLERI: UNION, UNION ALL==========================
    
    UNION, UNION ALL, (oracleSql->INTERSECT, ve MINUS) gibi SET operatorleri yardimiyla  
    Çoklu Sorgular birlestirilebilir.
    UNION :  Bir SET operatorudur. 2 veya daha fazla Sorgu ifadesinin sonuc 
    kumelerini birlesitirerek tek bir sonuc kumesi olusturur.    
   
    NOT:  Birlesik olan olan Sorgu ifadesinin veri türü diger sorgulardaki 
    ifadelerin veri türü ile uyumlu olmalidir.
    
    Syntax:
    ----------
    SELECT sutun_adi,sutun_adi2, .. FROM tablo_adi1
    UNION
    SELECT sutun_adi1, sutun_adi2, .. FROM tablo_adi2;
    
    NOT: UNION operatoru SADECE benzersiz degerleri alir. Benzerli verileri almak
    için UNION ALL kullanilir.
======================================================================================*/ 

use batch59;
CREATE TABLE personel 
(
	id int  PRIMARY KEY, 
	isim VARCHAR(50), 
	sehir VARCHAR(50), 
	maas int, 
	sirket VARCHAR(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(345678902, 'Mehmet Ozturk', 'istanbul', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(453445611, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin','Bursa', 4200, 'Honda');
    
SELECT * FROM personel;



/* -----------------------------------------------------------------------------
  SORU1: Maasi 4000’den cok olan isci isimlerini + 5000 liradan fazla maas 
  alinan sehirleri gosteren sorguyu yaziniz
------------------------------------------------------------------------------*/
select isim, maas from personel where maas>4000
union
select sehir, maas from personel where maas>5000;




/* -----------------------------------------------------------------------------
  SORU2: Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki 
  personelin maaslarini yüksekten alçaga dogru siralayarak bir tabloda gosteren 
  sorguyu yaziniz.    
------------------------------------------------------------------------------*/  





/* -----------------------------------------------------------------------------
  SORU3: Honda,Ford ve Tofas’ta calisan  personelin ismini listeleyin
------------------------------------------------------------------------------*/  





/* -----------------------------------------------------------------------------
  SORU4: 5000’den az maas alanlarin bilgileri ile, arti Honda calisani olmayanlarin bilgilerini
 alt alta listeleyen bir sorgu yaziniz. 
------------------------------------------------------------------------------*/ 






/* -----------------------------------------------------------------------------
  SORU5: Ismi Mehmet Ozturk olanlarin sehirlerini + Istanbul’da calismayanlarin isimlerini ve 
  sehirlerini listeleyen sorguyu yaziniz.
------------------------------------------------------------------------------*/








/*======================== FARKLI TABLOLARDAN BIRLESTIRME ====================*/   
    
CREATE TABLE personel_bilgi 
(
	id int, 
	tel char(10) UNIQUE , 
	cocuk_sayisi int
); 
   
INSERT INTO personel_bilgi VALUES(123, '5302345678' , 5);
INSERT INTO personel_bilgi VALUES(234, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345, '5354561245', 3); 
INSERT INTO personel_bilgi VALUES(478, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(789, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(344, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(125, '5537488585', 1);

select * from personel_bilgi;

/* -----------------------------------------------------------------------------
  SORU6: id’si 123456789 olan personelin Personel tablosundan sehir ve 
  maasini, personel_bilgi tablosundan da (id ilk 3 hanesiyle kaydolmuş=123)
  tel ve cocuk sayisini yazdirin  
------------------------------------------------------------------------------*/    





/* -----------------------------------------------------------------------------
  SORU7: Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini
 ve Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini sorgulayiniz.
------------------------------------------------------------------------------*/




