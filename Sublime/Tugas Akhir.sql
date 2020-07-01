create tablespace apotek
datafile 'D:\Praktikum 4\Basis Data\Modul 1\apotek.dbf'
size 30M;

create user redho06929
identified by redho
default tablespace apotek
quota 30M on apotek;

grant all privileges to redho06929;

==========================================================================

create table kasir
(
	id_kasir integer not null,
	nama_kasir varchar2(25),
	jenis_kelamin varchar2(25),
	constraint pk_kasir primary key (id_kasir)
);

create table pembeli
(
	kartu_pelanggan integer not null,
	id_kasir integer,
	nama_pelanggan varchar2(15),
	usia_pelanggan integer,
	constraint pk_pembeli primary key (kartu_pelanggan),
	constraint fk_pembeli_kasir foreign key (id_kasir) references kasir (id_kasir)
);

create table obat
(
	id_obat integer not null,
	id_kasir integer,
	nama_obat varchar2(25),
	harga_obat number(25),
	constraint pk_obat primary key (id_obat),
	constraint fk_obat_kasir foreign key (id_kasir) references kasir (id_kasir)
);

create table detail_pemesanan
(
	kartu_pelanggan integer not null,
	id_obat integer,
	nama_pelanggan varchar2(15),
	nama_obat varchar2(25),
	total number(5)
);

  alter table detail_pemesanan
  add constraint fk_kartu_pelanggan foreign key(kartu_pelanggan) references pembeli(kartu_pelanggan)
  add constraint fk_id_obat foreign key(id_obat) references obat(id_obat);

  create sequence id_obat
  minvalue 1
  maxvalue 100
  start with 1
  increment by 10
  cache 20;

  ==================================================================
#tabel kasir
insert all
into kasir (id_kasir, nama_kasir, jenis_kelamin) values (01, 'AKU', 'cowok')
into kasir (id_kasir, nama_kasir, jenis_kelamin) values (02, 'KAMU', 'cewek')
select 1 from dual;

#tabel pembeli
insert all
into pembeli (kartu_pelanggan, id_kasir, nama_pelanggan, usia_pelanggan) values (001, 01, 'Redho AR', 19)
into pembeli (kartu_pelanggan, id_kasir, nama_pelanggan, usia_pelanggan) values (002, 02, 'Redho AE', 20)
into pembeli (kartu_pelanggan, id_kasir, nama_pelanggan, usia_pelanggan) values (003, 01, 'Redho AS', 21)
into pembeli (kartu_pelanggan, id_kasir, nama_pelanggan, usia_pelanggan) values (004, 02, 'Redho AU', 22)
into pembeli (kartu_pelanggan, id_kasir, nama_pelanggan, usia_pelanggan) values (005, 01, 'Redho AD', 23)
select 1 from dual;

#tabel obat
insert all
into obat (id_obat, id_kasir, nama_obat, harga_obat) values (1, 01, 'PARAH MEN', 2500)
into obat (id_obat, id_kasir, nama_obat, harga_obat) values (2, 02, 'PARAH BRO', 2000)
into obat (id_obat, id_kasir, nama_obat, harga_obat) values (3, 01, 'PARAH SIS', 3000)
into obat (id_obat, id_kasir, nama_obat, harga_obat) values (4, 02, 'PARAH CAK', 3500)
into obat (id_obat, id_kasir, nama_obat, harga_obat) values (5, 01, 'PARAH LEK', 1500)
select 1 from dual;

#tabel detail_pemesanan
insert all
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (001, 1, 'Redho AR', 'PARAH MEN', 5)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (001, 2, 'Redho AR', 'PARAH BRO', 5)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (001, 3, 'Redho AR', 'PARAH SIS', 5)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (001, 4, 'Redho AR', 'PARAH CAK', 5)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (001, 5, 'Redho AR', 'PARAH LEK', 5)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (002, 1, 'Redho AE', 'PARAH MEN', 4)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (002, 2, 'Redho AE', 'PARAH BRO', 4)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (002, 3, 'Redho AE', 'PARAH SIS', 4)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (002, 4, 'Redho AE', 'PARAH CAK', 4)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (002, 5, 'Redho AE', 'PARAH LEK', 4)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (003, 1, 'Redho AS', 'PARAH MEN', 3)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (003, 2, 'Redho AS', 'PARAH BRO', 3)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (003, 3, 'Redho AS', 'PARAH SIS', 3)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (003, 4, 'Redho AS', 'PARAH CAK', 3)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (003, 5, 'Redho AS', 'PARAH LEK', 3)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (004, 1, 'Redho AU', 'PARAH MEN', 2)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (004, 2, 'Redho AU', 'PARAH BRO', 2)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (004, 3, 'Redho AU', 'PARAH SIS', 2)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (004, 4, 'Redho AU', 'PARAH CAK', 2)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (004, 5, 'Redho AU', 'PARAH LEK', 2)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (005, 1, 'Redho AD', 'PARAH MEN', 1)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (005, 2, 'Redho AD', 'PARAH BRO', 1)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (005, 3, 'Redho AD', 'PARAH SIS', 1)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (005, 4, 'Redho AD', 'PARAH CAK', 1)
into detail_pemesanan (kartu_pelanggan, id_obat, nama_pelanggan, nama_obat, total) values (005, 5, 'Redho AD', 'PARAH LEK', 1)
select 1 from dual;


================================================

 Menerapkan where clause
==========================================
update detail_pemesanan set nama_obat = 'PARAH NDAN' where id_obat = 1;
update detail_pemesanan set nama_obat = 'PARAH TEN' where id_obat = 6;

menerapkan like
=========================================
select nama_pelanggan from pembeli_06929 where nama_pelanggan LIKE '%r%';

Menerapkan AND, OR dan NOT minimal 2 operator pada satu baris query
=======================================================================
select * from detail_pemesanan where kartu_pelanggan = 2 AND id_obat = 5 OR nama_pelanggan = 'Redho AE'; 

Delete minimal 3 data pada salah satu tabel dengan menerapkan 1 klausa dan 2 operator pada satu baris query yang berbeda pada setiap data
==========================================================================================================================================
DELETE from detail_pemesanan where id_obat = 5 AND nama_pelanggan = 'Redho AE' OR nama_obat = 'PARAH LEK';
DELETE from detail_pemesanan where id_obat = 1 AND nama_pelanggan = 'Redho AS' OR nama_obat = 'PARAH MEN';

=======================================================================
select id_kasir, sum(harga_obat) as total_harga from obat_06929 where harga_obat > 1000 group by id_kasir order by total_harga desc;
select kartu_pelanggan from detail_pemesanan order by kartu_pelanggan desc;
select nama_obat from detail_pemesanan group by nama_obat;

====================================================================
select a.nama_pelanggan, b.nama_obat, c.nama_kasir, harga_obat from PEMBELI a right join kasir c on a.id_kasir = c.id_kasir right join obat b on b.id_kasir = c.id_kasir
AND harga_obat = (select min(harga_obat) as total from obat);

=================================================================
create view list_nama as select a.nama_pelanggan, b.nama_kasir from PEMBELI a join kasir b on a.id_kasir = b.id_kasir where rownum <=3;
create view list_nama as select a.nama_obat, b.nama_kasir from obat a join kasir b on a.id_kasir = b.id_kasir where rownum <=3;

select * from list_nama2;
drop view list_nama2;