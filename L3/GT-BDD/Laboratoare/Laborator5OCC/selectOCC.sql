create procedure SelectOCC
@id_t int, @id_r int
as
begin
	declare @cursa varchar(50), @nr_locuri int, @nr_locuri_libere int

	if not exists(select * from SetCitire where id_resursa=@id_r and id_tranzactie=@id_t)
		if not exists(select * from SetScriere where id_tranzactie=@id_t and id_resursa=@id_r)
		begin
			select * from Rezervari where id=@id_r
			select @id_r=id,@cursa=cursa,@nr_locuri=nr_locuri,@nr_locuri_libere=nr_locuri_libere
				from Rezervari where id=@id_r
			insert into SetCitire values(@id_t,@id_r,@cursa,@nr_locuri,@nr_locuri_libere)	
		end
		else
			select id_resursa,cursa,nr_locuri,nr_locuri_libere from SetScriere where id_tranzactie=@id_t and id_resursa=@id_r
	else 
		if not exists(select * from SetScriere where id_tranzactie=@id_t and id_resursa=@id_r)
			select id_resursa,cursa,nr_locuri,nr_locuri_libere from SetCitire where id_tranzactie=@id_t and id_resursa=@id_r
		else
			select id_resursa,cursa,nr_locuri,nr_locuri_libere from SetScriere where id_tranzactie=@id_t and id_resursa=@id_r
end