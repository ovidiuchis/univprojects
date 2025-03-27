alter function caz1(@id1 int,@id2 int)
returns int
as
begin
	if (select ts from Tranzactii where id=@id2 and faza='C') < (select ts from Tranzactii where id=@id1 and faza='R')
			return 1
	return 0	
end