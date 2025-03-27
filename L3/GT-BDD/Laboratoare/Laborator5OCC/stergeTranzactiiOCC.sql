alter procedure StergeTranzactiiOCC
as
begin
	delete from Tranzactii where id in 
				(select id from Tranzactii where faza='A' or faza='C')
end
