
CREATE VIEW TRANZAKCJE 
AS
select LEFT(K.IMIE,1) + '.' + K.NAZWISKO AS NADAWCA,LEFT(P.IMIE_ODBIORCY,1)+ '.' +
 P.NAZWISKO_ODBIORCY AS ODBIORCA,P.DATA AS DATA_PRZELEWU,P.KWOTA AS KWOTA_PRZELEWU
FROM KLIENT K JOIN PRZELEW P ON
K.ID_KLIENT = P.ID_NADAWCA


CREATE VIEW PODGLAD_KONTA_KLIENTA
AS
SELECT K.IMIE,K.NAZWISKO,KO.NUMER_KONTA, KO.KWOTA_NA_KONCIE FROM KONTO KO JOIN KLIENT K ON
KO.ID_Konto = K.ID_KLIENT 





create view Starsi_klienci
as 
select Imie,Nazwisko,Data_zapozyczenia from 
Klient k join Kredyt Kr
on k.Id_klient = Kr.ID_klient
join Konto ko
on k.ID_klient = ko.ID_konto  
where datediff(year,Kr.Data_zapozyczenia,getdate())>10
and ko.Id_konto is not null





create view Wysokie_kredyty 
as
select LEFT(K.IMIE,1) + '.' + K.NAZWISKO AS KlIENT,Kwota_kredytu from
klient k join Kredyt kk
on k.Id_klient = kk.id_klient 
where kk.kwota_kredytu > 400000



create view Klient_Koniec_Lokaty
as
select imie,nazwisko,data_otwarcia,data_zamkniecia
from klient k join Lokata l 
on k.Id_klient = l.ID_klient
join lokata_data_zamkniecia ldz
on k.id_klient = ldz.id_klient
where datediff(m,getdate(),ldz.Data_zamkniecia) < 2

create view Inwestorzy
as
select imie,nazwisko,ilosc_akcji
from klient k join fundusz_inwestycyjny fi
on k.id_klient = fi.id_klient
where ilosc_akcji > 200


create view topkredyt
as
select  top 10 kwota_kredytu,imie,nazwisko,termin
from klient k join kredyt kr
on k.id_klient = kr.id_klient
order by kwota_kredytu desc

create view Wysokieprzelewy 
as
select ID_klient,Id_przelew,Kwota,Numer_konta,numer_konta_odbiorcy
from klient k join Konto ko 
on k.id_klient = ko.id_konto
join przelew p 
on p.id_nadawca = ko.ID_konto
where p.Kwota > 5000

create function rodzinaKlient (@imie varchar(40),@nazwisko varchar(40))
returns table as
return
	(select nazwisko,k.id_adres ,count(*) as LiczbaCzlonkowRodziny from 
	klient k join Adres_klienta ak on k.id_adres = ak.id_adres	
	where nazwisko = @nazwisko 
	group by nazwisko,k.id_adres
	having count(*) > 1
)



create function Sprawdz_koszta_konta(@imie varchar(40), @nazwisko varchar(40))
returns table as
return(select 
	Koszt_prowadzenia, 
	Koszt_karty_debetowej, 
	Koszt_wyplaty_z_bankomatu, 
	Koszt_przelewu
	from Konto k  join konto_koszta ko 
	on  k.ID_konto = ko.Id_konto
	join klient kli
	on k.id_konto = kli.id_klient 
	where 
	(kli.imie= @imie and
	kli.nazwisko = @nazwisko)
)
