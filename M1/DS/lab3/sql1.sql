--drop type StudObj;
--drop type MultimeRez;
--drop type rezType;

create  type rezType as object(
   anuniv integer,
   disciplina char(10),
   nota integer,
   nrcredite float
);

/

create  type MultimeRez is table of rezType;
-- multime de rezultate
/
create   type StudObj as object
(
        nume varchar2(30),
        prenume varchar2(30),
        cnp char(13),
        sectia integer,
        nrmatricol varchar(10),
        rezult MultimeRez,

        member function NrRezultate return number,
        member Function retRezultate return string,

        member procedure AdaugaRezultat(rez rezType),
--        elimina un rezultat profesional
        member procedure EliminaRezultat(an number , disciplina string),
--      determina data nasterii
        member function DataNasterii return date,
--         Furnizeaza o situatie cu privire la un an universitar: promovat (nr. de credite la disciplinele promovate în acest an universitar >= n) sau nepromovat
        member function Situatie(an number,  nrcred float) return string,
--	   Furnizeaza media notelor la disciplinele promovate dintr-un an universitar (media = 0 daca nu e promovat)

        member function Media(an integer) return float
        
               
);
/
-------------------------------------*****************-------------------
create or replace type body StudObj is


  member function NrRezultate return number is
  begin
    return rezult.count;
  end; -- final functie
  
member Function retRezultate return string is
  rez varchar(2000):=' ';
  i number:=1;
  begin
      for i in 1..rezult.count loop
        rez:= rez || ' ' || rezult(i).disciplina || ' ' || rezult(i).nota;
      end loop;
   return rez;
  end;
  
   member procedure AdaugaRezultat(rez rezType) is
    m number;
    begin 
      m:=rezult.count+1;
      rezult.extend;
      rezult(m):=rez;
    end;

   member procedure EliminaRezultat(an number , disciplina string) is
     i number:=1;
     m   number:=rezult.count;
      begin
     if (rezult(m).anuniv=an) and (trim(rezult(m).disciplina) )=(trim(disciplina)) then
        rezult.trim;
     else    
        for i in 1..m-1 loop
           if (rezult(i).anuniv=an) and (trim(rezult(i).disciplina) )=(trim(disciplina)) then
                rezult(i):=rezult(m);
                rezult.trim;                    
           end if;
        end loop;
     end if;
  end;

   member function DataNasterii return date is
       rez varchar(10):='';
        an char(2);
         s char(1);

       begin
             s:=substr(cnp,1,1);
             if s='1' or s='2' then an:='19'; end if;
             if s='5' or s='6' then an:='20'; end if;
           return to_date(an || substr(cnp,2,2) || '-' ||substr(cnp,4,2) || '-'|| substr(cnp,6,2),'yyyy-mm-dd');
       end; --end DataNasterii

   member function Situatie(an number, nrcred float) return string is
       rez  varchar(30):=' ';
       i number;
       suma float:=0;
       begin
           for i in 1..rezult.count loop
              if(rezult(i).anuniv=an) then
                 suma:=suma+rezult(i).nrcredite;
              end  if;
           end loop;
        if (suma>=nrcred) then rez:='promovat';
               else rez:='nepromovat'      ;   
        end  if;
       return rez;
       end;


  member function Media(an integer) return float is
    i number:=0;
    nrnote number:=0;
    suma integer:=0;
    media float:=0;
    begin
       if ( (Situatie( an,30))='promovat') then
            for i in 1..rezult.count loop
                if(rezult(i).anuniv=an) then
                      suma:=suma+rezult(i).nota;
                      nrnote:=nrnote+1;
                end  if;     
           end loop;
          else
           suma:=0; 
           nrnote:=1;
         end if; 
         return suma/nrnote;
      end;   



end; -- END BODY StudObj






