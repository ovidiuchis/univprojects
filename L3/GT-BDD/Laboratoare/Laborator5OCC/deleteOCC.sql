create procedure DeleteOCC
@id_t int, @id_r int
as
begin
	if not exists(select * from SetScriere where id_tranzactie=@id_t and id_resursa=@id_r)
		insert into SetScriere values(@id_t,@id_r,null,null,null)
	else update SetScriere set cursa=null,nr_locuri=null,nr_locuri_libere=null
			where id_tranzactie=@id_t and id_resursa=@id_r
end