show errors;
drop type student;
drop type colrez;
drop type rezult;
drop type coltraiect;
drop type traiectorie;
create or replace type traiectorie as object (
anuniv integer,
grupa integer,
member procedure setgrupa(r integer),
member procedure setanuniv(r integer)
);
/
create or replace type coltraiect is table of traiectorie;
-- multime de rezultate
/

create or replace type body traiect is
member procedure setgrupa(r integer) is
begin
grupa:=r;
end;
member procedure setanuniv(r integer)is
begin
anuniv:=r;
end;
end;
/


create or replace type rezult as object(
   anuniv integer,
   codd char(10),
   nota integer,
   nrcredite float
);

/

create or replace type colrez is table of rezult;
-- multime de rezultate
/
create  or replace type student as object
(
        nume varchar2(30),
        prenume varchar2(30),
        cnp char(13),
        sectia integer,
        nrmatricol varchar(10),
        rez colrez,
        tra coltraiect,
        member function NrRezultate return number,
        member Function retRezultate return string,

        member procedure AdaugaRezultat(r rezult),
       member procedure EliminaRezultat(an number , disciplina string),
        member function DataNasterii return date,
        member function Situatie(an number,  nrcred float) return string,
        member function Media(an integer) return float
        
               
);
/

create or replace type body student is


  member function NrRezultate return number is
  begin
    return rez.count;
  end; -- final functie
  
member Function retRezultate return string is
  r varchar(2000):=' ';
  i number:=1;
  begin
      for i in 1..rez.count loop
        r:= r || ' ' || rez(i).codd || ' ' || rez(i).nota;
      end loop;
   return r;
  end;
  
   member procedure AdaugaRezultat(r rezult) is
    m number;
    begin 
      m:=rez.count+1;
      rez.extend;
      rez(m):=r;
    end;

   member procedure EliminaRezultat(an number , disciplina string) is
     i number:=1;
     m   number:=rez.count;
      begin
     if (rez(m).anuniv=an) and (trim(rez(m).codd) )=(trim(disciplina)) then
        rez.trim;
     else    
        for i in 1..m-1 loop
           if (rez(i).anuniv=an) and (trim(rez(i).codd) )=(trim(disciplina)) then
                rez(i):=rez(m);
                rez.trim;                    
           end if;
        end loop;
     end if;
  end;

   member function DataNasterii return date is
       r varchar(10):='';
        an char(2);
         s char(1);

       begin
             s:=substr(cnp,1,1);
             if s='1' or s='2' then an:='19'; end if;
             if s='5' or s='6' then an:='20'; end if;
           return to_date(an || substr(cnp,2,2) || '-' ||substr(cnp,4,2) || '-'|| substr(cnp,6,2),'yyyy-mm-dd');
       end; --end DataNasterii

   member function Situatie(an number, nrcred float) return string is
       r  varchar(30):=' ';
       i number;
       suma float:=0;
       begin
           for i in 1..rez.count loop
              if(rez(i).anuniv=an) then
                 suma:=suma+rez(i).nrcredite;
              end  if;
           end loop;
        if (suma>=nrcred) then r:='promovat';
               else r:='nepromovat'      ;   
        end  if;
       return r;
       end;


  member function Media(an integer) return float is
    i number:=0;
    nrnote number:=0;
    suma integer:=0;
    media float:=0;
    begin
       if ( (Situatie( an,30))='promovat') then
            for i in 1..rez.count loop
                if(rez(i).anuniv=an) then
                      suma:=suma+rez(i).nota*rez(i).nrcredite;
                      nrnote:=nrnote+rez(i).nrcredite;
                end  if;     
           end loop;
          else
           suma:=0; 
           nrnote:=1;
         end if; 
         return suma/nrnote;
      end;   



end;


