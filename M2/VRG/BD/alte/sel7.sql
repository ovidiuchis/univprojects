	SELECT (
				CASE WHEN p.tip = 'O' THEN 'Operatie' WHEN (
							p.tip = 'M'
							AND n.tip = 'P'
							) THEN 'Semifabricat' WHEN p.tip = 'R' THEN 'Reper' WHEN p.tip = 'Z' THEN 'Rezultat' ELSE 'Material' END
				) AS _grupare, (
				CASE WHEN p.tip IN ('M', 'Z') THEN rtrim(n.denumire) WHEN p.tip = 'O' THEN rtrim(c.
								Denumire) WHEN p.tip = 'R' THEN RTRIM(isnull(t.denumire, p.detalii.value('(/row/@denumire)[1]', 
										'varchar(20)'))) END
				) AS denumire, (CASE WHEN p.tip IN ('M', 'Z') THEN rtrim(n.um) WHEN p.tip = 'O' THEN rtrim(c.um) END
				) AS um, (
				CASE WHEN p.tip NOT IN ('R', 'M') THEN p.id WHEN (
							p.tip IN ('R', 'M')
							AND p2.id IS NOT NULL
							) THEN p2.id ELSE p.id END
				) AS id, RTRIM(r.descriere) AS denresursa, p.id AS idReal, p.idp AS idp, p.parinteTop AS parinteTop, (CASE WHEN p.tip = 'R' THEN 'RS' WHEN p.tip = 'M' THEN 'MT' WHEN p.tip = 'O' THEN 'OP' WHEN p.tip = 'Z' THEN 'RZ' ELSE 'TT' END
				) AS subtip, isnull(convert(DECIMAL(10, 6), p.ordine_o), 0) AS ordine, rtrim(p.cod) AS cod, p.idp AS idParinte, convert
			(DECIMAL(12, 3), p.pret) AS pret, p.tip AS tip, convert(DECIMAL(16, 6), p.cantitate) AS cantitate, ISNULL(convert(DECIMAL
					(16, 6), p.cantitate_i), 0) AS cant_i, rtrim(p.resursa) AS resursa, convert(XML, dbo.wfIaArboreTehn(p.id, 
					DEFAULT)), (CASE WHEN p.detalii IS NOT NULL THEN p.detalii END) detalii
		FROM pozTehnologii p
		LEFT JOIN poztehnologii p2
			ON p2.tip = 'T'
				AND p2.idp IS NULL
				AND p2.cod = p.cod
		
		LEFT JOIN tehnologii t
			ON t.cod = p.cod
		LEFT JOIN nomencl n
			ON n.Cod = p.cod
		LEFT JOIN catop c
			ON c.Cod = p.cod
		LEFT JOIN resurse r
			ON r.cod = p.resursa
				AND p.tip = 'O'
				AND r.tip = 'U'
		WHERE p.idp = 1
			AND p.tip IN ('M', 'O', 'R', 'Z')
		ORDER BY 1 DESC
	--	OPTION (HASH GROUP, FAST 10);