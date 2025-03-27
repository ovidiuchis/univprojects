alter function caz2(@id1 int,@id2 int)
returns int
as
begin
	if (select ts from Tranzactii where id=@id2 and faza='C') < getdate() and
		(select ts from Tranzactii where id=@id2 and faza='V') < (select ts from Tranzactii where id=@id1 and faza='R') and
			dbo.intersectie1(@id1,@id2)=0
		return 1
	return 0
end