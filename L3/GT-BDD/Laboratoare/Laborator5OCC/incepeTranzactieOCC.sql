create procedure incepeTranzactieOCC
@id int output
as
begin 
	declare @max_id int
	select @max_id=max(id) from Tranzactii
	if @max_id is null
		set @id=1
	else set @id=@max_id+1
	insert into Tranzactii values(@id,getdate(),'R')
end