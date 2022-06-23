create database okul;

use okul;

create table ogrenciler
(okul_no int primary key,
ogrenci_ismi varchar(50),
sinif varchar(10),
cinsiyet char
);

insert into ogrenciler values(100, 'Mustafa Bal', 9, 'E');
insert into ogrenciler values(101, 'Derya Soylu', 9, 'K');
insert into ogrenciler values(102, 'Enes Boz', 9, 'E');
insert into ogrenciler values(103, 'Nil Naz', 9, 'K');
insert into ogrenciler values(104, 'Ali Can', 9, 'E');
insert into ogrenciler values(105, 'Yusuf Cengiz', 10, 'E');
insert into ogrenciler values(106, 'Ahmet Aslan', 10, 'E');
insert into ogrenciler values(107, 'Mehmet Aslan', 10, 'E');
insert into ogrenciler values(108, 'Sena Yavuz', 10, 'K');
insert into ogrenciler values(109, 'Zehra Amber', 10, 'K');
insert into ogrenciler values(110, 'Fatma Nur', 11, 'K');
insert into ogrenciler values(111, 'Mustafa Bay', 11, 'E');
insert into ogrenciler values(112, 'Murat Kerem', 11, 'E');
insert into ogrenciler values(113, 'Sinan Ay', 11, 'E');
insert into ogrenciler values(114, 'Figen Bal', 11, 'K');
insert into ogrenciler values(115, 'Serkan Bayram', 12, 'E');
insert into ogrenciler values(116, 'Hakan Bacak', 12, 'E');
insert into ogrenciler values(117, 'Zafer Yanak', 12, 'E');
insert into ogrenciler values(118, 'Birol Kara', 12, 'E');
insert into ogrenciler values(119, 'Ayten Tan', 12, 'K');
insert into ogrenciler values(120, 'Mustafa Tan', 12, 'E');

select * from ogrenciler;

commit;
select * from ogrenciler where cinsiyet ='E';


create table notlar
(
okul_no int primary key,
ogrenci_ismi varchar(50),
fizik int,
matematik int,
kimya int,
tarih int,
CONSTRAINT okul_no_fk FOREIGN KEY(okul_no) REFERENCES ogrenciler(okul_no)
);

insert into notlar values(100, 'Eymen Bal', 40, 50, 60, 70);
insert into notlar values(101, 'Derya Soylu', 45, 55, 65, 75);
insert into notlar values(102, 'Enes Boz', 50, 60, 70, 80);
insert into notlar values(103, 'Nil Naz', 55, 65, 75, 85);
insert into notlar values(104, 'Ali Can', 60, 70, 80, 90);
insert into notlar values(105, 'Yusuf Cengiz', 65, 75, 85, 95);
insert into notlar values(106, 'Ahmet Aslan', 70, 80, 90, 100);
insert into notlar values(107, 'Mehmet Aslan', 65, 75, 85, 95);
insert into notlar values(108, 'Sena Yavuz', 60, 70, 80, 90);
insert into notlar values(109, 'Zehra Amber', 55, 65, 75, 85);
insert into notlar values(110, 'Fatma Nur', 50, 60, 70, 80);
insert into notlar values(111, 'Mustafa Bay', 45, 55, 65, 75);
insert into notlar values(112, 'Murat Kerem', 40, 50, 60, 70);
insert into notlar values(113, 'Sinan Ay', 45, 55, 65, 75);
insert into notlar values(114, 'Figen Bal', 50, 60, 70, 80);
insert into notlar values(115, 'Serkan Bayram', 55, 65, 75, 85);
insert into notlar values(116, 'Hakan Bacak', 60, 70, 80, 90);
insert into notlar values(117, 'Zafer Yanak', 65, 75, 85, 95);
insert into notlar values(118, 'Birol Kara', 70, 80, 90, 100);
insert into notlar values(119, 'Ayten Tan', 65, 75, 85, 95);

select * from notlar;

SELECT * FROM ogrenciler, notlar WHERE ogrenciler.okul_no = notlar.okul_no;
