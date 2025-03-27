IF EXISTS (
		SELECT *
		FROM sysobjects
		WHERE NAME = 'IaSubalterni'
		)
	DROP function IaSubalterni
GO

CREATE function IaSubalterni (@parinte int)
returns xml
as
begin
	return			
		(
			select
			(	select 
					id, nume, dbo.IaSubalterni(id)
				from Persoane
				where parinte=@parinte
				for xml raw('Persoana')
			)
		)
end