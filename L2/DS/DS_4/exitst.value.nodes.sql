declare @par xml, @ok bit, @count int
set @par = (select xml from xmlTable)
--select @par

set @count = @par.value('count(/librarie/filiale/filiala)','int')
print 'Numar filiale: ' + convert(varchar(2),@count)

/*
while (@count > 0)
begin
	set @denumire = @par.value ('(/librarie/filiale/filiala/denumire/text())[@count]','varchar')
	print @denumire
end
*/