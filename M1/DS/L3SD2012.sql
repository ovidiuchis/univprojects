/* Creare tipuri de date solicitate **/ 
create  type Rezultat as object(
   anuniv integer,
   disciplina char(10),
   nrcredite float,
   nota integer,  
   
);
/
create  type ColectieRezult is table of Rezultat;
/
create   type Student as object
(
        nume varchar2(30),
        prenume varchar2(30),
        cnp char(13),
        sectia integer,
        nrmatricol varchar(10),
        rezultate ColectieRezult,

        member function iaNrRezultate return number,
        member Function iaRezultate return string,

        member procedure adaugaRezultat(rez rezType),
        member procedure stergeRezultat(an number , disciplina string),
        member function iaDataNasterii return date,
        member function iaSituatie(an number,  nrcred float) return string,
        member function iaMedieStud(an integer) return float
        
               
);
/
-------------------------------------*****************-------------------
create or replace type body Student is


	member function iaNrRezultate return number is
		begin
			return rezultate.count;
		end;
	  
	member Function iaRezultate return string is
		rezult varchar(2000):=' ';
		i number:=1;
		begin
		  for i in 1..rezultate.count loop
			rezult:= rezult || ' ' || rezultate(i).disciplina || ' ' || rezultate(i).nota;
		  end loop;
		return rezult;
	end;
	  
	member procedure adaugaRezultat(rezultat Rezultat) is
		m number;
		begin 
		  m:=rezultate.count+1;
		  rezultate.extend;
		  rezultate(m):=rezultat;
		end;

	member procedure stergeRezultat(an number , disciplina string) is
		i number:=1;
		m number:=rezultate.count;
		begin
			if (rezultate(m).anuniv=an) and (trim(rezultate(m).disciplina) )=(trim(disciplina)) then
				rezultate.trim;
			else    
			for i in 1..m-1 loop
				   if (rezultate(i).anuniv=an) and (trim(rezultate(i).disciplina) )=(trim(disciplina)) then
						rezultate(i):=rezultate(m);
						rezultate.trim;                    
				   end if;
				end loop;
			end if;
		end;

	member function iaDataNasterii return date is
		rez varchar(10):='';
		an char(2);
		s char(1);
		begin
			s:=substr(cnp,1,1);
			if s='1' or s='2' then 
				an:='19'; 
			end if;
			if s='5' or s='6' then 
				an:='20'; 
			end if;
		   return to_date(an || substr(cnp,2,2) || '-' ||substr(cnp,4,2) || '-'|| substr(cnp,6,2),'yyyy-mm-dd');
		end;

	member function iaSituatie(an number, nrcred float) return string is
		rez  varchar(30):=' ';
		i number;
		suma float:=0;
		begin
			for i in 1..rezultate.count loop
				  if(rezultate(i).anuniv=an) then
					 suma:=suma+rezultate(i).nrcredite;
				  end  if;
			   end loop;
			if (suma>=nrcred) then rez:='promovat';
				   else rez:='nepromovat'      ;   
			end  if;
			return rez;
		end;


	member function iaMedieStudent(an integer) return float is
		i number:=0;
		nrnote number:=0;
		suma integer:=0;
		media float:=0;
		begin
		   if ( (iaSituatie(an,30))='promovat') then
				for i in 1..rezultate.count loop
					if(rezultate(i).anuniv=an) then
						  suma:=suma+rezultate(i).nota;
						  nrnote:=nrnote+1;
					end  if;     
			   end loop;
			  else
				   suma:=0; 
				   nrnote:=1;
			end if; 
			 return suma/nrnote;
		  end;   
end;


/* Testari si utilizare ale tipurilor */

set serveroutput on
declare
  rezultat Rezultat;        
  rezultate ColectieRezult:=ColectieRezult();
  student Student;
  sectia integer;
  nume varchar2(30);
  cnp varchar(13):='1890307125793';
  prenume varchar2(30);
  nrmatricol char(10);
  linieRezultat master.rezultate%rowtype;
begin
        dbms_output.enable;    
        select nume into nume from master.studenti where cnp=cnp ;
        select prenume into prenume from master.studenti where cnp=cnp;
        select sectia into sectia from master.studenti where cnp=cnp ;
        select  nrmatricol into nrmatricol  from master.studenti where cnp=cnp ; 
        student:= Student(nume ,prenume ,cnp,sectia,unrmatricol,rezultate);
        dbms_output.put_line('Studentul ' || student.nume || ' are ' || student.iaNrRezultate || ' rezultat  ');
        for linieRezultat in ( select * from master.rezultate where nrmatricol=nrmatricol) loop
           student.adaugaRezultat(Rezultat(linieRezultat.anuniv,linieRezultat.disciplina,linieRezultat.nota,linieRezultat.nrcredite) );
        end loop;
        dbms_output.put_line('Studentul ' || student.nume || ' are ' || student.iaNrRezultate || ' rezultat  ');
        dbms_output.put_line(student.iaRezultate);
        dbms_output.put_line('Studentul' || student.nume || ' are media =' || student.iaMedieStud(2011)|| '  ');
        student.stergeRezultat(2007,'MID0005');
        dbms_output.put_line('Studentul ' || student.nume || ' are ' || student.iaNrRezultate || ' rezultat  ');
        dbms_output.put_line(student.iaRezultate);    
end;






