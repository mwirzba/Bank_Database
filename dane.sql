/*UWAGA PROSZE NAJPIERW STWORZYC WYZWALACZE I FUNKCJE PRZED DODANIEM DANYCH*/

insert into adres_klienta values('Lubichowo','Polna','22b')
insert into adres_klienta values('Gda�sk','Pomorka','12')
insert into adres_klienta values('Gdynia','Jagielo�ska','31c')
insert into adres_klienta values('Gdynia','Jajeczna','12a')
insert into adres_klienta values('Bia�ystok','Bia�a','231b')
insert into adres_klienta values('Sopot','Jachtowa','5')
insert into adres_klienta values('Sopot','Jacka Soplicy','47b')
insert into adres_klienta values('Starogard Gda�ski','Szornaka','27')
insert into adres_klienta values('Lubichowo','Polna','22b')
insert into adres_klienta values('Gda�sk','Pomorka','12')
insert into adres_klienta values('Gdynia','Jagielo�ska','31c')
insert into adres_klienta values('Gdynia','Jajeczna','12a')
insert into adres_klienta values('Bia�ystok','Bia�a','231b')
insert into adres_klienta values('Sopot','Jachtowa','5')
insert into adres_klienta values('Starogard Gda�ski','Szornaka','27')


INSERT INTO KLIENT VALUES(1,'Andrzej','Janusz','Kowalski','TOPPEK','324456456','47062577555')
INSERT INTO KLIENT VALUES(1,'Pawe�','Miros�aw','Kowalski','MECH','863135752','80031649946')
INSERT INTO KLIENT VALUES(2,'Kajetan','Darek','D�b','S�up','862678272','67092854319')
INSERT INTO KLIENT VALUES(3,'Barbara','Adella','Kowalski','Adamowski','936284638','89040177141')
INSERT INTO KLIENT VALUES(4,'Aleksandra','Agnieszka','Konieczko','Luty','372964827','68071112978')
INSERT INTO KLIENT VALUES(5,'Marta ','Aneta','Chudy','Wieczorek','647825835','75042093659')
INSERT INTO KLIENT VALUES(5,'Rafa� ','Pawe�','Dalecki','Moroz','835164025','85051138296')
INSERT INTO KLIENT VALUES(6,'Dariusz','Zbigniew ','Solarski','Terlecki','264973114','89040177311')
INSERT INTO KLIENT VALUES(7,'Grzegorz','Damian','Cie�lewicz','Beczek','699650124','62050235309')
INSERT INTO KLIENT VALUES(8,'Stanis�aw ','Wojciech ','Kowalski','Lenartowicz','Dembowski','56050774365')
INSERT INTO KLIENT VALUES(9,'Marian','Kazimierz','Lubi�ski','J�wicki','692565382','68071312978')
INSERT INTO KLIENT VALUES(10,'Jerzy ','J�zef ','Konieczko','Kawka','728803138','89041541969')
INSERT INTO KLIENT VALUES(11,'Marcin','Stanis�aw ','Kacperski','Wrzesie�','789665671','54100939366')
INSERT INTO KLIENT VALUES(12,'Marta ','Danuta','Sadowski','Kacperski','699242956','91012342521')
INSERT INTO KLIENT VALUES(12,'Marianna','Izabela ','Sadowski','Stok�osa','722372775','48032416642')
INSERT INTO KLIENT VALUES(14,'Ewa','Teresa ','Piskorz','Misiura','699660194','80020867555')
INSERT INTO KLIENT VALUES(14,'Joanna ','Ma�gorzata','Wrzesie�','Kacperski','793229133','61040912249')
INSERT INTO KLIENT VALUES(14,'Jakub','Andrzej ','Wrzesie�','Kacperski','883719688','80020867555')
INSERT INTO KLIENT VALUES(15,'Wies�awa ','Dorota ','Mirowski','Dratwa','699284899','90101665541')
INSERT INTO KLIENT VALUES(15,'Krzysztof','S�awomir ','Mirowski','Czoga�a','532154945','92050475752')


exec dodaj_konto "Zwykle" ,1, 11230
exec dodaj_konto "Zwykle" ,2, 9000
exec dodaj_konto "Zwykle" ,3, 6355
exec dodaj_konto "Zwykle" ,4, 8709
exec dodaj_konto "Zwykle" ,5 ,7235
exec dodaj_konto "Zwykle" ,6, 4215
exec dodaj_konto "Zwykle" ,7, 1456
exec dodaj_konto "Mlodziezowe" ,8, 499
exec dodaj_konto "Zwykle" ,9 ,1235
exec dodaj_konto "Zwykle" ,10 ,1546
exec dodaj_konto "Zwykle" ,11, 6081
exec dodaj_konto "Mlodziezowe" ,12 ,1200
exec dodaj_konto "Mlodziezowe" ,13, 1245
exec dodaj_konto "Mlodziezowe" ,15, 899


exec dokonaj_przelewu 1,'Jan' ,'Wieczorek',6000,'34154012325840161062047821','Warszawa','Tadeusza Wendy','66c'

exec dokonaj_przelewu 1,'Monika' ,'Michalak' ,1234,'91154012320601408261553091','Krak�w','pnura','31b'

exec dokonaj_przelewu 2,'Gra�yna' ,'Paw�owska',2254,'52154012321695381053686629','��d�','Regatowa ','1a'

exec dokonaj_przelewu 3,'Miros�aw ','Zieli�ski',234,'29154012320921183201766794','Pozna�','Bukowa','12a'

exec dokonaj_przelewu 4,'Janina',' St�pie�',1234,'51105000998997125398590882','Gda�sk','Jednoro�ca','45'

exec dokonaj_przelewu 5,'Teresa', 'Wasilewska',415,'48154012324349277666009620','Bydgoszcz','Biwakowa','13a'

exec dokonaj_przelewu 4,'Damian' ,'Sobczak',1124,'93109012320325359907841852','Bydgoszcz','��kowa ','13a'

exec dokonaj_przelewu 2,'Kazimierz','Zaj�c',456,'51109012329574369972161268','Bia�ystok','Brzozowa ','78'

exec dokonaj_przelewu 6,'Micha�', 'Wysocki',123,'89109012329726759156294161','Bia�ystok','S�oneczna ','61'

exec dokonaj_przelewu 1,'Iwona','Grabowska',1345,'06109012325957232169896559','Wroc�aw' ,'Kwiatowa ','24'


exec dodaj_kredyt 1,500000,3,40

exec dodaj_kredyt 2,250000,3,40

exec dodaj_kredyt 3,300000,3,40

exec dodaj_kredyt 10,666000,2.5,45

exec dodaj_kredyt 7,50000,4,10



insert into Fundusz_inwestycyjny values(1,1000,32)
insert into Fundusz_inwestycyjny values(1,3253,32)
insert into Fundusz_inwestycyjny values(7,6552,32)
insert into Fundusz_inwestycyjny values(2,1234,32)
insert into Fundusz_inwestycyjny values(3,1443,32)
insert into Fundusz_inwestycyjny values(4,3455,32)

insert into Lokata values(1,3000,3,2.5)
insert into Lokata values(2,1200,3,2.5)
insert into Lokata values(3,3000,3,2.5)
insert into Lokata values(6,8000,12,2.5)
insert into Lokata values(19,1678,6,2.5)

insert into Pozyczka values(4,1900,10)
insert into Pozyczka values(9,1900,10) 
insert into Pozyczka values(13,1900,10) 
insert into Pozyczka values(20,1900,10) 
 

