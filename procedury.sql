


create procedure dodaj_konto @nazwa_konta varchar(20) ,@id_klient int ,@kwota money
AS
	IF OBJECT_ID('Konto') IS NULL 
	begin
		raiserror('BRAK TABELI', 13, 1)
		return -1
	end
BEGIN
	DECLARE @NR VARCHAR(26)
	set @NR = CONVERT(VARCHAR,ROUND((RAND()*(99-10)+10),0)) +'1240'+
	CONVERT(VARCHAR,ROUND((RAND()*(9999-1000)+1000),0))+
	CONVERT(VARCHAR,ROUND((RAND()*(9999-1000)+1000),0))+
	CONVERT(VARCHAR,ROUND((RAND()*(9999-1000)+1000),0))+
	CONVERT(VARCHAR,ROUND((RAND()*(9999-1000)+1000),0))+
	CONVERT(VARCHAR,ROUND((RAND()*(9999-1000)+1000),0))
	DECLARE @HASLO VARCHAR(20)
	SET @HASLO =  'SA'+convert(varchar,char(rand()*26+65))+convert(varchar,char(rand()*26+65))+convert(varchar,char(rand()*26+65))+
	CONVERT(VARCHAR,ROUND((RAND()*(99-10)+10),0))			
	INSERT INTO Konto(id_konto,nazwa_konta,NUMER_KONTA,HASlO,kwota_na_koncie)
	VALUES(@id_klient,@nazwa_konta,@NR,@HASLO,@kwota)
	begin
		IF @nazwa_konta = 'Mlodziezowe'
		insert into konto_koszta(id_konto,koszt_karty_debetowej,koszt_prowadzenia,koszt_przelewu,koszt_wyplaty_z_bankomatu)
		values(@id_klient,0,0,0,3.00)
	end
	if @nazwa_konta = 'Zwykle' 
	begin
	insert into konto_koszta(id_konto,koszt_karty_debetowej,koszt_prowadzenia,koszt_przelewu,koszt_wyplaty_z_bankomatu)
	values (@id_klient,3.99,5.99,2.5,5.00)
	end
END


CREATE PROCEDURE ZMIEN_HASLO @ID_KONTA INT ,@HASLO VARCHAR(20)
AS
BEGIN
	IF OBJECT_ID('Konto') IS NULL 
	begin
		raiserror('BRAK TABELI', 13, 1)
		return -1
	end
	UPDATE KONTO SET HAslO= @HASLO
	WHERE ID_KONTO = @ID_KONTA
END



create procedure dokonaj_przelewu @id_nadawca int,@imie varchar(40),@nazw varchar(40),@kwota money,
@konto_odbiorcy varchar(40),
@miasto varchar(40),@ulica varchar(40),@numer varchar(40)
as 
BEGIN
	IF OBJECT_ID('Przelew') IS NULL 
	begin
		raiserror('BRAK TABELI', 13, 1)	
		return -1
	end
		IF OBJECT_ID('Adres_odbiorcy') IS NULL 
	begin
		raiserror('BRAK TABELI', 13, 1)	
		return -1
	end
	if (select id_konto from konto where id_konto = @id_nadawca) is null
	begin
		raiserror('brak klienta o podanym numerze',14,2)
		return -1
	end
	declare @ilosc money 
	select @ilosc = (select Kwota_na_koncie from konto
	where ID_konto = @id_nadawca)
	if @ilosc < @kwota
	begin
		raiserror('za mala ilosc funduszy na koncie',12,2)
		return -1
	end
	begin
		insert into adres_odbiorcy values(@miasto,@ulica,@numer)
	end
	begin	
		declare @id_adres int 
		select @id_adres = id_adres_odbiorcy from adres_odbiorcy 
		insert into przelew values(@id_nadawca,@id_adres,@imie,@nazw,@kwota,@konto_odbiorcy)
	end
	begin
		update Konto set Kwota_na_koncie = @ilosc-@kwota where ID_konto = @id_nadawca
	end
END

create proc wplac_srodki @id_konto int, @kwota money
as 
IF OBJECT_ID('Konto') IS NULL 
begin
	raiserror('BRAK TABELI', 13, 1)	
	return -1
end	
begin
 update konto set kwota_na_koncie = kwota_na_koncie + @kwota
 where id_konto = @id_konto
end

create procedure dodaj_Kredyt  @id_klient int, @Kwota Money, @procent float ,@termin int
as 
begin 
	declare @rata money
	declare @wsp float
	set @procent = @procent* 0.01
	select @wsp = 1 + (@procent*0.12) 
	select @rata = convert(money,(@KWOTA * power(@wsp,@termin) * (@wsp-1)/(power(@wsp,@termin-1))))
	insert into Kredyt values(@id_klient,@Kwota,@procent,@termin,@rata)
end


