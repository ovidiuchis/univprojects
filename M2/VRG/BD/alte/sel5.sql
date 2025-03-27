--exec wIaPozTehnologii '','<row cod_tehn="012" />'

;with arbore(id,idp,cod)

as
(	select id, idp,cod
	from pozTehnologii where id=1

	UNION all

	select
		pt.id, pt.idp, pt.cod
	from pozTehnologii pt
	JOIN arbore a on a.id=pt.idp
)

select * from arbore