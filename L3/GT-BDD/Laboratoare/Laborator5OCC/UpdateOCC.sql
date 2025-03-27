create procedure UpdateOCC
@id_t int, @id_r int, @cursa varchar(50),@nr_locuri int, @nr_locuri_libere int
as
begin
	if not exists(select * from SetScriere where id_tranzactie=@id_t and id_resursa=@id_r)
		insert into SetScriere values(@id_t, @id_r, @cursa,@nr_locuri, @nr_locuri_libere)
	else update SetScriere set cursa=@cursa,nr_locuri=@nr_locuri,nr_locuri_libere=@nr_locuri_libere
			where id_tranzactie=@id_t and id_resursa=@id_r
end