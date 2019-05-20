
create table Adres_klienta(
ID_adres int identity(1,1) primary key,
Miasto varchar(40) not null,
Ulica varchar(40) not null,
[Numer domu/mieszkania] varchar(10) not null
)

create table Klient(
ID_klient int identity(1,1),
ID_adres int foreign key references Adres_klienta(ID_adres) 
on delete cascade on update cascade not null,
Imie varchar(40) not null,
Drugie_imie varchar(40) not null,
Nazwisko varchar(40) not null,
Nazwisko_rodowe_matki varchar(40) not null,
Numer_telefonu varchar(9) unique not null,
Pesel varchar(11) unique not null,
primary key(ID_klient)
)


create table Konto(
ID_konto int,
foreign key(ID_konto) references Klient(ID_klient)
on delete cascade on update cascade,
Nazwa_konta varchar(20),
Numer_konta varchar(26),
Haslo varchar(20),
Kwota_na_koncie money,
primary key(ID_konto)
)

create table Konto_koszta(
ID_konto_koszta int identity(1,1),
ID_konto int,
Koszt_prowadzenia money,
Koszt_karty_debetowej money,
Koszt_wyplaty_z_bankomatu money,
Koszt_przelewu money,
foreign key(ID_konto) references Konto(Id_konto)
on delete cascade on update cascade,
primary key (ID_konto,id_konto_koszta)
)

create table Adres_odbiorcy(
ID_adres_odbiorcy int identity(1,1),
Miasto varchar(40),
Ulica varchar(40),
[Numer_domu/mieszkania] varchar(40),
primary key(ID_adres_odbiorcy)
) 

create table Przelew(
ID_przelew int identity(1,1),
ID_nadawca int,
ID_adres_odbiorcy int foreign key references adres_odbiorcy(ID_adres_odbiorcy)
on delete cascade on update cascade,
Imie_odbiorcy varchar(40),
Nazwisko_odbiorcy varchar(40),
Kwota money,
Numer_konta_odbiorcy varchar(26),
data  as convert(date,getdate()),
foreign Key(ID_nadawca) references konto(ID_konto)
on delete cascade on update cascade,
primary key (ID_nadawca,Id_przelew,ID_adres_odbiorcy)
)


create table Kredyt(
ID_kredyt int identity(1,1),
ID_klient int unique,
foreign key(ID_klient) references Klient(ID_klient)
on delete cascade on update cascade,
Kwota_kredytu money,
Oprocentowanie_kredytu float,
Termin int,
Wysokoœæ_raty money,
Data_zapozyczenia as convert(date,dateadd(m,+1,getdate())),
primary key(ID_klient,ID_kredyt)
)


create table Kredyt_data_splacenia(
ID_kredyt_data int identity(1,1),
ID_kredyt int,
ID_klient int unique,
Data_splacenia date,
foreign key(ID_klient,ID_kredyt) references Kredyt(ID_klient,ID_kredyt)
on delete cascade on update cascade,
primary key(ID_klient,ID_kredyt,ID_kredyt_data)
)

create table Fundusz_inwestycyjny(
ID_fundusz_inwestycyjny int identity(1,1),
ID_klient int,
Kwota money,
Cena_akcji money,
Data_otwarcia as convert(date,getdate()),
ilosc_akcji as CAST(CAST(KWOTA AS DECIMAL)/CAST(cena_akcji AS DECIMAL) AS DECIMAL(18,4)),
foreign key(ID_klient) references Klient(ID_klient)
on delete cascade on update cascade,
primary key(ID_klient,ID_fundusz_inwestycyjny)
)

create table Lokata(
ID_lokata int identity(1,1),
ID_klient int,
Kwota money,
Termin int,
Oprocentowanie int,
Data_otwarcia as  convert(date,getdate()),
foreign key(ID_klient) references Klient(ID_klient)
on delete cascade on update cascade,
primary key(ID_klient,ID_lokata)
)

create table Lokata_data_zamkniecia(
ID_lokata_data int identity(1,1),
ID_lokata int,
ID_klient int,
Data_zamkniecia date,
foreign key(ID_klient,ID_lokata) references Lokata(ID_klient,ID_lokata)
on delete cascade on update cascade,
primary key(ID_klient,ID_lokata,ID_lokata_data)
)

create table Pozyczka(
ID_pozyczka int identity(1,1),
ID_klient int,
Kwota money check(Kwota < 200000),
Czas_splaty int check(Czas_splaty <96),
Data_zapozyczenia  as  convert(date,getdate()),
Wysokosc_miesiecznej_raty as cast(Kwota*1.25/Czas_splaty as money),
foreign key(ID_klient) references Klient(ID_klient)
on delete cascade on update cascade,
primary key(ID_klient,ID_pozyczka)
)

create table Pozyczka_data_splacenia(
ID_pozyczka_data int identity(1,1),
ID_pozyczka int,
ID_klient int,
Data_splacenia date,
foreign key(ID_klient,ID_pozyczka) references Pozyczka(ID_klient,ID_pozyczka)
on delete cascade on update cascade,
primary key(ID_klient,ID_pozyczka,ID_pozyczka_data)
)

