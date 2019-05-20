
CREATE TRIGGER KLIENT_CHECK ON KLIENT AFTER INSERT 
AS 
BEGIN 
	DECLARE @DLPESEL INT 
	DECLARE @DLTEL INT 
	SELECT @DLPESEL = DATALENGTH(PESEL) FROM INSERTED
	SELECT @DLTEL = DATALENGTH(NUMER_TELEFONU) FROM INSERTED
	IF @DLPESEL <> 11
	BEGIN 
		RAISERROR('PODANO B£EDNY NUMER PESEL',1,2)
		ROLLBACK
	END
	IF @DLTEL <> 9
	BEGIN
		RAISERROR('PADANO B£EDNU NUMER TELEFONU',1,3)
		ROLLBACK
	END
END

create trigger Data_Kredyt_splacenia on Kredyt after insert
as
begin
	IF OBJECT_ID('Kredyt_data_splacenia') IS NULL
	begin
		RAISERROR('Brak tabeli na dane o dacie splaty kredytu',2,4)
		rollback
	end
	else
	begin 
		declare @termin int
		select @termin = Termin from Inserted
		declare @ID_k  int ,@ID_Kl int
		select @ID_k = ID_kredyt from Inserted
		select @ID_Kl = ID_klient from Inserted
		declare @data date
		select @data = convert(date,dateadd(yy,+@termin,getdate()))
		insert into Kredyt_data_splacenia values(@Id_k,@ID_Kl,@data)
	end
end


create trigger Data_Pozyczka on Pozyczka after insert
as
begin 
	IF OBJECT_ID('Pozyczka_data_splacenia') IS NULL
	begin
		RAISERROR('Brak tabeli na dane o dacie spacenia pozyczki',2,4)
		rollback
	end
	else
	begin	
		declare @czas int
		select @czas = Czas_splaty from Inserted
		declare @ID_p  int ,@ID_Kl int
		select @ID_p = ID_pozyczka from Inserted
		select @ID_Kl = ID_klient from Inserted
		declare @data date
		select @data = convert(date,dateadd(m,+@czas,getdate()))
		insert into Pozyczka_data_splacenia values(@Id_p,@ID_Kl,@data)
	END
end



create trigger Data_Lokata on Lokata after insert
as
begin
IF OBJECT_ID('Lokata_data_zamkniecia') IS NULL
	begin
		RAISERROR('Brak tabeli na dane o dacie zamknieciu lokaty',2,4)
		rollback
	end 
	else
	begin
		declare @czas int
		select @czas = Termin from Inserted
		declare @ID_l  int ,@ID_Kl int
		select @ID_l = ID_lokata from Inserted
		select @ID_Kl = ID_klient from Inserted
		declare @data date
		select @data = convert(date,dateadd(m,+@czas,getdate()))
		insert into Lokata_data_zamkniecia values(@Id_l,@ID_Kl,@data)
	end
end


CREATE TRIGGER PRZELEW_BLEDY ON PRZELEW AFTER INSERT
AS
BEGIN
	DECLARE @NADAWCA varchar(40)
	DECLARE @ODBIORCA varchar(40)
	SELECT @NADAWCA=K.NUMER_KONTA FROM INSERTED I JOIN KONTO K
	ON I.ID_NADAWCA = K.ID_Konto
	SELECT @ODBIORCA = I.NUMER_KONTA_ODBIORCY FROM INSERTED I
	IF @NADAWCA = @ODBIORCA
	BEGIN
		PRINT('NUMER KONTA ODBIORCY TEN SAM CO NADAWCY')
		RAISERROR('NUMER KONTA ODBIORCY TEN SAM CO NADAWCY',2,4)
		ROLLBACK
	END
	IF LEN(@ODBIORCA) <> 26
	BEGIN
		PRINT('BLEDNY NUMER KONTA ODBIORCY')
		RAISERROR('BLEDNY NUMER KONTA ODBIORCY',2,4)
		ROLLBACK
	END
END

create Trigger Pozyczka_check on Pozyczka after insert
as
begin 
	declare @termin int,@kwota money
	select @termin =  Czas_splaty from inserted 
	select @kwota = Kwota from inserted
	if @kwota < 1000 and @termin > 6  or @kwota < 10000 and @termin > 48
	begin 
		raiserror('za mala kwota na tak dlugi termin',5,2)
		rollback
	end
end 

			
create Trigger Okragly_klient on Klient after insert
as
	begin
	declare @id_klient int
	select @id_klient  = Id_klient from inserted 
	if @id_klient= 100 
	print 'Gratulacje jesteœ setnym klientem'
	if @id_klient= 1000 
	print ' Gratulacje jesteœ tysiêcznym klientem'
	if @id_klient= 10000 
	print 'Gratulacje jesteœ dziesieciotysiecznym klientem' 
	if @id_klient= 100000 
	print 'Gratulacje jesteœ sto tysiecznym klientem'
	if @id_klient= 1000000 
	print 'Gratulacje jesteœ milionowym klientem'
end

