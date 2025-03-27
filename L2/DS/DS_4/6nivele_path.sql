select 
	(select rtrim(nume) as nume, rtrim(tip) as tip ,
		(select c.denumireC, convert(datetime,c.valabilDela,104) as data_start, convert(datetime,c.valabilDela,103) as data_stop, c.premium,
			(select denumireP,pret,descriere,garantie,
					(select caracteristica, valoare from caracteristici where idp=p.idp for xml path ('Caracteristica'),type )
			from produse p where p.codc=c.cod for xml path ('Produs'), type) 
		from categorii c where c.cod in (select idcat from magazinCategorii where idmag= m.idmag)for xml path ('Categorie'),type)
	from magazine m for xml path('Magazin'),type)
for xml path ('Catalog')
