--create or replace view view1 as select nume,prenume from
 info.studenti s inner join info.traiectorie t on s.nrmatricol=t.nrmatricol where
 anuniv=2005 and grupa=251;
--select * from view1;


select * from info.traiectorie where anuniv=2005 and nrmatricol='334' and sectia='1';
create or replace view view2 as select  distinct nume,prenume,s.nrmatricol,s.sectia from
 info.studenti s right outer join (select * from info.traiectorie where anuniv=2005) t on s.nrmatricol=t.nrmatricol;
select * from view2 where nume='Chira';


create or replace view view3 as select distinct
 nume,prenume,grupa,denumire,anstudiu from (info.studenti s inner join 
(select grupa,nrmatricol,sectia from info.traiectorie  where anuniv=2005) t on
 s.nrmatricol=t.nrmatricol and s.sectia=t.sectia)  inner join (select
 denumire,sectia,anstudiu,f.cod from info.formatii f inner join info.sectii se on
 se.cod=f.sectia) ff on grupa=ff.cod;
select * from view3;


create or replace view view4 as
select count(S.nume) as numar ,an
from info.Studenti S inner join (select distinct substr(to_char(datan, 'dd/mm/yy'),7,2) as an  from info.Studenti ) on substr(to_char(datan, 'dd/mm/yy'),7,2)=an
group by an;
select * from view4;

create or replace view view5 as
select  distinct count(*) as numar,zi,luna from
info.Studenti S inner join (select distinct substr(to_char(datan,'dd/mm/yy'),1,2) as zi,substr(to_char(datan,'dd/mm/yy'),4,2) as luna from info.Studenti)
on substr(to_char(datan,'dd/mm/yy'),4,2)=luna and substr(to_char(datan,'dd/mm/yy'),1,2)=zi
group by luna,zi
order by luna,zi;
select * from view5;

create or replace view view6 as
select nume,prenume,denumire,S.nrmatricol,nrex,nrc,med
from (info.Studenti  S inner join (select count(*) as nrex,sum(nrcredite) as nrc, avg(nota) as med,nrmatricol from info.rezultate where nota>=5 and anuniv=2005  group by nrmatricol) D
on S.nrmatricol=D.nrmatricol)  inner join info.sectii ss on sectia=ss.cod ;
select * from view6;


create or replace view view71 as
select nume,prenume,nrmatricol,media,grupa,sectia,anstudiu,rank () over (partition by sectia order by media desc) as poz_s ,rank () over (partition by grupa order by media desc) as poz_g from
(select *  from infstud )
order by media desc;
select * from view71 order by grupa,poz_g;


create or replace view view72 as
select nume,prenume,grupa,media,avg(media) over (partition by grupa) mg from infstud where anuniv=2005 order by nume,prenume; 
select * from view72;

create or replace view view73 as
select nume,prenume,grupa, media from 
(select nume,prenume,media,grupa,rank() over (partition by grupa order by media desc)poz from infstud) where poz=1; 
select * from view73;

--studentii promovati care au media > media sectiei din care fac parte
create or replace view view74 as
select * from
( select nume,prenume,media, avg(media) over ( partition by sectia) ma  from infstud where media>=5 and anuniv=2005)
where media>ma
order by media desc;
select * from view74;

-- primii 10 stud in ordinea desc a mediilor (cu repetare)
create or replace view view75 as 
select  distinct nume,prenume,media,poz
from
(select nume,prenume,media,dense_rank() over (order by media desc) poz from infstud)
where poz<=10
order by poz; 
select * from view75;


create or replace view viewcube as
select sectia,tipdisc,count(*) as nrnote  from info.rezultate where nota<5 group by
rollup(sectia,tipdisc) ;
select * from viewcube;

create or replace view viewgr as
select sectia,anuniv,count(*) as nrs  from (select s.sectia,anuniv,datan from info.studenti s inner join info.traiectorie t on s.nrmatricol=t.nrmatricol and s.sectia=t.sectia) where to_char(datan,'yy') like '80' group by
grouping sets(sectia,anuniv) ;
select * from viewgr;

create or replace view viewrollup as
select sectia,anstudiu,count(*) as nrstud  from infstud group by
rollup(sectia,anstudiu);
select * from viewrollup;

select * from all_views where owner='SM29778';





