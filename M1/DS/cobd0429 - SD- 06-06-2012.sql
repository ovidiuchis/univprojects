
/* Rezolvare 1.*/
/*a*/
select 
	distinct st.nume, st.prenume, st.sectia,st.nrmatricol, sum(rz.nota)/count(rz.nota) media
from master.studenti st
inner join master.traiectorie tr on st.nrmatricol=tr.nrmatricol
inner join master.sectii  sc on sc.cod=st.sectia
inner join master.rezultate rz on rz.nrmatricol=st.nrmatricol and rz.sectia=st.sectia
inner join master.grupe gr on gr.cod=tr.grupa and gr.sectia=st.sectia 
where rz.anuniv=2009 and gr.anstudiu=1
group by  st.sectia,st.nrmatricol,st.nume, st.prenume
having sum(rz.nota)/count(rz.nota) > 7

/*Observatii: anul univ 2009, an studiu 1, media nu este calculata cu credite(probabil nu este corecta), etc*/

/*b*/
select 
	distinct st.nume, st.prenume, st.sectia,st.nrmatricol, sum(rz.nota)/count(rz.nota) media,  rank() over (order by sum(rz.nota)/count(rz.nota) desc ) r
from master.studenti st
inner join master.traiectorie tr on st.nrmatricol=tr.nrmatricol
inner join master.sectii  sc on sc.cod=st.sectia
inner join master.rezultate rz on rz.nrmatricol=st.nrmatricol and rz.sectia=st.sectia
inner join master.grupe gr on gr.cod=tr.grupa and gr.sectia=st.sectia 
where rz.anuniv=2009 and gr.anstudiu=1
group by  st.sectia,st.nrmatricol,st.nume, st.p-renume
order by 5 desc

/*Observatii: la medii egale ramane o aceasi pozitie ( 2 studenti cu 9 => au acelasi loc). Daca se doreste diferentierea acestora se poate face 
o ordonare dupa nrmatricol in functia de ranking */

/* Rezolvare 2*/
create or replace package procs 
as
procedure numarStud (anS IN number, anU IN number, mediaJos IN number, mediaSus IN number, nr OUT number)
begin
	select count(*) 
	into nr
	from 
		(
			select distinct st.nume, st.prenume, st.sectia,st.nrmatricol, sum(rz.nota)/count(rz.nota) media
			from master.studenti st
			inner join master.traiectorie tr on st.nrmatricol=tr.nrmatricol
			inner join master.sectii  sc on sc.cod=st.sectia
			inner join master.rezultate rz on rz.nrmatricol=st.nrmatricol and rz.sectia=st.sectia
			inner join master.grupe gr on gr.cod=tr.grupa and gr.sectia=st.sectia 
			where rz.anuniv=anU and gr.anstudiu=anS
			group by  st.sectia,st.nrmatricol,st.nume, st.prenume
			having sum(rz.nota)/count(rz.nota) between mediaJos and mediaSus
		)
end;
/*Observatii: erori compilare */
/* Eventuala testare */
declare nr number
begin
	execute proc.numarStud (1, 2009 ,8, 10,nr)
	DBMS_OUTPUT.PUT_LINE(`Numar returnat :`|| nr) ;
end

/* Rezvolvare 3 */
create  or replace type student as object
(
        nume varchar2(30),
        prenume varchar2(30),
        nrmatricol varchar2(10)        
               
);
create or replace type listaStudenti is table of student;

create or replace type Centralizator as object
(
        cod_disciplina varchar2(10),
        denumire_disciplina varchar2(100),
        studenti listaStudenti,

        member function NrStudenti return number,    
        member procedure AdaugaStudent(s student),
        member procedure EliminaStudent(matricol string)   
               
);
/
create or replace type body Centralizator is

  member function NrStudenti return number is
  begin
    return studenti.count;
  end; 

  member procedure AdaugaStudent(s student) is
  m number;
  begin 
    m:=studenti.count+1;
    studenti.extend;
    studenti(m):=s;
  end;

  member procedure EliminaStudent(matricol string) is
     i number:=1;
     m number:=studenti.count;
     begin
     if (studenti(m).nrmatricol=matricol) then
        studenti.trim;
     else    
        for i in 1..m-1 loop
           f (studenti(i).nrmatricol=matricol) then
                studenti(i):=studenti(m);
                studenti.trim;                    
           end if;
        end loop;
     end if;
  end;

end;

/* Rezolvare 4 */
/*a*/
declare
	nume master.studenti.nume %type;
	prenume master.studenti.prenume %type;
	nota master.rezultate.nota %type;
	cod master.discipline.cod %type;
	denumire master.discipline.denumire%type;
	nr number;
	listaS listaStudenti2;

cursor cIaDate is
select st.nume, st.prenume, rz.nota, d.cod, d.denumire
from master.studenti st inner join master.rezultate rz on st.sectia=rz.sectia and st.nrmatricol=rz.nrmatricol
inner join master.discipline d on d.cod=rz.disciplina;

begin
	open cIaDate;
	loop
		fetch cIaDate into nume, prenume,nota, cod,denumire
		select count(1) into nr from tabel4 where cod_disciplina=cod
		if ( nr = 1 )
		begin
			select listaS from tabel4 where cod_disciplina=cod	
			insert into listaS values (student(nume,prenume,nota))
			update tabel4 set lista=listaS where cod_discplina=cod
		end
		else if ( nr = 0)
			begin
				insert into listaS values (student(nume,prenume,nota))
				insert into tabel4 values (cod, denumire, listaS) 
			end

		exit when cIaDate%NOTFOUND;
		
	end loop;

	close cIaDate ;
end;

/*b*/

select 
	denumire as Discplina, lista.count NumarStudenti
from tabel4
order by 2 desc