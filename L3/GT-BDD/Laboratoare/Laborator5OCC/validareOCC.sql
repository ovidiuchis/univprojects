create procedure ValidareOCC
@id_t int
as
begin
	insert into Tranzactii values(@id_t,getdate(),'V')
	declare C cursor read_only 
		for select id from Tranzactii where id<>@id_t
	open C
	declare @id_c int,@ok int
	set @ok=1
	fetch next from C into @id_c

	while @@fetch_status=0
	begin
		if exists (select * from dbo.opConflict(@id_t,@id_c))
			if dbo.caz1(@id_t,@id_c)=0 and dbo.caz2(@id_t,@id_c)=0 and dbo.caz3(@id_t,@id_c)=0
				set @ok=0
		fetch next from C into @id_c
	end
	close C
	deallocate C
	if @ok=0
		begin
		raiserror('Tranzactie anulata',16,1)
		exec RollbackOCC @id_t
		end
end