IF EXISTS (
		SELECT *
		FROM sysobjects
		WHERE NAME = 'IaArbore'
		)
	DROP PROCEDURE IaArbore
GO

CREATE PROCEDURE IaArbore @id int
as
	select
		id, nume, dbo.IaSubalterni(id)
	from Persoane
	where id=@id
	for xml raw('Persoana')