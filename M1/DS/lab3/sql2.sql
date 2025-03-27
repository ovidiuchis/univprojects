select * from
(select nrmatricol,anuniv,disciplina,sum(nrcredite) from master.rezultate
where anuniv=2007
group by disciplina,nrmatricol,anuniv 
order by nrmatricol
)s1 inner join(select cnp,nrmatricol from master.studenti) s on s1.nrmatricol=s.nrmatricol






