alter procedure RollbackOCC
@id_t int
as
begin
	insert into Tranzactii values(@id_t,getdate(),'A')
	delete from SetCitire where id_tranzactie=@id_t
	delete from SetScriere where id_tranzactie=@id_t

end