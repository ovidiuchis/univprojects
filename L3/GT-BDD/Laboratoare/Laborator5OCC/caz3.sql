create function caz3(@id1 int,@id2 int)
returns int
as
begin
	if (select ts from Tranzactii where id=@id2 and faza='V') < getdate() and
		dbo.intersectie2(@id1,@id2)=0
			return 1
	return 0
end