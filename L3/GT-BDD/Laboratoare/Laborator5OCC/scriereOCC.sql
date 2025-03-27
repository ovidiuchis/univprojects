alter procedure ScriereOCC
@id_t int
as
begin
	insert into Tranzactii values (@id_t,getdate(),'W')
	declare C cursor read_only
		for select id_resursa,cursa,nr_locuri,nr_locuri_libere from SetScriere
	open C
	declare @id_r int,@cursa varchar(50),@nr_locuri int,@nr_locuri_libere int
	fetch next from C into @id_r,@cursa,@nr_locuri,@nr_locuri_libere
	while @@fetch_status=0
	begin
		if exists(select * from Rezervari where id=@id_r)
			if @cursa is null and @nr_locuri is null and @nr_locuri_libere is null
				delete from Rezervari where id=@id_r
			else
				update Rezervari set cursa=@cursa,nr_locuri=@nr_locuri,nr_locuri_libere=@nr_locuri_libere
					where id=@id_r
		else
			insert into Rezervari values (@id_r,@cursa,@nr_locuri,@nr_locuri_libere)
		fetch next from C into @id_r,@cursa,@nr_locuri,@nr_locuri_libere
	end
	close C
	deallocate C
end